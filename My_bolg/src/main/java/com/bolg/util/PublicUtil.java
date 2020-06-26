package com.bolg.util;

import com.bolg.po.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class PublicUtil {
    public static boolean isLogin(HttpSession session, String user_str) {
        User user = (User) session.getAttribute(user_str);
        return user != null;
    }

    public static Object getSession(HttpSession session,String session_str){
        return (Object) session.getAttribute(session_str);
    }

    public static String SuccessCode(Object o){
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        if (o!=null){
            map.put("code","200");
        }else {
            map.put("code","501");
        }
        map.put("data",o);
        String str = null;
        try {
            str = objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return str;
    }
    public static String SuccessCode(String code,Object o){
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        if (o!=null){
            map.put("code",code);
        }else {
            map.put("code","501");
        }
        map.put("data",o);
        String str = null;
        try {
            str = objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return str;
    }
}
