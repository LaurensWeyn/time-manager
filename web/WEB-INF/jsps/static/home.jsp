<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Student Time Management System</title>
    <%@include file="../common/headerIncludes.jsp"%>

    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
        .lightText {
            color: #959595;
        }

        h1, h2, h3, h4, h5, h6 {
            color: black;
        }

        .page-header {
            padding-top: 50px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/homepage.css">
</head>
<body>


<%@include file="../common/navbar.jsp" %>

<div class="container">

    <img src="/static/welcome.png" alt="Welcome to the Student Time Management System" width="800" height="350">

</div>

    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="/static/dashboard%20(2).png" alt="First slide" height="600">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="/static/courseAndEvent.png" alt="Second slide" height="600">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="/static/Calendar.png" alt="Third slide" height="600">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>



<p style="margin-bottom:50px;"></p>
</body>
</html>
