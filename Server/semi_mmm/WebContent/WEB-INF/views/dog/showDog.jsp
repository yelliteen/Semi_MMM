<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css?after">
<link rel="stylesheet" href="/css/content.css?after">
</head>
<body>
<div id="mypageArea" style="margin: 0 auto; width:1100px;border: 1px solid  #E4E8EB;">
<style>
#joinForm{width: 1000px;margin: 0 auto;padding-top: 50px; padding-bottom: 50px;padding-right:20px;}
#left>div>label {width:20%;}
.input-lg {width:80%; border: 1px solid black;}
</style>
<form action="/addDog" id="updateForm" method="post" enctype="multipart/form-data">
<input type="hidden" value="${member.memberId }" name="memberId" id="memberId">
  <legend></legend>
<div style="display:flex">
<div id="left" style="width:70%;border:1px solid black; padding: 20px;">
<div><label for="dogid">* 강이지 등록번호</label><input type="text" value="${oneDog.dogId }" id="dogId" name="dogId" class="input-lg" readonly/></div>
 <input type="hidden" id="checkId" style="border:0px; color:red;font-size:11px;margin-left:20px;" size="30" readonly><br>
<div><label for="dogName">* 강아지 이름</label><input type="text" id="dogName" name="dogName" class="input-lg" value="${oneDog.dogName }"/></div><br>
<div style="display:flex; line-height:100px;"><label for="variety">&nbsp;&nbsp;강아지 품종</label>
<select name="dogCate" size="4">
<c:if test="${empty var[0] }"><option value="대형견">대형견</option><option value="중형견">중형견</option><option value="소형견">소형견</option></c:if>
<c:if test="${not empty var[0] }">
<c:if test="${var[0] eq "대형견"}>
<option value="대형견">대형견</option><option value="중형견">중형견</option><option value="소형견">소형견</option></c:if>	</c:if>						
</select>
<input type="text" id="variety" name="variety" class="input-lg" style="margin-left:20px; width:70%; margin-top:28px;"/></div><br>
<div><label for="dogAge">* 강아지 나이</label><input type="text" id="dogAge" name="dogAge" placeholder="1~38세까지" class="input-lg"/></div><br>
<div><label for="dogGenderM">&nbsp;&nbsp;강아지 성별</label><input type="radio" id="dogGenderM" name="dogGender" value="m" />&nbsp;M&nbsp;&nbsp;
<input type="radio" id="dogGenderW" name="dogGender" value="w"/>&nbsp;W</div><br>
  </div>
  <div id="right" style="width:30%; text-align:center; border:1px solid black; border-left: 0px;"><p style="margin:10px; font-weight:bold;">* 댕댕이 사진</p>
  <div style="border: 1px solid black">
  	<div style="width:100%;  padding:30px; margin:0 auto;">
  	  	<img src="/upload/dogImg/noDogImg.png"  style="width:100%; height:90%;">
  	</div><input type="file" value="사진 선택" name="dogImg" style="border:0px; margin: 10px;">
  </div>
  </div>
  </div>

<button type="submit" style="float:right; margin: 20px;" class="btn btn-primary" onclick="return sub();">등록하기</button>
  </form>
  </div>
</body>
</html>