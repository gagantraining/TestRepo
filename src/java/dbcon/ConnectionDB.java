
package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
    public static Connection getConnection(){
            Connection con = null;
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
            }catch(Exception e){
                System.out.println(e.getMessage());    
            }
            return con;
    }
}
