<%@page import="java.sql.*"%>
<%@page import="pkg.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Cookie ck[] = request.getCookies();
    String rfn = request.getParameter("rfn");
    String size = request.getParameter("size");
    String rby = session.getAttribute("emailid").toString();
    String upon = request.getParameter("upon");
    String st = request.getParameter("st");
    try {
        MyCon x = new MyCon();
        Connection c = x.tcon();
        if (st.equalsIgnoreCase("request")) {
            String reqto = request.getParameter("reqto");
            PreparedStatement pst = c.prepareStatement("insert into trustservice(filename,uploadedon,size,requestby,requestto) values(?,?,?,?,?)");
            pst.setString(1, rfn);
            pst.setString(2, upon);
            pst.setString(3, size);
            pst.setString(4, rby);
            pst.setString(5, reqto);
            int j1 = pst.executeUpdate();
            PreparedStatement pst1 = c.prepareStatement("INSERT INTO userfiles(emailid,filename,uploadedon,size)VALUES(?,?,?,?)");
            pst1.setString(1, rby);
            pst1.setString(2, rfn);
            pst1.setString(3, upon);
            pst1.setString(4, size);
            int j2 = pst1.executeUpdate();
            if (j2 != 0 && j1 != 0) {
                session.setAttribute("msg", "Request sent success");
                RequestDispatcher rd = request.getRequestDispatcher("usertrustreq.jsp");
                rd.forward(request, response);

            } else {
                session.setAttribute("msg", "Request Failed");
                RequestDispatcher rd = request.getRequestDispatcher("usertrustreq.jsp");
                rd.forward(request, response);

            }
        } else if (st.equalsIgnoreCase("Granted click to remove")) {
            PreparedStatement pst = c.prepareStatement("DELETE FROM trustservice WHERE filename=? and requestby=?");
            pst.setString(1, rfn);
            pst.setString(2, rby);
            pst.executeUpdate();
            PreparedStatement st2 = c.prepareStatement("DELETE FROM userfiles WHERE filename=? and emailid=?");
            st2.setString(1, rfn);
            st2.setString(2, rby);
            st2.executeUpdate();
            PreparedStatement st3 = c.prepareStatement("DELETE FROM authorityservice WHERE filename=? and requestby=?");
            st3.setString(1, rfn);
            st3.setString(2, rby);
            st3.executeUpdate();
            session.setAttribute("msg", "suceccfully removed");
            RequestDispatcher rd = request.getRequestDispatcher("usertrustreq.jsp");
            rd.forward(request, response);
        }

    } catch (Exception ex) {
        session.setAttribute("msg", "You hava already given request");
        RequestDispatcher rd = request.getRequestDispatcher("usertrustreq.jsp");
        rd.forward(request, response);
    }
%>