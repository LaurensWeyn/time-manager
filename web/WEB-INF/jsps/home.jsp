<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Student Time Management System</title>
  </head>
  <body>
  Hello, World!<br>
  Value of 'Key' in with different techniques: <br>
  <%=session.getAttribute("Key")%> <br><%--'raw Java' way--%>
  ${Key}<br><%--key inject way. prefered for HTML.--%>
  <c:out value="${Key}"/><%--c:out way. This is prefered for non-HTML as it stops HTML injection--%>

</body>
</html>