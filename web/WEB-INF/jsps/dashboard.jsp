<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<html>

<head>
    <title>Student Time Management System</title>
    <%@include file="common/headerIncludes.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/dashboard.css">
</head>

<body>
    <%@include file="common/navbar.jsp" %>
  <br>
  <div class="container-fluid">
      <div class="row">
          <div class="col-sm-4">
              <h3>Today</h3>
              <div class="container-fluid">
                  <%@include file="component/classSchedule.jsp"%>
              </div>
              <h4>To-do</h4>
              <div class="container-fluid">
                  <%@include file="Placeholders/todoList.jsp"%>
              </div>

              <%--<div class="container-fluid">
                  <h4>Due</h4>
                  <div class="card">
                      <div class="card-body"><p>Physics Weekly Problem Set</p></div>
                  </div>
                  <div class="card">
                      <div class="card-body"><p>Capstone Progress Report</p></div>
                  </div>
              </div>--%>

          </div>
          <div class="col-sm-8">
              <%@include file="component/upcomingEvents.jsp"%>
          </div>
      </div>
  </div>
</body>

</html>
