<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/08/26
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>

<%--@elvariable id="upcomingEvents" type="java.util.List<com.capstone.db.dto.EventGroup>"--%>
<c:forEach items="${upcomingEvents}" var="timeslot">
    <c:forEach items="${timeslot.events}" var="event">
        <c:if test="${event.type == 2}">
            <div class="card">
                    <%--link to course:--%>
                <form>
                    <input name="eventID" type="hidden" value="${event.id}"/>
                    <a href="${pageContext.request.contextPath}/completeEvent?id=${event.id}"
                       style="position: absolute;top:0;left:0;height:100%;width:100%;"></a>
                </form>
                <div class="card-body">
                    <c:out value="${event.due.toGMTString()}"/> <br>
                    <div class="schedule-text">
                        <c:out value="${event.name}"/>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</c:forEach>

