package com.example.noticeboard.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@MapperScan(value={"com.example.noticeboard.mapper"}, sqlSessionFactoryRef = "sqlSessionFactory")
public class MybatisConfig {
  private final ApplicationContext applicationContext;
  public MybatisConfig(ApplicationContext applicationContext) {
    this.applicationContext = applicationContext;
  }

  @Bean
  @Autowired
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource) {
    SqlSessionFactory factory = null;
    try {
      System.out.println("DataSource : "+dataSource);
      SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
      factoryBean.setDataSource(dataSource);
      factoryBean.setTypeAliasesPackage("com.example.noticeboard");
      factoryBean.setMapperLocations(applicationContext.getResource("classpath:noticeBoardMapper/mapper/main.xml"),
                                     applicationContext.getResource("classpath:noticeBoardMapper/mapper/login.xml"));
      factory = factoryBean.getObject();
    }
    catch(Exception e){e.printStackTrace();}
    return factory;
  }

  @Bean
  public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
    return new SqlSessionTemplate(sqlSessionFactory);
  }
}
