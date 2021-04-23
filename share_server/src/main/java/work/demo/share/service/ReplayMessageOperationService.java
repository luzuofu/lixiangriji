package work.demo.share.service;

import org.springframework.stereotype.Service;
import work.demo.share.basemapper.SameService;
import work.demo.share.mapper.ReplayMessageMapper;
import work.demo.share.model.ReplayMessage;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplayMessageOperationService extends SameService<ReplayMessage> {

    @Resource
    private ReplayMessageMapper replayMessageMapper;


    public List<ReplayMessage> getReplayContent(Integer commentId) {

        return replayMessageMapper.getReplayContent(commentId);

    }

    /**
     * 获取回复的人
     *
     * @param replayId
     * @return
     */
    public ReplayMessage getReplayMessage(Integer replayId) {
        return replayMessageMapper.getReplayMessage(replayId);
    }
}
