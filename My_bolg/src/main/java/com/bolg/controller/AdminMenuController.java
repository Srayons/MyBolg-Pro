package com.bolg.controller;

import com.bolg.config.PrefixConfig;
import com.bolg.po.AdminMenu;
import com.bolg.service.AdminMenuService;
import com.bolg.util.PublicUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class AdminMenuController {
    @Resource
    private AdminMenuService adminMenuService;

    @RequestMapping(value = "/m_list.html")
    public String m_list(String m_name, String m_pid, String m_createDate, Model model) {
        List<AdminMenu> adminMenus = adminMenuService.selectAdminMenu(m_name, m_pid, m_createDate);
        model.addAttribute("a", adminMenus);
        return PrefixConfig.menus.getMenuPath("/list");
    }


    @RequestMapping("/m_edit/{id}.html")
    public String m_edit(@PathVariable Integer id, Model model) {
        AdminMenu adminMenu = adminMenuService.selectById(id);
        model.addAttribute("adminMenu", adminMenu);
        return PrefixConfig.menus.getMenuPath("/edit");
    }

    @RequestMapping("/menuEdit.html")
    @ResponseBody
    public String menuEdit(AdminMenu adminMenu) {
        Integer i = adminMenuService.MenuEditById(adminMenu);
        return PublicUtil.SuccessCode(i);
    }

    @RequestMapping("/m_add.html")
    public String menu_add() {
        return PrefixConfig.menus.getMenuPath("/add");
    }

    @RequestMapping("/menuAdd.html")
    @ResponseBody
    public String menuAdd(AdminMenu adminMenu) {
        adminMenu.setM_createDate(new Date());
        Integer i = adminMenuService.MenuAdd(adminMenu);
        return PublicUtil.SuccessCode(i);
    }

    @RequestMapping("/menuDel/{id}.html")
    @ResponseBody
    public String menuDel(@PathVariable Integer id,Integer str) {
        List<AdminMenu> adminMenu = adminMenuService.selectByPId(id);
        if (str!=null){
            Integer i = adminMenuService.MenuDel(id,id);
            return PublicUtil.SuccessCode(i);
        }
        if (adminMenu.size()!=0) {
            return PublicUtil.SuccessCode("502",0);
        }
        Integer i = adminMenuService.MenuDel(id,null);
        return PublicUtil.SuccessCode(i);
    }
}
