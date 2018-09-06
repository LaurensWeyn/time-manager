<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h4>Schedule</h4>
<div class="card">
    <%--@elvariable id="timeslots" type="java.util.List<com.capstone.db.dto.Timeslot>"--%>
    <c:forEach items="${timeslots}" var="timeslot">
        <div class="card">
            <%--link to course:--%>
            <form>
                <input name="courseID" type="hidden" value="${timeslot.parentCourse.id}" />
                <a href="${pageContext.request.contextPath}/viewCourse?id=${timeslot.parentCourse.id}" style="position: absolute;top:0;left:0;height:100%;width:100%;"></a>
            </form>
            <div class="card-body">
                <c:out value="${timeslot.startTime.string24}"/><br><%--Time of course--%>
                <div class="schedule-text">
                    <c:out value="${timeslot.parentCourse.name}"/> <%--Course name--%>
                </div>
            </div>
        </div>
    </c:forEach>
</div>