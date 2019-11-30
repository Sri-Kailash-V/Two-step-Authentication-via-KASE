<%@page import="pkg.MyCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.IOException,org.apache.commons.net.ftp.FTPClient;"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Services</title>
        <%@include file="header.jsp" %>
        <%@include file="authoritynav.jsp" %>
        <script>
            function del() {
                var vall = confirm('Cofirm to delete');
                if (vall !== false) {
                    document.forms["myForm"].submit();
                    return true;
                } else {
           
           return false;
                }
            }


        </script>
        <style>
            .sign1{margin-left:2%;margin-top: 0%;
                   height: 500px;
            }
            .imgc{float: right;width: 35%;margin-right: 4%;margin-top: 4%;}
            select {color: #fff;
                    width: 100%;
                    padding: 16px 20px;
                    border: none;
                    border-radius: 4px;
                    background-color: rgba(0,0,0,.4);}
            </style>
        <div class="sign1">
        <div class="log-box" style="height: 300px;float: left">
            <h2>upload file</h2>
            <form action="aufileupload" method="post" enctype="multipart/form-data">
                File name<br/><br/>
                <input type="file" name="fileName" required />
                <input name="submit" type="submit" value="Upload" />
            </form>

        </div>
        <div class="log-box" style="height: 300px;float: left; margin-left: 20px">
            <h2>Delete file</h2>
            <form action="filedelete.jsp" method="post"  name="myForm" >
                File name<br/><br/>
                <select name="fileName">
                    <% MyCon x = new MyCon();
                        Connection c = x.tcon();
                        PreparedStatement st = c.prepareStatement("select filename from aufiles ");
                        ResultSet rs = st.executeQuery();
                        while (rs.next()) {
                    %>
                    <option><%= rs.getString(1)%></option>
                    <% }
                    %>
                </select><br/><br/>
                <input name="Proceed" type="button" value="Proceed" onclick="del();"/>
            </form> 
        </div>
        <img src="img/authority.jpg" alt="authority.jpg" class="imgc"/>
        <% if (request.getParameter("msg") != null) {%>
        <div class="log-box" style="height: 45px;float: left;margin-top:4%;margin-left: 13%;padding:  8px 0 20px 25px "> <%@include file="alert.jsp" %></div>
        <% }%>
    </div>


