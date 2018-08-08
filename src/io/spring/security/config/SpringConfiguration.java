package io.spring.security.config;

import java.beans.PropertyVetoException;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "io.spring.security")
@PropertySource("classpath:resources/persistence-mysql.properties")
public class SpringConfiguration implements WebMvcConfigurer {

	// set up variable to hold the properties
	@Autowired
	private Environment env;

	// set up a logger for diagnostics
	private Logger logger = Logger.getLogger(getClass().getName());

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Bean
	public DataSource dataSource() {
		// create connection pool
		ComboPooledDataSource dataSource = new ComboPooledDataSource();

		// set the jdbc driver class
		try {
			dataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}

		// log the connection props
		logger.info(">>> jdbc.url= " + env.getProperty("jdbc.url"));
		logger.info(">>> jdbc.user= " + env.getProperty("jdbc.user"));

		// set database connection props
		dataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		dataSource.setUser(env.getProperty("jdbc.url"));
		dataSource.setPassword(env.getProperty("jdbc.property"));

		// set connection pool props
		dataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		dataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		dataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
		dataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));

		return dataSource;
	}

	// need a helper method
	// read environment property and conver to int
	private int getIntProperty(String propName) {

		String propValue = env.getProperty(propName);

		// now convert to int
		int intPropVal = Integer.parseInt(propValue);

		return intPropVal;

	}
}
