<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<title>FEED : SOOP</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/a613319909.js"	crossorigin="anonymous"></script>
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- jQuery & bootstrap -->
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script> -->
<!-- bootstrap -->
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
<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

//관심업무 해제하기
function deleteFavorite(task_no){	
		console.log("관심업무 해제 클릭");
			$.ajax({
				type: "GET",
				url: "/deleteFavoriteOne",
				data: {
					"task_no" : task_no
				}
			});
}

</script>

<script>
// Range calendar (수정)
  $( function() {
	    var dateFormat = "yy-mm-dd",
	    startvalue = $( "#startvalue" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1,
	          dateFormat: dateFormat // 날짜 형식을 변경
	        })
	        .on( "change", function() {
	          to2.datepicker( "option", "minDate", getDate( this ) );
	        }).on("select", function() {
		        $(this).change();
		    });
	        
	      endvalue = $( "#endvalue" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1,
	        dateFormat: dateFormat // 날짜 형식을 변경
	      })
	      .on( "change", function() {
	        from2.datepicker( "option", "maxDate", getDate( this ) );	        
	      }).on("select", function() {
		        $(this).change();
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
</script>

<!-- 생성/수정 모달에 데이터 값 넘기기 -->
<script>

$(document).ready(function(){

		// 수정 모달에 값 넘기기
		$("#updateModal").on('show.bs.modal', function(e) { // #updateModal 실행해서 모달 창 보이면 function(e)실행
			console.dir(e.relatedTarget); // e의 값 확인
			var no = $(e.relatedTarget).data().no; // e의 no라는 데이터를 no라는 변수에 대입
			var title = $(e.relatedTarget).data().title;
			var content = $(e.relatedTarget).data().content;
			var status = $(e.relatedTarget).data().status;
			var start = $(e.relatedTarget).data().start;
			var end = $(e.relatedTarget).data().end;
			var filename = $(e.relatedTarget).data().filename;
			var signappover1 = $(e.relatedTarget).data().signappover1;
			/* var currentUserSignMemberNo = $(e.relatedTarget).data().currentUserSignMemberNo;
			var currentUserSignApprover = $(e.relatedTarget).data().currentUserSignApprover; */
			console.log(no);
			
			

			$("#tasknovalue").val(no); // #tasknovalue값(수정 모달에서 사용)에 no 밸류 넣기
			$("#titlevalue").val(title);
			$("#contentvalue").val(content);
			$("#statusvalue").val(status);
			$("#startvalue").val(start);
			$("#endvalue").val(end);
			$("#filename").val(filename);
			$("#filedto").empty(); // 이전 파일 정보를 지웁니다.
			$("#filedto").append("<p>기존파일 : " + filename + "</p>");
			$("#signapprovervalue1").val(signappover1); // sign1의 value를 signvalue1에 넣기
			/* $("#currentUserSignMemberNo").val(currentUserSignMemberNo); // sign1의 value를 signvalue1에 넣기
			$("#currentUserSignApprover").val(currentUserSignApprover); // sign1의 value를 signvalue1에 넣기 */
			

		});

	});
</script>


<!-- 수정 모달에서 새 파일 선택했을 때, 기존 파일 보여주는 div 숨기기 -->
<script>
	function hideFileDto() {
		// "filedto" 아이디를 가진 <div> 요소를 가져옵니다
		var fileDtoDiv = document.getElementById("filedto");

		// 파일 선택 버튼의 값이 있는지 확인하여 <div> 요소를 숨기거나 표시합니다
		var fileInput = document.getElementById("fileInput");
		if (fileInput.value) {
			fileDtoDiv.style.display = "none";
		} else {
			fileDtoDiv.style.display = "block"; // 혹은 "inline" 등 원하는 디스플레이 속성을 지정할 수 있습니다.
		}
	}
	
</script>

<!-- 첨부 파일 크기 제한 (업무 생성 및 수정) -->
<script>
	function checkFileSize(input) {
		// 선택된 파일 객체 가져오기
		var file = input.files[0];

		// 파일 크기 확인 (단위: bytes)
		var fileSize = file.size;
		var maxSizeInBytes = 50 * 1024 * 1024; // 50MB를 bytes로 변환

		if (fileSize > maxSizeInBytes) {
			// 파일 크기가 20MB보다 큰 경우, 경고 메시지 띄우기
			alert('파일 크기가 50MB를 초과합니다. 다른 파일을 선택해주세요.');
			// 파일 선택 input 비우기 (선택한 파일 초기화)
			input.value = '';
		}
	}
</script>

<!-- sign 수정을 위해 기본값 전달 -->
<script type="text/javascript">
 function test(e){
	console.log($(e).parent().prev().prev().prev().html());
	let member_no = $(e).parent().prev().prev().prev().html();
	
	//let member_no = ${signdto.member_no};
	//let member_no = 1;
	
	$.ajax({
		url: "/soop/taskinfo" , 
		data : {"member_no": member_no},
		success : function (data){
			console.log(data);
			
			$("#sign_approver_up").val(data.sign_approver);
			$("#sign_member_no_up").val(data.sign_member_no);
			$("#sign_step_up").val(data.sign_step);
			
		}
			
	});
	}
</script>


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


<style>
	#signapprovervalue1 {
		width: 60%;
		margin-left: auto;
	}
	#statusvalue {
		width: 60%;
		margin-left: auto;
	}
	
    #modal-table {
	margin-top: -9%;
  	margin-left: auto;
    }
    
    .modal-header {
    background-color: #D5F5E3; 
  	}
</style>

</head>
<body>
	<jsp:include page="nav.jsp" />
	<input type="hidden" name="project_no" value="${pno}" />
	<input type="hidden" name="task_no" value="${tno}" />
	<input type="hidden" name="member_no" value="${mno}"/>
	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ Feed navigation menu ] start -->
		    <nav class="pcoded-navbar theme-horizontal menu-light" style="position: fixed; height:100px;">
		        <div class="navbar-wrapper container">
		            <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
		                <table>
                         <tr>
                             <td> 
                             <ul class="nav pcoded-inner-navbar sidenav-inner">
                             <li class="nav-item">
                             <span class="pcoded-mtext" style="padding-top: 15px; font-size: 20px;">${projectDTO.project_title}</span>
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
                              <a href="gantt?member_no=${memberDTO.member_no }" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-calendar-days"></i></span><span class="pcoded-mtext">일정</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="kanban?member_no=${memberDTO.member_no }" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span><span class="pcoded-mtext">할일</span></a>
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
			<br /><br /><br /><br /><br /><br /><br /><br />
			
			<!-- 업무 피드 card -->
			<div class="col-xl-8 col-md-12">
				<div class="card table-card" style="left: 250px;">
					<div class="card-header">
						<c:choose>
							<c:when test="${favorite eq 0}">
                            	<a href="insertFav?project_no=${pno}&member_no=${mno}&task_no=${tno}"><i class="fa-regular fa-star"></i>&nbsp;&nbsp;홈 화면에 관심업무 등록</a>
							</c:when>
							<c:otherwise>
                            	<a href="deleteFav?project_no=${pno}&member_no=${mno}&task_no=${tno}"><i class="fa-solid fa-star"></i>&nbsp;&nbsp;홈 화면에 관심업무 해제</a>
							</c:otherwise>
						</c:choose>
						<br /><br />
						
						<c:if test="${feedTaskDTO.task_status eq '0'}">
							<label class="badge badge-light-info">발의</label>
						</c:if>
						<c:if test="${feedTaskDTO.task_status eq '1'}">
							<label class="badge badge-light-success">진행</label>
						</c:if>
						<c:if test="${feedTaskDTO.task_status eq '2'}">
							<label class="badge badge-light-warning">검토</label>
						</c:if>
						<c:if test="${feedTaskDTO.task_status eq '3'}">
							<label class="badge badge-light-secondary">완료</label>
						</c:if>
						<c:if test="${feedTaskDTO.task_status eq '4'}">
							<label class="badge badge-light-danger">보류</label>
						</c:if>
							<input type="hidden" name="task_no"	value="${feedTaskDTO.task_no}" />
							<h4>${feedTaskDTO.task_title}</h4>
						

						<div class="card-header-right">
	                        <div class="btn-group card-option">
									<c:if test="${mno eq feedTaskDTO.member_no}">
			                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                <i class="feather icon-more-horizontal"></i>
			                            </button>
			                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
									
			                                <li class="dropdown-item"><a href="#!" data-no="${dto.task_no}" data-title="${dto.task_title}" data-content="${dto.task_content}" data-status="${dto.task_status}" data-start="${dto.task_start_date}" data-end="${dto.task_end_date}" data-filename="${dto.file_name}" data-signappover1="${dto.sign_approver}"  data-bs-toggle="modal" data-bs-target="#updateModal" onclick="test(this)"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;수정</a></li>
			                                <li class="dropdown-item"><a href="delete?task_no=${tno}&project_no=${pno}&member_no=${mno}"><i class="feather icon-trash"></i>&nbsp;&nbsp;삭제</a></li>
	                            		</ul>
	                                </c:if>
	                        </div>
	                    </div>
                	</div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table mb-0" >
                                <thead style="border-color: transparent;">
                                    <tr>
										<td colspan="2">
											<div class="align-middle">
												<img src="/data/${feedTaskDTO.profile_name}"
													alt="user image" class="img-radius wid-40 align-top m-r-15">
													<span style="font-size: 15px; font-weight: bold;">${feedTaskDTO.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<span style="font-size: 15px; float:right">
														<i class="fa-regular fa-clock"></i>&nbsp;&nbsp;&nbsp;${feedTaskDTO.task_register_date}</span>
											</div>
										</td>
										
                                    </tr>
                                </thead>
                                <tbody style="border-color: transparent;">
                                    <tr>
                                    	<td colspan="2"><i class="fa-solid fa-calendar">&nbsp;업무기한</i>&nbsp;&nbsp;&nbsp;&nbsp;${feedTaskDTO.task_start_date}&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;${feedTaskDTO.task_end_date}</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">
                                    		<div style="float: left;"><i class="fa-solid fa-user-tie">&nbsp;담당자</i>&nbsp;&nbsp;&nbsp;</div>
											<!-- 결재 라인 보이는 곳 -->
											<div class="align-middle">
												<%-- <img src="/data/${signDTO.profile_name}" alt="user image" class="img-radius wid-40 align-top m-r-15"> --%>
													<span style="font-size: 15px;">${signDTO.sign_approver}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
			                                    		
                                    	</td>
                                    </tr>

                                    <tr>
                                    	<td colspan="2">
	                                    		${feedTaskDTO.task_content}
                                    	</td>
                                    </tr>
                                    <tr style="border-bottom: #DEE2E6;">
                                    	<td colspan="2">
                                    		<i class="fa-solid fa-file-arrow-down">&nbsp;첨부파일</i>&nbsp;&nbsp;&nbsp;
                                    		<!-- 해당 업무 첨부파일 보이는 곳 -->
                                    		<c:if test="${not empty feedTaskDTO.file_name}">
											<a href="/task/download?file_name=${feedTaskDTO.file_name}" class="btn btn-outline-primary btn-sm" style="border-radius: 20px;">${feedTaskDTO.file_name}</a>
											</c:if>
                                    	</td>
                                    </tr>
                                </tbody>
                                <tfoot style="border-color: transparent;">
                                	<tr>
                                		<td colspan="2">
			                                <form action="/comment/insert" name="commentInsertForm" method="post">
												<div class="input-group m-t-0">
													<input type="hidden" name="project_no" value="${pno}" />
			                                		<input type="hidden" name="task_no" value="${tno}" />
			                                		<input type="hidden" name="member_no" value="${mno}"/>
													<input type="text" name="comment_content" class="form-control" id="comment_content" placeholder="댓글을 입력하세요.">
													<div class="input-group-append">
														<button class="btn btn-primary" id="commentInsertBtn"><i class="fa-regular fa-paper-plane"></i></button>
													</div>
	                       						</div>
		                                	</form>
                                		</td>
                                	</tr>
                                	<!-- 댓글 입력하면 여기에 append -->
                                	<tr>
                                		<td colspan="2">
		        							<c:forEach var="commentDTO" items="${commentDTO}">
			                                	<tr>
			                                		<td colspan="2">
			                                			<div class="row m-b-0">
															<div class="col-auto p-r-0">
																<img src="/data/${commentDTO.profile_name}" alt="user image" class="img-radius wid-40">
																
															</div>
															<div class="col">
																<c:choose>
																	<c:when test="${commentDTO.member_no eq mno}">
																		<p class="text-muted m-b-0">${commentDTO.name}&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>${commentDTO.comment_register_date}
																		<a href="comment/delete?project_no=${pno}&member_no=${mno}&task_no=${tno}&comment_no=${commentDTO.comment_no}"> 삭제 </a></p>
																	</c:when>
																	<c:otherwise>
																		<p class="text-muted m-b-0">${commentDTO.name}&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>${commentDTO.comment_register_date}</p>
																	</c:otherwise>
																</c:choose>
																<p class="m-b-0">${commentDTO.comment_content}</p>
															</div>
			                       						</div>
			                                		</td>
			                                	</tr>
			                               	</c:forEach>
                                		</td>
                                	</tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
       		 <!-- 업무 수정 모달 -->
				<form action="update" method="post" modelAttribute="uploadFile" enctype="multipart/form-data">
				<input type="hidden" id="tasknovalue" name="task_no" value="${tno }"/>
				<input type="hidden" id="project_no" name="project_no" value="${pno }"/>
				<input type="hidden" id="member_no" name="member_no"  value="${mno }"/>
				<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="updateModalLabel">업무 수정</h1>
				       <!--  <h1><input type="text" id="hvalue2" name="task_no"  /></h1> -->
						<!-- <p>task_title : <input type="text" id="titlevalue" name="task_title"  /></p> -->
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        	<table class="table" id="modal-table">
							<tr>
								<td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 제목</p></td>
								<td><input class="form-control" id="titlevalue" type="text" name="task_title" style="font-size: 16px;"></td>
								<br />
							</tr>
							<tr><td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 상태</p>	&nbsp; &nbsp;
										<td>
										<select name="task_status" id="statusvalue" class="form-select" aria-label="Default select example">
											<option selected>------업무 상태 선택-----</option>
					<!-- 						<option selected value="100">--업무 상태 선택--</option> -->
											<option value="0">발의</option>
											<option value="1">진행</option>
											<option value="2">검토</option>
											<option value="3">완료</option>
											</select>
											<!-- 컨트롤러에 task_status 넘겨주는 역할 -->
											<input type="hidden" name="task_status" id="task_status" value="">
												<script>
													  document.getElementById("task_status_select").addEventListener("change", function () {
													    var selectedValue = this.value;
													    document.getElementById("task_status").value = selectedValue;
													  });
												</script>
											
										</td>
										
							</tr>
							<tr>
				
								<td colspan="8">
												<p style="font-weight: bold; font-size: 16px;">담당자</p>
											</td>
											<td>
								            <select name="sign_approver" id="signapprovervalue1" class="form-select" aria-label="Default select example" value="">
											<option value="">------담당자 선택-----</option>
								              <c:forEach var="member" items="${members}">
								                <option data-memberno="${member.member_no}" data-membername="${member.name}" data-projectno="${member.project_no}" data-step="1">${member.name}</option>
								              </c:forEach>
								            </select>
													<!-- 값 넘기기 위한.. hidden -->
													<input type="hidden" name="sign_approver_up" id="sign_approver_up" value="">
													<input type="hidden" name="sign_member_no_up" id="sign_member_no_up" value="">
													<input type="hidden" name="sign_step_up" id="sign_step_up" value=""><!-- 일단 1단계라서 1 줌 -->
													
													
										</td>
										
										<script>
										
												  // select 요소의 change 이벤트를 감지하여 value를 설정하는 함수
												  document.getElementById("signapprovervalue1").addEventListener("change", function () {
												    var selectedOption = this.options[this.selectedIndex];
												    var memberNo = selectedOption.getAttribute("data-memberno");
												    var memberName = selectedOption.getAttribute("data-membername");
												    var projectNo = selectedOption.getAttribute("data-projectno");
												    var step = selectedOption.getAttribute("data-step");
												
												    // 값을 hidden input 요소에 설정
												    document.getElementById("sign_approver_up").value = memberName;
												    document.getElementById("sign_member_no_up").value = memberNo;
												    document.getElementById("sign_step_up").value = step;
												
												    // 선택된 값 출력
												    console.log("선택된 결재자: " + memberName);
				/* 								    console.log("sign_approver_up : " + sign_approver_up); */
												    console.log("선택된 결재자 번호: " + memberNo);
												    console.log("선택된 프로젝트 번호: " + projectNo);
												    console.log("선택된 단계: " + step);
												    
				
												  });
												  
													
										</script>
									</tr>
							
								<br />
							</tr>
							<tr>
							 	<th>
					 				<p style="font-weight: bold; font-size: 16px;">날짜 선택</p>
					 			</th>
								<td colspan="8">
								<!-- calendar -->
								<label for="from2" style="font-size: 16px;">시작일</label>&nbsp; &nbsp;
								<input type="text" id="startvalue" name="task_start_date" >
								&nbsp; &nbsp;
								<label for="to2" style="font-size: 16px;">마감일</label>&nbsp; &nbsp;
								<input type="text" id="endvalue" name="task_end_date">
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
								</td>
							</tr>	
							<tr>	
							<th>
								<p style="font-weight: bold; font-size: 16px;">첨부파일</p>
							</th>
								<td colspan="8">
								<!-- 첨부파일 -->
								<!-- controller로 file 넘김 -->
								<input type="file" name="file" id="fileInput" onchange="hideFileDto(); checkFileSize(this);"/>
								    <!-- 기존 첨부파일 정보를 출력할 div 영역 -->
												<div id="filedto">
													<%-- <c:forEach var="file" items="${filedto}"> --%>
													<c:forEach var="file" items="${SignTaskAttachedFiledto}">
														<p>${file.file_name}</p>
														<p>${file.file_path}</p>
													</c:forEach>
												</div>
												</td>
							</tr>
							<tr>
								<td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 내용</p></td>
								<br />
								<br />
								<td><textarea class="form-control" id="contentvalue" rows="10" name="task_content" style="font-size: 16px;"></textarea></td>
							</tr>
										
						</table>
				      </div>
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="submit"  class="btn btn-primary">업무 수정</button>
				      </div>
				    </div>
				  </div>
				</div>
				</form>
				<!-- 업무 수정 모달 end-->
        
</body>
</html>