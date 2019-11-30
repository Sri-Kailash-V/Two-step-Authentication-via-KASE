package pkg;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "regchk", urlPatterns = {"/regchk"})
public class regchk extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int y;
            MyCon x = new MyCon();
            Connection c = x.tcon();
            String emailid = request.getParameter("email").trim();
            String uotp = request.getParameter("otp");
            PreparedStatement pt= c.prepareStatement("select * from regotp where email =?");
            pt.setString(1, emailid);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                if (uotp.equals(Integer.toString(rs.getInt(4)))) {
                    PreparedStatement pst = c.prepareStatement("insert into user(name,emailid,pass) values(?,?,?)");
                    pst.setString(1, rs.getString(1));
                    pst.setString(2, emailid);
                    pst.setString(3, rs.getString(3));
                    PreparedStatement st=c.prepareStatement("DELETE FROM regotp WHERE email=?;");
                    st.setString(1, emailid);
                    st.executeUpdate();
                    y = pst.executeUpdate();
                    if (y > 0) {
                        response.sendRedirect("usersignin.jsp?msg=Registration Successful");
                    } else {
                        response.sendRedirect("usersignup.jsp?msg=Server error");
                    }
                } else {
                    response.sendRedirect("registration.jsp?msg=wrong OTP ");
                }
            } else {
                response.sendRedirect("registration.jsp?msg=Not Requested to Register");
            }
        } catch (SQLException e) {
            response.sendRedirect("registration.jsp?msg=User already Registered");
        }
    }
}
