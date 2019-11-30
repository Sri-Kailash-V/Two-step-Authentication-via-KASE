package pkg;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "aufileupload", urlPatterns = {"/aufileupload"})
public class aufileupload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            DiskFileItemFactory fileFactory = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fileFactory);
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem fileItem = (FileItem) itr.next();//ok
            String fname = fileItem.getName();
            String sk = Integer.toString(new Random().nextInt(1000000));
            System.out.println("sk" + sk);
            
            MyCon x = new MyCon();
            Connection con = x.tcon();
            PreparedStatement pstmt0 = con.prepareStatement("select * from aufiles where filename=?");
            pstmt0.setString(1, fname);
            if (!pstmt0.executeQuery().next()) {
                //file fron web
                File fll = new File("ToEncrypt\\" + fname);
                fileItem.write(fll);
                //to encrypt file
                File fl2 = Encrypter.eenc(fll, fname, sk);
                //to upload file
                Ftpcon ftpcon = new Ftpcon();
                boolean bool = ftpcon.upload(fl2, fname + ".des");
                //database upload
                if (bool) {
                    PreparedStatement pstmt = con.prepareStatement("insert into aufiles (filename, size,date,SecretKey) values(?,?,?,?)");
                    pstmt.setString(1, fileItem.getName());
                    pstmt.setInt(2, (int) fileItem.getSize());
                    pstmt.setTimestamp(3, new java.sql.Timestamp(new Date().getTime()));
                    pstmt.setString(4, sk);
                    int i = pstmt.executeUpdate();
                    if (i != 0) {
                        System.out.println("Absolute Path at server=" + fll.getAbsolutePath());
                        System.out.println("Absolute Path at server=" + fl2.getAbsolutePath());
                        fll.delete();
                        response.sendRedirect("authorityservice.jsp?msg=fileuploded susscessfully...");
                    } else {
                        response.sendRedirect("authorityservice?msg=Uploadingsucessfull,update failed");
                    }
                } else {
                    fl2.delete();
                    response.sendRedirect("authorityservice.jsp?msg=Uploading failed...");
                }
            } else {
                System.out.println("exist");
                response.sendRedirect("authorityservice.jsp?msg=file already exists");
            }

        } catch (FileUploadException e) {
            response.sendRedirect("authorityservice.jsp?msg=Exception in uploading filedd." + e);
        } catch (Exception e) {
            response.sendRedirect("authorityservice.jsp?msg=Exception in uploading file." + e);
        }
    }
}
