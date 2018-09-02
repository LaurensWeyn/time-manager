<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h4 style="text-align: center;">Viewing Course info for Mathematics</h4>
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <div class="card-body">
                    <div class="field-name">Course Name</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="courseName" name="Assignment Name" placeholder="Mathematics" >
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Course Code</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="courseCode" name="Assignment Name" placeholder="MAM2000W" >
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Lecturer</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="courseLecturer" name="Assignment Name" placeholder="Matt. E. Matics" >
                    </div>
                </div>
                <!--<div class="card-body">
                    <div class="field-name">Lecture Time</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lectureTime" name="Assignment Name" placeholder="8 A.M" >
                    </div>
                </div>-->
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
                    <a href="/courseDetail" type="button" class="btn btn-info">Add</a>
                    <br>
                </div>
                    <!--<h5 style="margin-left:22px">Days of Week</h5>
                    <form style="margin-left:22px">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="monday" name="mondayBox">
                            <label class="custom-control-label" for="monday">Monday</label>
                        </div>
                        <input type="text" class="form-control" id="mondayTime" name="Assignment Name" placeholder="8 A.M - 10 A.M" style="max-width:20%;display:inline">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="mondayTut" name="mondayBox">
                            <label class="custom-control-label" for="mondayTut">is Tutorial</label>
                        </div>
                    </form>
                    <form style="margin-left:22px">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="tuesday" name="mondayBox">
                            <label class="custom-control-label" for="tuesday">Tuesday</label>
                        </div>
                        <input type="text" class="form-control" id="tuesdayTime" name="Assignment Name" placeholder="8 A.M - 10 A.M" style="max-width:20%;display:inline">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="tuesdayTut" name="mondayBox">
                            <label class="custom-control-label" for="tuesdayTut">is Tutorial</label>
                        </div>
                    </form>
                    <form style="margin-left:22px">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="wednesday" name="mondayBox">
                            <label class="custom-control-label" for="wednesday">Wednesday</label>
                        </div>
                        <input type="text" class="form-control" id="wednesdayTIme" name="Assignment Name" placeholder="8 A.M - 10 A.M" style="max-width:20%;display:inline">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="wednesdayTut" name="mondayBox">
                            <label class="custom-control-label" for="wednesdayTut">is Tutorial</label>
                        </div>
                    </form>
                    <form style="margin-left:22px">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="thursday" name="mondayBox">
                            <label class="custom-control-label" for="thursday">Thursday</label>
                        </div>
                        <input type="text" class="form-control" id="thursdayTime" name="Assignment Name" placeholder="8 A.M - 10 A.M" style="max-width:20%;display:inline">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="thursdayTut" name="mondayBox">
                            <label class="custom-control-label" for="thursdayTut">is Tutorial</label>
                        </div>
                    </form>
                    <form style="margin-left:22px">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="friday" name="mondayBox"> <!-- it wont let me change the id, stupid thing -->
                            <!--<label class="custom-control-label" for="friday">Friday</label>
                        </div>
                        <input type="text" class="form-control" id="fridayTime" name="Assignment Name" placeholder="8 A.M - 10 A.M" style="max-width:20%;display:inline">
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <input type="checkbox" class="custom-control-input" id="fridayTut" name="mondayBox">
                            <label class="custom-control-label" for="fridayTut">is Tutorial</label>
                        </div>
                    </form>
                </div>-->
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
        </div>
    </div>
</div>
</body>

</html>
