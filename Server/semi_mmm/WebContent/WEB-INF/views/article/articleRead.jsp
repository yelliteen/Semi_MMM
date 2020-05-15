<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 보기 - ${article.articleNoticeTitle}</title>
    <style>
        .container {
            padding-top: 20px;
            padding-bottom: 20px;
        }
        
        .container>h5, .container>h3, .container>h4 {
            margin-left: 50px;
            margin-bottom: 10px;
            margin-top: 10px;
        }
        
        .content {
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 10px;
            width: 90%;
        }
        
        .container>h3>button {
            float: right;
            color: #545454;
            border: 1px solid #FFA6C2;
            margin-right: 20px;
            font-weight: bold;
            height: 26px;
            line-height: 26px;
            padding: 0;
            width: 50px;
        }
        
        .container>h3>button:hover {
            background-color: #FFA6C2;
            color: white;
        }
        
        .comment {
            width: 95%;
            margin: 0 auto;
        }
        
        .comment>h4>button {
            float: right;
        }
        
        .container>h5>span {
            float: right;
            margin-right: 50px;
        }
        
        .commentWrite {
            width: 95%;
            margin-top: 30px;
            margin: 0 auto;
            overflow: hidden;
        }
        
        .commentWrite>form>* {
            float: left;
        }
        
        .commentWrite textarea {
            width: 90%;
            resize: none;
        }
        
        .commentWrite button {
            left: 30px;
            margin-top: 30px;
        }
        
        .container>h4 {
            overflow: hidden;
        }
        
        .container>h4>* {
            float: left;
        }
        
        .container>h4>span {
            display: inline-block;
            line-height: 80px;
        }
        
        #soldBox {
            display: inline-block;
            width: 80px;
            height: 80px;
            background-position: center;
            background-size: contain;
            background-repeat: no-repeat;
        }
        
        #soldText {
            font-size: 0.8em;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <h5>중고장터 > ${article.articleNoticeCategory1 } > ${article.articleNoticeCategory2 }</h5>
        <h3>${article.articleNoticeTitle }
            <c:if test="${sessionScope.member.memberId == article.articleNoticeWriter }">
                <button class="btn" id="delete">삭제</button>
                <button class="btn" id="modify">수정</button>
            </c:if>
        </h3>
        <h5>작성자 : ${memberNickname }<span>작성일 : ${article.articleNoticeDate }</span></h5>
        <h4>
            <span>구매여부 : </span>
            <div id="soldBox"></div>
            <span id="soldText"></span>
        </h4>
        <hr>
        <div class="content">
            ${article.articleNoticeContent }
        </div>
        <hr>
        <c:if test="${not empty sessionScope.member.memberId}">
            <div class="commentWrite">
                <form action="/articleCommentWrite" method="post">
                    <input type="hidden" name="articleRef" value="${article.articleNoticeNo}">
                    <input type="hidden" name="articleCommentWriter" value="${sessionScope.member.memberId}">
                    <input type="hidden" name="articleCommentRef" value="0">
                    <input type="hidden" name="articleCommentLevel" value="1">
                    <textarea rows="5" name="articleCommentContent"></textarea>
                    <button class="btn btn-primary" style="margin-bottom: 30px;">댓글 입력</button>
                </form>
            </div>
            <br>
        </c:if>
        <div class="comment">
            <h4>댓글:<span id="commentCount"></span> <button class="btn btn-primary" id="list">목록으로</button></h4>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
    <script>
        $("#modify").click(function() {
            location.href = "/articleModifyFrm?articleNoticeNo=" + ${article.articleNoticeNo};
        });
        
        $("#delete").click(function() {
            if (confirm("게시글을 삭제하시겠습니까?")) {
                location.href = "/articleDelete?articleNoticeNo=" + ${article.articleNoticeNo};
            }
        })
        
        $("#list").click(function() {
            location.href = "/articleList";
        })
        
        if (${article.articleNoticeSoldBool} == 0) {
            $("#soldBox").css("background-image", "url(/img/sold.png)");
            $("#soldText").html("구매가능");
            $("#soldText").css("color", "blue");
        } else {
            $("#soldBox").css("background-image", "url(/img/soldout.png)");
            $("#soldText").html("판매완료");
            $("#soldText").css("color", "red"); 
        }
        
        console.log("${sessionScope.member.memberId}");
    </script>

</html>
