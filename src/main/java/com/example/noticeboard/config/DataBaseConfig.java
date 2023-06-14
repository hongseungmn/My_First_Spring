package com.example.noticeboard.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import javax.sql.DataSource;

@Configuration
public class DataBaseConfig {
  @Value("${database-config.driverClassName}")
  private String driver;
  @Value("${database-config.oracleUrl}")
  private String url;
  @Value("${database-config.user}")
  private String user;
  @Value("${database-config.password}")
  private String password;

  @Bean
  public DataSource dataSource() {
    HikariConfig hikariConfig = new HikariConfig();
    hikariConfig.setDriverClassName(driver);
    hikariConfig.setJdbcUrl(url);
    hikariConfig.setUsername(user);
    hikariConfig.setPassword(password);
    hikariConfig.setAutoCommit(true);
    hikariConfig.setConnectionTimeout(30000);

    return new HikariDataSource(hikariConfig);
  }

  @Bean
  public DataSourceTransactionManager transactionManager(HikariDataSource hikariDataSource) {
    return new DataSourceTransactionManager(hikariDataSource);
  }

  @Bean
  public TransactionTemplate transactionTemplate(DataSourceTransactionManager transactionManager) {
    TransactionTemplate transactionTemplate = new TransactionTemplate();
    transactionTemplate.setTransactionManager(transactionManager);
    return transactionTemplate;
  }
}
