<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user update</title>
    </head>
    <body>
        <%  String email, ty, rps, ps;
            email = request.getParameter("email");
            ps = request.getParameter("pass");
            rps = request.getParameter("repass");
            ty = request.getParameter("ty");
            try {
                int y = 0;
                MyCon x = new MyCon();
                Connection c = x.tcon();
                if (ps.matches(rps)) {
                    PreparedStatement pst = c.prepareStatement("update "+ ty +" set pass=? where emailid=?");
                    pst.setString(2, email);
                    pst.setString(1, ps);
                    y = pst.executeUpdate();
                }
                if (y > 0) {
                    response.sendRedirect(ty + "signin.jsp?msg=update Successful");
                } else {
                    response.sendRedirect("chk.jsp?msg=Password Mismatch, OTP Resended&email="+email+"&ty="+ty);
                }

            } catch (Exception e) {
                response.sendRedirect("forget"+ ty +".jsp?msg=Error occured"+e);
            }
        %>
    </body>
</html>