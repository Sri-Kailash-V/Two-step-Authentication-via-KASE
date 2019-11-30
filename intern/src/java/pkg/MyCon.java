package pkg;
import java.sql.*;
public class MyCon {
    public Connection tcon()
    {
        Connection c=null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/intern","root","");
        
        }
        catch(Exception e){
        System.out.println(e);
        }
    return c;
    }
 
}
