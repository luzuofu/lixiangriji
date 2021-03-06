import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import work.demo.share.MiniProgramRunApp;
import work.demo.share.model.Audience;
import work.demo.share.model.OSSMessage;
import work.demo.share.model.WXMessage;
import work.demo.share.service.ReplayMessageOperationService;
import work.demo.share.util.RedisUtil;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;


@SpringBootTest(classes = MiniProgramRunApp.class)
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class test {

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private OSSMessage ossMessage;

    @Autowired
    private WXMessage wxMessage;

    @Autowired
    private Audience audience;
    @Resource
    private ReplayMessageOperationService replayMessageOperationService;

    @Before
    public void setup() {
    }


    @Test
    public void simple() {

        List list = new LinkedList();
        list.add(1);
        Object o = list.get(0);


    }
}
