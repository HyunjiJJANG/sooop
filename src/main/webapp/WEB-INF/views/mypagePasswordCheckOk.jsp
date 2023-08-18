<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.form-control {
	margin-bottom: 20px;
	width: 450px;
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

/* 이미지 수정 아이콘 스타일 */
#profileImageModifyButton {
	position: absolute;
	bottom: 0;
	right: 0;
	left: 130px;
	width: 40px;
	height: 40px;
	background-color: #bdbdbd;
	border-radius: 50%;
	object-fit: cover;
	z-index: 1; /* 이미지를 다른 요소들 위에 겹치도록 설정 */
}

/* 프로필 이미지 스타일 수정 */
img.rounded {
	position: relative;
	z-index: 0; /* 프로필 이미지의 z-index 값을 낮추어 다른 요소 위에 나오도록 설정 */
}

#MypageH6 {
	margin-top: 40px;
	margin-bottom: 20px;
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
	text-align: left;
	height: 100%;
}

.card-title {
	font-weight: 300;
}

#MypageH2 {
	font-weight: bold;
}

#MypageH6 {
	margin-top: 40px;
	margin-bottom: 20px;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 100%;
}
</style>

<script type="text/javascript">
	$(function() {

		//이름 변경 버튼을 누르면 입력받는 창이 보이게
		$("#nameChange").on("click", function() {
			console.log("이름 변경 버튼 눌림 ");
			$("#nameDiv").hide();
			$("#newChangeNameDiv").show();
		});

		//이름 변경 입력 취소 버튼을 누르면 입력 받는 창이 안 보이게
		$("#nameChangeCancel").on("click", function() {
			console.log("이름 변경 입력 취소 버튼 눌림 ");
			$("#newChangeNameDiv").hide();
			$("#nameDiv").show();
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
		$("#password").on("keyup", function() {
			if ($(this).val().trim().length < 8) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");

			} else if ($(this).val().trim().length >= 8) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");

			}
		})

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

		//이름 변경 확인 버튼을 누르면
		$("#nameChangeOk")
				.on(
						"click",
						function() {
							console.log("이름 변경 확인 버튼 눌림 ");

							if ($("#name").val().trim().length > 2
									&& $("#name").val().trim() !== $(
											"#nameView").val()) {

								$.ajax({
									type : 'GET',
									url : '/nameChange',
									data : {
										"name" : $("#name").val().trim(),
										"nameView" : $("#nameView").val(),
										"email" : $("#email").val()
									},
									dataType : 'text',
									success : function(result) {
										var resp = result.trim();
										if (resp == "OK") {
											alert("닉네임(이름) 변경이 완료되었습니다.");

											$("#newChangeNameDiv").hide();
											$("#nameDiv").show();
											location.reload();

										} else {
											alert("닉네임(이름) 변경에 실패했습니다.");

										}
									}

								});

							} else if ($("#name").val().trim().length < 3) {
								alert("최소 2글자 이상 입력하세요.");
							} else if ($("#name").val().trim() == $("#nameView")
									.val().trim()) {

								alert("변경 전 같은 이름은 사용 불가능합니다.");
							}

						});

		//비밀번호 변경 버튼을 누르면 입력받는 창이 보이게
		$("#passwordChange").on("click", function() {
			$("#passwordDiv").hide();
			$("#newChangePasswordDiv").show();
			$("#newChangePasswordCheckDiv").show();
		});

		//비밀번호 변경 입력 취소 버튼을 누르면 입력받는 창이 보이게
		$("#passwordChangeCancel").on("click", function() {
			$("#newChangePasswordDiv").hide();
			$("#newChangePasswordCheckDiv").hide();
			$("#passwordDiv").show();
		});

		//비밀번호 변경 확인 버튼을 누르면
		$("#passwordChangeOk").on(
				"click",
				function() {
					console.log("비밀번호 변경 확인 버튼 눌림 ");

					if ($("#password").val().trim().length > 7
							&& $("#password").val().trim() == $("#repeatPw")
									.val().trim()) {

						$.ajax({
							type : 'GET',
							url : '/passwordChange',
							data : {

								"password" : $("#password").val(),
								"repeatPw" : $("#repeatPw").val(),
								"email" : $("#email").val()
							},
							dataType : 'text',
							success : function(result) {
								var resp = result.trim();
								if (resp == "OK") {
									alert("비밀번호 변경이 완료되었습니다.");
									$("#newChangePasswordDiv").hide();
									$("#newChangePasswordCheckDiv").hide();
									$("#passwordDiv").show();
									location.reload();

								} else {
									alert("비밀번호 변경에 실패했습니다.");

								}
							}

						});

					} else if ($("#password").val().trim().length < 7) {
						alert("8~30자 영문 대소문자, 숫자만 입력하세요.");
					} else if ($("#password").val().trim() !== $("#repeatPw")
							.val().trim()) {

						alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					}

				});

	})

	// 파일 선택 버튼 클릭 시, input 태그를 클릭하도록 설정
	$(document).ready(function() {
		$("#fileInputLabel").on("click", function() {
			$("#profileImageInput").click();
		});

		/* 프로필 사진 변경 코드  */

		$("#profileImageInput").on("change", function() {
			const file = this.files[0];
			const formData = new FormData();
			formData.append("profileImage", file);
			formData.append("email", $("#email").val());

			$.ajax({
				type : "POST",
				url : "/uploadProfileImage",
				data : formData,
				contentType : false,
				processData : false,
				success : function(response) {
					// 성공적으로 업로드된 경우 처리 로직
					alert("프로필 사진이 성공적으로 업로드되었습니다!");
					location.reload();
				},
				error : function(error) {
					// 업로드 오류 처리 로직
					alert("프로필 사진 업로드에 오류가 발생했습니다.");
				}
			});
		});
	});
</script>
<jsp:include page="nav.jsp" />
</head>

	<body>
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row" style="margin-top: 50px; margin-left: 200px;">
					<div class="col-xl-10 col-md-12"
						style="margin-top: 40px; height: 2000px;">
						<div class="card table-card">
							<div class="card-header" style="padding-bottom: 0px;">
								<h3>회원정보</h3>

							</div>

							<div class="card-body p-0 ">
								<div class="table-responsive" style="height: 1200px">
									<div class="card-text" style="margin-top:-50px;">

										<!-- <form name="frm" id="frm"> -->
										<!-- <div class="card-title text-left" id="MypageH6">
											<h5 style="margin-right: 663px;">회원정보</h5>
										</div> -->
										<!-- 회원 프로필 사진 -->
										<div class="text-left"
											style="margin-top: 10px; margin-bottom: 50px; position: relative;">
											<!-- 최신 브라우저들은 보안상의 이유로 웹 페이지에서 
							로컬 파일 시스템의 리소스를 직접 접근하는 것을 금지하고 있습니다.
							 따라서 로컬 파일 시스템의 경로를 직접 불러올 수 없도록 막고 있습니다. 그래서 정적 리소스 경로 사용하여 이미지 보여줌 -->
											<img src="/data/${memberDTO.profile_name}" class="rounded"
												alt="profile_image"
												style="width: 150px; height: 150px; margin-right: 520px;">

											<!-- 버튼을 누르면 회원 프로필 사진이 변경되게하는 a태그 -->
											<form id="profileImageForm" enctype="multipart/form-data"
												modelAttribute="uploadFile" method="POST">
												<label for="profileImageInput" id="fileInputLabel">
													<a href="#" id="profileImageModify"> <img
														src="/images/iconmodify.png" alt="profile_image"
														id="profileImageModifyButton"
														style="top: 160px; left: 160px;">
												</a>
												</label> <input type="file" name="profileImage"
													id="profileImageInput" style="display: none;"/> <input
													type="hidden" name="email" id="email"
													value="${memberDTO.email }">
												<!-- email 값을 변경해주세요 -->


												<!-- <a href="#" id="profileImageModify"> <img
									src="/images/iconmodify.png" alt="profile_image"
									id="profileImageModifyButton">
								</a> <input type="file" name="file" id="profileImageInput" /> -->
											</form>
											<!-- <a href="#" id="profileImageModify"> <input type="file"
									id="profileImageInput" style="display: none;"> <img
									src="/images/iconmodify.png" alt="profile_image"
									id="profileImageModifyButton">
									
									
									
									<input type="file"
										id="profileImageInput"/>
										
										
										
								</a> -->
										</div>


										<!-- 이메일 -->
										<div class="row g-3 align-items-center" style="width: 800px;">
											<div class="col-md-6 position-relative">
												<div class="col-6">
													<span class="join-label-title" style="margin-right: 61px;">이메일(아이디)</span>
													<div class="form-floating">
														<div class="form-floating mb-3">
															<input type="email" class="form-control" name="emailView"
																id="emailView" value="${memberDTO.email }"
																style="--bs-border-color: #ffffff; padding-top: 0px; width: 300px;  background-color: white; border: 1px solid #ccc;"
																readonly /> <input type="hidden" id="email"
																name="email" value="${memberDTO.email }" />

														</div>
													</div>
												</div>
											</div>
										</div>




										<div style="margin-top: 30px; margin-bottom: 40px;">
											<hr />
										</div>
										<hr class="pill" />
										<div class=id="MypageH6" >
											<h5 style="margin-right: 663px;">회원정보 수정</h5>
										</div>
										<div style="margin-top: 5px; margin-bottom: 5px;">
											<hr />
										</div>
										<!-- <div style="margin-bottom: 30px;">
											<span style="margin-right: 663px;">로그인 정보</span>
										</div> -->
										<!-- hidden -->




										<!-- 닉네임 -->
										<div class="row g-3 align-items-center" style="width: 800px;"
											id="nameDiv">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
													<div class="form-floating">
														<div class="form-floating mb-3">
															<input type="text" class="form-control" name="nameView"
																id="nameView" value="${memberDTO.name }"
																style="--bs-border-color: #ffffff; padding-top: 0px; width: 300px;background-color: white;   margin-bottom: 45px;"
																readonly />
														</div>

													</div>
												</div>
											</div>

											<div class="col-1">
											
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="변경" id="nameChange"
													style="height: 45px; margin-top: 15px;  width: 73px;" />
											</div>

										</div>

										<!-- 닉네임 변경 후 보일 div -->
										<div class="row g-3 align-items-center"
											style="width: 800px; display: none;" id="nameChangOkDiv">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
													<div class="form-floating">
														<div class="form-floating mb-3">
															<div class="col-6">
																<span id="nameCkView" class="form-text"></span>
															</div>
														</div>

													</div>
												</div>
											</div>

											<div class="col-1">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="변경" id="nameChange"
													style="height: 45px; margin-top: 15px;  width: 73px;" />
											</div>

										</div>


										<!-- 새로 받을 닉네임 -->
										<div class="row g-3 align-items-center" id="newChangeNameDiv"
											style="width: 800px; display: none;">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
													<div class="form-floating">
														<div class="form-floating mb-3">
															<input type="text" class="form-control" name="name"
																id="name"
																style="padding-top: 0px; width: 300px; background-color: white;  margin-bottom: 45px;"
																id="validationTooltipUsername"
																aria-describedby="validationTooltipUsernamePrepend"
																required />
															<div class="invalid-feedback"
																style="width: 300px; margin-bottom: 30px; margin-top: -20px;">닉네임은
																2글자 이상 작성해주세야합니다.</div>
														</div>

													</div>
												</div>
											</div>

											<div class="col-1" style="margin-top: 10px;">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="변경" id="nameChangeOk"
													style="height: 45px; margin-top: 15px;  width: 73px;" />
											</div>
											<div class="col-1" style="margin-top: 10px;">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="입력 취소" id="nameChangeCancel"
													style="height: 45px; margin-top: 15px; margin-left: 60px; width: 73px;" />
											</div>

										</div>


										<!-- 비밀번호 -->
										<div class="row g-3 align-items-center" style="width: 800px;"
											id="passwordDiv">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">비밀번호</span>
													<div class="form-floating">
														<div class="form-floating">


															<input type="password" class="form-control" name="pwView"
																id="pwView" class="form-control" value="password"
																style="--bs-border-color: #ffffff; width: 300px; background-color: white;  margin-bottom: 45px;"
																readonly /> <input type="hidden" class="form-control"
																name="passwordView" id="passwordView"
																class="form-control" value="${memberDTO.password }" />
															<label for="password"></label>
														</div>
													</div>
												</div>
											</div>
											<div class="col-1">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="변경" id="passwordChange"
													style="height: 45px; margin-top: 15px; width: 73px;" />

											</div>
										</div>

										<!-- 변경 할 비밀번호 -->
										<div class="row g-3 align-items-center"
											style="width: 800px; display: none;"
											id="newChangePasswordDiv">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">비밀번호</span>
													<div class="form-floating">
														<div class="form-floating">
															<input type="password" class="form-control"
																name="password" id="password" class="form-control"
																style="width: 300px;  margin-bottom: 45px;"
																id="validationTooltipUsername"
																aria-describedby="validationTooltipUsernamePrepend"
																required /> <label for="password"></label>
															<div class="invalid-feedback"
																style="width: 400px; margin-bottom: 30px; margin-top: -20px;">8~30자
																영문 대소문자, 숫자만 입력하세요.</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 변경 할 비밀번호 확인 -->
										<div class="row g-3 align-items-center"
											style="width: 800px; display: none; margin-top: -50px;"
											id="newChangePasswordCheckDiv">
											<div class="col-md-6 position-relative" style="width: 150px;">
												<div class="col-6">
													<span class="join-label-title"
														style="width: 200px; margin-top: 20px;">비밀번호 확인</span>
													<div class="form-floating">
														<div class="form-floating">
															<input type="password" class="form-control"
																name="repeatPw" id="repeatPw" class="form-control"
																style="width: 250px; margin-bottom: 45px; width: 300px; "
																id="validationTooltipUsername"
																aria-describedby="validationTooltipUsernamePrepend"
																required /> <label for="password"></label>
															<div class="invalid-feedback"
																style="width: 300px; margin-bottom: 30px; margin-top: -20px;">비밀번호와
																동일하지 않습니다.</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-1">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="변경" id="passwordChangeOk"
													style="height: 45px; margin-top: 15px; width: 73px;" />
											</div>
											<div class="col-1">
												<input type="button" class="btn btn-outline-primary btn-sm"
													value="입력 취소" id="passwordChangeCancel"
													style="height: 45px; margin-top: 15px; margin-left: 60px; width: 73px;" />
											</div>

										</div>

										<hr />

										<!-- 	</form> -->

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