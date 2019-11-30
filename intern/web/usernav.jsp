<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="background-color: rgba(0,0,0,.5) ;border-radius: 50px ;">
    <div class="hdiv2">
        <ul class="cf">
            <li><a class="a1" href="userhome.jsp" >Home</a></li>
            <li><a class="a1" href="usertrustreq.jsp?">Trustee Request</a></li>
            <li><a class="a1" href="userauthsecretkey.jsp">Authority Secret key</a></li>
            <li><a class="a1" href="userfiledownload.jsp">File Download</a></li>
            <li><a class="a1" href="logout.jsp">logout</a></li>
            <li Style="float: right;"><a style="color: white;cursor: auto;display: block;padding: 12px 33px;"><%= session.getAttribute("emailid").toString()%></a></li>

        </ul>
    </div>
</div>
<br/>