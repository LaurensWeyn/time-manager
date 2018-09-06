<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp" %>
    <link rel="stylesheet" type="text/css" href="/static/assignemnt.css">
</head>

<body>
<%@include file="common/navbar.jsp" %>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <h4 style="text-align: center;">Add Course Timeslot</h4>
            <sf:form method="post" action="${pageContext.request.contextPath}/doAddTimeslot?id=${param.get('id')}"
                     modelAttribute="timeslotForm">
                <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                    <div class="card-body">
                        <div class="field-name">Course Code</div>
                        <div class="form-group">
                            <sf:select class="form-control" path="metaCourseId">
                                <%@include file="component/activeCourses.jsp" %>
                            </sf:select>
                        </div>
                    </div>

                    <div class="card-body">
                        <form>
                            Lecture or Tutorial:<br>
                            <div class="custom-control custom-radio" style="white-space:nowrap;display:inline;">
                                <sf:radiobutton id="lecture" class="custom-control-input" path="type" value="1"/>
                                <label class="custom-control-label" for="lecture">Lecture</label>
                            </div>
                            <div class="custom-control custom-radio" style="white-space:nowrap;display:inline;">
                                <sf:radiobutton id="tutorial" class="custom-control-input" path="type" value="2"/>
                                <label class="custom-control-label" for="tutorial">Tutorial</label>
                            </div>
                        </form>
                    </div>

                    <div class="card-body">
                        <div class="field-name">Day</div>
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <sf:checkbox class="custom-control-input" id="monday" value="m" path="daysOfWeek"/>
                            <label class="custom-control-label" for="monday">Monday</label>
                        </div>
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <sf:checkbox class="custom-control-input" id="tuesday" value="m" path="daysOfWeek"/>
                            <label class="custom-control-label" for="tuesday">Tuesday</label>
                        </div>
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <sf:checkbox class="custom-control-input" id="wednesday" value="m" path="daysOfWeek"/>
                            <label class="custom-control-label" for="wednesday">Wednesday</label>
                        </div>
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <sf:checkbox class="custom-control-input" id="thursday" value="m" path="daysOfWeek"/>
                            <label class="custom-control-label" for="thursday">Thursday</label>
                        </div>
                        <div class="custom-control custom-checkbox" style="white-space:nowrap;display:inline;">
                            <sf:checkbox class="custom-control-input" id="friday" value="m" path="daysOfWeek"/>
                            <label class="custom-control-label" for="friday">Friday</label>
                        </div>
                    </div>
                    <!--TODO: advanced view gets to type their times-->
                    <c:if test="${timeError != null}">
                        <div class="alert alert-danger alert-dismissible">
                            <strong>Start Time cannot be less than End Time.</strong>
                        </div>
                    </c:if>

                    <div class="card-body">
                        <div class="field-name">Start Time</div>
                        <div class="form-group">
                            <sf:select class="form-control" path="startTime">
                                <%@include file="static/times.jsp" %>
                                <!-- TODO: select course from which you got redirected from-->
                            </sf:select>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="field-name">End Time</div>
                        <div class="form-group">
                            <sf:select class="form-control" path="endTime">
                                <%@include file="static/times.jsp" %>
                                <!-- TODO: select course from which you got redirected from-->
                            </sf:select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info">Add Timeslot</button>
                </div>
            </sf:form>
        </div>
    </div>
</div>
</body>

</html>
