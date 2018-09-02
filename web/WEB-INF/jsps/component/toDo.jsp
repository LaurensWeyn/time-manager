<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/08/26
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>

<!--TODO: Update database with required entities-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${toDo}" var="todoitem">

    <div class="card">
            <%--link to course:--%>
        <a href="/dashboard" style="position: absolute;top:0;left:0;height:100%;width:100%;"></a>
        <div class="card-body">
            <c:out value="${todoitem.dueTime.string24}"/> <br>
            <div class="schedule-text">
                <c:out value="${todoitem.description}"
            </div>
        </div>
    </div>

</c:forEach>

