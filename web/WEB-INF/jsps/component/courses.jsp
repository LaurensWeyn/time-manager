<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/dashboard.css">

<%--@elvariable id="courses" type="java.util.List<com.capstone.db.dto.Course>"--%>
<c:forEach items="${courses}" var="course">
    <div class="card">
        <a href="${pageContext.request.contextPath}/viewCourse?courseId=${course.id}" style="position: absolute;top:0;left:0;height:100%;width:100%;"></a>
        <div class="card-body">
            <c:out value="${course.name}"/><br>
            <div class="schedule-text">
               <strong> Course Code:</strong> <c:out value="${course.code}"/> <%--Course name--%>
            </div>
        </div>
    </div>
    <div class="buttonContainer">
        <a type="button" href="${pageContext.request.contextPath}/editCourse?courseId=${course.id}" class="btn btn-info" style="margin-left:1em;margin-right:1em;width:47% !important;">Edit</a>
        <a type="button" href="${pageContext.request.contextPath}/removeCourse?courseId=${course.id}" class="btn btn-danger" style="margin-left:1em;margin-right:1em;width:47% !important;">Remove</a>
    </div>
</c:forEach>