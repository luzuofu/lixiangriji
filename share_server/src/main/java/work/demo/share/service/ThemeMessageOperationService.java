package work.demo.share.service;

import org.springframework.stereotype.Service;
import work.demo.share.basemapper.SameService;
import work.demo.share.mapper.ThemeMessageMapper;
import work.demo.share.model.ThemeMessage;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ThemeMessageOperationService extends SameService<ThemeMessage> {
    @Resource
    private ThemeMessageMapper themeMessageMapper;


    /**
     * 获取所有主题
     *
     * @param use
     * @return
     */
    public List<ThemeMessage> getAllTheme(Integer use) {
        return themeMessageMapper.getAllTheme(use);
    }
}
