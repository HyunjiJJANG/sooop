<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/nav.css">
<jsp:include page="nav.jsp" />
<script src="https://kit.fontawesome.com/a613319909.js"
	crossorigin="anonymous"></script>
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
<title>할 일</title>

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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
.sortable_list, .sortable_list0 {
	border: 1px solid #eee;
	width: 300px;
	min-height: auto;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin-right: 10px;
	margin-top: 100px;
}

.sortable_list li, .sortable_list1 li {
	margin: auto;
	padding: 5px;
	font-size: 1.0em;
	width: 250px;
}

#kanbanDiv {
	margin: auto;
	width: 1200px;
	background-color: aquamarine;
}

.table-responsive {
	margin-left: 8%;
	margin-bottom: 5%;
}
</style>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$(".sortable_list").sortable({
			connectWith : ".connectedSortable",

			receive : function(event, ui) {

				// 업무상태가 열의 id의 상태값에 따라 변경되도록하기
				var beforeTaskStatus = ui.sender[0].id//내가 클릭한 카드의 열의 위치

				var presentTaskStatus = this.id

				var changeStatus; /* 바뀐 업무상태값 변수 */

				if (beforeTaskStatus != presentTaskStatus) {
					if (presentTaskStatus == "sortable0") {
						ui.item.find("td").eq(9).html("발의")
						changeStatus = $("table").eq(0).next().val("0");

					} else if (presentTaskStatus == "sortable1") {
						ui.item.find("td").eq(9).html("진행")
						changeStatus = $("table").eq(1).next().val("1");

					} else if (presentTaskStatus == "sortable2") {
						ui.item.find("td").eq(9).html("검토")
						// 업무상태값을 변경
						changeStatus = $("table").eq(2).next().val("2");

					} else if (presentTaskStatus == "sortable3") {
						ui.item.find("td").eq(9).html("완료")
						// 업무상태값을 변경
						changeStatus = $("table").eq(3).next().val("3");
					}

				} // if문 end

				// ajax 변수
				// 변동된 정보를 업데이트
				var task_status = changeStatus.val();
				var member_no = ui.item.find("td").eq(4).text();
				var task_no = ui.item.find("td").eq(2).text();

				if (task_status == undefined) {
					task_status = 0;
				}

				$.ajax({
					url : "<c:url value='/chageTaskStatus' />",
					type : "get",
					data : {
						"task_status" : task_status,
						"member_no" : member_no,
						"task_no" : task_no
					},
					dataType : "text",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
					},
					error : function(data) {

					}
				}); // ajax end               
			} // receive end         
		}).disableSelection();

	}); // function() end
</script>

<script>
	$(document)
			.ready(
					function() {
						// 버튼을 클릭하면 선택된 옵션의 값을 보여줍니다.

						var member_no = $(this)[0].baseURI.match(/\d+$/)[0];
						var addedProjectTitles = [];

						$("#showSelected")
								.click(
										function() {

											$
													.ajax({
														url : "<c:url value='/tasksByProject' />",
														type : "get",
														data : {
															"member_no" : member_no
														},
														dataType : "text",
														contentType : "application/json;charset=utf-8",
														success : function(data) {
															data = JSON
																	.parse(data);
															$(data)
																	.each(
																			function(
																					index) {

																				var projectTitle = $(
																						this)
																						.prop(
																								"project_title"); //추가
																				var projectNo = $(
																						this)
																						.prop(
																								"project_no"); // 프로젝트 번호

																				if (addedProjectTitles
																						.indexOf(projectTitle) === -1) {
																					$(
																							"#mySelect")
																							.append(
																									"<option value='" + projectNo + "'>"
																											+ projectTitle
																											+ "</option>");
																					addedProjectTitles
																							.push(projectTitle);
																				}

																			});

														},
														error : function(data) {

														}
													}); // ajax end 

											var selectedOption = $(
													"#mySelect option:selected")
													.text();

										});
					});
</script>

<script>
	$(document)
			.ready(
					function() {

						// 프로젝트 선택 박스에 대한 이벤트 리스너
						$("#mySelect")
								.on(
										"change",
										function() {

											var project_title = $(
													"#mySelect option:selected")
													.text(); // 선택된 프로젝트 제목 가져오기 
											var member_no = $(this)[0].baseURI
													.match(/\d+$/)[0];
											var project_no = $(this).val();

											// 선택된 프로젝트의 업무를 가져오기 위한 AJAX 요청 전송

											$
													.ajax({
														url : '/tasksByprojectTitle',
														type : 'GET',
														data : {
															member_no : member_no,
															project_no : project_no,
															project_title : project_title
														},
														dataType : "text",
														contentType : "application/json;charset=utf-8",
														success : function(data) {
															data = JSON
																	.parse(data);
															updateTaskLists(data);
														},
														error : function(data) {
														}
													});
										});

						// 업무 목록을 새로운 업무로 업데이트하는 함수
						function updateTaskLists(tasks) {
							// 기존 업무 목록 비우기
							$(".sortable_list").empty();

							// 업무를 반복하며 해당하는 업무 목록에 추가
							$.each(tasks, function(index, task) {
								var taskListId = "sortable" + task.task_status;
								$("#" + taskListId)
										.append(createTaskItem(task));
							});

							$(".sortable_list")
									.sortable(
											{
												receive : function(event, ui) {
													var beforeTaskStatus = ui.sender[0].id//내가 클릭한 카드의 열의 위치
													var presentTaskStatus = this.id
													var changeStatus; /* 바뀐 업무상태값 변수 */

													if (beforeTaskStatus != presentTaskStatus) {
														if (presentTaskStatus == "sortable0") {
															ui.item.find("td")
																	.eq(9)
																	.html("발의")
															changeStatus = $(
																	"table")
																	.eq(0)
																	.next()
																	.val("0");

														} else if (presentTaskStatus == "sortable1") {
															ui.item.find("td")
																	.eq(9)
																	.html("진행")
															changeStatus = $(
																	"table")
																	.eq(1)
																	.next()
																	.val("1");

														} else if (presentTaskStatus == "sortable2") {
															ui.item.find("td")
																	.eq(9)
																	.html("검토")
															changeStatus = $(
																	"table")
																	.eq(2)
																	.next()
																	.val("2");

														} else if (presentTaskStatus == "sortable3") {
															ui.item.find("td")
																	.eq(9)
																	.html("완료")
															changeStatus = $(
																	"table")
																	.eq(3)
																	.next()
																	.val("3");
														}

													} // if문 end

													// ajax 변수
													// 변동된 정보를 업데이트
													var task_status = changeStatus
															.val();
													var member_no = ui.item
															.find("td").eq(4)
															.text();
													var task_no = ui.item.find(
															"td").eq(2).text();

													if (task_status == undefined) {
														task_status = 0;
													}

													$
															.ajax({
																url : "<c:url value='/chageTaskStatus' />",
																type : "get",
																data : {
																	"task_status" : task_status,
																	"member_no" : member_no,
																	"task_no" : task_no
																},
																dataType : "text",
																contentType : "application/json;charset=utf-8",
																success : function(
																		data) {
																},
																error : function(
																		data) {
																}
															}); // ajax end   

												} // receive end     	
											});

						}

						// 업무 아이템 HTML을 생성하는 함수
						function createTaskItem(task) {

							if (task.task_status == 0) {
								var tableHTML = '<li class="list-group-item list-group-item-action list-group-item-warning">';

							} else if (task.task_status == 1) {
								var tableHTML = ' <li   class="list-group-item list-group-item-action list-group-item-info">	';
							} else if (task.task_status == 2) {
								var tableHTML = '<li   class="list-group-item list-group-item-action list-group-item-danger">';
							} else if (task.task_status == 3) {
								var tableHTML = '<li class="list-group-item list-group-item-action list-group-item-dark">';
							}

							tableHTML += '<table>'
									+

									'<tr>'
									+ '<th style="display: none;">프로젝트 번호 : </th>'
									+ '<td style="display: none;">'
									+ task.project_no
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">프로젝트 제목 : </th>'
									+ '<td style="display: none;">'
									+ task.project_title
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무 번호 : </th>'
									+ '<td style="display: none;">'
									+ task.task_no
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무 제목 : </th>'
									+ '<td>['
									+ task.task_title
									+ ']</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무생성자번호 : </th>'
									+ '<td style="display: none;">'
									+ task.member_no
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무생성자이름 : </th>'
									+ '<td>업무 생성자 :'
									+ task.name
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무등록일 : </th>'
									+ '<td style="display: none;">'
									+ task.task_register_date
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무시작일 : </th>'
									+ '<td style="display: none;">'
									+ task.task_start_date
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;">업무종료일 : </th>'
									+ '<td style="display: none;">'
									+ task.task_end_date
									+ '</td>'
									+ '</tr>'
									+

									'<tr>'
									+ '<th style="display: none;" >업무 상태 :</th>'
									+ '<td style="display: none;">';

							if (task.task_status == 0) {
								tableHTML += '<c:out value="발의"></c:out>';
							} else if (task.task_status == 1) {
								tableHTML += '<c:out value="진행"></c:out>';
							} else if (task.task_status == 2) {
								tableHTML += '<c:out value="검토"></c:out>';
							} else if (task.task_status == 3) {
								tableHTML += '<c:out value="완료"></c:out>';
							}

							tableHTML += '</td>'
									+ '</tr>'
									+

									'</table>'
									+ '<input type="hidden" name="task_status" value="' + task.task_status + '" />'
									+ '</li>';

							return tableHTML;
						}
					});
</script>

<script>
function redirectIfSelectedValue() {
    var selectBox = document.getElementById("mySelect"); // selectbox 요소 가져오기
    var selectedValue = selectBox.value; // 선택된 옵션의 값 가져오기
    
    if (selectedValue === "100") { // 선택된 값이 100일 경우
        //window.location.href = "kanban?member_no=1"; // 리다이렉트
    	location.reload();
    }
}
</script>
</head>
<body>

	<div class="pcoded-main-container">

		<div class="pcoded-content">

			<div class="row">
				<!-- 간트차트 감싸는 DIV -->
				<div class="col-xl-12 col-md-10" style="margin-top: 40px">

					<div class="card table-card">

						<div class="card-header" style="padding-bottom: 0px;">
							<h3>할 일</h3>
						</div>

						<div class="card-body p-0">

							<div class="table-responsive">

								<!-- <select id="mySelect" style="margin-top: 50px;">
									<option>프로젝트 선택</option>
								</select> -->
								<select id="mySelect" onchange="redirectIfSelectedValue()"
									style="margin-top: 50px;">
									<option value="100">전체 프로젝트 보기</option>
								</select>
								<button id="showSelected" class="btn btn-primary btn-sm"
									style="margin-left: 10px; color: #fff; background-color: #78C2AD; border: none">선택된
									프로젝트 보기</button>
								<div id="result"></div>

								<div style="margin-bottom: -40px; margin-top: 15px;">
									<span
										style="font-size: large; font-weight: bold; margin-left: 130px;">발의</span>
								</div>
								<ul id="sortable0" class="sortable_list connectedSortable"
									style="margin-top: 50px; background-color: white;">
									<c:forEach var="tasklist" items="${dto }">
										<c:if test="${tasklist.task_status == 0}">
											<li
												class="list-group-item list-group-item-action list-group-item-warning">
												<table>
													<tr>
														<th style="display: none;">프로젝트 번호 :</th>
														<td style="display: none;">${tasklist.project_no }</td>
													</tr>
													<tr>
														<th style="display: none;">프로젝트 제목 :</th>
														<%-- <td style=" display: none;">${tasklist.project_title }</td> --%>
														<td>[${tasklist.project_title }]</td>
													</tr>
													<tr>
														<th style="display: none;">업무 번호 :</th>
														<td style="display: none;">${tasklist.task_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 제목 :</th>
														<td>${tasklist.task_title }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자번호 :</th>
														<td style="display: none;">${tasklist.member_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자이름 :</th>
														<td>업무 생성자 : ${tasklist.name }</td>
													</tr>
													<tr>
														<th style="display: none;">업무등록일 :</th>
														<td style="display: none;">${tasklist.task_register_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무시작일 :</th>
														<td style="display: none;">${tasklist.task_start_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무종료일 :</th>
														<td style="display: none;">${tasklist.task_end_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 상태 :</th>
														<!-- <td> -->
														<td style="display: none;"><c:out value="발의"></c:out>
														</td>
													</tr>
												</table> <input type="hidden" name="task_status"
												value="${tasklist.task_status}" />
											</li>
										</c:if>
									</c:forEach>
								</ul>

								<div style="margin-bottom: -40px; margin-top: 15px;">
									<span
										style="font-size: large; font-weight: bold; margin-left: 130px;">진행</span>
								</div>
								<ul id="sortable1" class="sortable_list connectedSortable"
									style="margin-top: 50px;">
									<c:forEach var="tasklist" items="${dto }">
										<c:if test="${tasklist.task_status == 1}">
											<li
												class="list-group-item list-group-item-action list-group-item-info">
												<table>
													<tr>
														<th style="display: none;">프로젝트 번호 :</th>
														<td style="display: none;">${tasklist.project_no }</td>
													</tr>
													<tr>
														<th style="display: none;">프로젝트 제목 :</th>
														<%-- <td style=" display: none;">${tasklist.project_title }</td> --%>
														<td>[${tasklist.project_title }]</td>
													</tr>
													<tr>
														<th style="display: none;">업무 번호 :</th>
														<td style="display: none;">${tasklist.task_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 제목 :</th>
														<td>${tasklist.task_title }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자번호 :</th>
														<td style="display: none;">${tasklist.member_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자이름 :</th>
														<td>업무 생성자 : ${tasklist.name }</td>
													</tr>
													<tr>
														<th style="display: none;">업무등록일 :</th>
														<td style="display: none;">${tasklist.task_register_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무시작일 :</th>
														<td style="display: none;">${tasklist.task_start_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무종료일 :</th>
														<td style="display: none;">${tasklist.task_end_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 상태 :</th>
														<td style="display: none;"><c:out value="진행"></c:out>
														</td>
													</tr>
												</table> <input type="hidden" name="task_status"
												value="${tasklist.task_status}" />
											</li>
										</c:if>
									</c:forEach>
								</ul>

								<div style="margin-bottom: -40px; margin-top: 15px;">
									<span
										style="font-size: large; font-weight: bold; margin-left: 130px;">검토</span>
								</div>
								<ul id="sortable2" class="sortable_list connectedSortable"
									style="margin-top: 50px;">
									<c:forEach var="tasklist" items="${dto }">
										<c:if test="${tasklist.task_status == 2}">
											<li
												class="list-group-item list-group-item-action list-group-item-danger">
												<table>
													<tr>
														<th style="display: none;">프로젝트 번호 :</th>
														<td style="display: none;">${tasklist.project_no }</td>
													</tr>
													<tr>
														<th style="display: none;">프로젝트 제목 :</th>
														<%-- <td style=" display: none;">${tasklist.project_title }</td> --%>
														<td>[${tasklist.project_title }]</td>
													</tr>
													<tr>
														<th style="display: none;">업무 번호 :</th>
														<td style="display: none;">${tasklist.task_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 제목 :</th>
														<td>${tasklist.task_title }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자번호 :</th>
														<td style="display: none;">${tasklist.member_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자이름 :</th>
														<td>업무 생성자 : ${tasklist.name }</td>
													</tr>
													<tr>
														<th style="display: none;">업무등록일 :</th>
														<td style="display: none;">${tasklist.task_register_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무시작일 :</th>
														<td style="display: none;">${tasklist.task_start_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무종료일 :</th>
														<td style="display: none;">${tasklist.task_end_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 상태 :</th>
														<td style="display: none;"><c:out value="검토"></c:out>
														</td>
													</tr>
												</table> <input type="hidden" name="task_status"
												value="${tasklist.task_status}" />
											</li>
										</c:if>
									</c:forEach>
								</ul>

								<div style="margin-bottom: -40px; margin-top: 15px;">
									<span
										style="font-size: large; font-weight: bold; margin-left: 130px;">완료</span>
								</div>
								<ul id="sortable3" class="sortable_list connectedSortable"
									style="margin-top: 50px;">
									<c:forEach var="tasklist" items="${dto }">
										<c:if test="${tasklist.task_status == 3}">
											<li
												class="list-group-item list-group-item-action list-group-item-dark">
												<table>
													<tr>
														<th style="display: none;">프로젝트 번호 :</th>
														<td style="display: none;">${tasklist.project_no }</td>
													</tr>
													<tr>
														<th style="display: none;">프로젝트 제목 :</th>
														<%-- <td style=" display: none;">${tasklist.project_title }</td> --%>
														<td>[${tasklist.project_title }]</td>
													</tr>
													<tr>
														<th style="display: none;">업무 번호 :</th>
														<td style="display: none;">${tasklist.task_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 제목 :</th>
														<td>${tasklist.task_title }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자번호 :</th>
														<td style="display: none;">${tasklist.member_no }</td>
													</tr>
													<tr>
														<th style="display: none;">업무생성자이름 :</th>
														<td>업무 생성자 : ${tasklist.name }</td>
													</tr>
													<tr>
														<th style="display: none;">업무등록일 :</th>
														<td style="display: none;">${tasklist.task_register_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무시작일 :</th>
														<td style="display: none;">${tasklist.task_start_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무종료일 :</th>
														<td style="display: none;">${tasklist.task_end_date }</td>
													</tr>
													<tr>
														<th style="display: none;">업무 상태 :</th>
														<td style="display: none;"><c:out value="완료"></c:out>
														</td>
													</tr>
												</table> <input type="hidden" name="task_status"
												value="${tasklist.task_status}" />
											</li>
										</c:if>
									</c:forEach>
								</ul>


							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>