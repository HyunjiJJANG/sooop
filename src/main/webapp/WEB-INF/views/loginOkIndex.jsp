<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="/css/hhj.css">

<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>

<script>
	// 리다이렉트된 페이지 로딩 후 실행되는 스크립트
	window.onload = function() {
		var message = "${message}";
		if (message) {
			alert(message); // 얼럿 창에 메시지 출력
		}
	};
</script>
</head>
<body>
	<h3>
		<!-- principal : 보호된 대상에 접근하는 유저(접근 주체) -> 걔에 대한 정보를 보여주세요~~~~뜻  -->
		<sec:authentication property="principal" />
	</h3>
	<hr />
	<%-- <p>사용자 이름 : <sec:authentication property="principal.username"/> </p>  --%>
	<hr />
	<c:if test="${not empty memberDto}">
	memberDto 이거 맞나요
	${memberDto}
		
	<h1>

			<a
				href="/mypage?member_no=${memberDto.member_no }&email=${memberDto.email}">mypage</a>
		</h1>
		<h1>
			<a
				href="/contact?member_no=${memberDto.member_no }&email=${memberDto.email}&project_no=1">/주소록</a>
		</h1>
		<h1>
			<a
				href="/historyList?member_no=${memberDto.member_no }&email=${memberDto.email}">히스토리</a>
		</h1>
				<h1>
		<a href="/home?member_no=${memberDto.member_no }">home</a>
		</h1>
	</c:if>
	<c:if test="${not empty memberOauth2Dto}">
	memberOauth2Dto 이거 맞나요
	${memberOauth2Dto}
		
	<h1>

			<a
				href="/mypageOauth2?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}">mypage</a>
		</h1>
		<h1>
			<a
				href="/contact?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}&project_no=1">/주소록</a>
		</h1>
		<h1>
			<a
				href="/historyList?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}">/히스토리</a>
		</h1>


		<a	href="/mypageOauth2?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}">mypage</a>
	</h1>
	<h1>
		<a	href="/contact?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}&project_no=1">/주소록</a>
	</h1>
		<h1>
		<a href="/home?member_no=${memberOauth2Dto.member_no }">home</a>
		</h1>
	
	</c:if>
	
</body>
</html>