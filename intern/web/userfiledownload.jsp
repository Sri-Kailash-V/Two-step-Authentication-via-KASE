<%@page contentType="text/html" pageEncoding="UTF-8" import="pkg.*,java.sql.*" %>
<html>
    <head>
        <title>Files Viewer</title>
        <%@include file="header.jsp" %>
        <%@include file="usernav.jsp" %>
        <style>
            .ts{text-align: center;}
            .tts{width: 100%;font-size: 23px;background-color: rgba(0,0,0,.2);border-radius: 30px;color: white;text-align: center;}
            th{background-color: rgba(0,0,0,.5);border-radius: 50px 50px 0 0;font-size: 25px;}
            tr:nth-child(even){background-color: rgba(255,255,255,.2);color: black;}
            tr:nth-child(odd){background-color: rgba(0,0,0,.3);}
            tr:last-child td{border-radius:0 0 50px 50px;}
        </style>
    <div style="margin-left: 10%;padding: 3% 4%;background-color: rgba(225,225,225,.5);border-radius: 70px">
        <h1 class="ts">Files</h1>
        <table class="tts">
            <tr><th>File name</th><th>Uploaded on</th><th>Size</th><th>Download</th></tr>
                    <% try {
                            MyCon x = new MyCon();
                            Connection c = x.tcon();
                            String rby = session.getAttribute("emailid").toString();
                            PreparedStatement st = c.prepareStatement("Select * from userfiles where emailid=?");
                            st.setString(1, rby);
                            ResultSet rs = st.executeQuery();
                            while (rs.next()) {
                    %>
            <tr>
                <td><% out.println(rs.getString("filename"));%></td>
                <td><% out.println(rs.getString("uploadedon"));%></td>
                <td><% out.println(rs.getInt("size"));%></td>
                <% if (rs.getString("autstatus").equalsIgnoreCase("All Set")) {%>
                <td><a style = "color: red;" href="userfiledownseckey?rfn=<%= rs.getString("filename")%>&rby=<%= rby %>">Download </a></td>
                    <% } else {%>
                <td>Trustee or Authority ??</td>
                <% }%>
            </tr>
            <% }
                } catch (Exception e) {
                    e.printStackTrace();
                }%>
        </table>
        <br/>
        <div style="color: white;"><%@include file="alert.jsp" %><% session.setAttribute("msg", "");%></div>
    </div>