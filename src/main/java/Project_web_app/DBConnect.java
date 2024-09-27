package Project_web_app;
import java.sql.*;

/*
* A utility class for ease and safety of database connection
*
* Nic Graf 2024 for CSI2132
 */

public class DBConnect{

    private static final String ipAddress = "127.0.0.1";
    private static final String dbServerPort = "5432";
    private static final String dbName = "postgres";
    private static final String dbusername = "postgres";
    private static final String dbpassword = "drowssap12";
    private Connection con = null;


    public Connection getConnection() throws Exception{
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://"
                    + ipAddress + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);

            try (Statement stmt = con.createStatement()) {
                stmt.execute("SET search_path = 'Project'");
            }

            return con;
        } catch (Exception e) {
            throw new Exception("Could not establish connection with the Database Server: "
                    + e.getMessage());
        }

    }
    public void close() throws Exception{

        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
        }

    }
}
