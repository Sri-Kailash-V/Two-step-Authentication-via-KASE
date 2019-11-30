<%@page import="java.io.File"%>
<style>
    footer{
        text-align:center;
        font-family:Lucida Console;
        font-size:15px;
        border-top:1px solid black;
        padding:15px;
        background-color: rgba(225,225,225,.7);
        position: relative;
        bottom: 0;
        width: 100%;
        z-index: -1;}
</style>
<%new File("ToEncrypt").mkdir();
    new File("Crypted").mkdir();
    new File("DCrypted").delete();
    new File("DCrypted").mkdir();%>
<footer>
    copyright &copy 2019 Storage Master, All Rights Reserved<br/>
    Website developed by Sri Kailash V, Vinay, Akshay, Mohan, Shashank
</footer>	