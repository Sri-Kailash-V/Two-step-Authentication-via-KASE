<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
        <style>
            .sign1{height: 470px; margin:10% ;padding:0 4%;background-color:rgba(225,225,225,.5);border-radius: 70px;}
        </style>
        <link rel="stylesheet" type="text/css" href="css/formstyle.css"/>
    </head>
    <body style="background-image: url('img/body back1.jpg');background-size: cover">

        <div class="sign1">
            <div class="log-box" style="height: 360px; width: 60%;">
                <h2>Enter details</h2>
                <form action="regchk" method="post">
                    Email<br />
                    <input type="text" name="email" placeholder="Enter email" required />
                    OTP<br /><input type="text" name="otp" placeholder="Enter OTP" required  />
                    <input type="submit" value="proceed" />
                </form>
                <%@include file="alert.jsp" %>
            </div>
        </div>
    </body>
</html>
