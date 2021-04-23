package work.demo.share.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import work.demo.share.globalException.MyException;
import work.demo.share.model.*;
import work.demo.share.service.*;
import work.demo.share.util.CheckMessageUtil;
import work.demo.share.util.status.BaseResponse;
import work.demo.share.util.status.CodeEnum;
import work.demo.share.util.status.ResponseData;
import work.demo.share.model.*;
import work.demo.share.service.*;
import work.demo.share.util.CheckAllow;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/wx")
public class CommentOperationController {

    @Resource
    private CommentService commentService;
    @Resource
    private ReplayMessageOperationService replayMessageOperationService;
    @Resource
    private UserMessageOperationService userMessageOperationService;
    @Resource
    private NoticeOperationService noticeOperationService;
    @Resource
    private ArticleOperationService articleOperationService;
    @Resource
    private WXMessage wxMessage;

    @Transactional
    @ApiOperation(value = "保存评论")
    @RequestMapping("/saveComment")
    public BaseResponse saveComment(@RequestBody CommentMessage commentMessage, HttpServletRequest request) {

        Integer userId = CheckAllow.checkAllow(userMessageOperationService, request);

        if (userId < 0) {
            return ResponseData.out(CodeEnum.SIGNATURE_NOT_ALLOW);
        }

        if (CheckMessageUtil.checkMessage(commentMessage.getCommentContent(), wxMessage)) {
            return ResponseData.error(403, "检测到内容违规,请重新输入");
        }


//先添加，在查询，然后在保存通知
        commentMessage.setUserId(userId);

        commentService.add(commentMessage);

        CommentMessage commentMessage1 = commentService.findList(commentMessage).get(0);


        ArticleMessage newArticle = articleOperationService.getNewArticleById(commentMessage.getArticleId());

        if (!newArticle.getUserId().equals(userId)) {
            NoticeMessage noticeMessage = new NoticeMessage();
            noticeMessage.setUserId(newArticle.getUserId());
            noticeMessage.setNoticeType(3);
            noticeMessage.setArticleId(commentMessage.getArticleId());
            noticeMessage.setCommentId(commentMessage1.getCommentId());

            noticeOperationService.add(noticeMessage);
        }


        return ResponseData.success();
    }


    @Transactional
    @ApiOperation(value = "回复评论")
    @RequestMapping("/saveReplay")
    public BaseResponse saveReplay(@RequestBody ReplayMessage replayMessage, HttpServletRequest request) {

        Integer userId = replayMessage.getUserId();
        UserMessage userMessage = new UserMessage();
        userMessage.setUserId(userId);

        Integer personId = CheckAllow.checkAllow(userMessageOperationService, request);

        if (personId < 0) {
            return ResponseData.out(CodeEnum.SIGNATURE_NOT_ALLOW);
        }

        if (CheckMessageUtil.checkMessage(replayMessage.getReplayContent(), wxMessage)) {
            return ResponseData.error(403, "检测到内容违规,请重新输入");
        }

        if (userMessageOperationService.findCount(userMessage) == 0) {
            return ResponseData.error(new MyException("数据错误"));
        }

        WXSessionModel user = (WXSessionModel) request.getSession().getAttribute("user");

        replayMessage.setUserId(user.getUserId());

        replayMessageOperationService.add(replayMessage);


        ReplayMessage replayMessage1 = replayMessageOperationService.findList(replayMessage).get(0);

        System.out.println(replayMessage1);

        NoticeMessage noticeMessage = new NoticeMessage();
        noticeMessage.setReplayId(replayMessage1.getReplayId());
        noticeMessage.setNoticeType(4);

        CommentMessage commentMessage = new CommentMessage();
        commentMessage.setCommentId(replayMessage1.getCommentId());

        CommentMessage commentMessage1 = commentService.findList(commentMessage).get(0);


        noticeMessage.setArticleId(commentMessage1.getArticleId());
        if (replayMessage1.getReplayUserId() == null && !commentMessage1.getUserId().equals(personId)) {
            noticeMessage.setUserId(commentMessage1.getUserId());
            noticeOperationService.add(noticeMessage);
        } else if (!replayMessage1.getReplayUserId().equals(personId) && replayMessage1.getReplayUserId() != null) {
            noticeMessage.setUserId(replayMessage1.getReplayUserId());
            noticeOperationService.add(noticeMessage);
        }
        return ResponseData.success();
    }
}
