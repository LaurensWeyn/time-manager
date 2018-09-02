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
            <h4 style="text-align: center;">Add Course Timeslot</h4>
            <!-- <div class="card">-->
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <div class="card-body">
                    <div class="field-name">Course Code</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="assignmentCourse" name="Assignment Name" placeholder="MAM2000W" >
                    </div>
                </div>
                <div class="card-body">
                    <form>
                        Lecture or Tutorial:<br> <!--TODO: add JS to fetch the answer from here-->
                        <div class="custom-control custom-radio" style="white-space:nowrap;display:inline;">
                            <input type="radio" class="custom-control-input" id="customRadio" name="example1" value="customEx">
                            <label class="custom-control-label" for="customRadio">Lecture</label>

                        </div>
                        <div class="custom-control custom-radio" style="white-space:nowrap;display:inline;">
                            <input type="radio" class="custom-control-input" id="customRadio1" name="example1" value="customEx1">
                            <label class="custom-control-label" for="customRadio1">Tutorial</label>

                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div class="field-name">Day</div>
                    <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                        <input type="checkbox" class="custom-control-input" id="monday" name="mondayBox">
                        <label class="custom-control-label" for="monday">Monday</label>
                    </div>
                    <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                        <input type="checkbox" class="custom-control-input" id="tuesday" name="mondayBox">
                        <label class="custom-control-label" for="tuesday">Tuesday</label>
                    </div>
                    <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                        <input type="checkbox" class="custom-control-input" id="wednesday" name="mondayBox">
                        <label class="custom-control-label" for="wednesday">Wednesday</label>
                    </div>
                    <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                        <input type="checkbox" class="custom-control-input" id="thursday" name="mondayBox">
                        <label class="custom-control-label" for="thursday">Thursday</label>
                    </div>
                    <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                        <input type="checkbox" class="custom-control-input" id="friday" name="mondayBox">
                        <label class="custom-control-label" for="friday">Friday</label>
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Time</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lectureTime" name="Lecture Time" placeholder="8 A.M" >
                    </div>
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>
</div>
</body>

</html>
