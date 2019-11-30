<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>forget Truste password</title>
        <%@include file="header.jsp" %>
        <%@include file="homenav.jsp" %>
        <style>
            .sign1{margin-left: 10%;
                   height: 550px;}
            </style>
            <link rel="stylesheet" type="text/css" href="css/formstyle.css"/>
        </head>
        <body style="background-image: url('img/body back1.jpg');background-size: cover">
        <div class="sign1">
            <div class="log-box" style="height: 290px; width: 50%;left: 5%">
                <h2>Forget truste password</h2>
                <form action="chk.jsp">
                    Email<br />
                    <input type="hidden" name="ty" value="truste"/>
                    <input type="text" name="email" placeholder="Enter Email" required  />
                    <input type="submit" value="proceed" />
                </form>
                <%@include file="alert.jsp" %>
            </div>
        </div >
    </body>
</html>
