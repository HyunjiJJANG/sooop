package kr.co.jhta.soop.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.co.jhta.soop.service.CustomerOAuth2UserDetailService;

//인가를 위한 어노테이션
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource datasource;

	@Autowired
	CustomerOAuth2UserDetailService userDetailService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
//	@Autowired
//	private  CustomHandler customHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		String usernameQuery = "SELECT email as username , password as password, enabled from member where email = ? ";

		StringBuffer authQuery = new StringBuffer();
		authQuery.append("SELECT a.email as username, b.role as authority ");
		authQuery.append("from member a, member_role b ");
		authQuery.append("WHERE a.email=b.email and a.email = ? ");

		auth.jdbcAuthentication()
		.dataSource(datasource)
		.usersByUsernameQuery(usernameQuery)
		.authoritiesByUsernameQuery(authQuery.toString())
		.passwordEncoder(passwordEncoder);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// 보안 관련해서 비활성화 하는 코드
		http.csrf().disable().authorizeHttpRequests()
				// http.authorizeHttpRequests() 
				//member 주소는 role_user 권한이 있어야 접근 할 수 있다
				//.antMatchers("/inviteMember/**").authenticated()
				.antMatchers("/member/**").hasRole("USER") 
				// admin 주소는 ADMIN 권한이 있어야 접근 할 수있다
				.antMatchers("/admin/**").hasRole("ADMIN") 
				// 그 외는 모두 허용해준다.
				.anyRequest().permitAll()
				.and()
				.formLogin()
				// 인증이 필요한 url의 요청이 오면 이 페이지로 
				//	.loginPage("/clogin")
					.loginPage("/")
				//로그인 창에서 입력받는 name의 값을 지정해주는 코드
				.usernameParameter("username")
				.passwordParameter("password")
				// 로그인 처리할 url 
				.loginProcessingUrl("/login")
				// 로그인성공하면 "/"로 이동
				
				.defaultSuccessUrl("/home")
				//.defaultSuccessUrl("/home")
				// 로그인 실패하면 /clogin?error=true
				.failureUrl("/?loginMessage=error")
				.and()
					.logout()
					// logout 요청이 오면 clogout url로 가고
						.logoutUrl("/logout")
						// 로그아웃에 성공하면 홈으로
						.logoutSuccessUrl("/")
				.and()
				.oauth2Login()
				.loginPage("/")
				// OAuth2 로그인 성공 후 사용자 정보를 가져오는 설정을 담당
				.defaultSuccessUrl("/home")
				//.successHandler(customHandler)
				// 로그인 실패하면 /clogin?error=true
				.failureUrl("/?loginMessage=error")
				.userInfoEndpoint()
				.userService(userDetailService);
						// 소셜 로그인 성공시 진행할 OAuth2UserService 인터페이스를구현한 객체를 등록 //즉 사용자가 정보를 가져온
						// 상태에서 추가 진행하고자 하는 기능을 구현

	}

}