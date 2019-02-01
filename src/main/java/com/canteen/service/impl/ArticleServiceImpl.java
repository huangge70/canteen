package com.canteen.service.impl;

import com.canteen.dao.ArticleMapper;
import com.canteen.pojo.Article;
import com.canteen.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public PageInfo<Article> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Article> list=articleMapper.selectAll();
        PageInfo<Article> page=new PageInfo<>(list);
        return page;
    }

    @Override
    public int delete(Integer id) {
        Article article=new Article();
        article.setId(id);
        article.setStatus(0);
        return articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public int insert(Article article) {
        return articleMapper.insert(article);
    }

    @Override
    public Article selectById(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }
}
