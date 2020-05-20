<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import = "shop.model.vo.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myShopFrm</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
	body{
		background-color: red;
	}
	div{
		height: 150px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
  	<div style="height: 500px;"></div>
  	<div id="content" style="background-color:red;">
  		<c:if test="${not empty sessionScope.shop }">
  	
	  		<div>
	  			<form action="/insertMenu" method="post">
	  				<input type="hidden" name="productNo">
	  				<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
	  				<input type="hidden" name="productFilename">
	  				<input type="hidden" name="productFilepath">
	  				<input type="text" class="form-control" name="productTitle">
	  				<button type="submit" class="btn btn-primary">메뉴 추가</button>
	  			</form>
	  		</div>
	  		<div>
	  			<form name="myShopFrm" action="/myShopFrm" method="post" id="myShopFrm">
		  			<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
		  				<button type="submit" class="btn btn-primary" id="sendVal">메뉴 보기</button>
			  					<!-- <input type="hidden" id="productTitle" name="productTitle" value="${p.productTitle }">-->
		  			
		  				<select id="selectMenu" onchange=selectVal1(this.value)>
		  					<option>==선택==</option>
			  				<c:forEach items="${list }" var="p">
			  							<option value="${p.productNo },${p.productTitle },${p.productFilename },${p.productFilepath }">${p.productTitle }</option>
                                        <!--<input type="hidden" id="inputpn" name="${p.productNo}" value="${p.productNo}">-->
		  						<!-- <input type="hidden" name="productNo" value="${p.productNo }">-->
			  				</c:forEach>
		  				</select>
	  			</form>
	  			<form name="updateMenu" action="/updateMenu" method="post" id="updateMenu">
	  				<input type="hidden" name="productNo" value="">
	  				<input type="text" name="productTitle">
	  				<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
	  				<input type="hidden" name="productFilename" value="">
	  				<input type="hidden" name="productFilepath" value="">
	  				<button type="submit" class="btn btn-primary">메뉴 이름 수정</button>
	  			</form>
	  			<form name="deleteMenu" action="/deleteMenu" method="post" id="deleteMenu">
	  				<input type="hidden" name="productNo" value="">
	  				<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
	  				<button type="submit" class="btn btn-primary">메뉴 삭제</button>
	  			</form>
	  			
	  			
	  		</div>
	  		<div>
				<form name="insertSubMenu" action="/insertSubMenu" method="post" id="insertSubMenu">
					<input type="hidden" name="optionNo" value="">
					<input type="hidden" name="productNo" value="">	
					<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
					<label>옵션이름</label><input type="text" name="optionTitle">
					<label>옵션추가가격</label><input type="text" name="optionPrice">	
					<button type="submit" class="btn btn-primary">하위 메뉴 추가</button>
				</form>
	  		</div>
	  		<div>
	  			<form name="myShopFrm2" action="/myShopFrm2" method="post" id="myShopFrm2">
	  				<input type="hidden" name="productNo" value="">
	  				<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
	  					<button type="submit" class="btn btn-primary">하위 메뉴 보기</button>
	  					<select id="selectSubMenu" onchange=selectVal2(this.value)>
	  						<option>==선택==</option>
	  						<c:forEach items="${subList }" var="po">
	  							<option value="${po.optionNo},${po.productNo},${po.optionTitle},${po.optionPrice}">${po.optionTitle }</option>
	  						</c:forEach>
	  					</select>
	  			</form>
	  			
	  			<form name="updateSubMenu" action="/updateSubMenu" method="post" id="updateSubMenu">
	  				<input type="hidden" name="optionNo" value="">
	  				<input type="hidden" name="productNo" value="">
	  				<input type="hidden" name="bnMemberId" value="${sessionScope.shop.memberId }">
	  				<input type="text" name="optionTitle" value="">
	  				<input type="text" name="optionPrice" value="">
	  				<button type="submit" class="btn btn-primary">하위 메뉴 이름 수정</button>
	  			</form>
	  		</div>
  		</c:if>
  	</div>
  	
  
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        function selectVal1(v){
        	var vSplit = v.split(",");
        	document.updateMenu.productNo.value = vSplit[0];
        	document.updateMenu.productTitle.value = vSplit[1];
        	document.updateMenu.productFilename.value = vSplit[2];
        	document.updateMenu.productFilepath.value = vSplit[3];
        	document.insertSubMenu.productNo.value = vSplit[0];
        	document.myShopFrm2.productNo.value = vSplit[0];
        }
        function selectVal2(v){
        	var vSplit = v.split(",");
        	document.insertSubMenu.optionNo.value = vSplit[0];
        	document.updateSubMenu.optionNo.value = vSplit[0];
        	document.updateSubMenu.productNo.value = vSplit[1];
        	document.updateSubMenu.optionTitle.value = vSplit[2];
        	document.updateSubMenu.optionPrice.value = vSplit[3];
        }
        
    </script>
    
</body>
</html>