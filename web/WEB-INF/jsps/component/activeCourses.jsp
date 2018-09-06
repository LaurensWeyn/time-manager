<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--@elvariable id="courses" type="java.util.List<com.capstone.db.dto.Course>"--%>
<c:forEach items="${courses}" var="course">
    <c:if test="${course.id == param.get('courseId')}">
        <option selected value="${course.id}"><c:out value="${course.code}"/></option>
    </c:if>
    <c:if test="${course.id != param.get('courseId')}">
        <option value="${course.id}"><c:out value="${course.code}"/></option>
    </c:if>
</c:forEach>