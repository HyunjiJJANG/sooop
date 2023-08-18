<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<meta charset="utf-8">

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

#MypageH2 {
	font-weight: bold;
}

#MypageH6 {
	margin-top: 40px;
	margin-bottom: 20px;
}

#btnNext {
	margin-top: 50px;
	width: 250px;
	height: 40px;
	margin-left: 330px;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 100%;
}

#profileImageModifyButton {
	position: fixed;
	top: 308px; /* 화면 위쪽에서 20px 떨어진 위치에 고정됩니다. */
	left: 314px; /* 화면 오른쪽에서 20px 떨어진 위치에 고정됩니다. */
	width: 50px;
	background-color: #bdbdbd;
	padding: 10px;
	border-radius: 50%; /* 반지름 값이 너비와 높이의 절반 크기가 되도록 설정 */
	object-fit: cover; /* 이미지가 요소에 꽉 차도록 설정 */
}

#profileImage {
	width: 100px;
	height: 100px;
	text-align: center;
	align-items: center;
}

#profileCard {
	text-align: left;
	align-items: center;
	margin-right: 50px;
	margin-left:200px;
	width: 1000px;
	height: 400px;
	overflow-y: auto;
}
/* 검색창  */
#searchDiv {
	position: relative;
	width: 200px;
	margin-left: 1000px;
	margin-top: 70px;
	margin-bottom: 10px;
}

#searchInput {
	font-size: 15px;
	color: #222222;
	width: 200px;
	border: none;
	border-bottom: solid #aaaaaa 1px;
	padding-bottom: 10px;
	padding-left: 10px;
	position: relative;
	background: none;
	z-index: 5;
}

#searchInput::placeholder {
	color: #aaaaaa;
}

#searchInput:focus {
	outline: none;
}

#searchSpan {
	display: block;
	position: absolute;
	bottom: 0;
	left: 0%; /* right로만 바꿔주면 오 - 왼 */
	background-color: #666;
	width: 0;
	height: 2px;
	border-radius: 2px;
	transition: 0.5s;
}

#searchLable {
	position: absolute;
	color: #aaa;
	left: 10px;
	font-size: 20px;
	bottom: 8px;
	transition: all .2s;
}

#searchInput:focus ~ #searchLable, #searchInput:valid ~ #searchLable {
	font-size: 16px;
	bottom: 40px;
	color: #666;
	font-weight: bold;
}

#searchInput:focus ~ #searchSpan, #searchInput:valid ~ #searchSpan {
	width: 100%;
}

.search-result-container {
	margin-left: 100px;
	/* margin:auto; */
}
</style>

<script type="text/javascript">
	$(function() {
		$("#searchInput").on("keyup", function() {
			var searchName = $(this).val().trim();
			var member_no = parseInt($("#member_no").val());
			var project_no = parseInt($("#project_no").val());
			getSearchList(searchName, member_no, project_no);
		});
	});

	function getSearchList(searchName, member_no, project_no) {
		console.log("searchName getSearchList 이벤트 발생중");

		$
				.ajax({
					url : "/getSearchList",
					method : "GET",
					data : {
						searchName : searchName,
						member_no : member_no,
						project_no : project_no
					},
					dataType : "json",
					success : function(result) {
						if (result && result.length >= 1) {
							var searchResultList = [];
							
							result
									.forEach(function(item) {
										var str = '<div class="col" id="searchResultList">';
										str += '<div>';
										str += '<img src="/data/' + item.profile_name + '" class="card-img-top" alt="프로필 이미지" id="profileImage">';
										str += '<div>';
										str += '<h5 class="card-title" style="margin-top: 10px;">'
												+ item.name + '</h5>';
										str += '<p class="card-text">'
												+ item.email + '</p>';
										str += '</div>';
										str += '</div>';
										str += '</div>';

										searchResultList.push(str);
									});

							$('#profileCard').empty().append(
									searchResultList.join(''));
						} else {

							$('#profileCard').empty();
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						console.log("Error occurred:", errorThrown);
					}
				});
	}
</script>
<jsp:include page="nav.jsp" />
</head>

<body>
	<input type="hidden" value="${email }" name="email" />
	<input type="hidden" value="${member_no }" name="member_no"
		id="member_no" />
	<input type="hidden" value="${project_no }" name="project_no"
		id="project_no" />
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<nav class="pcoded-navbar theme-horizontal menu-light"
				style="position: fixed; height: 100px;">
				<div class="navbar-wrapper container" style="text-align: left;">
					<div class="navbar-content sidenav-horizontal" id="layout-sidenav">
						<table>
							<tr>
								<td>
									<ul class="nav pcoded-inner-navbar sidenav-inner">
										<li class="nav-item"><span class="pcoded-mtext"
											style="padding-top: 15px; font-size: 20px;">${projectDTO.project_title}</span>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>
									<ul class="nav pcoded-inner-navbar sidenav-inner">

										 <li class="nav-item">
                              <a href="feed?project_no=${pno}&member_no=${mno}" class="nav-link "><span class="pcoded-micon"><i class="fa-regular fa-message" style="color: #707272;"></i></span><span class="pcoded-mtext">피드</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="gantt?member_no=${member_no }" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-calendar-days"></i></span><span class="pcoded-mtext">일정</span></a>
                          </li>
                          <li class="nav-item">

                              <a href="kanban?member_no=${member_no }" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span><span class="pcoded-mtext">할일</span></a>

                          </li>
                          <li class="nav-item">
                              <a href="contact?email=${memberDTO.email }&project_no=${pno}&member_no=${mno}" class="nav-link "><span class="pcoded-micon"><i class="fa-regular fa-address-book"></i></span><span class="pcoded-mtext">주소록</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="fileList?project_no=${pno}&member_no=${mno}" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-file-arrow-down"></i></span><span class="pcoded-mtext">첨부파일</span></a>
                          </li>
									</ul>
								</td>

							</tr>
						</table>
					</div>
				</div>
			</nav>

			<div class="pcoded-main-container">
				<div class="pcoded-content">
					<div class="row" style="margin-top: 50px;">
						<div class="col-xl-12 col-md-12">
							<div class="card table-card">
								<div class="card-header" style="padding-bottom: 0px;">
									<h3>주소록</h3>
								</div>

								<div class="card-body p-0">
									<div class="table-responsive">
										<div class="card-text">

											<div class="search-result-container">
												<div id="searchDiv">
													<input type="text" id="searchInput" name="searchInput"
														required> <label id="searchLable">이름🔍</label> <span
														id="searchSpan"></span>
												</div>
												<!-- <div class="row row-cols-1 row-cols-md-3 g-6 "
														id="profileCard" style="height: 600px; width: 800px;">
									</div> -->
											</div>
											<div class="card-body p-0">
												<div class="table-responsive">
													<div class="card-text" style="margin-left: 150px;">
														<div class="search-result-container">
															<div class="row" id="profileCard"
																style="margin-left: 10px; margin-right: 10px; margin-top: 10px; margin-bottom: 10px">
																<c:forEach var="memberProjectMemberdto" items="${list}">
																	<div class="col" id="searchResultList">
																		<div>
																			<img
																				src="/data/${memberProjectMemberdto.profile_name }"
																				class="card-img-top" alt="프로필 이미지" id="profileImage">
																			<div>
																				<h5 class="card-title-center"
																					style="margin-top: 10px;">${memberProjectMemberdto.name }</h5>
																				<p class="card-text-center"
																					style="margin-top: 10px;">${memberProjectMemberdto.email }</p>
																			</div>
																		</div>
																	</div>
																</c:forEach>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>

									</div>
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