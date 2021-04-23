package work.demo.share.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import work.demo.share.service.SwiperMessageOperationService;
import work.demo.share.util.status.BaseResponse;
import work.demo.share.util.status.CodeEnum;
import work.demo.share.util.status.ResponseData;

import javax.annotation.Resource;

@RestController
@RequestMapping("/wx/api")
public class SwiperMessageController {
    @Resource
    private SwiperMessageOperationService swiperMessageOperationService;

    @ApiOperation(value = "获取轮播图")
    @GetMapping("/getSwiperMessage")
    public BaseResponse getSwiperMessage() {
        return ResponseData.out(CodeEnum.SUCCESS, swiperMessageOperationService.findAll());
    }
}
