<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<script src="https://kit.fontawesome.com/a613319909.js"
	crossorigin="anonymous"></script>
<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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


<!-- CSS -->
<style type="text/css">
html, body {
	height: 100%;
}

body {
	background: #ffffff;
}

#historyH2 {
	margin-left: 50px;
	font-weight: bold;
	margin-top: 100px;
	align-items: center;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 90%;
	text-align: center;
	align-items: center;
	margin-left: 60px;
	margin-top: 40px;
	margin-bottom: 40px;
}

table {
	border: 1px #00480c solid;
	font-size: .9em;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

/* th {
	text-align: center;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #00480c;
} */
thead {
	font-weight: bold;
	color: #fff;
	background: #00480c;
	position: sticky; /* 테이블 헤더 고정 */
	top: 0; /* 상단에 고정 */
	z-index: 2; /* 다른 내용 위에 표시되도록 z-index 설정 */
}

th {
	padding: 1em .5em;
	vertical-align: middle;
	text-align: center;
	background-color: #00480c; /* 배경색 지정 */
	position: sticky; /* 열 고정 */
	top: 0; /* 상단에 고정 */
	z-index: 1; /* 테이블 헤더 위에 표시되도록 z-index 설정 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
	text-align: center;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}

td {
	/* ... */
	position: sticky; /* 열 고정 */
	top: 0; /* 상단에 고정 */
	z-index: 1; /* 테이블 헤더 위에 표시되도록 z-index 설정 */
}

td {
	max-width: 200px; /* 최대 너비 설정 */
	overflow: hidden; /* 넘치는 부분 감춤 */
	white-space: nowrap; /* 텍스트가 줄 바꿈 없이 표시 */
	text-overflow: ellipsis; /* 넘치는 텍스트는 ...으로 표시 */
}

a {
	color: #00480c;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: center;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: center;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
		text-align: center;
	}
	tr {
		display: inline-block;
		vertical-align: top;
		text-align: center;
	}
	th {
		border-bottom: 1px solid #00480c;
		text-align: center;
	}
	td {
		border-bottom: 1px solid #e5e5e5;
		text-align: center;
	}
}

/* ul {
	text-align: center;
	margin-top: 30px;
	vertical-align: middle;
} */
</style>


<script>
	$(document)
			.ready(
					function() {
						$("#projectList")
								.change(
										function() {
											var selectedProjectNo = $(this)
													.val();
											var member_no = parseInt($(
													"#member_no").val());
											if (selectedProjectNo) {
												$
														.ajax({
															url : "/getSelectProjectHistoryList", // 서버에서 히스토리 리스트를 반환하는 URL
															method : "GET",
															data : {
																project_no : selectedProjectNo,
																member_no : member_no

															},
															dataType : "json",
															success : function(result) {
																if (result && result.length >= 1) {
																	var searchResultList = [];
																	result.forEach(function(
																					item) {

																				var str = '<tr>';
																				str += '<td>'
																						+ item.project_title
																						+ '</td>';
																				str += '<td><a href="/historyDetail?task_no='
																						+ item.task_no
																						+ '">'
																						+ item.task_title
																						+ '</a></td>';
																				str += '<td>'
																						+ item.history_content
																						+ '</td>';
																				str += '<td>'
																						+ item.name
																						+ '</td>';
																				str += '<td>';

																				var formattedDate = new Date(
																						item.history_register_date);
																				var year = formattedDate
																						.getFullYear();
																				var month = (formattedDate
																						.getMonth() + 1)
																						.toString()
																						.padStart(
																								2,
																								'0');
																				var day = formattedDate
																						.getDate()
																						.toString()
																						.padStart(
																								2,
																								'0');
																				var formattedDateString = year
																						+ '-'
																						+ month
																						+ '-'
																						+ day;

																				// ...

																				str += formattedDateString; // 원하는 날짜 형식으로 출력

																				str += '</td>';
																				str += '</tr>';
																				searchResultList
																						.push(str);

																			});

																	$(
																			'#historyListDiv')
																			.empty()
																			.append(
																					searchResultList
																							.join(''));

																} else {
																	$(
																			'#historyListDiv')
																			.empty()
																			.html(
																					'<tr><td colspan="5">선텍하신 프로젝트의 히스토리가 없습니다.</td></tr>');

																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.log(
																				"Error occurred:",
																				errorThrown);
															}
														});
											}
										});
					});
</script>


<jsp:include page="nav.jsp" />
</head>
<body>
	<input type="hidden" value="${member_no }" name="member_no"
		id="member_no" />
	<div class="pcoded-main-container">
		<div class="pcoded-content">
		
		    
			<div class="row">
				<div class="col-xl-12 col-md-12" style="margin-top: 50px">
					<div class="card table-card">
						<!-- <h2 class="card-title text-left" id="historyH2">히스토리</h2> -->
						<div class="card-header" style="padding-bottom: 0px;">
							<h3>히스토리</h3>

						</div>
						<div class="card-body p-0 ">
							<div class="table-responsive" style="height: 550px">
								<div class="card-text">
									<div class="container" style="margin-top: 50px">
										<table>
											<thead>
												<tr>
													<th>프로젝트 제목</th>
													<th>업무 제목</th>
													<th>히스토리 내용</th>
													<th>작성자</th>
													<th>시간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>


													<td><select class="form-select"
														aria-label="Default select example" name="projectList"
														id="projectList">
															<option selected>프로젝트 선택</option>
															<option value="0">전체보기</option>
															<c:forEach var="project" items="${projectList}">
																<option value="${project.project_no}">${project.project_title}</option>
															</c:forEach>

													</select></td>

												</tr>
											<tbody id="historyListDiv">
												<c:forEach var="historydto" items="${list }">
													<tr>
														<td>${historydto.project_title }</td>
														<td><a
															href="/historyDetail?task_no=${hitorydto.task_no}">${historydto.task_title }</a></td>
														<td>${historydto.history_content }</td>
														<td>${historydto.name }</td>

														<td>
															<%-- ${historydto.history_register_date }  --%> <!-- 이 때 여기 value는 날짜값이 와야 합니다. string일 경우 날짜값으로 바꿔줘야 함 -->
															<fmt:parseDate var="dateString"
																value="${historydto.history_register_date }"
																pattern="yyyy-MM-dd HH:mm:ss" /> <!-- 위에 저런 문자로 되어있으니까 날짜로 인식해서 바꿔줘 -->
															<fmt:formatDate value="${dateString}"
																pattern="yyyy-MM-dd" />
														</td>
													</tr>


												</c:forEach>

											</tbody>



											<%-- <tr>
												<td colspan="5">
													<nav aria-label="Page navigation example">
														<ul class="pagination">
															<c:if test="${map.prev }">
																<li class="page-item"><a class="page-link"
																	href="historyList?currentPage=${map.currentPage-5}&member_no=${member_no}">이전</a></li>
															</c:if>
															<c:forEach var="i" begin="${map.startPageNo}"
																end="${map.endPageNo}">
																<li class="page-item"><a class="page-link"
																	href="historyList?currentPage=${i}&member_no=${member_no}">${i}</a></li>
															</c:forEach>
															<c:if test="${map.next }">
																<li class="page-item"><a class="page-link"
																	href="historyList?currentPage=${map.currentPage+5}&member_no=${member_no}">다음</a></li>
															</c:if>
														</ul>
													</nav>

												</td>
											</tr> --%>
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
	</div>
</body>


</html>