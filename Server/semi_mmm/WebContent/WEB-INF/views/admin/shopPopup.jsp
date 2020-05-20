<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	body {
		padding: 5%;
	}
</style>
<body>
	<h4>아이디 : </h4>
	<h4>닉네임 : </h4>
	<h4>이름 : </h4>
	<h4>생일 : </h4>
	<h4>전화번호 : </h4>
	<h4>주소 : </h4>
	<h4>가입일 : </h4>
	<h4>프로필 이미지 : </h4>
	<div style='text-align: center'>
		<c:if test="${answer.answerDeleteBool eq 0 }">
    		<button style='width: 70px; height: 30px; margin-right: 10px; margin-left: 10px; 
    		background-color: black; color: white; font-size: 15px; border: none' onclick='deleteConfirm();'>삭제</button>
    	</c:if>
    	<c:if test="${answer.answerDeleteBool eq 1 }">
        	<button style='width: 70px; height: 30px; margin-right: 10px; margin-left: 10px; 
        	background-color: black; color: white; font-size: 15px; border: none' onclick='recoveryConfirm();'>복구</button>
        </c:if>
        <button style='width: 70px; height: 30px; margin-right: 10px; margin-left: 10px; 
        background-color: black; color: white; font-size: 15px; border: none' onclick='self.close();'>취소</button>
	</div>
</body>
</html>