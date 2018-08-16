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
                  <h4>Schedule</h4>
                  <div class="card">
                      <div class="card-body">09:00|  Computer Science</div>
                      <div class="card-body">10:00|  Games Development</div>
                      <div class="card-body">11:00|  Physics</div>
                      <div class="card-body">12:00|  EEE</div>
                      <div class="card-body">13:00|  </div>
                      <div class="card-body">14:00|  Psychology</div>
                      <div class="card-body">15:00|  Physics Tut</div>
                      <div class="card-body">16:00|  Physics Tut</div>

                  </div>
              </div>

              <div class="container-fluid">
                  <h4>Due</h4>
                  <div class="card">
                      <div class="card-body"><p>Physics Weekly Problem Set</p></div>
                  </div>
                  <div class="card">
                      <div class="card-body"><p>Capstone Progress Report</p></div>
                  </div>
              </div>

          </div>

          <div class="col-sm-8">
              <h3>Upcoming</h3>
              <h4>Tomorrow</h4>
              <div class="container-fluid">

                  <div class="card">
                  <div class="card-body">
                      <div class="progress-label">Capstone Stage 3</div>
                      <div class="progress">
                          <div class="progress-bar" style="width:70%">70%</div>
                      </div>
                      <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                          <button type="button" class="btn btn-info">Edit</button>
                      </div>
                      <br>
                      <h5>Due: 10AM</h5>
                  </div>
              </div>

                  <br>
                  <div class="card">
                      <div class="card-body">
                          <div class="progress-label">Psychology Essay</div>
                          <div class="progress">
                              <div class="progress-bar" style="width:95%">95%</div>
                          </div>
                          <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                              <button type="button" class="btn btn-info">Edit</button>
                          </div>
                          <br>
                          <h5>Due: 11AM</h5>
                      </div>
                  </div>
                  <h4>20/08</h4>
                  <br>
                  <div class="card">
                      <div class="card-body">
                          <div class="progress-label">EEE project</div>
                          <div class="progress">
                              <div class="progress-bar bg-warning" style="width:50%">50%</div>
                          </div>
                          <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                              <button type="button" class="btn btn-info">Edit</button>
                          </div>
                          <br>
                          <h5>Due: 10AM</h5>
                      </div>
                  </div>

                  <br>
                  <div class="card">
                      <div class="card-body">
                          <div class="progress-label">Games Dev Assignment</div>
                          <div class="progress">
                              <div class="progress-bar" style="width:30%">30%</div>
                          </div>
                          <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                              <button type="button" class="btn btn-info">Edit</button>
                          </div>
                          <br>
                          <h5>Due: 9AM</h5>
                      </div>
                  </div>
                  <h4>25/08</h4>
                  <br>
                  <div class="card">
                      <div class="card-body">
                          <div class="progress-label">Math Test</div>
                          <div class="progress">
                              <div class="progress-bar bg-danger" style="width:0%">0%</div>
                          </div>
                          <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                              <button type="button" class="btn btn-info">Edit</button>
                          </div>
                          <br>
                          <h5>Due: 6PM</h5>
                      </div>
                  </div>
                  <h4>05/09</h4>
                  <br>
                  <div class="card">
                      <div class="card-body">
                          <div class="progress-label">Physics Test</div>
                          <div class="progress">
                              <div class="progress-bar bg-danger" style="width:15%">15%</div>
                          </div>
                          <div class="progress-buttons"><button type="button" class="btn btn-success">Done</button>
                              <button type="button" class="btn btn-info">Edit</button>
                          </div>
                          <br>
                          <h5>Due: 2PM</h5>
                      </div>
                  </div>


              </div>
          </div>

      </div>
  </div>
</body>

</html>
