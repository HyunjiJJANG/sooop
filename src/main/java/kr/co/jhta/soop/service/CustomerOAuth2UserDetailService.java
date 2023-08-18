package kr.co.jhta.soop.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class CustomerOAuth2UserDetailService extends DefaultOAuth2UserService {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	MemberMysqlService service;

	@Autowired
	private HttpSession httpSession;

	// 유저로딩 메서드 재정의
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>userRequest : " + userRequest);
		// 등록되어 있는 클라이언트에서 클라이언트의 이름을 ClientName에 담아줘
		String ClientName = userRequest.getClientRegistration().getClientName();
		log.info("ClientName : " + ClientName);

		// super는 부로를 가르키는 참조 변수
		// 여기서 this는 CustomerOAuth2UserDetailService
		// super는 DefaultOAuth2UserService
		// 유저 요청 정보로 인증사용자 객체 얻어오기
		OAuth2User oAuth2User = super.loadUser(userRequest);
		// oAuth2User에 Attributes 정보 일부를 가져오기
		// map 타입으로 되어 있기때문에 map으로 받아옴
		Map<String, Object> map = oAuth2User.getAttributes();
		// 키값만 가져오기 위해 map.keyset key 값을 set 타입으로 가져오기
		Set<String> s = map.keySet();
		//
		Iterator<String> it = s.iterator();

		while (it.hasNext()) {

			String name = it.next();
			// 키 : 밸류 값으로 찍어
			log.info(name + " : " + map.get(name));
		}

		///////////////////////////////////////////////////////////

		String email = "";
		String name = "";
		// 구글 로그인인지 확인
		// ClientName이 구글이라면
		if (ClientName.equals("Google")) {
			// 이메일과 이름을 가져왔음
			email = oAuth2User.getAttribute("email");
			name = oAuth2User.getAttribute("name");
			
			// ClientName이 카카오일때
		} else if (ClientName.equals("Kakao")) {

			Map<String, Object> map2 = oAuth2User.getAttributes();

			Map<String, Object> map3 = (Map<String, Object>) map2.get("properties");

			Map<String, Object> map4 = (Map<String, Object>) map2.get("kakao_account");
			// 이메일
			email = (String) map4.get("email");
			// 닉네임
			name = (String) map3.get("nickname");

			// 출력해보기

			log.info("카카오 이메일 : " + email);
			log.info("카카오 이름 : " + name);

		}

		saveMember(email, name);
		MemberDTO dto = service.selectMemberByEmail(email);
		 // 세션에 이메일 값 담기
        httpSession.setAttribute("email", email);
        //httpSession.setAttribute("signupMessage", "로그인이 성공적으로 완료되었습니다.");
       
		return super.loadUser(userRequest);
	}

	private void saveMember(String email, String name) {
		// 기존에 등록되어 있는 회원인지 확인 후

		MemberDTO dto = service.selectMemberByEmail(email);
		log.info("멤버 : " + dto);

		String memberpassword = Integer.toString(new Random().nextInt(100000));

		// 등록되어 있지 않으면 db에 추가하기
		if (dto == null) {

			int enabled = 2;
			dto = MemberDTO.builder().email(email).password(passwordEncoder.encode(memberpassword)).name(name)
					.enabled(enabled)
					.build(); // 마지막에
			
			service.oAuth2UserinsertOne(dto);


			dto = MemberDTO.builder().email(email).password(passwordEncoder.encode(memberpassword)).name(name).build();
			// 마지막에 build해야 set하게 되는거야

			//service.insertOne(dto);


			// -----------------------> 기존에 가입되어있지 않은 사람이라면 member 테이블에 데이터를 저장해
			// member_role에는 데이터가 저장되지 않음 그래서 해당 아이디와 비밀번호로 로그인 시도시 로그인이 안 됨

			// member_role에 데이터를 추가하는 코드 문
			service.insertRole(email);
		}

	}

}