<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/button-style.css">
<link rel="stylesheet" href="/css/ham-menu1.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/content.css">
<script type="text/javascript" src="/js/header.js"></script>
<style>
</style>
    <div id="header">
        <div id="navbar">
            <div id="navbar_menu">
                <div id="wrapper_menu">
                    <div id="line-wrapper" href="javascript:void(0)" class="closebtn" onclick="openNav()">
                        <!-- 추가된 부분 -->
                        <div id="line-top" class="line init top-reverse" style="background-color:#545454;"></div>
                        <div id="line-mid" class="line init mid-reverse" style="background-color:#545454;"></div>
                        <div id="line-bot" class="line init bot-reverse" style="background-color:#545454;"></div>
                    </div>
                    <div id="mySidepanel" class="sidepanel">
                        <a href="/info" class="openbtn">회사소개</a>
                        <a href="/articleList" class="openbtn">번개장터</a>
                        <a href="/dessertMain" class="openbtn">디저트</a>
                        <a href="#" class="openbtn">커뮤니티</a>
                        <a href="/map" class="openbtn">함께 할 수 있는 곳</a>
                        <a href="#" class="openbtn">F&A</a>
                    </div>

                </div>
            </div>
            <div id="navbar_logo">
            </div>
            <div id="navbar_login">
            <c:if test="${not empty sessionScope.member.memberId }">
                <span style="font-size:20px;"><a href="#" style="text-decoration:none; color:#545454;">[ ${sessionScope.member.memberNickname } ]</a>&nbsp; 님 어서오세요!</span>
                <span style="font-size:20px;"><a onclick="location.href='/logout'" style="cursor: pointer;">로그아웃</a></span>
                </c:if>
               <c:if test="${not empty sessionScope.shop.memberId }">
                <span style="font-size:20px;"><a href="#" style="text-decoration:none; color:#545454;">[ ${sessionScope.shop.memberNickname } ]</a>&nbsp; 님 어서오세요!</span>
                <span style="font-size:20px;"><a onclick="location.href='/logout'" style="cursor: pointer;">로그아웃</a></span>
                </c:if>  
                <c:if test="${empty sessionScope.member.memberId && empty sessionScope.shop.memberId }">
                 <span style="font-size:20px;"><a href="/loginFrm" style="text-decoration:none; color:#545454;">로그인</a></span>
                <span style="font-size:20px;"><a href="/joinFrm" style="text-decoration:none; color:#545454;">회원가입</a></span>
                </c:if>
            </div>
        </div>
    </div>
