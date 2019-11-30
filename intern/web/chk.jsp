<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= request.getParameter("ty")%> Check</title>
        <style>
            .sign1{height: 360px; margin:10% ;padding:0 4%;background-color:rgba(225,225,225,.5);border-radius: 70px;}
        </style>
        <link rel="stylesheet" type="text/css" href="css/formstyle.css"/>
    </head>
    <body style="background-image: url('img/body back1.jpg');background-size: cover">

        <%String email = request.getParameter("email");
            String ty = request.getParameter("ty");
            try {
                int y = 0;
                MyCon x = new MyCon();
                Email em = new Email();
                Connection c = x.tcon();
                PreparedStatement pst = c.prepareStatement("select * from " + ty + " where emailid=?");
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    Random rd = new Random();
                    int num = rd.nextInt(100000);
                    em.msg("OTP", "your password reset OTP is " + num, email);
                    int i = em.mail();
                    if (i != 0) {
                        session.setAttribute("otp", num);
        %>
        <div class="sign1">
            <div class="log-box" style="height: 280px; width: 60%;">
                <h2>Enter details</h2>
                <form action="otpchk.jsp">
                    OTP<br />
                    <input type="hidden" name="ty" value="<%= ty%>"/>
                    <input type="hidden" name="email" value="<%= email%>"/>
                    <input type="text" name="uotp" placeholder="Enter OTP" required  />
                    <input type="submit" value="proceed" />
                </form>
                <%@include file="alert.jsp" %>
                <% } else {
                                response.sendRedirect("forget" + ty + ".jsp?msg=Mail not sent");
                            }
                        } else {
                            response.sendRedirect("forget" + ty + ".jsp?msg=Enter Valid Details");
                        }
                    } catch (Exception e) {
                        response.sendRedirect("forget" + ty + ".jsp?msg=Enter Valid Details" + e);
                    }
                %>
            </div>
        </div>
    </body>
</html>
