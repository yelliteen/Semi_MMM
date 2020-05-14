<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myShopFrm</title>
	<style>
		#mypage{
			width: 1000px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<div id="wrapper">
  	<jsp:include page="/WEB-INF/views/common/header.jsp" />
  	<div id="content">
  
  			<div>${sessionScope.shop.memberId }</div>
  		
  	</div>
  	</div>
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>