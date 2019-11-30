package pkg;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "filedownload", urlPatterns = {"/filedownload"})
public class filedownload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        File fileout =null;
        try {
            response.setContentType("text/html;charset=UTF-8");
            String fileName = request.getParameter("rfn");
            String rby = request.getParameter("rby");
            String Deckey = request.getParameter("Deckey");
            if (fileName == null || fileName.equals("")) {
                throw new Exception("File Name can't be null or empty");
            }
            MyCon x = new MyCon();
            Connection con = x.tcon();
            PreparedStatement pstmt0 = con.prepareStatement("select * from aufiles where filename=?");
            pstmt0.setString(1, fileName);
            if (pstmt0.executeQuery().next()) {
                //Download from server
                Ftpcon ftp = new Ftpcon();
                ftp.download(fileName);
                //file to decrypt
                fileout = Decrypter.ddec(fileName,Deckey);
                //to user location
                ServletContext ctx = getServletContext();
                System.out.println(fileout.getAbsolutePath());
                try (InputStream fis = new FileInputStream(fileout)) {
                    String mimeType = ctx.getMimeType(fileout.getAbsolutePath());
                    response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
                    response.setContentLength((int) fileout.length());
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    try (ServletOutputStream os = response.getOutputStream()) {
                        byte[] bufferData = new byte[1024];
                        int read = 0;
                        while ((read = fis.read(bufferData)) != -1) {
                            os.write(bufferData, 0, read);
                        }
                        os.flush();
                    }
                }
                //Database update
                PreparedStatement pst = con.prepareStatement("DELETE FROM filedownloads WHERE filename=? and downloadedby=? ;");
                pst.setString(1, fileName);
                pst.setString(2, rby);
                pst.executeUpdate();
                PreparedStatement pst1 = con.prepareStatement("insert into filedownloads (filename, downloadedby,downloadon) values(?,?,?)");
                pst1.setString(1, fileName);
                pst1.setString(2, rby);
                pst1.setTimestamp(3, new java.sql.Timestamp(new Date().getTime()));
                pst1.executeUpdate();
                System.out.println("File downloaded at client successfully");
                fileout.getFreeSpace();
                fileout.delete();System.out.println("1");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/userfiledownload.jsp?msg=download successfull");
                rd.forward(request, response);
                System.out.println("2");
                
                response.sendRedirect("userfiledownload.jsp?msg=download successfull");
                System.out.println("3");
            } else {
                throw new Exception("File doesn't exists on server.");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage() + "\n\n" + e);
            RequestDispatcher rd = request.getRequestDispatcher("userfiledownload.jsp");
            rd.forward(request, response);
            

        }finally{
                fileout.delete();
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
