package com.bolg.mapper;

import com.bolg.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    List<User> select_user();
    User select_user_ById(@Param("account") String account, @Param("password") String password);
}
