package work.demo.share.mapper;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import work.demo.share.model.UserMessage;

public interface UserMessageMapper extends Mapper<UserMessage> {


    UserMessage getUserMessage(@Param("userId") Integer userId);
}