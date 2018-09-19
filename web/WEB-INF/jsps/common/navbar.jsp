<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">STMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" aria-controls="collapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/calendar">Calendar</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/" id="viewMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    View
                </a>
                <div class="dropdown-menu" aria-labelledby="viewMenu">
                    <a class="dropdown-item" href="/viewAllCourses">Courses</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/" id="addMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Add
                </a>
                <div class="dropdown-menu" aria-labelledby="addMenu">
                    <a class="dropdown-item" href="/addCourse">Course</a>
                    <%--<a class="dropdown-item" href="#">To-Do</a>
                    <a class="dropdown-item" href="/addTimeslot">Time-slot</a>--%>
                    <a class="dropdown-item" href="/createEvent">Event</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="button-group">
                <sec:authorize access="!isAuthenticated()">
                    <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/login">Login</a>
                    <a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/createAccount">Create Account</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <%--<a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/logout">Logout</a>--%>
                    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                        <input class="btn btn-primary" type="submit" value="Logout" />
                    </form:form>
                </sec:authorize>
            </li>
        </ul>
    </div>
</nav>
