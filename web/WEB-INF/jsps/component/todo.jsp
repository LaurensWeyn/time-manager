<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/08/26
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>

<%--@elvariable id="todoList" type="com.capstone.db.dto.EventGroup"--%>
<c:forEach items="${todoList.events}" var="event">
        <%--<div class="card">
                &lt;%&ndash;link to course:&ndash;%&gt;
            <form>
                <input name="eventID" type="hidden" value="${event.id}"/>
                <a href="${pageContext.request.contextPath}/completeEvent?eventId=${event.id}"
                   style="position: absolute;top:0;left:0;height:100%;width:100%;"></a>
            </form>
            <div class="card-body">
                <c:out value="${event.due.toGMTString()}"/> <br>
                <div class="schedule-text">
                    <c:out value="${event.name}"/>
                </div>
            </div>
        </div>--%>
        <div class="card">
            <div class="card-body">
                <div class="progress-label"><c:out value="${event.name}"/></div>
                <div class="progress">
                    <div class="progress-bar" style="width:${event.progress}%">${event.progress}%</div>
                </div>
                <div class="progress-buttons button-bar"><a href="${pageContext.request.contextPath}/completeEvent?eventId=${event.id}&courseId=${event.parentCourse.id}" id="${event.id}" type="button" class="btn btn-success">Done</a>
                    <a href="${pageContext.request.contextPath}/editEvent?eventId=${event.id}&courseId=${event.parentCourse.id}" type="button" class="btn btn-info">Edit</a>
                </div>
                <br>
                <h5>Due: ${event.due.toGMTString()}</h5>
            </div>
        </div>
</c:forEach>

