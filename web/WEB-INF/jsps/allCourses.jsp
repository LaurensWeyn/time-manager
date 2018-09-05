<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/assignemnt.css">
</head>

<body>
<%@include file="common/navbar.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <h4 style="text-align: center;"> All Courses </h4>
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <%@include file="component/courses.jsp"%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
