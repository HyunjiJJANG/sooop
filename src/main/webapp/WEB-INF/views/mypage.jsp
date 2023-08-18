<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<script src="https://kit.fontawesome.com/a613319909.js"
	crossorigin="anonymous"></script>


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">

<link
	href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
form {
	padding-top: 10px;
	font-size: 14px;
	margin-top: 20px;
	text-align: center;
	align-items: center;
	justify-content: center;
}

.form-floating {
	margin-top: 10px;
}

.sign-in {
	text-align: center;
	padding: 20px 0 0;
}

.join-label-title {
	display: inline-block;
	padding: 3px 0;
	font-size: 16px;
	color: #333;
	font-weight: 700;
	text-align: left;
}

.row g-3 align-items-center {
	width: 800px;
}

#btnNext {
	margin-top: 50px;
	width: 250px;
	height: 40px;
	margin-left: 218px;
}

.card-text {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	height: 100%;
}

.card-body {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	height: 100%;
}
</style>





<script type="text/javascript">
	function validation() {

		var email = $("#email").val().trim();
		console.log(email);
		var password = $("#password").val().trim();
		console.log(password);
		$
				.ajax({
					type : "GET",
					url : "/mypagePasswordCheck",
					data : {
						/* "email" : $("#email").val().trim(),
						"password" : $("#password").val().trim() */
						"email" : email,
						"password" : password
					},
					dataType : "text",
					success : function(result) {
						var resp = result.trim();
						if (resp == "OK") {
							alert("비밀번호 확인이 완료되었습니다.");
							isCertification = true; //인증 성공여부 check	
							$("#frm").attr("action", "/mypagePasswordCheckOk")
									.submit();
						}

						else {
							isCertification = false; //인증 실패
							alert("비밀번호가 맞지않습니다. 다시 확인해주세요.");
						}
					}
				});

		if (isCertification == false) {
			alert("비밀번호가 맞지않습니다. 다시 확인해주세요.")
			return false;
		}

	}
</script>
<jsp:include page="nav.jsp" />
</head>
<body>
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="row" style="margin-top: 50px;">
				<!--  -->
				<div class="col-xl-12 col-md-12"
					style="margin-top: 50px; height: 2000px;">
					<div class="card table-card">
						<div class="card-header" style="padding-bottom: 0px;">
							<h3>마이페이지 - 비밀번호 확인</h3>
							<div style="margin-top: 20px; margin-bottom: 20px;">
								<span>회원님의 소중한 정보보호를 위해 비밀번호를 재확인하고 있습니다.</span>
							</div>
						</div>


						<div class="card-body p-0 ">
							<div class="table-responsive" style="height: 550px">
								<div class="card-text">
									<form action="/mypagePasswordCheckOk" method="post" name="frm"
										id="frm">
										<div style="width: 500px;">
											<div>
												<div>
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px; margin-right: 80px;">이메일</span>
													<div class="form-floating">
														<div class="form-floating mb-3" style="left: 125px;">
															<input type="email" class="form-control"
																style="width: 300px; margin-left: -20px; background-color: white; border: 1px solid white;"
																name="emailView" id="emailView"
																value="${memberDTO.email }"
																style="--bs-border-color: #ffffff;" readonly /> <input
																type="hidden" id="email" name="email"
																value="${memberDTO.email }" />

														</div>
													</div>
												</div>
											</div>
										</div>




										<div style="width: 500px;">
											<div>
												<div>
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px; margin-right: 80px;">비밀번호</span>
													<div class="form-floating">
														<div class="form-floating mb-3" style="left: 125px;">
															<input type="password" class="form-control"
																name="password" id="password" placeholder="Password"
																class="form-control" id="validationTooltipUsername"
																aria-describedby="validationTooltipUsernamePrepend"
																required style="width: 300px; margin-left: -20px;" /> <label
																for="password">비밀번호</label> <input type="hidden"
																id="passwordCheckTest" name="passwordCheckTeset"
																value="${memberDTO.password }" />


														</div>
													</div>
												</div>
											</div>

										</div>
										<hr />
										<div class="d-grid gap-2 col-12"
											style="width: 300px; height: 65px; display: flex; justify-content: center; align-items: center;">
											<!-- <button type="button" class="btn btn-success" id="btnNext"
													value="다음" onclick="validation()">다음</button> -->
											<button type="button"
												class="btn btn-primary btn-sm scheduleAdd" id="btnNext"
												onclick="validation()" value="다음">&nbsp;&nbsp;다음</button>

										</div>

									</form>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>