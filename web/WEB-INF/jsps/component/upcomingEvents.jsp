<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3>Upcoming</h3>
<div class="container-fluid">
    <script src="static/dashboard.js"></script>
    <%--@elvariable id="upcomingEvents" type="java.util.List<com.capstone.db.dto.EventGroup>"--%>
    <c:forEach items="${upcomingEvents}" var="eventGroup">
        <br>
        <h4><c:out value="${eventGroup.dateString}"/></h4>
        <br>
        <c:forEach items="${eventGroup.events}" var="event">
            <div class="card">
                <div class="card-body">
                    <div class="progress-label"><c:out value="${event.name}"/></div>
                    <div class="progress">
                        <div class="progress-bar" style="width:${event.progress}%">${event.progress}%</div>
                    </div>
                    <div class="progress-buttons button-bar"><a href="${pageContext.request.contextPath}/completeEvent?id=${event.id}" id=${event.id} onclick="onEventComplete(this.id)" type="button" class="btn btn-success">Done</a>
                        <a href="${pageContext.request.contextPath}/editEvent?id=${event.id}" type="button" class="btn btn-info">Edit</a>
                    </div>
                    <br>
                    <h5>Due: ${event.dueTimeString}</h5>
                </div>
            </div>
        </c:forEach>
    </c:forEach>

</div>