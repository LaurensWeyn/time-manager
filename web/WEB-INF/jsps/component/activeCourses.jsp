<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--TODO: This is supposed to return all the courses the user registered, and display them on the courses page-->
<%--@elvariable id="courses" type="java.util.List<com.capstone.db.dto.Course>"--%>
<c:forEach items="${courses}" var="course">
    <c:if test="${course.id == param.get('id')}">
        <option selected value="${course.id}"><c:out value="${course.code}"/></option>
    </c:if>
    <c:if test="${course.id != param.get('id')}">
        <option value="${course.id}"><c:out value="${course.code}"/></option>
    </c:if>
</c:forEach>