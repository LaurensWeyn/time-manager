<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp" %>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/assignment.css">--%>
</head>

<body>
<%@include file="common/navbar.jsp" %>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <%--@elvariable id="course" type="com.capstone.db.dto.Course"--%>
            <sf:form method="post" action="${pageContext.request.contextPath}/updateCourseInfo"
                     modelAttribute="courseForm">
                <h4 style="text-align: center;">Viewing Course info for <c:out
                        value="${course.code}"/></h4>
                <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                    <div class="card-body">
                        <div class="field-name">Course Name</div>
                        <div class="form-group">
                            <sf:input class="form-control" path="name" placeholder="${course.name}"/>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="field-name">Course Code</div>
                        <div class="form-group">
                            <sf:select class="form-control" path="courseCode">
                                <%@include file="component/activeCourses.jsp" %>
                            </sf:select>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="panel-title">
                                <span class="glyphicon glyphicon-log-in"></span>
                                Time slots
                            </h3>
                        </div>
                        <br>
                        <div class="card" style="display:inline;">
                            <%@include file="component/timeSlotDays.jsp" %>
                        </div>
                        <br>
                        <form>
                            <input name="courseID" type="hidden" value="${course.id}"/>
                            <a href="${pageContext.request.contextPath}/addTimeslot?courseId=${course.id}" type="button"
                               class="btn btn-info">Add</a>
                        </form>
                        <br>
                    </div>

                </div>
                <button type="submit" class="btn btn-default" style="margin-left: 45%">Update Course Information
                </button>
            </sf:form>
        </div>
    </div>
</div>
</body>

</html>
