<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>truste signin</title>
    </head>
    <body>
        <%try {
                int y = 0;
                MyCon x = new MyCon();
                Connection c = x.tcon();
                String emailid, ps;
                emailid = request.getParameter("email");
                ps = request.getParameter("pass");
                PreparedStatement pst = c.prepareStatement("select * from truste where emailid=? and pass=?");
                pst.setString(1, emailid);
                pst.setString(2, ps);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    session.setAttribute("emailid", emailid);
                    session.setAttribute("uname", rs.getString("name"));
                    response.sendRedirect("trustehome.jsp");
                } else {
                    response.sendRedirect("trustesignin.jsp?msg=Invalid Login Details");
                }
            } catch (Exception e) {
                response.sendRedirect("trustesignin.jsp?msg=Enter Valid Details"+e);
            }
        %>
    </body> 
</html>
