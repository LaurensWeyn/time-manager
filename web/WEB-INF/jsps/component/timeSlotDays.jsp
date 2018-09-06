<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/05
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>

<!--TODO: get the days a particular timeslot is for, highlight them as seen in viewCourse.jsp-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%--@elvariable id="timeslots" type="java.util.List<com.capstone.db.dto.Timeslot>"--%>
<c:forEach items="${timeslots}" var="timeslot">
    <c:if test="${timeslot.parentCourse.id == param.get('courseId')}">
    <c:forEach var="i" begin="0" end="${fn:length(timeslot.daysOfWeek)}" step="1">
        <c:if test="${fn:substring(timeslot.daysOfWeek, i, i + 1) == 'Y'}">
            <div class="card-body"style="display:inline;"><span class="badge badge-pill badge-danger">Mo</span>
            </div>
        </c:if>
        <c:if test="${fn:substring(timeslot.daysOfWeek, i, i + 1) != 'Y'}">
            <div class="card-body"style="display:inline;"><span class="badge badge-pill badge-secondary">Mo</span>
            </div>
        </c:if>

    </c:forEach>

    <div class="card-body"style="display:inline;">
        <c:if test="${timeslot.type==1}">
            Lecture
        </c:if>
        <c:if test="${timeslot.type==2}">
            Tutorial
        </c:if>
    </div>
    <div class="card-body"style="display:inline;">
        <c:out value="${timeslot.startTime.string24}"/>
    </div>
    <div type="button" class="btn btn-info">Edit</div>
    <div type="button" class="btn btn-danger">Remove</div>
    <br>
    </c:if>
</c:forEach>