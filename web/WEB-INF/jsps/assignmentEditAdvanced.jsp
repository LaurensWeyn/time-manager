<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/assignemnt.css">
</head>

<body>
<%@include file="common/navbar.jsp" %>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <h4 style="text-align: center;">Edit Assignment: Capstone Stage 3</h4>
            <!-- <div class="card">-->
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <div class="card-body">
                    <div class="field-name">Assignment Name</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="assignmentName" name="Assignment Name" placeholder="Capstone Stage 3" >
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Assignment Due Date</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="assignmentDue" name="Assignment Name" placeholder="08/18" >
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Assignment Course</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="assignmentCourse" name="Assignment Name" placeholder="CSC3003S" >
                    </div>
                </div>
                <div class="form-group" style="width:1376px">
                    <label for="comment" style="margin-left: 22px;">Description:</label>
                    <textarea class="form-control" rows="5" id="comment" style="margin-left: 22px;margin-right:22px;">Capstone stage 3 requires a prototype for demonstration.</textarea>
                </div>
                <form>
                    <label for="customRange" style="margin-left: 22px;">Assignment Progress</label>
                    <br>
                    <input type="range" class="custom-range" id="customRange" name="progress" style="max-width: 80%;margin-left: 10%;">
                </form>
                <div class="form-group">
                    <input type="text" class="form-control" id="estimatedCompletionTime" name="ETA" placeholder="5 hrs">
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>
</div>
</body>

</html>
