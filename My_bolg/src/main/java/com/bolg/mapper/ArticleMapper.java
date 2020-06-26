package com.bolg.mapper;

import com.bolg.po.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleMapper {
     List<Article> select_Article();
     Article select_Article(@Param("id")Integer id);
     List<Article> select_Article_Menu_id(@Param("id")Integer id);
     Integer AddArt(Article article);
     Integer UpdateArtById(Article article);
     Integer DelArtById(@Param("id") Integer id);
}
