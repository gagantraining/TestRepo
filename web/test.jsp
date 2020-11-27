<%-- 
    Document   : test.jsp
    Created on : 4 Nov, 2020, 5:12:58 PM
    Author     : gagan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            int i = 5/0;
            %>
    </body>
</html>
