package com.bolg.service;

import com.bolg.mapper.MenuMapper;
import com.bolg.po.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuMapper menuMapper;

    public List<Menu> select_All(){
        return menuMapper.select_Menu();
    }
}
