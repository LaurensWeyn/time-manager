<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Student Time Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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


<%--TODO make it so I don't have to copy paste this thing everywhere (Apache Tiles!!!!!)--%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
    <a class="navbar-brand" href="#">STMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">View</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Edit</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="button-group">
                <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/login">Login</a>
                <a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/createAccount">Create Account</a>
            </li>
        </ul>
    </div>
</nav>

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
