package io.spring.security.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	// add a reference to our data source
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		// add our users for in memory authentication

//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();

//		UserDetails user1 = User.withUsername("ugur").password(encoder.encode("111.")).roles("EMPLOYEE").build();
//		UserDetails user2 = User.withUsername("tutku").password(encoder.encode("123.")).roles("EMPLOYEE", "MANAGER").build();
//		UserDetails user3 = User.withUsername("emin").password(encoder.encode("000.")).roles("EMPLOYEE", "ADMIN").build();
//
//		auth.inMemoryAuthentication().withUser(user1).withUser(user2).withUser(user3);
		
		// use jdbc authentication
		auth.jdbcAuthentication().dataSource(dataSource);

	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()	// restrict access based on the HttpServletRequest
				//.anyRequest().authenticated()	// Any request to the app must be authenticated (ie logged in)
		.antMatchers("/").hasRole("EMPLOYEE")
		.antMatchers("/leaders/**").hasRole("MANAGER")
		.antMatchers("/systems/**").hasRole("ADMIN")
			.and()
			.formLogin()	// We are customizing the form login process
				.loginPage("/showLoginPage")	// show our custom form at the request mapping "/showLoginPage"
				.loginProcessingUrl("/authenticateTheUser")	// Login form should post data to this url for processing (check user id and password) (spring create)
				.permitAll()	// Allow everyone to see login page. No need to be logged in.
			.and()
			.logout().permitAll()	// Adds logout support
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}
}
