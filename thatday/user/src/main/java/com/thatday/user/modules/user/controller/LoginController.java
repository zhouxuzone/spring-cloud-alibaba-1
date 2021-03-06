package com.thatday.user.modules.user.controller;

import com.thatday.common.model.Result;
import com.thatday.user.modules.user.entity.User;
import com.thatday.user.modules.user.vo.LoginPhoneVo;
import com.thatday.user.modules.user.vo.LoginWeChatVo;
import com.thatday.user.modules.user.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/login")
@Api(tags = "登录类API")
public class LoginController {

    private UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }


    @ApiOperation("手机号登录接口")
    @PostMapping(value = "/loginByPhone")
    public Result<User> loginByPhone(@Valid @RequestBody LoginPhoneVo vo) {
        User user = userService.loginByPhone(vo);

        return Result.buildSuccess(user);
    }

    @ApiOperation("微信登录接口")
    @PostMapping(value = "/loginByWeChat")
    public Result<User> loginByWeChat(@Valid @RequestBody LoginWeChatVo loginWeChatVo) {
        User user = userService.loginByWeChat(loginWeChatVo);
        return Result.buildSuccess(user);
    }
}
