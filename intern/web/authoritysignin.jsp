<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>authority login</title>
        <%@include file="header.jsp" %>
        <%@include file="homenav.jsp" %>
        <style>
            .sign1{margin-left: 10%;
                   height: 550px;
            }
            .imgc{float: right;width: 40%;margin-right: 10%;margin-top: 8%;}
        </style>
    <div class="sign1">
        <img src="img/authority.jpg" alt="authority.jpg" class="imgc"/>
        <div class="log-box" style="height: 410px;">
            <h2>
                Login as Authoriy</h2>
            <form action="authoritydoin.jsp">
                Email<br />
                <input type="text" name="email" placeholder="Enter Email" required  />
                Password<br />
                <input type="Password" name="pass" placeholder="Enter Password" required  />
                <input name="submit" type="submit" value="Sign In" />
                <a class="af" href="forgetauthority.jsp">Forget Password</a>
            </form>
            <br/><%@include file="alert.jsp" %>
        </div>
    </div>
