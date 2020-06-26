package com.bolg.service;

import com.bolg.mapper.UserMapper;
import com.bolg.po.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserMapper userMapper;

    public List<User> select_All(){
        return userMapper.select_user();
    }

    public User select_user_By_Id(String account,String password){
        return userMapper.select_user_ById(account,password);
    }
}
