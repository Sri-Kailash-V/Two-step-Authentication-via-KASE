<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Trustee requesr to</title>
        <%@include file="header.jsp" %>
        <%@include file="usernav.jsp" %>
        <style>
            select {color: #fff;
                    width: 100%;
                    padding: 16px 20px;
                    border: none;
                    border-radius: 4px;
                    background-color: rgba(0,0,0,.4);}

        </style>
    <div class="sign1">
        <div class="log-box" style="height: 280px; width: 60%;">
            <h2>Select Trustee</h2>
            <form action="usertrustres.jsp" method="post">
                Trustee..<br />
                <input type="hidden" name="rfn" value="<%= request.getParameter("rfn")%>"/>
                <input type="hidden" name="upon" value="<%= request.getParameter("upon")%>"/>
                <input type="hidden" name="size" value="<%= request.getParameter("size")%>"/>
                <input type="hidden" name="st" value="<%= request.getParameter("st")%>"/>
                <select name="reqto"  required >
                    <% MyCon x = new MyCon();
                        Connection c = x.tcon();
                        PreparedStatement st = c.prepareStatement("select emailid from truste ");
                        ResultSet rs = st.executeQuery();
                        while (rs.next()) {
                    %>
                    <option><%= rs.getString(1)%></option>
                    <% }
                    %>
                </select>
                <br/><br/>
                <input type="submit" value="proceed" />
            </form>
            <%@include file="alert.jsp" %>
        </div>
    </div>
</body>
</html>