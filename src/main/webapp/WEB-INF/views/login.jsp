<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

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

<!-- css -->

<style>
html, body {
	height: 100%;
}

.global-container {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #ffffff;
}

form {
	padding-top: 10px;
	font-size: 14px;
	margin-top: 20px;
}

.card-title {
	font-weight: 300;
}

.card-text {
	
}

.form-floating {
	margin-top: 10px;
}

.login-form {
	width: 500px;
	margin: 20px;
}

.sign-in {
	text-align: center;
	padding: 20px 0 0;
	border-top: #333 1px;
}

.card {
	--bs-card-border-color: rgb(0 0 0/ 0%);
}

.card-body {
	flex: 1 1 auto;
	padding: var(--bs-card-spacer-y) var(--bs-card-spacer-x);
	color: var(--bs-card-color);
}

.join-label-title {
	display: inline-block;
	padding: 3px 0;
	font-size: 16px;
	color: #333;
	font-weight: 700;
	text-align: left;
}

.form-control {
	margin-bottom: 20px;
	width: 450px;
}

.row g-3 align-items-center {
	width: 800px;
}

.line {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 14px;
	margin: 8px 0px;
}

.line::before {
	content: "";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.line::after {
	content: "";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.loginButton {
	
}

.link {
	font-size: 16px;
	margin-top: 80px;
	color: black;
	align-items: center;
}

/* 이미지 오른쪽으로 */
/*
 #Login_Logo {
        position: fixed;
        right: 200px;
        top: 430px;
        transform: translateY(-50%);
        width: 600px;
        height: 400px;
        
    }
.global-container{
 position: fixed;
 left:400px;
 top:10px;
} */
/* 이미지가 왼쪽으로 */
.global-container {
	position: fixed;
	right: 400px;
	top: 50px;
}

#Login_Logo {
	position: fixed;
	left: 350px;
	top: 200px;
	width: 600px;
	height: 400px;
}
</style>

<!-- 리다이렉트로 넘어온 메세지  -->
<script>
	// 리다이렉트된 페이지 로딩 후 실행되는 스크립트
	window.onload = function() {
		var message = "${message}";
		if (message) {
			alert(message); // 얼럿 창에 메시지 출력
		}
	};
</script>

<script>
	// URL에서 message 파라미터 값 가져오기
	var loginMessage = new URLSearchParams(window.location.search)
			.get('loginMessage');
	if (loginMessage) {
		loginMessage = "비밀번호 또는 이메일이 일치하는 회원이 없습니다. 다시한번 확인해주세요";
		alert(loginMessage); // 얼럿 창에 메시지 출력
	}
</script>
</head>



<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card login-form">
			<div class="card-body">
				<h3 class="card-title text-center">LOGIN</h3>
				<div class="card-text">
					<form action="/login" method="post" name="frm" id="frm">
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">이메일</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="email"
												class="form-control" name="username" id="username"
												placeholder="account@example.com"
												aria-labelledby="emailCheck" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="email">이메일</label>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password"
												class="form-control" name="password" id="password"
												placeholder="Password" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="password">비밀번호</label> <input type="hidden"
												name="${_csrf.parameterName }" value="${_csrf.token }" />

										</div>
									</div>
								</div>
							</div>

						</div>


						<div class="d-grid gap-2 col-12"
							style="width: 276px; height: 36px;">
							<input type="submit" class="btn btn-success" value="로그인"
								style="margin-top: 20px; width: 450px; height: 50px;" />
						</div>
					</form>

					<div class="link">
						<a href="/searchPassword"
							style="margin-left: 90px; color: black; text-decoration-line: none;">비밀번호
							찾기</a> <a href="/register"
							style="margin-left: 100px; color: black; text-decoration-line: none;">회원가입</a>

					</div>

					<div class="line"
						style="margin-top: 70px; padding-right: 20px; margin-bottom: 35px;">SNS
						계정 로그인</div>

					<div class="loginButton">
						<a href="oauth2/authorization/kakao"><img alt="kakaoLogin"
							src="/images/kakao_login_medium_narrow.png"
							style="width: 150px; height: 40px; margin-left: 45px;"></a> <a
							href="oauth2/authorization/google"><img alt="googleLogin"
							src="/images/btn_google_signin_light_normal_web.png"
							style="margin-left: 10px; width: 150px; height: 43px; margin-left: 50px;"></a>
					</div>

				</div>
				<div id="Login_Logo">
					<h2 style="text-align: laft; font-weight: bold; ">쉽고,</h2>
					<br />
					<h2 style="text-align: laft; font-weight: bold; ">빠른 업무 관리의 시작 SOOP</h2>
					<br /> <img src="/images/LoginLogo.png" alt="LoginLogo"
						style="width: 500px; height: 300px;" />

				</div>

			</div>
		</div>
	</div>
</body>




</html>