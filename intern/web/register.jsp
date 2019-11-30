<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; url=home.jsp" />
        <title>Registration</title>
        <%@include file="header.jsp" %>
        <style>
            p{
                font-size: 40px; 
                margin-left: 5%;
            }
        </style>
    <div style="margin: 5% 0 2% 10%;padding: 3% 4%;background-color: rgba(225,225,225,.5);border-radius: 70px">
        <% String email = request.getParameter("email");
            String uname = request.getParameter("un");
            String pass = request.getParameter("ps");
            MyCon x = new MyCon();
            Connection c = x.tcon();
            PreparedStatement pt = c.prepareStatement("select * from regotp where emailid =?");
            pt.setString(1, email);
            ResultSet rs = pt.executeQuery();
            if (!rs.next()) {
                PreparedStatement pst = c.prepareStatement("insert into user(name,emailid,pass) values(?,?,?)");
                pst.setString(1, uname);
                pst.setString(2, email);
                pst.setString(3, pass);
                int y = pst.executeUpdate();
                if (y > 0) {%>
        <p>
            <b>Registration Successful...</b>
            <br/>
            <br/>
            Redirecting to home for login......
        </p>
        <% } else {%>
        <p>
            <b>Registration  UnSuccessful...</b>
            <br/>
            <br/>
            Redirecting to home to register again......
        </p>
        <%}
            }%>
    </div>