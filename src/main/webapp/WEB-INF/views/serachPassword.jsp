<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

#email {
	width: 350px;
}
#authCode{
	width: 350px;
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


<!--  javascript -->

<script type="text/javascript">
	$(function() {
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
	})
	//유효성 검사 후 비밀번호 찾기 폼으로 이동하게 
	function validation() {
		//변수 저장
		var $email = $("#email").val().trim();
		// 이메일
		var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

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
		if (isCertification == false) {
			alert("이메일 인증이 완료되지 않았습니다.")
			return false;
		}

		// 유효성 문제 없을 시 폼에 submit

		$("#frm").attr("action", "/searchPasswordOk").submit();

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
							<h6>가입한 아이디(이메일)를 입력해주세요</h6>
							<h6>이메일 본인인증을 통해</h6>
							<h6>비밀번호를 변경합니다.</h6>

						</div>

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative"
								style="padding-right: 0px; width: 378px;">
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
									style="height: 45px; margin-top: 15px;" />
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
									style="height: 45px; margin-top: 57px; margin-left: 139px; width: 85px;"
									class="btn btn-outline-success btn-sm" value="인증" id="btnAuth" />
								&nbsp;&nbsp;&nbsp;
							</div>
							<div class="col-6">
								<span id="authCodeCheck" class="form-text"></span>
							</div>
						</div>

						<div class="d-grid gap-2 col-12" id="serachButtonDiv"
							style="width: 276px; height: 36px; margin-top: 40px;">
							<input type="button" id="serachButton" class="btn btn-success"
								value="비밀번호 찾기"
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