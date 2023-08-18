<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


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
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>고객센터</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<br />
	<br />
	<!-- FAQ 컨테이너 -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="row">
				<div class="col-xl-12 col-md-12">
					<div class="card table-card">
						<div class="card-header">
							<h3>자주 묻는 질문</h3>
						</div>
						<div class="card-body p-0" style="height:auto;">
							<div class="table-responsive">

							<!-- 아코디언 -->
							<div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							        프로필 정보 및 비밀번호 변경하기
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>1. 프로필 정보 변경하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 우측 상단의 사람모양 아이콘을 클릭한 후 나타나는 메뉴에서 '마이페이지'를 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;2) 비밀번호를 입력하여 비밀번호 확인이 완료되면 회원정보 화면이 나타납니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;3) 프로필 사진, 닉네임(이름) 정보를 변경할 수 있습니다.<br />
										<br />
										<strong>2. 비밀번호 변경하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 우측 상단의 사람모양 아이콘을 클릭한 후 나타나는 메뉴에서 '마이페이지'를 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;2) 비밀번호를 입력하여 비밀번호 확인이 완료되면 회원정보 화면이 나타납니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;3) 비밀번호 우측에 '변경' 버튼을 클릭한 후 새로운 비밀번호를 설정하면 변경이 완료됩니다.<br />

							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							        프로젝트 및 업무 생성하기
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>1. 프로젝트 생성하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 좌측에 '프로젝트 생성'을 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;2) 프로젝트 이름, 프로젝트 기간, 프로젝트 설명을 입력 후 '프로젝트 생성'을 클릭하면 새 프로젝트가 생성됩니다.<br />
										<br />
										<strong>2. 업무 생성하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;1) 프로젝트 피드 화면에 있는 '새 업무 작성'을 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;2) 업무제목, 업무내용, 업무기간, 결재라인, 첨부파일을 입력 후 '업무 생성'을 클릭하면 새 업무가 생성됩니다.<br />
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							        프로젝트 멤버 초대 및 강퇴하기 / 관리자 권한 변경하기
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>1-1. 프로젝트 멤버 초대하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 좌측에 멤버를 초대하고 싶은 프로젝트명을 클릭하여 해당 프로젝트 피드 화면으로 이동합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 우측에 있는 참여자 리스트 상단에 '새 멤버 초대' 버튼을 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) 초대할 이메일과 초대내용을 입력 후 '파트너 초대하기' 버튼을 클릭하면 초대 멤버 이메일로 전송됩니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) 초대받는 파트너 이메일 내용에 초대링크를 클릭하여 초대인증코드를 입력하면 해당 프로젝트에 멤버로 추가됩니다.<br />
										<br />
										<strong>1-2. 프로젝트 멤버 강퇴하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code>Tip! 프로젝트 관리자인 멤버의 경우에만 강퇴가 가능합니다.</code><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 좌측에 멤버를 초대하고 싶은 프로젝트명을 클릭하여 해당 프로젝트 피드 화면으로 이동합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 우측에 있는 참여자 메뉴에서 점세개 모양 아이콘을 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) '멤버 강퇴' 메뉴를 클릭하면 참여자 리스트 멤버 좌측에 '삭제' 아이콘이 나타납니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) 강퇴하고 싶은 멤버의 '삭제' 아이콘을 클릭하면 해당 멤버가 강퇴됩니다.<br />
										<br />
										<strong>2. 프로젝트 관리자 권한 변경하기</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code>Tip! 프로젝트 관리자인 멤버의 경우에만 권한 변경이 가능합니다.</code><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) SOOP 화면 좌측에 멤버를 초대하고 싶은 프로젝트명을 클릭하여 해당 프로젝트 피드 화면으로 이동합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 우측에 있는 참여자 메뉴에서 점세개 모양 아이콘을 클릭합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) '프로젝트 관리자 변경' 메뉴를 클릭하면 참여자 리스트 멤버 좌측에 '변경' 아이콘이 나타납니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) 관리자 권한을 위임하고 싶은 멤버의 '변경' 아이콘을 클릭하면 해당 멤버가 프로젝트 관리자가 됩니다. 
							      </div>
							    </div>
							  </div>
							</div>									
							<!-- 아코디언 end -->

							</div>
						</div>
					</div>
				</div>
			<!-- FAQ 컨테이너 end -->
			</div>
		</div>
	</div>
</body>
</html>