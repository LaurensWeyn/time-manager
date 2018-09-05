<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="../common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/assignemnt.css">
</head>

<body>
<%@include file="../common/navbar.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <h4 style="text-align: center;"> Adding new Course </h4>
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <sf:form method="post" action="${pageContext.request.contextPath}/doAddCourse" modelAttribute="courseForm">

                    <div class="card-body">

                        <c:if test="${courseCode != null}">
                            <div class="alert alert-danger alert-dismissible">
                                <strong>No course code provided.</strong> Course Code cannot be null.
                            </div>
                        </c:if>

                        <div class="field-name">Course code</div>
                        <div class="form-group">
                            <sf:input type="text" class="form-control" placeholder="ABC1234" path="courseCode"/>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="field-name">Course Name</div>
                        <div class="form-group">
                            <sf:input type="text" class="form-control" id="courseName" path="name" placeholder="Advanced biochemistry"/>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-default" style="margin-left: 45%">Add Course</button>
                </sf:form>

            </div>
        </div>
    </div>
</div>
</body>
</html>
