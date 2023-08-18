<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>::: SOOP :::</title>
<!-- Meta -->
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<link rel="stylesheet" type="text/css" href="assets/css/nav.css">
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- font awesome -->
<script src="https://kit.fontawesome.com/a613319909.js"	crossorigin="anonymous"></script>
<!-- datepicker -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>
/* Range Calender */
  $( function() {
	  	/* dateFormat mm/dd/yy에서 수정함 */
	    var dateFormat = "yy/mm/dd",
	      from = $( "#projectStartDate" ).datepicker({
	          changeMonth: true,
	          numberOfMonths: 1
	      })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#projectEndDate" ).datepicker({
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }	 
	      return date;
	    }
	  } );

  function createProject(event) {
	    /* const searchParams = new URLSearchParams(window.location.search);
	    const member_no = searchParams.get('member_no'); */
	    var member_no = $("#member_no").val().trim();
	    var project_title = $("#project_title").val().trim();
	    var project_start_date = $("#project_start_date").val().trim();
	    var project_end_date = $("#project_end_date").val().trim();
	    var project_description = $("#project_description").val().trim();
	    if (project_title == "" || project_start_date == "" || project_end_date == "" || project_description == "") {
	        alert("내용을 입력해주세요.");
	    } else {
	        $.ajax({
	            type: "post",
	            url: "createProject",
	            data: {
	                "project_title": project_title,
	                "project_start_date": project_start_date,
	                "project_end_date": project_end_date,
	                "project_description": project_description,
	                "member_no": member_no
	            },
	            dataType: "text",
	            success: function(response) {
	               console.log(response);
	               // var project_no = response.project_no;
	               // console.log(project_no);
	                alert("프로젝트가 생성되었습니다.");
	                closeModal();
	                window.location.href = "/feed?project_no=" + response + "&member_no=" + member_no;
	            }
	        });
	    }
	}

	function closeModal() {
	    $("#createProjectModal").removeClass("show");
	    $("#createProjectModal").hide();
	}


</script>

<style>
  .modal-header {
    background-color: #D5F5E3; 
  }

</style>

</head>
<body>
	<input type="hidden" id="member_no" name="member_no" value="${member_no}" />
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar  ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div ">
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption"><label>모아보기</label></li>
					<li class="nav-item">
						<a href="/home" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-home"></i></span>
							<span class="pcoded-mtext">홈</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/historyList?member_no=${memberDTO.member_no }" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-clock-rotate-left"></i></span>
							<span class="pcoded-mtext">히스토리</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/gantt?member_no=${memberDTO.member_no}" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-calendar-days"></i></span>
							<span class="pcoded-mtext">일정</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/kanban?member_no=${memberDTO.member_no}" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span>
							<span class="pcoded-mtext">내 할 일</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="faq?member_no=${memberDTO.member_no}" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-phone-volume"></i></span>
							<span class="pcoded-mtext">고객센터</span>
						</a>
					</li>
					<li class="nav-item pcoded-menu-caption"><label>프로젝트</label></li>
					<li class="nav-item">
						<a href="insertProject" data-bs-toggle="modal" data-bs-target="#createProjectModal">
							<span class="pcoded-micon"><i class="fa-solid fa-circle-plus"></i></span>
							<span class="pcoded-mtext">프로젝트 생성</span>
						</a>
					</li>
					
					<!-- 프로젝트 리스트가 보여지는 곳 -->
					<c:forEach var="dto" items="${projectList}">
						<li class="nav-item">
							<a href="feed?project_no=${dto.project_no}&member_no=${dto.member_no}" class="nav-link">
								<span class="pcoded-micon"><i class="fa-solid fa-people-group"></i></span>
								<span class="pcoded-mtext">${dto.project_title}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header	class="navbar pcoded-header navbar-expand-lg navbar-light header-dark" style="position: fixed;">
		<div class="m-header">
			<a href="/home" class="b-brand"> <!-- ========   change your logo hear   ============ -->
				<img src="assets/images/logo.png" alt="" class="logo">
				<img src="assets/images/logo-icon.png" alt="" class="logo-thumb">
			</a> 
			<a href="#!" class="mob-toggler"> 
				<i class="feather icon-more-vertical"></i>
			</a>
		</div>
		<div class="collapse navbar-collapse" style="padding-left: 20px;">
			<h4 style="width: 500px; color: black"> ${memberDTO.name} 님 환영합니다&nbsp;<span class="pcoded-micon"><i class="fa-regular fa-face-smile"></i></span></h4>
		</div>
		<div class="collapse navbar-collapse" style="padding-left: 200px;">
			<h6 style="width: 700px;" align="right">
				<c:set var="ymd" value="<%=new java.util.Date() %>" />
				<fmt:formatDate value="${ymd}" pattern="yyyy년 MM월 dd일 E요일" />
			</h6>
		</div>
	<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<%-- <li>
					<div class="dropdown">
						<a class="dropdown-toggle" href="#" data-toggle="dropdown">
							<i class="icon feather icon-bell"></i>
							<span class="badge badge-pill badge-danger alarm-number">5</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right notification">
							<div class="noti-head">
								<h6 class="d-inline-block m-b-0">알림</h6>
								<div class="float-right">
									<button class="read-button">읽음 처리</button>
								</div>
							</div>
							<ul class="noti-body">
							<!-- 여기서부터 반복 -->
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-1.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>John Doe</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>5 min</span>
											</p>
											<p>New ticket Added</p>
										</div>
									</div>
								</li>
								
								<!-- 여기가 끝 -->
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-2.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Joseph William</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>10 min</span>
											</p>
											<p>Prchace New Theme and make payment</p>
										</div>
									</div>
								</li>
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-1.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Sara Soudein</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>12 min</span>
											</p>
											<p>currently login</p>
										</div>
									</div>
								</li>
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-2.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Joseph William</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>30 min</span>
											</p>
											<p>Prchace New Theme and make payment</p>
										</div>
									</div>
								</li>
							</ul>
							
							<div class="noti-footer">
								<a href="/historyList?member_no=${memberDTO.member_no }&email=${memberDTO.email}">모든 히스토리 보기</a>
							</div>
						</div>
					</div>
				</li> --%>
				<li>
					<div class="dropdown drp-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="feather icon-user"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right profile-notification">
							<div class="pro-head">
								<img src="/data/${memberDTO.profile_name}" class="img-radius" alt="User-Profile-Image">
								<span>${memberDTO.name }</span>
							</div>
							<ul class="pro-body">
								<li>
									<a href="/mypage?member_no=${memberDTO.member_no }&email=${memberDTO.email}" class="dropdown-item">
										<i class="feather icon-user" style="color: #707272;"></i>마이페이지
									</a>
								</li>
								<!-- <li>
									<a href="" class="dropdown-item">
										<i class="fa-regular fa-address-book" style="color: #707272;"></i>주소록
									</a>
								</li> -->
								<li>
									<a href="/logout" class="dropdown-item">
										<i class="feather icon-log-out" style="color: #707272;"></i>로그아웃
									</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div> 
	</header>
	<!-- [ Header ] end -->
	
	<!-- Required Js -->
	<script src="assets/js/vendor-all.min.js"></script>
	<script src="assets/js/plugins/bootstrap.min.js"></script>
	<script src="assets/js/pcoded.min.js"></script>

	<!-- Modal -->
   <div class="modal" id="createProjectModal" role="dialog">
      <div class="modal-dialog modal-lg">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">새 프로젝트 생성</h4>
               <button type="button" class="close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
            </div>
               <div class="modal-body">
                  <table class="table">
                     <tr>
                        <td>프로젝트 이름</td>
                        <td colspan="2">
                           <input type="text" class="form-control" name="project_title" id="project_title">
                        </td>
                     </tr>
                     <tr>
                        <td>프로젝트 기간</td>
                        <td>
                           <div class="input-group" >
                              <input type="text" class="form-control" name="project_start_date" id="project_start_date" value="2023-08-21">
                              <label for="project_start_date" class="input-group-text"><i class="fa-solid fa-calendar"></i></label>
                           </div>                        
                        </td>
                        <td>
                           <div class="input-group">
                              <input type="text" class="form-control datepicker" name="project_end_date" id="project_end_date" value="2023-09-21">
                              <label for="project_end_date" class="input-group-text"><i class="fa-solid fa-calendar"></i></label>   
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <td>프로젝트 설명</td>
                        <td colspan="2"><textarea class="form-control" name="project_description" id="project_description" rows="5"></textarea></td>
                     </tr>
                  </table>
               </div>
               <div class="modal-footer">
                  <input type="button" class="btn btn-primary" id="btnCreateProject" onclick="createProject();" value="프로젝트 생성">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>         
               </div>
         </div>
      </div>
   </div>
</body>
</html>
