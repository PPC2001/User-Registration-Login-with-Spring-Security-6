package com.pms.app.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.pms.app.constants.PMSConstants;
import jakarta.persistence.EntityManagerFactory;

@PropertySource(PMSConstants.SPRING_BASE_CLASS_PROPERTYSOURCE)
@Configuration
@EnableTransactionManagement
public class DSConfig {

	@Autowired
	private Environment environment;

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(environment.getProperty(PMSConstants.DATASOURCE_DRIVER_CLASS_NAME));
		dataSource.setUrl(environment.getProperty(PMSConstants.DATASOURCE_URL));
		dataSource.setUsername(environment.getProperty(PMSConstants.DATASOURCE_USERNAME));
		dataSource.setPassword(environment.getProperty(PMSConstants.DATASOURCE_PASSWORD));
		return dataSource;
	}

	@Bean
	public JpaVendorAdapter jpaVendorAdapter() {
		HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		adapter.setDatabase(Database.ORACLE); // Set database type to Oracle
		adapter.setShowSql(true);
		adapter.setGenerateDdl(true);
		adapter.setDatabasePlatform(PMSConstants.HIBERNATE_DIALECT); // Use Oracle12cDialect for Oracle 11g
		return adapter;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(EntityManagerFactoryBuilder builder,
			DataSource dataSource, JpaVendorAdapter jpaVendorAdapter, Properties properties) {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource);
		em.setPackagesToScan(PMSConstants.JPA_PACKAGES_TO_SCAN);
		em.setJpaVendorAdapter(jpaVendorAdapter);
		em.setJpaProperties(properties);
		return em;
	}

	@Bean
	public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		return new JpaTransactionManager(entityManagerFactory);
	}

	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
		return new JdbcTemplate(dataSource);
	}
}
