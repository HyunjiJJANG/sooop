<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILE : SOOP</title>

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/memo.css">
<script src="https://kit.fontawesome.com/a613319909.js"
	crossorigin="anonymous"></script>

<!-- Full Calendar -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
<!-- Meta -->
<meta charset="utf-8">
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
<script type="text/javascript">
	//파일함 비동기 선택옵션
	function projectFileSelect() {
		var member_no = $("#member_no").val();
		let projectNo = $("#projectFileSelect").val();
		$
				.ajax({
					type : "GET",
					url : "/home/selectFile/" + member_no,
					data : {
						"member_no" : member_no
					},
					dataType : "text",
					success : function(data) {
						var obj = JSON.parse(data);
						var text = ""
						var count = 0;

						for (var i = 0; i < obj.length; i++) {
							count += (projectNo == obj[i].project_no);
						}

						if (count == 0) {
							if (projectNo == "프로젝트 선택") { // 프로젝트 선택 옵션은 전체 리스트가 나오게
								for (var i = 0; i < obj.length; i++) {
									text += "<tr><td><div class='chk-option'><label class='check-task custom-control custom-radio d-flex justify-content-center done-task'>"
											+ "<input  type='radio' name='options' class='custom-control-input'><span class='custom-control-label'></span>"
											+ "</label></div><div class='d-inline-block align-middle'><div class='d-inline-block'><h6>"
											+ obj[i].file_name
											+ "</h6><span class='text-muted m-b-0'>업로드한 날짜 : "
											+ obj[i].file_register_date
											+ "</span></div></div></td></tr>"
								}
							} else {
								text += "<tr><td style='text-align: center;'><div class='chk-option'>첨부파일 비어있음</div></td></tr>"
							}
						} else if (count != 0) {
							for (var i = 0; i < obj.length; i++) {
								if (projectNo == obj[i].project_no) {
									text += "<tr><td><div class='chk-option'><label class='check-task custom-control custom-radio d-flex justify-content-center done-task'>"
											+ "<input  type='radio' name='options' class='custom-control-input'><span class='custom-control-label'></span>"
											+ "</label></div><div class='d-inline-block align-middle'><div class='d-inline-block'><h6>"
											+ obj[i].file_name
											+ "</h6><span class='text-muted m-b-0'>업로드한 날짜 : "
											+ obj[i].file_register_date
											+ "</span></div></div></td></tr>"
								}
							}
						}

						$("#fileList").html(text);
					}
				})
	}

	// 첨부파일 다운로드 버튼 클릭시 파일 다운로드 하기
	$(function() {
		$("#fileDownload").click(function() {
			const fileName = $("input:radio[id='fileName']:checked").val();
			if (fileName) {
				console.log("선택한 파일이름: " + fileName);
				console.log("/download?fileName=" + fileName);
				const downloadUrl = "/download?fileName=" + fileName;
				window.open(downloadUrl, "_blank");
				/*  $.ajax({
				 	type : "GET",
				 	url : "/download?fileName="+fileName,
				 	data : {
				 		fileName : fileName
				 	},
				 	success : function(b){
				 		//if(b){
				// }else{
				//  alert("다운로드할 첨부파일을 선택해주세요.");
				 	
				// }
				 	}
				 }); */
				alert("다운로드가 완료되었습니다.");
			}
		});
	});
</script>

<style>
</style>
</head>
<body>
	<input type="hidden" value="${member_no }" name="member_no"
		id="member_no" />
	<jsp:include page="nav.jsp" />
	<br />
	<br />
	<div class="pcoded-main-container" style="margin-left: 300px;">
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
										<li class="nav-item"><a
											href="feed?project_no=${pno}&member_no=${mno}"
											class="nav-link "><span class="pcoded-micon"><i
													class="fa-regular fa-message" style="color: #707272;"></i></span><span
												class="pcoded-mtext">피드</span></a></li>
										<li class="nav-item"><a
											href="gantt?member_no=${mno }" class="nav-link "><span
												class="pcoded-micon"><i
													class="fa-solid fa-calendar-days"></i></span><span
												class="pcoded-mtext">일정</span></a></li>
										<li class="nav-item"><a
											href="kanban?member_no=${mno }" class="nav-link "><span
												class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span><span
												class="pcoded-mtext">할일</span></a></li>
										<li class="nav-item"><a
											href="contact?email=${memberDTO.email }&project_no=${pno}&member_no=${mno}"
											class="nav-link "><span class="pcoded-micon"><i
													class="fa-regular fa-address-book"></i></span><span
												class="pcoded-mtext">주소록</span></a></li>
										<li class="nav-item"><a
											href="fileList?project_no=${pno}&member_no=${mno}"
											class="nav-link "><span class="pcoded-micon"><i
													class="fa-solid fa-file-arrow-down"></i></span><span
												class="pcoded-mtext">첨부파일</span></a></li>
									</ul>
								</td>

							</tr>
						</table>
					</div>
				</div>
			</nav>


			<br />
			<br />
			<br />
			<div class="row" style="margin-top: 50px;">
				<!-- 파일함 -->
				<div class="col-xl-12 col-md-12">
					<div class="card table-card" style="height: 700px;">
						<div class="card-header">
							<h5>파일함</h5>
							<%-- <select id="projectFileSelect" onchange="projectFileSelect();"
								style="width: 30%;" class="form-select"
								aria-label="Default select example">
								<option selected>프로젝트 선택</option>
								<c:forEach var="dto" items="${projectList}">
									<option value="${dto.project_no}">${dto.project_title}</option>
								</c:forEach>
							</select> --%>
							<button type="button" id="fileDownload" style="float: right;"
								class="btn btn-primary btn-sm">
								<i class="fa-solid fa-download" style="color: #fff;"></i>&nbsp;&nbsp;다운로드
							</button>
						</div>
						<!-- 파일함 리스트가 들어갈 곳(리스트가 많아지면 자동 스크롤 생성됨)-->
						<div class="scrollbar"
							style="overflow-x: hidden; overflow-y: auto; height: 700px;">
							<div class="card-body p-0">
								<div class="table-responsive" style="height: 1200px">
									<table class="table table-hover mb-0">
										<tbody id="fileList">
											<c:forEach var="fdto" items="${list}">
												<tr>
													<td>

														<div class="chk-option">
															<label
																class="check-task custom-control custom-radio d-flex justify-content-center done-task">
																<input type="radio" id="fileName" name="options"
																class="custom-control-input" value="${fdto.file_name}">
																<span class="custom-control-label"></span>
															</label>
														</div>
														<div class="d-inline-block align-middle">
															<div class="d-inline-block">
																<h6>${fdto.file_name}</h6>
																<span class="text-muted m-b-0">업로드한 날짜 :
																	${fdto.file_register_date }</span>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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