<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import = "shop.model.vo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	  	<div class="container">
	  		<form id="toCart" name="toCart" action="/toCart" method="post">
		  		<c:if test="${not empty sessionScope.member }">
		  			<div>
		  				<c:forEach items="${sl }" var="list1" varStatus="status">
		  					<label>${list1.productTitle }</label>
		  					<select name="st" onchange=selectOpt(this.value)>
		  						<option value=","></option>
		  						<c:forEach items="${list1.subList }" var="list2">
		  							<option value="${list2.optionPrice},${list2.optionTitle },${list2.bnMemberId},${list1.productTitle}" }>${list2.optionTitle } (+${list2.optionPrice }원)</option>
		  							
		  						</c:forEach>
		  					</select><br>
		  				</c:forEach>
			  		</div>
		  		<div id="price">
		  			<input type="text" name="orderMemberId" value="${sessionScope.member.memberId }">
		  			<input type="text" name="totalPrice" id="totalPrice" value="" readonly>
		  			<input type="text" name="bnMemberId" value="">
		  			<input type="text" name="selectOpt" value="">
		  		</div>
		  		</c:if>
		  		<button type="submit" class="btn btn-primary">장바구니에 담기</button>
		  	</form>
	  		
	  </div>
	  
	  	
	  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
	    $(function(){
	    	$("select[name=st]").change(function(){
		    	var etcs = "";
		    	var etcs2 = "";
		    	var etcs3 = "";
		    	var s = "";
		    	var pt = "";
		    	$("select[name=st] option:selected").each(function(index){
		    		s = $(this).attr("value");
		    		s = s.split(",");
		    		if(s[3]==null){
		    			etcs = Number(etcs) + Number(s[0]);
			    		etcs2 = etcs2 + s[1] + " ";
			    		etcs3 = s[2];
		    		}else{
			    		etcs = Number(etcs) + Number(s[0]);
			    		etcs2 = etcs2 + s[3] + ":" + s[1] + " ";
			    		etcs3 = s[2];
		    		}
		    		
		    	});
		    	$("input[name=totalPrice]").attr("value",etcs);
		    	$("input[name=selectOpt]").attr("value",etcs2);
		    	$("input[name=bnMemberId]").attr("value",etcs3);
	    		
	    	});
	    });
    </script>
</body>
</html>