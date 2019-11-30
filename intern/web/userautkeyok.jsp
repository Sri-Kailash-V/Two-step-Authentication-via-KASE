<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User OTP check</title>
        <%@include file="header.jsp" %>
        <%@include file="usernav.jsp" %>
    <div class="sign1">
        <div class="log-box" style="height: 280px; width: 60%;">
            <h2>Enter details</h2>
            <form action="userautotpchk.jsp" method="post">
                Key..<br />
                <input type="hidden" name="rfn" value="<%= request.getParameter("rfn")%>"/>
                <input type="hidden" name="upon" value="<%= request.getParameter("upon")%>"/>
                <input type="hidden" name="size" value="<%= request.getParameter("size")%>"/>
                <input type="hidden" name="ast" value="<%= request.getParameter("ast")%>"/>
                <input type="text" name="ukey" placeholder="Enter key" required  />
                <input type="submit" value="proceed" />
            </form>
            <%@include file="alert.jsp" %>
        </div>
    </div>
</body>
</html>
