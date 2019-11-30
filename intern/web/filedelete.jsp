<%-- 
    Document   : filedelete
    Created on : 12 Aug, 2019, 5:44:32 PM
    Author     : Sri Kailash
--%>

<%@page import="java.io.File"%>
<%@page import="pkg.Ftpcon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pkg.MyCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String rfn = request.getParameter("fileName");
    try {
        Ftpcon ftp = new Ftpcon();
        if (ftp.delete(rfn)) {
            MyCon x = new MyCon();
            new File("Crypted\\" + rfn + ".des").delete();
            new File("Crypted\\" + rfn).delete();
            new File("Crypted\\" + rfn + "1.des").delete();
            Connection c = x.tcon();
            PreparedStatement pt = c.prepareStatement("DELETE FROM aufiles WHERE filename = ?");
            pt.setString(1, rfn);
            pt.executeUpdate();
            PreparedStatement pt1 = c.prepareStatement("DELETE FROM filedownloads WHERE filename = ?");
            pt1.setString(1, rfn);
            pt1.executeUpdate();
            PreparedStatement pt2 = c.prepareStatement("DELETE FROM userfiles WHERE filename = ?");
            pt2.setString(1, rfn);
            pt2.executeUpdate();
            PreparedStatement pt3 = c.prepareStatement("DELETE FROM authorityservice WHERE filename = ?");
            pt3.setString(1, rfn);
            pt3.executeUpdate();
            response.sendRedirect("authorityservice.jsp?msg=Deletion Successful");
        } else {
            response.sendRedirect("authorityservice.jsp?msg=Deletion UnSuccessful");
        }
    } catch (Exception e) {
        System.out.println(e);
    }


%>