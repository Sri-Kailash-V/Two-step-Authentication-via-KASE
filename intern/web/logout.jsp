<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; url=home.jsp" />
        <title>loging out</title>
        <%@include file="header.jsp" %>
        <% session.invalidate(); %>
        <style>
            p{
                font-size: 40px; 
                margin-left: 5%;
            }
        </style>
    <div style="margin: 5% 0 2% 10%;padding: 3% 4%;background-color: rgba(225,225,225,.5);border-radius: 70px">
        <p>
            <b>LogOut Successful...</b>
            <br/>
            <br/>
            Redirecting to home......
        </p>
    </div>
