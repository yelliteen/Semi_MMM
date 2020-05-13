<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
		.table{
			width:1000px;
			margin: 0auto;
			text-align: center;
		}
		#pageNavi{
			text-align: center;
			width: 1000px;
			margin: 0 auto;
		}
		
		#pageNavi>*{
			magin: 10px;
			
		}
		
		.selectPage{
			font-size: 18px;
			color: blue;
		}
		
		
	</style>


</head>
<body>

 <jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="container">
		<h1>사진 게시판</h1>
	
		<c:if test="${not empty sessionScope.member.memberId }">
		  		<form action="/noticeWriteFrm" method="post">
		  		<div style="text-align: right;">
		  			<button id="logining" class="btn btn-lg btn-primary btn-block" style=" width:100px; height: 40px; line-height: 100%; display: inline-block; font-size: 20px; margin-bottom: 1%;" type="submit">글쓰기</button>
		  		</div>
		  		</form>
		  	</c:if>
	
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>

			<c:forEach items="${list }" var="n">
				<tr>
					<td>${n.noticeNo }</td>
					<td>${n.noticeTitle }</td>
					<td>${n.noticeWriter }</td>
					<td>${n.noticeDate }</td>
				</tr>
			</c:forEach>
		</table>
		

		<div id="pageNavi">${pageNavi }</div>
		
	
	
		<table style="margin: 0 auto; margin-bottom: 2%; margin-top: 2%">
		<tr>
		  <td style="width: 20%; text-align: center;">
		  	<select>
		  	<option>제목</option>
		  	<option>내용</option>
		  	<option>작성자</option>
		  	</select>
		  </td>
		
		  <td style="width: 60%;"><input type="text" style="width: 100%;"></td>
		  
		   <td style="width: 20%;">
		   <form action="/noticeWriteFrm" method="post">
		  	<button id="logining" class="btn btn-lg btn-primary btn-block" style=" width:100px; height: 30px; line-height: 40%; display: inline-block; margin-left: 10%; font-size: 20px;" type="submit">검색</button>
		  </form>
		  </td>
		  
		</tr>
		</table>
		
		
		
	</section>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
</body>
</html>