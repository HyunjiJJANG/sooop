<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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
												style="--bs-border-color: #ffffff; width: 100px;" readonly />

											<input type="hidden" class="form-control" name="passwordView"
												id="passwordView" class="form-control"
												value="${memberDto.password }" /> <label for="password"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="passwordChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />

							</div>
						</div>

						<!-- 변경 할 비밀번호 -->
						<div class="row g-3 align-items-center"
							style="width: 800px; display: none;" id="newChangePasswordDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="password"
												id="password" class="form-control" style="width: 150px;" />
											<label for="password">비밀번호</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="passwordChangeOk"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="입력 취소" id="passwordChangeCancel"
									style="height: 45px; margin-top: 15px; margin-left: 100px;" />
							</div>


						</div>


</body>
</html>