<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
    body {
        z-index: 1;
    }
    #wrapper {
        overflow: hidden;
        width: 1500px;
        margin: 0;
        z-index: 2;
        position: relative;
    }
    .content {
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
        width: 1220px;
        height: 1500px;
        z-index: 500;
        overflow: hidden;
    }

    .container {
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }

</style>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div class="content">
            <section class="container">

            </section>
        </div>

        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
</body>

</html>
