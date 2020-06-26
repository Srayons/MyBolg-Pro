package com.bolg.mapper;

import com.bolg.po.AdminMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMenuMapper {
    List<AdminMenu> select_admin_menu();
    List<AdminMenu> select_admin_menu(@Param("m_name") String m_name,
                                      @Param("m_pid") String m_pid,
                                      @Param("m_createDate") String m_createDate);
    Integer EditMenuById(AdminMenu adminMenu);
    AdminMenu selectById(@Param("id") Integer id);
    List<AdminMenu> selectByPId(@Param("m_pid") Integer m_pid);
    Integer MenuAdd(AdminMenu adminMenu);
    Integer MenuDel(@Param("id") Integer id,@Param("m_pid") Integer m_pid);
}
