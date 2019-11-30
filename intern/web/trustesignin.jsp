<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>trustee login</title>
        <%@include file="header.jsp" %>
        <%@include file="homenav.jsp" %>
        
        <style>
            .sign1{margin-left: 10%;
                   height: 550px;}
            .imgc{float: right;width: 40%;margin-right: 10%;margin-top: 10%;}
        </style>
    <div class="sign1" >
        <img src="img/trustee.jpg" alt="trustee.jpg" class="imgc"/>
        <div class="log-box">
            <h2>Login as Trustee</h2>
            <form action="trustedoin.jsp">
                Email<br />
                <input type="text" name="email" placeholder="Enter Email" required  />
                Password<br />
                <input type="Password" name="pass" placeholder="Enter Password" required  />
                <input name="submit" type="submit" value="Sign In" />
                <a class="af" href="forgettruste.jsp">Forget Password</a>
            </form>
            <br/><%@include file="alert.jsp" %>
        </div>
    </div>
    