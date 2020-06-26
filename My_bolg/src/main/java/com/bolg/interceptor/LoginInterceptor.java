package com.bolg.interceptor;

import com.bolg.config.PrefixConfig;
import com.bolg.util.PublicUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    /**
     * Handler完成之前执行拦截
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!PublicUtil.isLogin(request.getSession(), "user")) {
            response.sendRedirect(request.getContextPath() + PrefixConfig.user.getUserPath("/login.html"));
            return false;
        }
        return true;
    }

    /**
     * Handler完成之后，返回视图之前执行拦截
     *
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //存入model里进项后台获取数据
        /*User user = PublicUtil.getUser(request.getSession(),"user");
        modelAndView.addObject("u_iFrame",user);*/
    }

    /**
     * Handler完成之后执行拦截
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
