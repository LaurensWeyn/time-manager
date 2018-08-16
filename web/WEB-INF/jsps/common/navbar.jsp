<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" href="#">STMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">View</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Edit</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="button-group">
                <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/login">Login</a>
                <a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/createAccount">Create Account</a>
            </li>
        </ul>
    </div>
</nav>
