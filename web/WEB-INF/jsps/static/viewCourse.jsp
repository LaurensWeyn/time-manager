<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="../common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/assignemnt.css">
</head>

<body>
<%@include file="../common/navbar.jsp" %>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <%--@elvariable id="courseDAO" type="com.capstone.db.dto.CourseDao"--%>
            <sf:form method="post" action="${pageContext.request.contextPath}/updateCourseInfo" modelAttribute="courseForm">
            <h4 style="text-align: center;">Viewing Course info for <c:out value="${courseDAO.getCourseByID(param.id).code}"/>></h4> <!--TODO: GET ACTUAL COURSE BY ID DYNAMICALLY-->
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <div class="card-body">
                    <div class="field-name">Course Name</div>
                    <div class="form-group">
                        <sf:input class="form-control" path="name" placeholder="${courseDAO.getCourseByID(param.id).name}"/>
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Course Code</div>
                    <div class="form-group">
                        <sf:input class="form-control" path="courseCode" placeholder="${courseDAO.getCourseByID(param.id).code}"/>
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Lecturer</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="courseLecturer" name="Assignment Name" placeholder="Matt. E. Matics" >
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-log-in"></span>
                            Time slots
                        </h3>
                    </div>
                    <br>
                    <div class="card"style="display:inline;">
                        <div class="card-body"style="display:inline;"><span class="badge badge-pill badge-danger">Mo</span>
                        </div>
                        <div class="card-body"style="display:inline;">Lecture
                        </div>
                        <div class="card-body"style="display:inline;">8 A.M
                        </div>
                        <div type="button" class="btn btn-info">Edit</div>
                        <div type="button" class="btn btn-danger">Remove</div>
                    </div>
                    <br>
                    <a href="/addTimeslot" type="button" class="btn btn-info">Add</a>
                    <br>
                </div>
                <div class="card-body">
                    <div class="field-name">Lecture Location</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lecturePlace" name="Assignment Name" placeholder="NSLT" >
                    </div>
                </div>
                <div class="form-group" style="width:1376px">
                    <label for="comment" style="margin-left: 22px;">Description:</label>
                    <textarea class="form-control" rows="5" id="comment" style="margin-left: 22px;margin-right:22px;">Currently covering integration by parts. A M A Z I N G stuff.</textarea>
                </div>
            </div>
                </sf:form>
        </div>
    </div>
</div>
</body>

</html>
