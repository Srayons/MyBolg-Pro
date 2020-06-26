package com.bolg.service;
import com.bolg.mapper.ArticleMapper;
import com.bolg.po.Article;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    public PageInfo<Article> select_All(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.select_Article();
        return new PageInfo<Article>(list);
    }

    public Article select_By_id(Integer id){
        return articleMapper.select_Article(id);
    }

    public PageInfo<Article> select_Article_Menu_id(Integer pageNum,Integer pageSize,Integer id){
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.select_Article_Menu_id(id);
        return new PageInfo<Article>(list);
    }

    public Integer addArt(Article article){
        article.setCreateDate(new Date());
        Integer i = articleMapper.AddArt(article);
        if (i==0){
            return null;
        }
        return i;
    }

    public Integer updateArt(Article article){
        Integer i = articleMapper.UpdateArtById(article);
        if (i==0){
            return null;
        }
        return i;
    }

    public Integer delArt(Integer id){
        Integer i = articleMapper.DelArtById(id);
        if (i==0){
            return null;
        }
        return i;
    }
}
