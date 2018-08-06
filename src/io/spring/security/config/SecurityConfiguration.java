package io.spring.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//
//		// add our users for in memory authentication
//
//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//
//		UserDetails user1 = User.withUsername("ugur").password(encoder.encode("111.")).roles("EMPLOYEE").build();
//		UserDetails user2 = User.withUsername("tutku").password(encoder.encode("123.")).roles("MANAGER").build();
//		UserDetails user3 = User.withUsername("emin").password(encoder.encode("000.")).roles("ADMIN").build();
//
//		auth.inMemoryAuthentication().withUser(user1).withUser(user2).withUser(user3);
//
//	}
}
