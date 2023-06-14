package com.example.noticeboard.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@MapperScan(value={"com.example.noticeboard.mapper"})
public class MybatisConfig {
  private final ApplicationContext applicationContext;
  public MybatisConfig(ApplicationContext applicationContext) {
    this.applicationContext = applicationContext;
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource) {
    SqlSessionFactory factory = null;
    try {
      SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
      factoryBean.setDataSource(dataSource);
      factoryBean.setTypeAliasesPackage("com.example.noticeboard");
      factoryBean.setMapperLocations(applicationContext.getResource("classpath:mapper/**/*.xml"));
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
