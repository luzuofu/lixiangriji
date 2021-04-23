package work.demo.share.mapper;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import work.demo.share.model.ReplayMessage;

import java.util.List;

public interface ReplayMessageMapper extends Mapper<ReplayMessage> {


    List<ReplayMessage> getReplayContent(@Param("commentId") Integer commentId);


    ReplayMessage getReplayMessage(@Param("replayId") Integer replayId);
}