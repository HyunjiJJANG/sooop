<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>커스텀 로그아웃</h2>
	<form action="/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="submit" value="로그아웃" />
	</form>
	
	<!-- 추후에 메인페이지 버튼 클릭 시 모달로 로그아웃 기능 구현하려함 / 테스트용 jsp 파일입니다. -->
</html>