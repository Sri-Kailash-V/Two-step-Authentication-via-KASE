<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user signup</title>
    </head>
    <body>
        <%try {
                int y = 0;
                MyCon x = new MyCon();
                Connection c = x.tcon();
                String emailid, un, rps, ps;
                emailid = request.getParameter("emailid");
                un = request.getParameter("name");
                ps = request.getParameter("pass");
                rps = request.getParameter("repass");
                PreparedStatement pt = c.prepareStatement("select * from user where emailid =?");
                pt.setString(1, emailid);
                ResultSet rs = pt.executeQuery();
                if (!rs.next()) {
                    if (ps.matches(rps)) {
                        Random re = new Random();
                        int num = re.nextInt(10000);
                        Email em = new Email();
                        em.msg("User Registration", "click the link to activate your account\n<a href = 'http://localhost:8080/intern/register?email=" + emailid + "&pass=" + ps + "&un="+ un +"' > click Here...</a><br/><br/>"
                                + "if connection refused enter your otp" + num + "<br/><br/><br/>"
                                + "If you didnt register plse Ignore the mail ", emailid);
                        int e = em.mail();
                        if (e == 1) {
                            PreparedStatement p = c.prepareStatement("DELETE FROM regotp WHERE email='" + emailid + "'");
                            p.execute();
                            p = c.prepareStatement("INSERT INTO regotp(email,name,pass,otp) VALUES (?,?,?,?);");
                            p.setString(1, emailid);
                            p.setString(2, un);
                            p.setString(3, ps);
                            p.setInt(4, num);
                            p.execute();

                            response.sendRedirect("usersignup.jsp?msg=Mail Sent for Activation");
                        } else if (e == 2) {
                            response.sendRedirect("usersignup.jsp?msg=Invalid Mail id ");
                        } else {
                            response.sendRedirect("usersignup.jsp?msg=Mail not Sent ");
                        }
                    } else {
                        response.sendRedirect("usersignup.jsp?msg=password mismatch");
                    }
                } else {
                    response.sendRedirect("usersignup.jsp?msg=User already registered");
                }
            } catch (Exception e) {
                response.sendRedirect("usersignup.jsp?msg=Email already registered");
            }
        %>
    </body>
</html>