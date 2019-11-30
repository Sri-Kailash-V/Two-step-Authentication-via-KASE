<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>user signin</title>
    </head>
    <body>
        <%  String res = request.getParameter("res");
            String rfn = request.getParameter("rfn");
            String rby = request.getParameter("rby");
            try {
                MyCon x = new MyCon();
                Connection c = x.tcon();
                if (res.equalsIgnoreCase("Grant Access")) {
                    PreparedStatement st = c.prepareStatement("Update trustservice set status='Allowed',response='Remove Access' where filename=? and requestby=? ");
                    st.setString(1, rfn);
                    st.setString(2, rby);
                    st.executeUpdate();
                    PreparedStatement st1 = c.prepareStatement("Update userfiles set autstatus='Request key',status='Granted click to remove' where filename=? and emailid=? ");
                    st1.setString(1, rfn);
                    st1.setString(2, rby);
                    st1.executeUpdate();
                } else if (res.equalsIgnoreCase("Remove Access")) {
                    PreparedStatement st = c.prepareStatement("DELETE FROM trustservice WHERE filename=? and requestby=?");
                    st.setString(1, rfn);
                    st.setString(2, rby);
                    st.executeUpdate();
                    PreparedStatement st2 = c.prepareStatement("DELETE FROM userfiles WHERE filename=? and emailid=?");
                    st2.setString(1, rfn);
                    st2.setString(2, rby);
                    st2.executeUpdate();
                    PreparedStatement st3 = c.prepareStatement("DELETE FROM Authorityservice WHERE filename=? and requestby=?");
                    st3.setString(1, rfn);
                    st3.setString(2, rby);
                    st3.executeUpdate();
                }
            } catch (Exception e) {
                out.println(e);
            }
            response.sendRedirect("trusteservices.jsp");
        %>
