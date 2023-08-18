<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

.form-floating {
	margin-top: 10px;
}

#btnRegister {
	font-size: 14px;
	margin-top: 20px;
	width: 450px;
}

.register-form {
	width: 500px;
	margin: 20px;
}

.sign-in {
	text-align: center;
	padding: 20px 0 0;
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
</style>

<script type="text/javascript">
	$(function() {

		/* var $email = $("#mid");
		 */
		$("#email").on(
				"keyup",
				function() {
					$.ajax({
						type : "GET",
						url : "/emailCheck",
						data : {
							"email" : $("#email").val().trim()
						},
						dataType : "text",
						success : function(result) {
							var resp = result.trim();
							if (resp == "OK") {
								$("#idCheck").html("사용가능한 아이디입니다.").css(
										"color", "blue");
								$("#btnMailCheck").show();
							} else if ($("#email").val().trim() == "") {
								$("#idCheck").hide();
								$("#btnMailCheck").hide();

							} else {
								$("#idCheck").html("이미 존재하는 아이디입니다.").css(
										"color", "red");
								$("#btnMailCheck").hide();
							}
						}
					});
				});

		// 이름 길이가 2보다 작으면 빨간 테두리
		$("#name").on("keyup", function() {
			if ($(this).val().trim().length < 0) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");

			} else if ($(this).val().trim().length >= 2) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");

			}
		})

		// 비밀번호 길이가 8보다 작으면 빨간 테두리
		/* $("#password").on("keyup", function() {
			if ($(this).val().trim().length < 8 || !/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/g.test($(this).val().trim())) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");

			} else if ($(this).val().trim().length >= 8) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");

			}
		}) */

		//비밀번호 유효성 검사 테스트 
		$("#password")
				.on(
						"keyup",
						function() {
							var password = $(this).val().trim();

							// 최소 8자 이상, 영문 대소문자 및 특수문자 포함 여부 검사
							var regPassword = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

							if (regPassword.test(password)) {
								$(this).removeClass("form-control is-invalid");
								$(this).addClass("form-control");
							} else {
								$(this).removeClass("form-control");
								$(this).addClass("form-control is-invalid");
							}
						});

		// 비밀번호 확인이 일치하지 않으면 빨간 테두리
		$("#repeatPw").on("keyup", function() {
			if ($(this).val().trim() != $("#password").val().trim()) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");
				isPasswordCheckOk = false;
			} else if ($(this).val().trim() == $("#password").val().trim()) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");
				isPasswordCheckOk = true;
			}
		})
		// 인증메일 비동기화 방식으로 보내기
		$("#btnMailCheck").on("click", function() {// 메일 입력 유효성 검사
			var email = $("#email").val(); //사용자의 이메일 입력값. 

			if (email == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {

				$.ajax({
					type : 'GET',
					url : '/mailCheck',
					data : {
						"email" : $("#email").val().trim()
					},
					dataType : 'text',

				});
				alert("인증번호가 전송되었습니다.")
				
				isCertification = false; //추후 인증 여부를 알기위한 값
				$("#authCodeDiv").show();
			}
		});

		// 인증번호 일치여부 확인
		$("#btnAuth").on(
				"click",
				function() {
					$.ajax({
						type : "GET",
						url : "/emailCheckOk",
						data : {
							"authCode" : $("#authCode").val().trim()
						},
						dataType : "text",
						success : function(result) {
							var resp = result.trim();
							if (resp == "OK") {
								$("#authCodeCheck").html("이메일 인증이 완료되었습니다.")
										.css("color", "blue");
								isCertification = true; //인증 성공여부 check
							} else {
								$("#authCodeCheck").html("인증번호가 불일치합니다.").css(
										"color", "red");
								isCertification = false; //인증 실패
							}
						}
					});
				});

		// 회원가입 유효성 검사

	})
	function validation() {

		//변수에 저장

		var $name = $("#name").val().trim();
		var $email = $("#email").val().trim();
		var $authCode = $("#authCode").val().trim();
		var $password = $("#password").val().trim();
		var $repeatPw = $("#repeatPw").val().trim();

		// 정규식
		// 이름
		var regName = /^[가-힣a-zA-Z]{2,15}$/;

		// id, pw
		var regIdPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

		// 이메일
		var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		//이름 확인 = 한글과 영어만 가능하도록
		if (name.value == "") {
			alert("이름을 입력하세요.")
			name.focus();
			return false;
		} else if (!regName.test(name.value)) {
			alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
			name.focus();
			return false;
		}

		//메일주소 확인
		if (email.value == "") {
			alert("메일주소를 입력하세요.")
			email.focus();
			return false;
		}

		else if (!regMail.test(email.value)) {
			alert("잘못된 이메일 형식입니다.")
			email.focus();
			return false;
		}
		//비밀번호 확인
		if (password.value == "") {
			alert("비밀번호를 입력하세요.")
			password.focus();
			return false;
		}
		//비밀번호 영어 대소문자 확인
		else if (!regIdPw.test(password.value)) {
			alert("영문 대문자 또는 소문자, 숫자를 포함한 8자 이상으로 입력하세요.")
			password.focus();
			return false;
		}
		//비밀번호와 아이디 비교
		else if (password.value == email.value) {
			alert("이메일과 동일한 비밀번호를 사용할 수 없습니다.")
			password.focus();
			return false;
		}

		//비밀번호 확인
		if (password.value !== repeatPw.value) {
			alert("비밀번호와 비밀번호 확인이 동일하지 않습니다.")
			repeatPw.focus();
			return false;
		}
		if (isCertification == false) {
			alert("이메일 인증이 완료되지 않았습니다.")
			return false;
		}

		// 유효성 문제 없을 시 폼에 submit
		$("#frm").attr("action", "/registerOk").submit();

	}
</script>



</head>
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card register-form">
			<div class="card-body">
				<h3 class="card-title text-center">SIGN UP</h3>
				<div class="card-text">
					<form action="/registerOk" method="post" name="frm" id="frm">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />
						<div class="row g-3 align-items-center " style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">닉네임</span>
									<div class="form-floating">
										<input type="text" class="form-control" name="name" id="name"
											placeholder="Name"> <label for="name">닉네임</label>
										<div class="invalid-feedback">닉네임은 2글자 이상 작성해주세야합니다.</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">이메일</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" name="email"
												id="email" placeholder="account@example.com"
												aria-labelledby="emailCheck" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="email">이메일</label>
											<div class="invalid-feedback">이메일을 입력해주세요</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<span id="idCheck" class="form-text"></span>
								</div>
							</div>

							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="인증번호 받기" id="btnMailCheck"
									style="display: none; height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>
						</div>
						<div class="row g-3 align-items-center" id="authCodeDiv"
							style="display: none" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">이메일 확인 인증번호</span>
									<div class="form-floating">
										<input type="text" class="form-control" name="authCode"
											id="authCode" placeholder="authCode"
											aria-labelledby="btnAuth" class="form-control"
											id="validationTooltipUsername"
											aria-describedby="validationTooltipUsernamePrepend" required>
										<div class="invalid-feedback">이메일 확인 인증번호를 입력해주세요</div>

									</div>
								</div>
							</div>
							<div class="col-6">
								<input type="button"
									style="height: 45px; margin-top: 60px; margin-left: 220px;"
									class="btn btn-outline-success btn-sm" value="인증" id="btnAuth" />
								&nbsp;&nbsp;&nbsp;
							</div>
							<div class="col-6">
								<span id="authCodeCheck" class="form-text"></span>
							</div>
						</div>

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Password" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="password">비밀번호</label>
											<div class="invalid-feedback" style="width: 400px;">비밀번호는
												8자 이상으로 영어 대,소문자와 숫자 특수문자를 포함하여 입력해주세요</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6">
								<span id="pwCheck" class="form-text"></span>
							</div>
						</div>

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">비밀번호 확인</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control"
												name="passwordCheck" id="repeatPw" placeholder="Password"
												class="form-control"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="repeatPw">비밀번호 확인</label>
											<div class="invalid-feedback" style="width: 400px;">비밀번호와 동일하지 않습니다.</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6">
								<span id="repeatPwCheck" class="form-text"></span>
							</div>
						</div>


						<div class="d-grid gap-2 col-12" style="height: 65px;">
							<button type="button" class="btn btn-success" value="가입하기"
								onclick="validation()">가입하기</button>

						</div>
						<div class="sign-in">
							<a href="/">이미 계정이 있습니다</a>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>