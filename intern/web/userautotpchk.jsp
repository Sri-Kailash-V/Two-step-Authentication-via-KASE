<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<%  String upon = request.getParameter("upon");
    String rfn = request.getParameter("rfn");
    String emailid = session.getAttribute("emailid").toString();
    String size = request.getParameter("size");
    String ast = request.getParameter("ast");
    String ukey = request.getParameter("ukey");
    try {
        MyCon x = new MyCon();
        Connection c = x.tcon();
        PreparedStatement pst = c.prepareStatement("select * from aufiles where filename=?");
        pst.setString(1, rfn);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            String skey = rs.getString("skey");
            if (skey.equals(ukey)) {
                PreparedStatement pst1 = c.prepareStatement("UPDATE userfiles SET autstatus='All Set' WHERE emailid=? and filename=?;");
                pst1.setString(1, emailid);
                pst1.setString(2, rfn);
                pst1.executeUpdate();
                session.setAttribute("msg", "All Set");
            } else {
                session.setAttribute("msg", "Invalid Key");
            }
        } else {
            session.setAttribute("msg", "Unknown file");
        }
    } catch (Exception e) {
        session.setAttribute("msg", "Internal Server Error");
        e.printStackTrace();
    } finally {
        RequestDispatcher rd = request.getRequestDispatcher("userauthsecretkey.jsp");
        rd.forward(request, response);
    }
%>