package com.canteen.service;

import com.canteen.pojo.Article;
import com.github.pagehelper.PageInfo;

public interface ArticleService {
    PageInfo<Article> selectAll(int pageNo, int pageSize);

    int delete(Integer id);

    int insert(Article article);

    Article selectById(Integer id);
}
