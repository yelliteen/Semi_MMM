<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shopMake</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
   		<form action="/insertShop" method="post" enctype="multipart/form-data" style="width:300px; margin: 0 auto;">
   			<table class="table table-bordered">
   				<tr>
   					<th>작성자</th>
   					<td>
   						${sessionScope.member.memberId }
   						<input type="hidden" name="shopWriter" value="${sessionScope.member.memberId }">
   					</td>
   				</tr>
   				<tr>
   					<th>첨부파일</th>
   					<td>
   						<input type="file" name="filename" onchange="LoadImg(this);">
   					</td>
   				</tr>
   				<tr>
   					<th>이미지보기</th>
   					<td>
   						<div id="img-viewer">
   							<img id="img-view" width="350">
   						</div>
   					</td>
   				</tr>
   				<tr>
   					<th>내용</th>
   					<td><textarea name="photoContent" rows="3" style="width:100%;"></textarea></td>
   				</tr>
   				<tr>
   					<th style="text-align: center;" colspan="2">
   						<button type="submit" class="btn btn-outline-primary">등록하기</button>
   					</th>
   				</tr>
   			</table>
   		</form>
  	</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  	
  	<script>
  		function LoadImg(f){
  			if(f.files.length!=0 && f.files[0]!=0){
  				var reader = new FileReader();
  				reader.readAsDataURL(f.files[0]);
  				reader.onload = function(e){
  					$("#img-view").attr("src", e.target.result);
  				}
  			}else{
  				$("#img-view").attr("src","");
  			}
  			
  		}
  	</script>
  	
  	
  	
  	
  	
</body>
</html>