<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset - Ministore</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h2 class="text-center mt-4">Password Reset</h2>
            <%
                String email = request.getParameter("email");
                String newPassword = request.getParameter("password");

                if (email != null && newPassword != null && !email.isEmpty() && !newPassword.isEmpty()) {
                    String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    // Database credentials
                    String dbUrl = "jdbc:mysql://localhost:3306/study";
                    String dbUser = "root";
                    String dbPassword = "";

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                        // Check if email exists
                        String checkEmailQuery = "SELECT * FROM register WHERE email = ?";
                        pstmt = conn.prepareStatement(checkEmailQuery);
                        pstmt.setString(1, email);
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            // Update password
                            String updatePasswordQuery = "UPDATE register SET password = ? WHERE email = ?";
                            pstmt = conn.prepareStatement(updatePasswordQuery);
                            pstmt.setString(1, hashedPassword);
                            pstmt.setString(2, email);
                            int rowsUpdated = pstmt.executeUpdate();

                            if (rowsUpdated > 0) {
                                out.println("<div class='alert alert-success' role='alert'>Password has been updated successfully!</div>");
                            } else {
                                out.println("<div class='alert alert-danger' role='alert'>Failed to update the password.</div>");
                            }
                        } else {
                            out.println("<div class='alert alert-danger' role='alert'>Email address not found.</div>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger' role='alert'>An error occurred. Please try again later.</div>");
                    } finally {
                        // Close resources
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    out.println("<div class='alert alert-danger' role='alert'>Invalid input. Please provide both email and password.</div>");
                }
            %>
            <div class="text-center mt-4">
                <a href="login.jsp" class="btn btn-primary">Return to Login</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
