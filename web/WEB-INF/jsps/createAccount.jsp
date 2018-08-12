<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Student Time Management System
                <small class="lightText">STMS</small>
            </h1>

            <div class="card card-default">
                <div class="card-header">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-log-in"></span>
                        Create Account
                    </h3>
                </div>
                <div class="card-body">
                        <sf:form method="post" action="${pageContext.request.contextPath}/doCreateAccount" modelAttribute="user">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Username</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Enter Username">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Password</span>
                            </div>
                            <input type="password" id="pass1" class="form-control" placeholder="Password">
                            <input type="password" id="pass2" class="form-control" placeholder="Confirm Password">
                        </div>
                        <button type="submit" class="btn btn-default">Sign Up</button>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>
</div>
<p style="margin-bottom:50px;"></p>

</body>
</html>
