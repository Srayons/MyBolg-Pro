package com.bolg.service;

import com.bolg.mapper.AdminMenuMapper;
import com.bolg.po.AdminMenu;
import com.bolg.util.PublicUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

@Service
public class AdminMenuService {
    @Resource
    private AdminMenuMapper adminMenuMapper;

    /**
     * 分页查询全部，排序正序
     * @param pageNum 第几页
     * @param pageSize 每页几行
     * @return 返回 PageInfo
     */
    public PageInfo<AdminMenu> selectAdminMenu(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<AdminMenu> adminMenus = adminMenuMapper.select_admin_menu();
        return new PageInfo<>(adminMenus);
    }

    public List<AdminMenu> selectAdminMenu(){
        return adminMenuMapper.select_admin_menu();
    }

    public List<AdminMenu> selectAdminMenu(String m_name,String m_pid,String m_createDate){
        return adminMenuMapper.select_admin_menu(m_name,m_pid,m_createDate);
    }

    public AdminMenu selectById(Integer id){
        return adminMenuMapper.selectById(id);
    }

    public List<AdminMenu> selectByPId(Integer Pid){
        return adminMenuMapper.selectByPId(Pid);
    }

    public Integer MenuEditById(AdminMenu adminMenu) {
        Integer i = adminMenuMapper.EditMenuById(adminMenu);
        if (i==0){
            return null;
        }
        return i;
    }

    public Integer MenuAdd(AdminMenu adminMenu){
        Integer i = adminMenuMapper.MenuAdd(adminMenu);
        if (i==0){
            return null;
        }
        return i;
    }

    public Integer MenuDel(Integer id,Integer m_pid){
        return adminMenuMapper.MenuDel(id,m_pid);
    }
}
