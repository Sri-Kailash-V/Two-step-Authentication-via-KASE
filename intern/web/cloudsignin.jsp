<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>cloud login</title>
        <%@include file="header.jsp" %>
        <%@include file="homenav.jsp" %>
        <style>
            .sign1{margin-left: 10%;
                   height: 550px;}
            .imgc{float: right;width: 40%; height: 90%;margin-right: 10%;margin-top: 10%;}
        </style>
    <div class="sign1" style=" height: 410px;">
        <img src="img/cloud manager.png" alt="cloud manager.png" class="imgc"/>
        <div class="log-box">
            <h2>Login as Cloud manager</h2>
            <form action="clouddoin.jsp">
                Email<br />
                <input type="text" name="email" placeholder="Enter Email" required  />
                Password<br />
                <input type="Password" name="pass" placeholder="Enter Password" required  />
                <input name="submit" type="submit" value="Sign In" />
                <a class="af" href="forgetcloud.jsp">Forget Password</a>
            </form>
            <br/><%@include file="alert.jsp" %>
        </div>
    </div>