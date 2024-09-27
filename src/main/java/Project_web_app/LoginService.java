package Project_web_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * Utility class that communicate with the SQL db in order to process a login request
 *
 * Nic Graf 2024 for CSI2132
 */
public class LoginService {

    public static Pair<Boolean, Boolean> validate(String username, String password) {

        Pair<Boolean, Boolean> isAuthenticated = new Pair<>(false, false);

        String query = "SELECT * FROM User_Login WHERE usern = ? AND pass = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    isAuthenticated.setFirst(true);
                    isAuthenticated.setSecond(rs.getBoolean("employee"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isAuthenticated;
    }
    public static boolean isInteger(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }
}
