package work.demo.share.service;

import org.springframework.stereotype.Service;
import work.demo.share.basemapper.SameService;
import work.demo.share.mapper.UserMessageMapper;
import work.demo.share.model.UserMessage;

import javax.annotation.Resource;

@Service
public class UserMessageOperationService extends SameService<UserMessage> {


    @Resource
    private UserMessageMapper userMessageMapper;


    public UserMessage getUserMessage(Integer userId){
        return userMessageMapper.getUserMessage(userId);
    }



}
