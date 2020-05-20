<%@page import="notice.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

	<style>
		.comment-wrapper{
			width: 1000px;
			margin: 0 auto;
		}
		.commnet-writer{
			width: 1000px;
			margin: 0 auto;
		}
		.table-warpper{
			width: 1000px;
			margin: 0 auto;
		}
		.commentList{
			width:100%;
			clear: both;
			border: 1px solid #ccc;
			border-radius: 5px;
			overflow: hidden;
		}


	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section class="container">
		<div class="table-wrapper">
		<h1>커뮤니티</h1>
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td>${n.noticeTitle }</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${n.noticeWriter }</td>
				</tr>
				
				<tr>
					<th>강아지 이름</th>
					<td>${dog.dogName }</td>
				</tr>
		
				<tr>
				<th class="con11">내용</th>
				 <td>${n.noticeContent }</td>
				</tr>
				
				<tr>
					<th colspan="2" style="text-align: center">
						<c:if test="${sessionScope.member.memberNickname == n.noticeWriter || sessionScope.shop.memberNickname == n.noticeWriter}">
							<a class="btn btn-outline-primary btn sm" href="updateNoticeFrm?noticeNo=${n.noticeNo }">수정하기</a>
							<!-- href="javascript:void(0); : 클릭이벤트 취소시킴 -->
							<a class="btn btn-outline-primary btn sm" href="javascript:void(0);" onclick="deleteNotice('${n.noticeNo }');">삭제하기</a>
						</c:if>
						<a href="/noticeList?reqPage=1" class="btn btn-outline-primary btn sm">목록으로</a>
					</th>
				</tr>
			</table>
		</div>
		
		
		
		
		<!-- ----------------------------------------------------------댓글창------------------------------------------------- -->
		
		<!-- 로그인이 되면 생성 -->
		<c:if test="${not empty sessionScope.member.memberId }">
		<!-- 댓글 작성창 -->
		<div class="comment-wrapper">
			<form action="/noticeCommentInsert" method="post">
			<!-- 작성자, 게시글번호, 댓글레벨, 댓글번호 -->
			<input type="hidden" name="noticeCommentWriter" value="${sessionScope.member.memberId }">
			<input type="hidden" name="noticeCommentWriterNickname" value="${sessionScope.member.memberNickname }">
			<input type="hidden" name="noticeCommentRef" value="${n.noticeNo }">
			<input type="hidden" name="dogId" value="${n.dogId }">
			<input type="hidden" name="noticeCommentLevel" value="1">
			<input type="hidden" name="noticeCommentNo" value="0">
			<input type="hidden" name="noticeCommentRefTwo" value="0">
			<input type="hidden" name="dogName" value="${dog.dogName }">
			
				<table class="table">
					<tr>
						<td width="85%">
							<input type="text" class="form-control" name="noticeCommentContent">
						</td>
						
						<td width="15%">
							<button type="submit" class="btn btn-primary">등록</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</c:if>
		
		
				<c:if test="${not empty sessionScope.shop.memberId }">
		<!-- 댓글 작성창 -->
		<div class="comment-wrapper">
			<form action="/noticeCommentInsert" method="post">
			<!-- 작성자, 게시글번호, 댓글레벨, 댓글번호 -->
			<input type="hidden" name="noticeCommentWriter" value="${sessionScope.shop.memberId }">
			<input type="hidden" name="noticeCommentWriterNickname" value="${sessionScope.shop.memberNickname }">
			<input type="hidden" name="noticeCommentRef" value="${n.noticeNo }">
			<input type="hidden" name="dogId" value="${n.dogId }">
			<input type="hidden" name="noticeCommentLevel" value="1">
			<input type="hidden" name="noticeCommentNo" value="0">
			<input type="hidden" name="noticeCommentRefTwo" value="0">
			<input type="hidden" name="dogName" value="${dog.dogName }">
			
				<table class="table">
					<tr>
						<td width="85%">
							<input type="text" class="form-control" name="noticeCommentContent">
						</td>
						
						<td width="15%">
							<button type="submit" class="btn btn-primary">등록 </button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</c:if>
 
		<div class="comment-wrapper">
			<c:forEach items="${list }" var="nc">
			

	
			<c:if test="${nc.noticeCommentLevel eq 1 }">
				<c:if test="${nc.noticeCommentBool eq 0 }">
				<div class="commentList" style=" float: right; margin-bottom: 2%; margin-right: 2%;
						padding-top: 0.5%; padding-left: 0.5%; padding-right: 0.5%;">
						
						<div style="">
					
						<div style=" text-align: left;">
								<div style="line-height: 30px; border-bottom: 1px solid #ccc;">${nc.noticeCommentWriter }
								</div>
							
								</div>
								
						
							<div style="text-align: left;">
								<div style="margin-bottom: 1%; margin: 2% 2% 2% 2%;">${nc.noticeCommentContent }</div>
								<input type="text" class="form-control" name="noticeCommentContent" value="${ncc.noticeCommentContent }"
								style="display:none;">
							</div>

				
					<div style="border-top: 1px solid #ccc;">
					<div style=" text-align:right; margin-right: 10%; ">
						<c:if test="${not empty sessionScope.member.memberId}">
							<div style="display: inline-block; margin-right: 10.7%;">${nc.noticeCommentDate }
							<input type="hidden" value="${nc.noticeCommentDate }" name="noticeCommentDate">
							</div>
							<a href="javascript:void(0)" onclick="insertComment(this,'${nc.noticeCommentNo }','${n.noticeNo }','${sessionScope.member.memberId }', '${n.dogId }')">댓글달기</a>
							<c:if test="${sessionScope.member.memberId == nc.noticeCommentWriter || sessionScope.member.memberId == nc.noticeCommentWriter}">
								<a href="javascript:void(0)" onclick="modifyComment(this, '${nc.noticeCommentNo }', '${nc.noticeCommentRef }')">수정</a>
								<a href="javascript:void(0)" onclick="deleteComment('${nc.noticeCommentNo }', '${nc.noticeCommentRef }')">삭제</a>
							</c:if>
						</c:if>
						
						<c:if test="${not empty sessionScope.shop.memberId}">
						<div style="display: inline-block; margin-right: 10.7%;
						padding-top: 0.5%; padding-left: 0.5%; padding-right: 0.5%;">${nc.noticeCommentDate }
						<input type="hidden" value="${nc.noticeCommentDate }" name="noticeCommentDate">
						</div>
							<a href="javascript:void(0)" onclick="insertComment(this,'${nc.noticeCommentNo }','${n.noticeNo }','${sessionScope.shop.memberId }', '${n.dogId }')">댓글달기</a>
							<c:if test="${sessionScope.shop.memberId == nc.noticeCommentWriter || sessionScope.shop.memberId == nc.noticeCommentWriter}">
								<a href="javascript:void(0)" onclick="modifyComment(this, '${nc.noticeCommentNo }', '${nc.noticeCommentRef }')">수정</a>
								<a href="javascript:void(0)" onclick="deleteComment('${nc.noticeCommentNo }', '${nc.noticeCommentRef }')">삭제</a>
							</c:if>
						</c:if>
					</div>
					</div>
					</div>
				</div>
			</c:if>
			</c:if>
				<c:forEach items="${list }" var="ncc">
					<c:if test="${ncc.noticeCommentLevel eq 2 && nc.noticeCommentNo eq ncc.noticeCommentRefTwo }">
						<c:if test="${ncc.noticeCommentBool eq 0 }">
						<div class="commentList" style=" width: 950px; float: right; margin-bottom: 2%; margin-right: 2%;
						padding-top: 0.5%; padding-left: 0.5%; padding-right: 0.5%;">
						
							<div style=" text-align: center">
							
							
							<div style=" text-align: left;">
								<div style="line-height: 30px; border-bottom: 1px solid #ccc;">${ncc.noticeCommentWriter }</div>
								
								</div>
						
							<div style="text-align: left;">
								<div style="margin-bottom: 1%; margin: 2% 2% 2% 2%;">${ncc.noticeCommentContent }</div>
								<input type="text" class="form-control" name="noticeCommentContent" value="${ncc.noticeCommentContent }"
						style="display:none;">
							</div>
							
							<div style="border-top: 1px solid #ccc;">
							<div style=" text-align:right; margin-right: 10%;">
								<c:if test="${not empty sessionScope.member.memberId}">
									<div style="display: inline-block; margin-right: 10.7%;">${ncc.noticeCommentDate }</div>
									<a href="javascript:void(0)" onclick="modifyComment(this, '${ncc.noticeCommentNo }', '${ncc.noticeCommentRef }', '${ncc.noticeCommentContent }')">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment('${ncc.noticeCommentNo }', '${ncc.noticeCommentRef }')">삭제</a>
								</c:if>
								
								<c:if test="${not empty sessionScope.shop.memberId}">
									<div style="display: inline-block;">${ncc.noticeCommentDate }</div>
									<a href="javascript:void(0)" onclick="modifyComment(this, '${ncc.noticeCommentNo }', '${ncc.noticeCommentRef }' '${ncc.noticeCommentContent }')">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment('${ncc.noticeCommentNo }', '${ncc.noticeCommentRef }')">삭제</a>
								</c:if>
							</div>
							</div>
						</div>
						</div>
						
					</c:if>
				</c:if>
				</c:forEach>
		</c:forEach>
	</div>
	
</section>
	 
	<script>

	
		function deleteNotice(noticeNo){
			if(confirm("삭제할래요?")){
				location.href="/deleteNotice?noticeNo="+noticeNo;
			}
		}
		function insertComment(obj,commentNo,noticeNo,memberId, dogId){
			$(obj).parent().hide();
			var $form = $("<form action='/noticeCommentInsert' method='post'></form>");
			var $ul = $("<ul class='commentList'></ul>");
			$form.append($("<input type='hidden' name='noticeCommentWriter' value='"+memberId+"'>"));
			$form.append($("<input type='hidden' name='noticeCommentRef' value='"+noticeNo+"'>"));
			$form.append($("<input type='hidden' name='noticeCommentLevel' value='2'>"));
			$form.append($("<input type='hidden' name='noticeCommentRefTwo' value='"+commentNo+"'>"));
			$form.append($("<input type='hidden' name='noticeCommentNo' value='0'>"));
			$form.append($("<input type='hidden' name='dogId' value='"+dogId+"'>"));
			var $li1 = $("<div>여기에 화살표 넣어야함.</div>");
			var $li2 = $("<div style='width:75%'></div>");
			$li2.append($("<input type='text' name='noticeCommentContent' class='form-control'>"));
			var $li3 = $("<div style='width:20%'></div>");
			$li3.append($("<button type='submit' class='btn btn-link btn-sm'>등록</button>"));
			$li3.append($("<button type='button' class='btn btn-link btn-sm' onclick='insertCancel(this, "+noticeNo+")'>취소</button>"));
			$ul.append($li1).append($li2).append($li3);
			$form.append($ul);
			$(obj).parent().parent().after($form);
		}
		
		function insertCancel(obj, noticeNo){
			location.href="/noticeView?noticeNo="+noticeNo;
		}
		
		function deleteComment(noticeCommentNo, noticeCommentRef){
			location.href="/noticeCommentDelete?noticeCommentNo="+noticeCommentNo+"&noticeCommentRef="+noticeCommentRef;
		}
		
		function modifyComment(obj, noticeCommentNo, noticeCommentRef, noticeCommentContent){
			$(obj).prev().hide();
			$(obj).html('수정완료');
			$(obj).attr('onclick','modifyComplete(this, "'+noticeCommentNo+'", "'+noticeCommentRef+'" , "'+noticeCommentContent+'")');
			$(obj).next().html('취소');
			$(obj).next().attr('onclick','modifyCancel(this, "'+noticeCommentNo+'", "'+noticeCommentRef+'" , "'+noticeCommentContent+'")');
			$(obj).parent().parent().find('input').show();
			$(obj).parent().parent().find('input').prev().hide();
		}
		
		function modifyCancel(obj, noticeCommentNo, noticeCommentRef, noticeCommentContent){
			$(obj).prev().prev().show();
			$(obj).prev().html('수정');
			$(obj).prev().attr('onclick','modifyComment(this,"'+noticeCommentNo+'", "'+noticeCommentRef+'", "'+noticeCommentContent+'")');
			$(obj).html('삭제');
			$(obj).attr('onclick','deleteComment("'+noticeCommentNo+'", "'+noticeCommentRef+'")');
			$(obj).parent().parent().find('input').hide();
			$(obj).parent().parent().find('input').prev().show();
		}
		
		function modifyComplete(obj, noticeCommentNo, noticeCommentRef){
			var $form=$("<form action='/noticeCommentUpdate' method='post'></form>");
			$form.append($("<input type='text' name='noticeCommentNo' value='"+noticeCommentNo+"'>"));
			$form.append($("<input type='text' name='noticeCommentRef' value='"+noticeCommentRef+"'>"));

			$form.append($(obj).parent().parent().find('input'));
			$('body').append($form);
			$form.submit();
			
		}
		
		
	</script>

</body>
</html>