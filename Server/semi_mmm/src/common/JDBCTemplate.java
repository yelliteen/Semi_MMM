package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

   private static final String ipAddress = "192.168.10.25";
   
   public static Connection getConnection() {

      Connection conn = null;

      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");

         conn = DriverManager.getConnection("jdbc:oracle:thin:@" + ipAddress + ":1521:xe", "mmm", "1234");

         conn.setAutoCommit(false);

      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }

      return conn;
   }

   public static void close(Connection conn) {

      try {
         if (conn != null && !conn.isClosed()) {
            conn.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void close(ResultSet rset) {

      try {
         if (rset != null && !rset.isClosed()) {
            rset.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void close(Statement stmt) {
      
      try {
         if (stmt != null && !stmt.isClosed()) {
            stmt.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void commit(Connection conn) {
      try {
         if (conn != null && !conn.isClosed()) {
            conn.commit();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void rollback(Connection conn) {
      try {
         if (conn != null && !conn.isClosed()) {
            conn.rollback();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}
