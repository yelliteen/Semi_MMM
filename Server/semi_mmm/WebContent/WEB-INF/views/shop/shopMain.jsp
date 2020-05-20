<%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/content.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
<title>shopMain</title>
<style>
	.sell-list{
		float:left;
		width: 250px;
		height: 300px;
		margin-left: 50px;
		margin-right: 50px;
		margin-top: 70px;
		margin-bottom: 30px;
        list-style: none;
	}
	.sell-list>a{
		text-decoration: none;
		
	}
	.sell-list1{
		width: 100%;
		height: 80%;
		background-color: black;
	}
	.sell-list2{
		width: 100%;
		height: 20%;
		background-color: yellow;
	}
    .sell-list2>div:first-child{
        width:100%;
        height: 50%;
        background-color: blue;
        text-align:center;
        font-size: 20px;
    }
    .sell-list2>div:last-child{
        width:100%;
        height: 50%;
        background-color: aquamarine;
        text-align:right;
    }
</style>
</head>
<body>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<form action="/shopMain" method="get">
			<%for(Member m : list) {%>
	         <ul>
	         	<li class="sell-list"> 
	         		<a onclick="location.href='/sellProductFrm2?memberId=<%=m.getMemberId() %>'"> <input type="hidden" name="memberId">
	         			<div class="sell-list1"></div>
	         			<div class="sell-list2">
	         				<div><%=m.getMemberNickname() %></div>
	         				<div><%=m.getMemberName() %></div>
	         			</div>
	         		</a>
	         	</li>
	         </ul>
	         <%} %>
		</form>
		<div>
		   	<a onclick="location.href='myCartFrm?memberId=${session.member.memberId}'">장바구니보기</a>
	    </div>
         <!--<c:if test="${not empty sessionScope.member }"><!-- 글쓰기는 로그인 한 사람만 할수있게 -->
            <!--<button class="btn btn-outline-info" id="write-btn">글쓰기</button>-->
         <!--</c:if>-->
	         
      </div>
      </div>
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>



</html>