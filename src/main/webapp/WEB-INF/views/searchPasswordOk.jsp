<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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

#searchPasswordH2 {
	font-weight: bold;
}

#searchPasswordH6 {
	margin-top: 40px;
	margin-bottom: 40px;
}



$
hr-height: 2px ; $hr-line-color: currentColor ; $hr-content-color: currentColor 
	 ; hr {
	height: $hr-height;
	overflow: visible;
	color: #999;
	position: relative;
	margin: 2em auto; &:: before { content : '';
	background: linear-gradient(to right, transparent, $ hr-line-color, transparent);
	height: $hr-height;
	width: 100%;
	position: absolute;
	left: 0;
}

&
[data-content] {
	text-align: center;
	&::
	before
	{
}

&
::after {
	content: attr(data-content);
	position: relative;
	background: #eee;
	padding: 0 1.5rem;
	top: -0.475em;
	font-size: 3em;
	line-height: 1;
	font-family: serif;
	font-style: italic;
	color: $hr-content-color;
}
}
}
</style>
<script type="text/javascript">


$(function() {
// 비밀번호 길이가 8보다 작으면 빨간 테두리
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

})
//유효성 검사 
function validation() {
	
	
	//변수에 저장 
	var $password = $("#password").val().trim();
	var $repeatPw = $("#repeatPw").val().trim();
	
	// pw
	var regIdPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

	//비밀번호 확인
	if (password.value == "") {
		alert("비밀번호를 입력하세요.")
		password.focus();
		return false;
	}
	//비밀번호 영어 대소문자 확인
	else if (!regIdPw.test(password.value)) {
		alert("8~30자 영문 대소문자, 숫자만 입력하세요.")
		password.focus();
		return false;
	}
	//비밀번호 확인
	if (password.value !== repeatPw.value) {
		alert("비밀번호와 비밀번호 확인이 동일하지 않습니다.")
		repeatPw.focus();
		return false;
	}
	// 유효성 문제 없을 시 폼에 submit
	alert("비밀번호 변경이 완료되었습니다.");
	$("#frm").attr("action", "/passwordChange").submit();
	
}

</script>


</head>
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card login-form">
			<div class="card-body">
				<h2 class="card-title text-center" id="searchPasswordH2">비밀번호
					찾기</h2>
				<div class="card-text">
					<form action="searchPasswordOk" method="post" name="frm" id="frm">

						<hr />
						<div class="card-title text-center" id="searchPasswordH6">
							<h6>비밀번호를 변경해주세요</h6>
						</div>

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
										
										<input type="hidden" name="member_no" value="${memberDto.member_no}"/>
										
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Password" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<label for="password">비밀번호</label>
											<div class="invalid-feedback " style="width: 400px;">비밀번호는
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
						
						

						<div class="d-grid gap-2 col-12" id="changeButtonDiv"
							style="width: 276px; height: 36px; margin-top: 40px;">
							<input type="button" id="changeButton" class="btn btn-success"
								value="비밀번호 변경하기"
								style="margin-top: 20px; width: 450px; height: 50px;"
								onclick="validation()" />
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>