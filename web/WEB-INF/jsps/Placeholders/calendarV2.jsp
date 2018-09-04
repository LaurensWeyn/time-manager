<%--
  Created by IntelliJ IDEA.
  User: Alec
  Date: 2018/09/02
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head id="header-head">
    <title>Student Time Management System</title>

    <div>
        <%@include file="../common/headerIncludes.jsp"%>
    </div>

    <link rel='stylesheet' href='/static/fullcalendar.css' />
    <script src='/static/jquery.min.js'></script>
    <script src='/static/moment.min.js'></script>
    <script src='/static/fullcalendar.js'></script>
    <script type='text/javascript' src='static/gcal.js'></script>
    <script>
        $(function() {

            // page is now ready, initialize the calendar...
            $('#calendar').fullCalendar({
                // put your options and callbacks here
                googleCalendarApiKey: 'AIzaSyDr6PBEBQSv5yRO9NI71DHSlqcw1dmP02g',
                events: {
                    googleCalendarId: 'badenhorst.alec@gmail.com' // Syncing works, although the user would need to make their calendar public and put their calendar id in here.
                },
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
            })

        });
    </script>

</head>
<body id="header-body">
    <%--<script>--%>
        <%--$(document).ready(function() {--%>
        <%--var html =  '/common/navbar';--%>
        <%--$('#header').load(html);--%>
    <%--});</script>--%>
    <div id="header">
    </div>
    <div class="card" style="">
        <div id='calendar' style="max-height:60%"></div>
    </div>
</body>
</html>
