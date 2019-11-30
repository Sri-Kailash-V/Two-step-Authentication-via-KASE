<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Authoriy Key Request</title>
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
        <h1 class="ts">Service Requested</h1>
        <table class="tts">
            <tr><th>File name</th><th>Uploaded on</th><th>Size</th><th>Status on trustee</th></tr>
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
                <% if (rs.getString("autstatus").equalsIgnoreCase("Trustee Respond?")) { %>
                <td><% out.println(rs.getString("autstatus"));%></td>
                <% } else if (rs.getString("autstatus").equalsIgnoreCase("Request key")) {%>
                <td> <a style = "color: red;" href = "userautkeyres.jsp?rfn=<%= rs.getString("filename")%>&upon=<%= rs.getString("uploadedon")%>&size=<%= rs.getString("size")%>&ast=<%= rs.getString("autstatus")%>">
                        <% out.println(rs.getString("autstatus"));%></a></td>
                        <% } else if (rs.getString("autstatus").equalsIgnoreCase("Enter key")) {%>
                <td> <a style = "color: red;" href = "userautkeyok.jsp?rfn=<%= rs.getString("filename")%>&upon=<%= rs.getString("uploadedon")%>&size=<%= rs.getString("size")%>&ast=<%= rs.getString("autstatus")%>">
                        <% out.println(rs.getString("autstatus"));%></a></td>
                        <% } else if (rs.getString("autstatus").equalsIgnoreCase("All Set")) {%>
                <td> 
                    <% out.println(rs.getString("autstatus"));%></td>
            </tr>
            <% }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                             }%>
        </table>
        <br/>
        <div style="color: white;"><%@include file="alert.jsp" %><% session.setAttribute("msg", "");%></div>
    </div>