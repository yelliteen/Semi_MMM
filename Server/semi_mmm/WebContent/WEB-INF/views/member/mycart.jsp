<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://admin.iamport.kr/users/login"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
	table tr th{
		text-align:center;
	}
	table tr td:nth-child(1){
		text-align:center;
	}
	table tr td:nth-child(2){
		text-align:center;
	}
	table tr td:nth-child(3){
		text-align:center;
	}
	table tr td:nth-child(4){
		font-size: 5px;
	}
	table tr td:nth-child(5){
		text-align:center;
	}
</style>
</head>
<body>
	<div id="wrapper">
	  	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	  	<div id="content">
	  	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	  		<c:if test="${not empty sessionScope.member }">
	  		
	  			
	  				<div id="pay">
			  			<table border="1px solid black">
				  				<tr>
				  					<th>선택</th>
				  					<th>주문번호</th>
				  					<th>판매자</th>
				  					<th>선택상품</th>
				  					<th>가격</th>
				  				</tr>
			  				<c:forEach items="${cartList }" var="c">
				  				<tr>
				  					<td><input type="checkBox" name="checkBtn" value="${c.totalPrice }"></td>
				  					<td>${c.cartNo }</td>
				  					<td>${c.bnMemberId }</td>
				  					<td>${c.selectOpt }</td>
				  					<td>${c.totalPrice }</td>
				  				</tr>
				  			</c:forEach>
			  			</table>
			  			<div>총 결제 금액 : <span></span></div>
			  			<button class="btn btn-danger">결제하기</button>
			  			<p id="paymentResult"></p>
			  		</div>
	  		</c:if>
	  	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        $(function(){
            var totalPrice = 0;
            $("input[name=checkBtn]").change(function(){
            	if($(this).is(":checked")){
            		totalPrice += Number($(this).attr("value"));
            	}else{
            		totalPrice -= Number($(this).attr("value"));
            	}
            	$("#pay div span").html(totalPrice);
            });
            
            $("#pay button").click(function(){
                var price = $("#pay span").html();
                var d = new Date();
                var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
                               //중간에 빈공간""을 넣어주지 않으면 각각이 숫자로 변해서 더해짐
                IMP.init("imp84399441");
                IMP.request_pay({
                   merchant_uid : '상품명_'+date,
                   name : '결제테스트',
                   amount : price,
                   buyer_email : 'test@naver.com',
                   buyer_name : '이솔',
                   buyer_tel : '010-1111-2222',
                   buyer_addr : '타워펠리스',
                   buyer_postcode : '45456'
                },function(rsp){
                   if(rsp.success){
                      var msg = "결제가 완료되었습니다";
                      var r1 = "고유 ID : "+rsp.imp_uid;
                      var r2 = "상점 거래 아이디 : "+rsp.merchant_uid;
                      var r3 = "결제 금액 : "+rsp.paid_amount;
                      var r4 = "카드 승인번호 : "+rsp.apply_num;
                      $("#paymentResult").html(msg+"<br>"+r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                   }else{
                      $("#paymentResult").html("에러 내용 : "+rsp.error_msg);
                   }
                });
             });
        });
    </script>
</body>
</html>