package com.meng.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * @description: 我的工具类
 * @author: wangxuemeng
 * @create: 2018-04-06 16:16
 **/

public class MyUtil {

    /**
     * 根据request和cookie名取cookie
     * @param request 页面请求
     * @param name cookie名
     * @return cookie
     */
    public static Cookie getCookie(HttpServletRequest request,String name){
        Cookie[] cookies = request.getCookies();
        if (cookies.length==0) return null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)){
                return cookie;
            }
        }
        return null;
    }




}
