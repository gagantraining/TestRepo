

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Error page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <br/>
        <br/>
    <center>
        <div class="jumbotron" style="width:65%; background-color: #b01541;color:white">
            <h1 class="display-4">We Got an Exception</h1>
            <p class="lead">There is some issue on our side Please Retry!!! </p>
            <hr class="my-4">
            <p><%= exception %></p>
            <a class="btn btn-primary btn-lg" href="https://google.co.in/search?q=<% out.print(exception); %>" role="button">Learn more</a>
         </div>
    </center>
        
        
        <%@include file="footer.html" %>
    </body>
</html>
