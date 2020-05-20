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
	         		<a onclick="location.href='/sellProductFrm2?memberId=<%=m.getMemberId() %>'">
	         			<input type="hidden" name="memberId">
	         			<div class="sell-list1"></div>
	         			<div class="sell-list2">
	         				<div name="memberNickname"><%=m.getMemberNickname() %></div>
	         				<div><%=m.getMemberName() %></div>
	         			</div>
	         		</a>
	         	</li>
	         </ul>
	         <%} %>
		</form>
		<div>
			<form action="/myCart">
			   	<input type="hidden" name="orderMemberId" value="${sessionScope.member.memberId }">
			   	<button type="submit" class="btn btn-primary">장바구니 보기</button>
			</form>
	    </div>
         <!--<c:if test="${not empty sessionScope.member }"><!-- 글쓰기는 로그인 한 사람만 할수있게 -->
            <!--<button class="btn btn-outline-info" id="write-btn">글쓰기</button>-->
         <!--</c:if>-->
	         
      </div>
      </div>
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>



</html>