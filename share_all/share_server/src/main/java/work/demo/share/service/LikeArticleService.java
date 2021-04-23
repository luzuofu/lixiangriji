package work.demo.share.service;

import org.springframework.stereotype.Service;
import work.demo.share.basemapper.SameService;
import work.demo.share.mapper.LikeMessageMapper;
import work.demo.share.model.LikeMessage;

import javax.annotation.Resource;

@Service
public class LikeArticleService extends SameService<LikeMessage> {


    @Resource
    private LikeMessageMapper likeMessageMapper;


    /**
     * 获取喜欢的列表
     *
     * @param likeId
     * @return
     */
    public LikeMessage getLikeMessage(Integer likeId) {
        return likeMessageMapper.getLikeMessage(likeId);
    }
}
