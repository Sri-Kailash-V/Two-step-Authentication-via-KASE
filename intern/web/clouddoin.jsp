<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>cloud signin</title>
    </head>
    <body>
        <%try {
                int y = 0;
                MyCon x = new MyCon();
                Connection c = x.tcon();
                String emailid, ps;
                emailid = request.getParameter("email");
                ps = request.getParameter("pass");
                PreparedStatement pst = c.prepareStatement("select * from cloud where emailid=? and pass=?");
                pst.setString(1, emailid);
                pst.setString(2, ps);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    session.setAttribute("emailid", emailid);
                    session.setAttribute("uname", rs.getString("name"));
                    response.sendRedirect("cloudhome.jsp");
                } else {
                    response.sendRedirect("cloudsignin.jsp?msg=Invalid Login Details");
                }
            } catch (Exception e) {
                response.sendRedirect("cloudsignin.jsp?msg=Enter Valid Details"+e);
            }
        %>
    </body> 
</html>
