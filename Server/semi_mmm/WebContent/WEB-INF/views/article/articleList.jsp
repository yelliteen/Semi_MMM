<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <title>중고장터</title>
    <style>
        #content {
            overflow: hidden;
        }

        #content>* {
            margin-left: 10%;
            margin-right: 10%;
        }

        #content>hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        h1>button {
            float: right;
            margin-right: 50px;
            margin-top: 30px;
        }

        .articleList {
            margin-bottom: 50px;
            overflow: hidden;
            padding: 0;
        }

        .articleList>li {
            list-style-type: none;
            float: left;
            width: 275px;
        }

        .articleList>li>div {
            width: 220px;
            height: 300px;
            margin: 0 auto;
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #76D5FF;
            color: #FFFFF4;
            border-radius: 10px;
            overflow: hidden;
        }

        .moreArea {
            text-align: center;
        }

        #more {
            width: 100%;
        }

        .searchBox {
            text-align: center;
            margin-bottom: 30px;
        }

        .imgBox {
            width: 100%;
            height: 200px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }
        
        .articleList p {
            margin-bottom: 2px;
            margin-left: 10px;
        }
        
        .title {
            font-weight: bolder;
        }
        
        .articleList>li>div:hover {
            cursor: pointer;
            transform: translateY(-10px);
            box-shadow: 0px 10px 10px 0px #949494;
        }
        
        .moreBtn {
            border: 1px solid #76D5FF;
            height: 30px;
            font-weight: bold;
        }
        
        .moreBtn:hover {
            background-color: #76D5FF;
            color: #F9F9F9;
        }
        
        .moreBtn:disabled {
            background-color: white;
            color: black;
        }
    </style>
    <script>
        $(function() {
            $("#writeBtn").click(function() {
                location.href = "/articleWriteFrm";
            });
        });

    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <h1 style="padding: 10px;">
            중고장터
            <c:if test="${not empty sessionScope.member.memberId }">
                <button class="btn btn-primary" id="writeBtn">글쓰기</button>
            </c:if>
        </h1>
        <hr>
        <ul class="articleList">
        </ul>
        <div class="moreArea">
            <button class="moreBtn" id="more" totalCount="${totalCount }" currentCount="0" value="">더보기</button>
        </div>
        <hr>
        <div class="searchBox">
            <form action="/searchArticle">
                <select name="articleNoticeCategory1">
                    <option value="대형견">대형견</option>
                    <option value="중형견">중형견</option>
                    <option value="소형견">소형견</option>
                </select> <select name="articleNoticeCategory2">
                    <option value="식품">식품</option>
                    <option value="장난감">장난감</option>
                    <option value="의상">의상</option>
                    <option value="가구">가구</option>
                </select> <input type="text" class="form-control" style="width: 250px; display: inline-block" required> <input type="submit" value="검색" class="btn btn-primary">
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        function fn_more(start) {
            var param = {
                start: start
            };
            $.ajax({
                url: "/articleMore",
                data: param,
                type: "post",
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        var li = $("<li></li>");
                        var div = $("<div onclick = readArticle(" + data[i]["articleNoticeNo"] + ");>");
                        
                        var img = $("<div class='imgBox'></div>");
                        img.css("background-image", "url(" + data[i]['articleNoticeImgName'] + ")");
                        div.append($(img));
                        
                        div.append($("<p>" + data[i]["articleNoticeCategory1"] + " > " + data[i]["articleNoticeCategory2"] + "</p>"));
                        div.append($("<p class='title'>" + data[i]["articleNoticeTitle"] + "</p>"));
                        div.append($("<p>작성자 : " + data[i]["articleNoticeWriter"] + "</p>"));
                        $(li).append($(div));
                        
                        $(".articleList").append($(li));
                    }

                    $("#more").val(Number(start) + 5);
                    $("#more").attr("currentCount", Number($("#more").attr("currentCount")) + data.length);
                    var totalCount = $("#more").attr("totalCount");
                    var currentCount = $("#more").attr("currentCount");
                    console.log(totalCount);
                    console.log(currentCount);

                    if (totalCount == currentCount) {
                        $("#more").attr("disabled", true);
                        $("#more").css("cursor", "context-menu");
                    }
                },
                error: function() {
                    console.log("실패");
                }
            });
        };

        $(function() {
            fn_more(1);
            $("#more").click(function() {
                fn_more($(this).val());
            });
        });

    </script>
</body>

</html>
