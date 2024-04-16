/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;
import java.sql.*;
/**
 *
 * @author Vivek Dwivedi
 */
public class DBConnection {
    public Connection con=null,con2=null;
    public Statement stmt=null,stmt1=null,stmt2=null;
    public PreparedStatement pstmt=null,pstmt1;
    public ResultSet rst=null,rst1=null,rst2=null;
    public DBConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pas","root","root");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
