package com.bolg.controller;

import com.bolg.po.Article;
import com.bolg.po.Menu;
import com.bolg.service.ArticleService;
import com.bolg.service.MenuService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@SessionAttributes("m")
public class InItController {
    @Resource
    private MenuService menuService;

    @Resource
    private ArticleService articleService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String list_all(Model model,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "2") Integer pageSize){
        /*System.out.println(logo);
        model.addAttribute("logoName",logo);*/
        List<Menu> menus = menuService.select_All();
        model.addAttribute("m",menus);
        PageInfo<Article> articles = articleService.select_All(pageNum,pageSize);
        model.addAttribute("a",articles);
        return "/index";
    }

    @RequestMapping(value = "/get/art/{id}.html")
    public String get_art_Id(@PathVariable Integer id, Model model){
        Article article = articleService.select_By_id(id);
        model.addAttribute("art",article);
        return "/article/list";
    }

    @RequestMapping(value = "/get/menu/{id}.html")
    public String get_menu_Id(@PathVariable Integer id, Model model,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "2") Integer pageSize){
        PageInfo<Article> articles = articleService.select_Article_Menu_id(pageNum,pageSize,id);
        model.addAttribute("a",articles);
        return "/index";
    }
}
