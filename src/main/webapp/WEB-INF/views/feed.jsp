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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	const exampleModal = document.getElementById("exampleModal")
	if (exampleModal) {
	  exampleModal.addEventListener("show.bs.modal", event => {
	    // Button that triggered the modal
	    const button = event.relatedTarget
	    // Extract info from data-bs-* attributes
	    const recipient = button.getAttribute("data-bs-whatever")
	    // If necessary, you could initiate an Ajax request here
	    // and then do the updating in a callback.
	
	    // Update the modal's content.
	    const modalTitle = exampleModal.querySelector(".modal-title")
	    const modalBodyInput = exampleModal.querySelector(".modal-body input")
	
	    modalTitle.textContent = `New message to ${recipient}`
	    modalBodyInput.value = recipient
	  })
	}
	
	$(function() {
		$("#email").on(
				"keyup",
				function() {
					$.ajax({
						type : "GET",
						url : "/emailCheck2",
						data : {
							"email" : $("#email").val().trim(),
							"project_no" : $("#project_no").val().trim()
						},
						dataType : "json",
						success : function(list) {
							console.log(list);	
							$("#btnInvitation").attr("disabled", false);
							$("#idCheck").html("");
							for(i=0; i<list.length; i++){
								if( list[i] == 1) { // 이미 초대되었으면
									console.log("이미 초대 성공");
									$("#idCheck").html("<span class='form-text' style='color: red;'>이미 초대된 파트너입니다.</span>");
									$("#btnInvitation").attr("disabled", true);
									break;
								}
							}
						}
					});
				});

	// 파트너 초대 메일 비동기화 방식으로 보내기
		$("#btnInvitation").on("click", function() {// 메일 입력 유효성 검사
			var email = $("#email").val(); //사용자의 이메일 입력값
			
			// 초대내용 엔터 반영되게
			var inviteMessage = $("#inviteMessage").val(); 
			inviteMessage = inviteMessage.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			if (email == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				$.ajax({
					type : "GET",
					url : "/invite",
					data : {
						"email" : $("#email").val().trim(),
						"name" : $("#name").val().trim(),
						"inviteMessage" : inviteMessage,
						"project_no": $("#project_no").val().trim()
					},
					dataType : 'text'
					
				});
				alert("초대링크가 전송되었습니다.")
				isCertification = false; //추후 인증 여부를 알기위한 값
				
				// 파트너 초대하기 버튼클릭후 초대이메일/초대내용 빈 내용으로 초기화
				$("#email").val("");
				$("#inviteMessage").val("");
			}
		});
		
	})
	
	$(function(){
	// 멤버 강퇴
		$("#deleteMember").on("click", function(){
			$(".deleteBtn").fadeIn(50);
			$(".changeBtn").fadeOut(50);
		});
	// 관리자 권한 변경
		$("#changeAuth").on("click", function(){
			$(".changeBtn").fadeIn(50);
			$(".deleteBtn").fadeOut(50);
		});
		
	// 새로고침(초기화)
		$("#refreshBtn").on("click", function(){
			$(".changeBtn").fadeOut(50);
			$(".deleteBtn").fadeOut(50);
		});	
	});
	
	// 멤버 강퇴하기
	function deleteMember(project_no, member_no){
		if(confirm("정말 강퇴하시겠습니까?")== true){
			
			const urlParams = new URL(location.href).searchParams;
			const loginMember_no = urlParams.get("member_no");
			
			$.ajax({
				type: "GET",
				url: "/deleteMemberOne",
				data: {
					"project_no" : project_no,
					"member_no" :  member_no
				},
				success: function (data) {
		            console.log(data); 
					location.href = "feed?project_no="+project_no+"&member_no="+loginMember_no;
		        }
			});
		}
	}
	
	// 프로젝트 관리자 변경
	function changeAuth(project_no, member_no){
		if(confirm("정말 변경하시겠습니까?")== true){
			const urlParams = new URL(location.href).searchParams;
			const adminMember_no = urlParams.get("member_no");
			
			$.ajax({
				type: "GET",
				url: "/changeAuthMember",
				data: {
					"project_no" : project_no,
					"member_no" :  member_no
				},
				success: function (data) {
		            console.log(data); 
					location.href = "feed?project_no="+project_no+"&member_no="+adminMember_no;
		        }
			});
		}
	}
</script>

<script>
// Range calendar (생성)
  $( function() {
	    var dateFormat = "yy-mm-dd",
	      from = $( "#from" ).datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1,
	          dateFormat: dateFormat // 날짜 형식을 변경
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }).on("select", function() {
		        $(this).change();
		    });
	        
	        
	     to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1,
	        dateFormat: dateFormat // 날짜 형식을 변경
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );	        
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

<!-- sign 생성을 위해 기본값 전달 -->
<script type="text/javascript">
 function newtask(event){

	var member_no = $("#member_no").val();
	var sign_approver = $("#sign_approver").val().trim();
	var sign_member_no = $("#sign_member_no").val().trim();
	var sign_step = $("#sign_step").val().trim();
	var project_no = $("#project_no").val();
	
	console.log("member_no"+member_no);
	console.log("project_no"+project_no);
	
	$.ajax({
		/* url: "/soop/taskinfo" ,  */
		url: "/taskinfo" , 
		data : {
			"member_no": member_no,
			"sign_member_no": sign_member_no,
			"sign_approver": sign_approver,
			"sign_step": sign_step
			
		},
		success : function (data){
			console.log(data);
			
			
			$("#member_no").val(data.member_no);
			$("#sign_approver").val(data.sign_approver);
			$("#sign_member_no").val(data.sign_member_no);
			$("#sign_step").val(data.sign_step);
			
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
	#selectMembersCreate1 {
		width: 60%;
		margin-left: auto;
	}
	#task_status_select {
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
<body class="modal-open" style="overflow: hidden; padding-right: 0px;">
	
	<jsp:include page="nav.jsp" />
	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ Feed navigation menu ] start -->
		    <nav class="pcoded-navbar theme-horizontal menu-light" style="position: fixed;height: 100px;">
		        <div class="navbar-wrapper container" style="text-align: left;">
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
			<br /><br /><br /><br /><br /><br /><br /><br />
			<input type="hidden" id="name" name="member_name" value="${name }"/>
			<input type="hidden" id="project_no" name="project_no" value="${project_no }"/>
			<input type="hidden" id="member_no" name="member_no" value="${member_no }"/>
			<!-- 업무 리스트 card -->
			<div class="col-md-6">
				<div class="card" style="left: 0px;">	
					<div class="card-header">
					
						<!-- 잠시 추가 -->
					<%-- 	<input type="text" name="member_no" id="member_no" value="${mno}" /> --%>
						
                        <button class="btn btn-primary col-md-12" type="button" id="insert_modal" name="insert_modal" data-no="${dto.task_no}" data-bs-toggle="modal" data-bs-target="#insertModal"> <!-- 소진 추가 -->
							<i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;새 업무 작성
						</button>
                    </div>
                    
		            
                    
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                        	<div class="scrollbar" style="overflow-x: hidden;">
                            <table class="table table-hover">
                                <tbody>
                                <c:choose>
                                	<c:when test="${empty feedListDTO}">
                                		<tr>
                                			<td colspan="8" style="text-align:center;">
                                				해당 프로젝트에 작성된 업무가 없습니다.
                                			</td>
                                		</tr>
                                	</c:when>
                                	<c:otherwise>
                                	<c:forEach var="feedListDTO" items="${feedListDTO}">
	                                    <tr>
	                                        <td width="10">
	                                        	<c:if test="${feedListDTO.task_status eq '0'}">
	                                       			<label class="badge badge-light-info">발의</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '1'}">
	                                       			<label class="badge badge-light-success">진행</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '2'}">
	                                       			<label class="badge badge-light-warning">검토</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '3'}">
	                                       			<label class="badge badge-light-secondary">완료</label>
	                                       		</c:if>
<%-- 	                                       		<c:if test="${feedListDTO.task_status eq '4'}">
	                                       			<label class="badge badge-light-danger">보류</label>
	                                       		</c:if> --%>
	                                        </td>
	                                        <td colspan="5">
	                                        	<a href="taskDetail?project_no=${pno}&member_no=${mno}&task_no=${feedListDTO.task_no}">${feedListDTO.task_title}</a>
	                                        </td>
	                                        <td width="50">
	                                        <div class="align-middle">
												<img src="/data/${feedListDTO.profile_name}" alt="user image" class="img-radius wid-40 align-top m-r-15">
													<span style="font-size: 15px;">${feedListDTO.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
	                                        </td>
	                                        <td width="50">${feedListDTO.task_register_date}</td>
	                                    </tr>
									</c:forEach>
									</c:otherwise>
									</c:choose>
                                </tbody>
                                <tfoot>
                                	<tr>
                                		<td colspan="8">
                                			<div class="row">
											    <div class="col-sm-4 col-md-4">
											        <ul class="btn-group pagination" style="margin-left: 150%;">
											            <c:if test="${pagenation.prev }">
											                <li>
											                    <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pagenation.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
											                </li>
											            </c:if>
														    <c:choose>
														      		<c:when test="${empty feedListDTO}">
																		<li><i class="fa-solid fa-circle" style="color:#78C2AD; font-size:5px;"></i></li>
																	</c:when>
																	<c:otherwise>
											            <c:forEach begin="${pagenation.startPage}" end="${pagenation.endPage}" var="pageNum">
														            <li>
														                <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pageNum}"/>'>
														                    <i class="fa">${pageNum}</i>
														                </a>&nbsp;&nbsp;
														            </li>
														</c:forEach>
														        </c:otherwise>
														    </c:choose>
											            <c:if test="${pagenation.next && pagenation.endPage >0 }">
											                <li>
											                     <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pagenation.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
											                </li>
											             </c:if>
											        </ul>
											    </div>
											</div>
                                		</td>
                                	</tr>
                                </tfoot>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        <!-- 업무 현황 -->
        
        <div class="col-md-3" style="position: fixed; top: 193px; right: 360px;">
                <div class="card">
                    <div class="card-header">
                        <h5>업무 현황</h5>
                    </div>
                    <div class="card-body">
							<c:if test="${empty feedListDTO}">
								<div>
								<br /><br /><br /><br />
									<h3 style="text-align:center;">등록된 업무</h3>	
									<br />
									<h3 style="color:#1abc9c; text-align:center;">0</h3>
								<br /><br /><br /><br /><br />					
								</div>
							</c:if>
							<c:if test="${!empty feedListDTO}">
		                        <div id="pie-chart-2" style="width:100%">
								</div>
							</c:if>
                    </div>
                </div>
            </div>
            
          <!-- 프로젝트 통계 -->  
             <div class="col-md-3 col-xl-3" style="position: fixed; top: 620px; right: 360px;">
                <div class="card flat-card">
                <div class="card-header">
                        <h5>프로젝트 통계</h5>
                    </div>
                    <div class="row-table">
                        <div class="col-sm-6 card-body br">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="fa-regular fa-user" style="color: #f6cf0f; font-size: 30px;"></i>
                                </div>
                                <div class="col-sm-8 text-md-center">
                                    <h5>${countProjectMember}명</h5>
                                    <span>참여 중인 인원</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 card-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="fa-regular fa-calendar" style="color: #e74c3c; font-size: 30px;"></i>
                                </div>
                                <div class="col-sm-8 text-md-center">
                                    <h5>${countDays}일</h5>
                                    <span>D-Day</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-table">
                        <div class="col-sm-6 card-body br">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="fa-solid fa-briefcase" style="color: brown; font-size: 30px;"></i>
                                </div>
                                <div class="col-sm-8 text-md-center">
                                    <h5>${countTask}개</h5>
                                    <span>작성된 업무</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 card-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="icon feather icon-file-text text-c-blue mb-1 d-block"></i>
                                </div>
                                <div class="col-sm-8 text-md-center">
                                    <h5>${countFile}개</h5>
                                    <span>업로드된 파일</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div> <!-- 안닫혀있길래 닫음 - 소진 -->

	    
	    <!-- 새 멤버 초대 버튼 -->
	    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" style="position: fixed; top: 193px; right: 46px; width: 288px;">
	    <i class="fa-solid fa-user-plus"></i>&nbsp;&nbsp;새 멤버 초대</a>
	                
		<!-- project member start -->
        <div class="col-xl-2 col-md-8" style="position: fixed; top: 250px; right: 30px; ">
            <div class="card table-card">
                <div class="card-header">
                    <h5>참여자</h5>
                    <c:choose>
	                	<c:when test="${projectMemberDTO.member_position == 0}"> 
                        <a href="" id="refreshBtn"><i class="fa-solid fa-rotate-right" style="color: #707272;"></i></a>
		                    <div class="card-header-right">
		                        <div class="btn-group card-option">
		                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                <i class="feather icon-more-horizontal"></i>
		                            </button>
		                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
		                                <li class="dropdown-item"><a id="changeAuth"><i class="feather icon-refresh-cw"></i> 프로젝트 관리자 변경</a></li>
		                                <li class="dropdown-item"><a id="deleteMember"><i class="feather icon-trash"></i> 멤버 강퇴</a></li>
		                            </ul>
		                        </div>
		                    </div>
                   		</c:when>
	               </c:choose>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive" >
                     <div class="scrollbar" style="background-color:#E9E9E9; overflow-x: hidden; overflow-y: auto; height:550px;">
                        <table class="table table-hover mb-0" >
                            <tbody>
                           		<!-- 해당 프로젝트 멤버 리스트가 보여지는 곳 -->
                                <c:forEach var="dto" items="${memberList }">
                                <tr>
                                    <td>
                                    	<c:choose>
												<c:when test="${dto.member_position == 0}">
                                                </c:when>
                                                <c:otherwise>
                                                	<div class="chk-option changeBtn" style="display:none">
														<a href="" onclick="changeAuth(${dto.project_no }, ${dto.member_no})" ><i class="fa-solid fa-circle-check" style="color: #707272;"></i></a>
													</div>
				                                    <div class="chk-option deleteBtn" style="display:none">
														<a href="" onclick="deleteMember(${dto.project_no }, ${dto.member_no})"><i class="fa-solid fa-circle-minus" style="color: #707272;"></i></a>
													</div>
                                                </c:otherwise>
                                        </c:choose>
                                        <div class="d-inline-block align-middle">
                                            <img src="/data/${dto.profile_name}" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                            <div class="d-inline-block">
													<h6>${dto.name }</h6>
												<c:choose>
												<c:when test="${dto.member_position == 0}">
                                                	<p class="text-muted m-b-0">프로젝트 관리자</p>
                                                </c:when>
                                                <c:otherwise>
                                                	<p class="text-muted m-b-0">프로젝트 멤버</p>
                                                </c:otherwise>
                                                </c:choose>
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
	
	<!-- 새 멤버 추가 modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">파트너 초대하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="mb-3">
	            <label for="email" class="col-form-label">초대할 이메일</label>
	            <input type="text" class="form-control" id="email"  placeholder="example@soop.team">
	          </div>
			<div class="col-6" id="idCheck">
				
			</div>
			  <div class="mb-3">
	            <label for="message" class="col-form-label">초대내용 입력</label>
	            <textarea class="form-control" id="inviteMessage"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="btnInvitation" >파트너 초대하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
</div>

<!-- 업무 생성 모달 -->
<!-- 일단 업무 생성 구현 용으로 project_no member_no을 임의로 지정 -->
<form action="insert" id="insertForm" name="insertForm" method="post" modelAttribute="uploadFile" enctype="multipart/form-data">
<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="insertModalLabel">업무 생성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      		
        	<table class="table" id="modal-table">
        	<input type="hidden" id="name" name="member_name" value="${name }"/>
			<input type="hidden" id="project_no" name="project_no" value="${project_no }"/>
			<input type="hidden" id="member_no" name="member_no" value="${member_no }"/>
         			<!-- link에 ?로 주는 대신 hidden으로 줘보기(자꾸 데이터 형식이 안맞아서 나는 오류를 해결하기 위해) -->
		        	<!-- <input type="hidden" name="project_no" id="project_no" value="1">
		        	<input type="hidden" name="member_no" id="member_no" value="1"> --> 


			<tr>
				<td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 제목</p></td>
				<td><input class="form-control" id="taskName" type="text" name="task_title" style="font-size: 16px;"></td>
				<br />
			</tr>
			<tr><td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 상태</p>	&nbsp; &nbsp;
						<td>
						<select name="task_status_select" id="task_status_select" class="form-select" aria-label="Default select example">
							<option selected>------업무 상태 선택-----</option>
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
				            <select name="sign_approval" id="selectMembersCreate1" class="form-select" aria-label="Default select example">
				              <option selected value="">------담당자 선택-----</option>
				              <c:forEach var="member" items="${members}">
				                <option data-memberno="${member.member_no}" data-membername="${member.name}" data-projectno="${member.project_no}" data-step="1">${member.name}</option>
				              </c:forEach>
				            </select>
									<!-- 값 넘기기 위한.. hidden -->
									<input type="hidden" name="sign_approver" id="sign_approver" value="">
									<input type="hidden" name="sign_member_no" id="sign_member_no" value="">
									<input type="hidden" name="sign_step" id="sign_step" value=""><!-- 일단 1단계라서 1 줌 -->
									<!-- 선택하지 않았을 때 경고 메시지 -->
       							<!-- 	<p id="sign_alert" style="color: red; display: none;">결재자를 선택하세요.</p> -->
						</td>
						
						<script>

						
								  // select 요소의 change 이벤트를 감지하여 value를 설정하는 함수
								  document.getElementById("selectMembersCreate1").addEventListener("change", function () {
								    var selectedOption = this.options[this.selectedIndex];
								    var memberNo = selectedOption.getAttribute("data-memberno");
								    var memberName = selectedOption.getAttribute("data-membername");
								    var projectNo = selectedOption.getAttribute("data-projectno");
								    var step = selectedOption.getAttribute("data-step");
								
								    // 값을 hidden input 요소에 설정
								    document.getElementById("sign_approver").value = memberName;
								    document.getElementById("sign_member_no").value = memberNo;
								    document.getElementById("sign_step").value = step;
								
								    // 선택된 값 출력
								    console.log("선택된 결재자: " + memberName);
								    console.log("sign_approver : " + sign_approver);
								    console.log("선택된 결재자 번호: " + memberNo);
								    console.log("선택된 프로젝트 번호: " + projectNo);
								    console.log("선택된 단계: " + step);
								    
						            
								  });
						</script>
					
			
				<br />
			</tr>
			<tr>

<!-- 			<a href=""><button></button></a>
				Calender
				<label for="from">시작일</label>
				<input type="text" id="from" name="task_start_date">
 -->
 			
 			<th>
 				<p style="font-weight: bold; font-size: 16px;">날짜 선택</p>
 			</th>
			<td colspan="8">
				<!-- calendar -->
				
					<!-- Calendar에 기본값 주기 위한 셋팅 -->
					<c:set var="ymd" value="<%=new java.util.Date()%>" />

				&nbsp;&nbsp;&nbsp;&nbsp;<label for="from" style="font-size: 16px;">시작일</label>&nbsp; &nbsp;
				<input type="text" id="from" name="task_start_date" value="2023-08-21">
				&nbsp; &nbsp;
				<label for="to" style="font-size: 16px;">마감일</label>&nbsp; &nbsp;
				<input type="text" id="to" name="task_end_date" value="2023-09-21">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				</td>
			</tr>
			<tr>	
				<!-- 첨부파일 -->
				<!-- controller로 file 넘김 -->
				
				<th>
					<p style="font-weight: bold; font-size: 16px;">첨부파일</p>
				</th>
				<td colspan="8">
					&nbsp;&nbsp;&nbsp;<input type="file" name="file" onchange="checkFileSize(this);"/> 
				</td>
			</tr>
			<tr>
				<td colspan="8"><p style="font-weight: bold; font-size: 16px;">업무 내용</p></td>
				<br />
				<br />
				<td><textarea class="form-control" id="taskContext" rows="10" name="task_content" style="font-size: 16px;"></textarea></td>
			</tr>
				
			</table>
      </div>
      <div class="modal-footer" >
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" id="insert_btn" class="btn btn-primary">업무 생성</button>
      </div>
    </div>
  </div>
</div>
</form>			

<script src="assets/js/plugins/apexcharts.min.js"></script>
<script src="assets/js/pages/chart-apex.js"></script>

	
</body>
</html>