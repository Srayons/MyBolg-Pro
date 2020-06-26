package com.bolg.mapper;

import com.bolg.po.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper {
    public List<Menu> select_Menu();
}
