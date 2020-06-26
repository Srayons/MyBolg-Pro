package com.bolg.controller;

import com.bolg.config.PrefixConfig;
import com.bolg.po.Article;
import com.bolg.po.User;
import com.bolg.service.ArticleService;
import com.bolg.service.UserService;
import com.bolg.util.PublicUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/art")
public class ArticleController {

    @Resource
    private ArticleService articleService;

    @Resource
    private UserService userService;

    @RequestMapping("/art_list.html")
    public String Art_list(Model model, @RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "2") Integer pageSize){
        PageInfo<Article> articlePageInfo = articleService.select_All(pageNum, pageSize);
        model.addAttribute("a",articlePageInfo);
        return PrefixConfig.article.getArtPath("/adminList");
    }

    @RequestMapping("/add.html")
    public String art_add(Model model) {
        List<User> users = userService.select_All();
        model.addAttribute("users",users);
        return PrefixConfig.article.getArtPath("/add");
    }

    @RequestMapping("/art_add.html")
    @ResponseBody
    public String AddArt(Article article) {
        Integer i = articleService.addArt(article);
        return PublicUtil.SuccessCode(i);
    }

    @RequestMapping("/art_edit/{id}.html")
    public String ArtEdit(Model model, @PathVariable Integer id){
        List<User> users = userService.select_All();
        model.addAttribute("users",users);
        Article article = articleService.select_By_id(id);
        model.addAttribute("article",article);
        return PrefixConfig.article.getArtPath("/edit");
    }

    @RequestMapping("/edit.html")
    @ResponseBody
    public String EditArt(Article article){
        Integer i = articleService.updateArt(article);
        return PublicUtil.SuccessCode(i);
    }

    @RequestMapping("/artDel/{id}.html")
    @ResponseBody
    public String ArtDel(@PathVariable("id") Integer id){
        Integer i = articleService.delArt(id);
        return PublicUtil.SuccessCode(i);
    }
}
