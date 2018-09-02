<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Student Time Management System</title>
    <%@include file="../common/headerIncludes.jsp"%>

    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
        .lightText {
            color: #959595;
        }

        h1, h2, h3, h4, h5, h6 {
            color: black;
        }

        .page-header {
            padding-top: 50px;
        }
    </style>
</head>
<body>


<%@include file="../common/navbar.jsp" %>

<div class="container">

    <h1 class="page-header">Student Time Management System
        <small class="lightText">STMS</small>
    </h1>

    <div class="row">
        <div class="col-lg-12">
            <h2>What is STMS?</h2>
            <div class="fakeimg">Super awesome screenshot of the UI would go here</div>
            <p>Why, it's this amazing thing that would probably be described in great detail here if I could be bothered! Lots of text, perhaps even a whole paragraph would be written here about how awesome this program is, why it's good, and why you should totally use it instead of something like Google Calendar. But right now, all I really need here is a block of text to check if this webpage formats text correctly and looks neat, so instead of writing up such a description, I've written this block of text. In fact, I'm still typing it up now, because I didn't feel it was long enough yet. Perhaps it is long enough now, though.</p>
        </div>
    </div>

</div>
<p style="margin-bottom:50px;"></p>
</body>
</html>
