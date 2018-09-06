<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/assignemnt.css">
    <script src="${pageContext.request.contextPath}/static/js/assignmentForm.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/prepped/bootstrap-datetimepicker.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/prepped/bootstrap-datetimepicker.min.js"></script>


</head>
<!-- TODO: !IMPORTANT, Figure out why the page scrolls off to the right by like, a lot -->
<body>
<%@include file="common/navbar.jsp" %>
<br>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <%--@elvariable id="course" type="com.capstone.db.dto.Course"--%>
                <%--@elvariable id="event" type="com.capstone.db.dto.Event"--%>
            <sf:form method="post" action="${pageContext.request.contextPath}/updateCourseInfo"
                     modelAttribute="eventForm">
            <h4 style="text-align: center;">Edit Assignment: <c:out value="${event.name}"/></h4>
            <div class="card" style="max-width:75%;width:75%;margin-left:12.5%;">
                <div class="card-body">
                    <div class="field-name">Assignment Name</div>
                    <div class="form-group">
                        <sf:input path="name" class="form-control" placeholder="${event.name}"/>
                    </div>
                </div>
                <div class="card-body">
                    <div class="field-name">Assignment Due Date</div>
                    <div class="form-group"> <!--TODO: make popup calendar -->
                        <div class="input-append date form_datetime">
                            <input size="16" type="text" value="" readonly>
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>

                        <script type="text/javascript">
                            $(".form_datetime").datetimepicker({
                                format: "dd MM yyyy - hh:ii"
                            });
                        </script>

                    </div>
                <div class="card-body" style="max-width:75%;width:75%;margin-left:12.5%;white-space:nowrap;display:inline;">
                        <label for="course">Assignment Course</label>
                    <div class="form-group" style="max-width:75%;width:75%;margin-left:12.5%;white-space:nowrap;display:inline;">
                        <select class="form-control" id="course">
                            <%@include file="component/activeCourses.jsp"%>
                        </select>
                    </div>
                </div>
                    <label for="comment" style="margin-left: 1.6%;">Description:</label>
                <div class="form-group" style="max-width:97% ;">
                    <textarea class="form-control" rows="5" id="comment" style="margin-left: 1.5%;margin-right:1.5%;">Capstone stage 3 requires a prototype for demonstration.</textarea>
                </div>
                <form>
                    <label for="customRange" style="margin-left: 22px;">Assignment Progress</label>
                    <br>
                    <input type="range" class="custom-range" id="customRange" value=50 min=0 max=100 onchange="updateProgress(this.value)" name="progress" style="max-width: 80%;margin-left: 10%;"><!-- TODO: value=50 is placeholder -->
                    <input type ="text" class="form-control-plaintext" id="assignmentProgressText" style="margin-left:49.5%">
                </form>
                <div class="form-group" style="max-width:75%;width:75%;margin-left:12.5%;white-space:nowrap;display:inline;">
                    <label for="complete">Time to complete:</label>
                    <select class="form-control" id="complete">
                        <%@include file="static/completionTimes.jsp"%>
                    </select>
                </div>
                <div class="form-group"style="max-width:75%;width:75%;margin-left:12.5%;white-space:nowrap;display:inline;">
                    <label for="importance">Importance:</label>
                    <select class="form-control" id="importance">
                        <%@include file="static/importance.jsp"%>
                    </select>
                </div>
            </div>
            </sf:form>
        </div>
    </div>
</div>
</body>

</html>
