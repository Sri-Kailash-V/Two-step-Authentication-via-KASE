<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Check</title>
        <style>
            .sign1{height: 450px; margin:9% ;padding:0 4%;background-color:rgba(225,225,225,.5);border-radius: 70px;}
        </style>
        <link rel="stylesheet" type="text/css" href="css/formstyle.css"/>
    </head>
    <body style="background-image: url('img/body back1.jpg');background-size: cover">
        <% String email, otp, uotp, ty;
            ty = request.getParameter("ty");
            uotp = request.getParameter("uotp");
            email = request.getParameter("email");
            otp = session.getAttribute("otp").toString();
            try {
                if (uotp.equals(otp)) {
        %>
        <div class="sign1">
            <div class="log-box" style="height: 330px; width: 60%;">
                <h2>Enter details</h2>
                <form action="update.jsp">
                    password<br />
                    <input type="password" name="pass" placeholder="Enter Password" required  />
                    RePassword<br />
                    <input type="password" name="repass" placeholder="ReEnter Password" required  />
                    <input type="hidden" name="email" value="<%= email%>"/>
                    <input type="hidden" name="ty" value="<%= ty%>"/>
                    <input type="submit" value="proceed" />
                </form>
                <% } else {
                            response.sendRedirect("chk.jsp?msg=Invalid OTP, OTP Resended&email=" + email+"&ty="+ty);
                        }
                    } catch (Exception e) {
                        response.sendRedirect("chk.jsp?msg=Enter Valid Details");
                    }
                %>
            </div>
        </div>
    </body> 
</html>