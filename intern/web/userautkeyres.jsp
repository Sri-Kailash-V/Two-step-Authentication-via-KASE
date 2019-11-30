<%@page import="java.sql.*"%>
<%@page import="pkg.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String rfn = request.getParameter("rfn");
    String size = request.getParameter("size");
    String rby = session.getAttribute("emailid").toString();
    String upon = request.getParameter("upon");
    String ast = request.getParameter("ast");
    try {
        MyCon x = new MyCon();
        Connection c = x.tcon();
        if (ast.equalsIgnoreCase("Request Key")) {
            PreparedStatement pst = c.prepareStatement("insert into authorityservice(filename,uploadedon,size,requestby) values(?,?,?,?)");
            pst.setString(1, rfn);
            pst.setString(2, upon);
            pst.setString(3, size);
            pst.setString(4, rby);
            int j1 = pst.executeUpdate();
             if (j1 != 0) {
                session.setAttribute("msg", "Request sent success");
                RequestDispatcher rd = request.getRequestDispatcher("userauthsecretkey.jsp");
                rd.forward(request, response);
            } else {
                session.setAttribute("msg", "Request Failed");
                RequestDispatcher rd = request.getRequestDispatcher("userauthsecretkey.jsp");
                rd.forward(request, response);

            }
        } 

    } catch (Exception ex) {
        ex.printStackTrace();
        session.setAttribute("msg", "You hava already given request");
        RequestDispatcher rd = request.getRequestDispatcher("userauthsecretkey.jsp");
        rd.forward(request, response);
    }
%>