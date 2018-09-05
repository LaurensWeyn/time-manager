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
<%@ page contentType="text/html;charset=UTF-8" %>

<%--@elvariable id="courseDAO" type="com.capstone.db.dto.CourseDao"--%>
<c:forEach items="${courseDAO.getCourseByID(param.id).timeslots}" var="timeslot">
    <c:forEach items="${timeslot.daysOfWeek}" var="day">
        <c:if test="${day == true}">
            <div class="card-body"style="display:inline;"><span class="badge badge-pill badge-danger">Mo</span>
            </div>
        </c:if>
        <c:if test="${day == false}">
            <div class="card-body"style="display:inline;"><span class="badge badge-pill badge-secondary">Mo</span>
            </div>
        </c:if>
    </c:forEach>
    <div class="card-body"style="display:inline;">
        <c:if test="${timeslot.type==0}">
            Lecture
        </c:if>
        <c:if test="${timeslot.type==1}">
            Tutorial
        </c:if>
    </div>
    <div class="card-body"style="display:inline;">
        <c:out value="${timeslot.startTime.string24}"/>
    </div>
    <div type="button" class="btn btn-info">Edit</div>
    <div type="button" class="btn btn-danger">Remove</div>
</c:forEach>