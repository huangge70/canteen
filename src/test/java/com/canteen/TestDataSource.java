package com.canteen;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;
import javax.sql.DataSource;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class TestDataSource {
    @Resource
    private DataSource dataSource;

    //测试是否能连接数据库
    @Test
    public void testConnection() throws Exception {
        System.out.println(this.dataSource);
    }
}
