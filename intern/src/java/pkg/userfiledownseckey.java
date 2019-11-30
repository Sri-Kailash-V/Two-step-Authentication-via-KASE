package pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/userfiledownseckey"})
public class userfiledownseckey extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String fileName = request.getParameter("rfn");
            String rby = request.getParameter("rby");
            MyCon x = new MyCon();
            Connection con = x.tcon();
            PreparedStatement pstmt0 = con.prepareStatement("select * from aufiles where filename=?");
            pstmt0.setString(1, fileName);
            ResultSet rs = pstmt0.executeQuery();
            if (rs.next()) {
                Email em = new Email();
                em.msg("Decrypt Key", "your Decrypt key for the Requested file " + fileName + " is " + rs.getString("SecretKey"), rby);
                int i = em.mail();
                if (i != 0) {
                    HttpSession session = request.getSession();
                    out.write("\n");
                    out.write("<!DOCTYPE html>\n");
                    out.write("<html>\n");
                    out.write("    <head>\n");
                    out.write("        <title>User Decrypt Key check</title>\n");
                    out.write("        ");
                    out.write("\n");
                    out.write("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\">\n");
                    out.write("<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n");
                    out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/formstyle.css\"/>\n");
                    out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/backhead.css\"/>\n");
                    out.write("<link rel=\"icon\" type = \"image/jpg\" href = \"img/cloud icon.jpg\">\n");
                    out.write("</head>\n");
                    out.write("<body style=\"background-image: url('img/body back1.jpg');\">\n");
                    out.write("    <div class=\"hdiv1\">\n");
                    out.write("        <img src=\"img/Storage Master.png\" alt=\"Storage Master.png\" class=\"img1\"/>\n");
                    out.write("        <p class=\"topic\"><span style=\"color: white\">Cloud </span>File Handler\n");
                    out.write("        </p>\n");
                    out.write("    </div>\n");
                    out.write("    ");
                    out.write("\n");
                    out.write("        ");
                    out.write("\n");
                    out.write("<div style=\"background-color: rgba(0,0,0,.5) ;border-radius: 50px ;\">\n");
                    out.write("    <div class=\"hdiv2\">\n");
                    out.write("        <ul class=\"cf\">\n");
                    out.write("            <li><a class=\"a1\" href=\"userhome.jsp\" >Home</a></li>\n");
                    out.write("            <li><a class=\"a1\" href=\"usertrustreq.jsp?\">Trustee Request</a></li>\n");
                    out.write("            <li><a class=\"a1\" href=\"userauthsecretkey.jsp\">Authority Secret key</a></li>\n");
                    out.write("            <li><a class=\"a1\" href=\"userfiledownload.jsp\">File Download</a></li>\n");
                    out.write("            <li><a class=\"a1\" href=\"logout.jsp\">logout</a></li>\n");
                    out.write("            <li Style=\"float: right;\"><a style=\"color: white;cursor: auto;display: block;padding: 12px 33px;\">");
                    out.print(session.getAttribute("emailid").toString());
                    out.write("</a></li>\n");
                    out.write("\n");
                    out.write("        </ul>\n");
                    out.write("    </div>\n");
                    out.write("</div>\n");
                    out.write("<br/>");
                    out.write("\n");
                    out.write("    <div class=\"sign1\">\n");
                    out.write("        <div class=\"log-box\" style=\"height: 280px; width: 60%;\">\n");
                    out.write("            <h2>Enter Key</h2>\n");
                    out.write("            <form action=\"filedownload\" method=\"post\">\n");
                    out.write("                Decrypt Key..<br />\n");
                    out.write("                <input type=\"hidden\" name=\"rfn\" value=\""+request.getParameter("rfn")+"\"/>\n");
                    out.write("                <input type=\"hidden\" name=\"rby\" value=\""+request.getParameter("rby")+"\"/>\n");
                     out.write("                <input type=\"text\" name=\"Deckey\" placeholder=\"Enter Decrypt key\" required  />\n");
                    out.write("                <input type=\"submit\" value=\"proceed\" />\n");
                    out.write("            </form>\n");
                    out.write("      <a href=\"userfiledownload.jsp\" style=\"color:white;\">Return to Download page</a>     ");
                    out.write("<p style=\"font-size:25px;margin: 0\">\n");
                    out.write("    ");

                    //response.sendRedirect("filedownload?rfn=" + fileName + "&rby=" + rby + "");

                }
            }
        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
