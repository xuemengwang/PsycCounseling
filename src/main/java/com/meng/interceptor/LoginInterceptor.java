package com.meng.interceptor;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-02 13:03
 **/

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 是否有cookie
        Cookie[] cookies = request.getCookies();
        if (ArrayUtils.isEmpty(cookies)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        } else {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    return true;
                }
            }
            response.sendRedirect(request.getContextPath() + "/login");
        }


        return false;
    }
}
