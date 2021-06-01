package com.sims.portal.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.sims.portal.user.services.impl.DefaultUserDetailsService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DefaultUserDetailsService defaultUserDetailsService;

	@Bean
	public AuthenticationTrustResolver authenticationTrustResolver() {
		return new AuthenticationTrustResolverImpl();
	}

	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(11);
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(defaultUserDetailsService).passwordEncoder(encoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/login", "/processLogin", "/accessdenied", "/WEB-INF/**").permitAll();

		http.authorizeRequests().antMatchers("/admin/**", "/master/**", "/manager/**", "/*").authenticated();

		http.authorizeRequests().antMatchers("/welcome").hasAnyRole("ROLE_USER", "ROLE_ADMIN", "ROLE_MIS");

		http.formLogin().loginProcessingUrl("/processLogin").loginPage("/login").defaultSuccessUrl("/welcome")
				.failureUrl("/login?error").usernameParameter("username").passwordParameter("password");

		http.logout().logoutSuccessUrl("/login").logoutUrl("/performlogout").deleteCookies("JSESSIONID")
				.invalidateHttpSession(true);

		http.sessionManagement().invalidSessionUrl("/login").maximumSessions(1).expiredUrl("/login");
	}

}
