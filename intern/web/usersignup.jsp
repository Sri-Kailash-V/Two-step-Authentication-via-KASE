<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>user signup</title>
        <%@include file="header.jsp" %>
        <%@include file="homenav.jsp" %>
        <style>
            .sign1{margin-left: 10%;
                   margin-top: -5%;
                   height: 750px;}
            .imgc{float: right;width: 40%;margin-right: 10%;margin-top: 16%;}
        </style>
    <div class="sign1">
        <img src="img/signup.gif" alt="signup.gif" class="imgc"/>
        <div class="log-box" style="height: 570px;">
            <h2>Register User Account</h2>
            <form action="userdoup.jsp">
                Name<br />
                <input type="text" name="name" placeholder="Enter Name" required  />
                Email Id<br />
                <input type="text" name="emailid" placeholder="Enter Email Id" required  />
                Password<br />
                <input type="Password" name="pass" placeholder="Enter Password" required  />
                Re-Password<br />
                <input type="Password" name="repass" placeholder="ReEnter Password" required  />
                <input type="submit" value="Sign Up" />
                <a class="af" href="registration.jsp">Having OTP</a>
                <%@include file="alert.jsp" %>
            </form>
        </div>
    </div>
