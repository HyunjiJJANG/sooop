<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="author" content="" />
<!-- 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="/css/hhj.css">
<!-- 부트스트랩 -->
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
</head>
<body class="d-flex flex-column h-100">
		<div class="global-container"> 
			<div class="card login-form">
				<div class="card-body">
					<h3 class="card-title text-center">SIGN IN</h3>
					<div class="card-text">
						<form action="loginOk.jsp" name="frm" method="post">
							<div class="form-group">
							  	<div class="form-floating">
									<input type="text" class="form-control" name="id" id="id" placeholder="ID" aria-labelledby="btnIdCheck">
									<label for="id">아이디</label>
								</div>
							</div>
							<div class="form-group">
						  		<div class="form-floating">
									<input type="password" class="form-control" name="pw" id="pw" placeholder="Password" aria-labelledby="repeatPw">
									<label for="pw">비밀번호</label>
								</div>
								<!-- <a href="###" style="float:right;font-size:12px;text-decoration:none;">비밀번호를 잊으셨나요?</a> -->
							</div>
							<div class="d-grid gap-2 col-12">
								<input type="submit" class="btn btn-primary" value="로그인" id="btn" />
							</div>
							<div class="sign-up">
								<span>계정이 없으신가요?</span>
								<a href="register.jsp" style="text-decoration:none;">여기를 눌러 회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>