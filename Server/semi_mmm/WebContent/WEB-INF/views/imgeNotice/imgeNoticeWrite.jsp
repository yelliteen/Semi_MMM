<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<section class="container">
			<h1>공지사항 작성</h1>
			<form action="/insertNotice" method="post" enctype="multipart/form-data" id="insertFrm">
				<table class="table table-bordered">
					
					<tr>
						<th>제목</th>
						<td><input  type="text" class="form-control" name="noticeTitle"></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>${sessionScope.Member.memberId }
							<input type="hidden" name="noticeWriter" value="${sessionScope.Member.memberId }">
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td>
							<jsp:include page="/WEB-INF/views/common/smartEditorForm.jsp" />
						</td>
					</tr>
					
					<tr style="text-align: center;">
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">등록</button>
						</th>
					</tr>
				</table>
			</form>
		</section>

</body>
</html>