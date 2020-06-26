package com.bolg.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bolg.config.PrefixConfig;
import com.bolg.po.AdminMenu;
import com.bolg.po.User;
import com.bolg.service.AdminMenuService;
import com.bolg.service.UserService;
import com.bolg.util.MD5Util;
import com.bolg.util.PublicUtil;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private AdminMenuService adminMenuService;

    @RequestMapping("/list_all.html")
    public String list_all(Model model) {
        List<User> users = userService.select_All();
        model.addAttribute("u", users);
        return PrefixConfig.user.getUserPath("/list");
    }

    @RequestMapping(value = "/admin_login.html",method = RequestMethod.POST)
    @ResponseBody
    public Object login_admin(String account, String password, HttpSession session){
        String msg;
        User user = userService.select_user_By_Id(MD5Util.getMD5String(password + account), MD5Util.getMD5String(account + password));
        if (user != null) {
            if (user.getAccount().equals(MD5Util.getMD5String(password + account)) && user.getPassword().equals(MD5Util.getMD5String(account + password))) {
                List<AdminMenu> adminMenus = adminMenuService.selectAdminMenu();
                session.setAttribute("user", user);
                session.setAttribute("admin_menu", adminMenus);
               /* msg = "{\"code\":\"200\",\"data\":\"" + user + "\"}";
                Map<String, Object> map = new HashMap<>();
                map.put("code","200");
                map.put("data",user);*/
                return PublicUtil.SuccessCode(user);
            }
        }
        //msg = "{\"code\":\"402\",\"data\":\"" + user + "\"}";
        return PublicUtil.SuccessCode(user);
    }

    @RequestMapping("/login.html")
    public String User_login() {
        return PrefixConfig.user.getUserPath("/login");
    }

    @RequestMapping("/index.html")
    public String toIndex() {
        return PrefixConfig.user.getUserPath("/index");
    }

    @RequestMapping("/iFrame_admin.html")
    public String iFrame_admin(){
        return PrefixConfig.user.getUserPath("/admin_iFrame");
    }

    @RequestMapping("/loginOut.html")
    public String LoginOut(HttpSession session){
        session.invalidate();
        return PrefixConfig.user.getUserPath("/login");
    }
}
