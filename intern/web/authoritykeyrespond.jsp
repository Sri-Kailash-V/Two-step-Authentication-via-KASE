<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<%  String res = request.getParameter("res");
    String rfn = request.getParameter("rfn");
    String rby = request.getParameter("rby");
    try {
        MyCon x = new MyCon();
        Connection c = x.tcon();
        PreparedStatement pst1 = c.prepareStatement("select skey from aufiles where filename='" + rfn + "'");
        ResultSet rs = pst1.executeQuery();
        if (rs.next()) {
            String skey = rs.getString("skey");
            if (skey.equalsIgnoreCase("0")) {
                Random rd = new Random();
                int num = rd.nextInt(100000);
                PreparedStatement pst = c.prepareStatement("update aufiles set skey = ? where  filename=?");
                skey = Integer.toString(num);
                pst.setString(1, skey);
                pst.setString(2, rfn);
                pst.executeUpdate();
            }
            if (res.equalsIgnoreCase("Issue key")) {
                Email em = new Email();
                em.msg("Pass Key", "your Pass key for the Requested file " + rfn + " is " + skey, rby);
                int i = em.mail();
                if (i != 0) {
                    response.sendRedirect("authoritypasskey.jsp?msg=key Issued sucessfully to " + rby + " for file " + rfn);
                    PreparedStatement st = c.prepareStatement("Update authorityservice set status='Key Issued',secretkey='Remove key' where filename=? and requestby=? ");
                    st.setString(1, rfn);
                    st.setString(2, rby);
                    st.executeUpdate();
                    PreparedStatement st1 = c.prepareStatement("UPDATE userfiles SET autstatus='Enter Key' WHERE emailid=? and filename=?;");
                    st1.setString(2, rfn);
                    st1.setString(1, rby);
                    st1.executeUpdate();

                } else {
                    response.sendRedirect("authoritypasskey.jsp?msg=Mail not sent plese resend");
                }
            } else if (res.equalsIgnoreCase("Remove key")) {
                PreparedStatement st = c.prepareStatement("DELETE FROM authorityservice WHERE filename=? and requestby=? ");//DELETE FROM trustservice WHERE filename=? and requestby=?");
                st.setString(1, rfn);
                st.setString(2, rby);
                st.executeUpdate();
                response.sendRedirect("authoritypasskey.jsp?msg=Access Removed sucessfully to " + rby + " for file " + rfn);
                PreparedStatement st1 = c.prepareStatement("UPDATE userfiles SET autstatus='Request key' WHERE emailid=? and filename=?;");
                st1.setString(2, rfn);
                st1.setString(1, rby);
                st1.executeUpdate();
            }
        } else {
            response.sendRedirect("authoritypasskey.jsp?msg=filenot found");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>