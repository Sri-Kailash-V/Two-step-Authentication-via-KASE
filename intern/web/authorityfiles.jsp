<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Files</title>
        <%@include file="header.jsp" %>
        <%@include file="authoritynav.jsp" %>
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
                            PreparedStatement st = c.prepareStatement("Select * from aufiles;");
                            ResultSet rs = st.executeQuery();
                            while (rs.next()) {
                    %>
            <tr>
                <td><% out.println(rs.getString(1));%></td>
                <td><% out.println(rs.getInt(3));%></td>
                <td><% out.println(rs.getString(2));%></td>
                <td><a style="color: red;" href="filedownload?rfn=<% out.println(rs.getString(1));%>&rby=authority&Deckey=<% out.println(rs.getString(5));%>">Download </a>
                </td>
            </tr>
            <% }
                } catch (Exception e) {
                }%>
        </table>
        <br/>
        <center><%@include file="alert.jsp" %></center>
    </div>