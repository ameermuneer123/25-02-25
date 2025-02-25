<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Admin - Delete Slide</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin - Delete Slide</h1>

        <%
            String slideId = request.getParameter("slide_id");
            Connection conn = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPassword = "";

            if (slideId != null && !slideId.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "DELETE FROM carousel WHERE id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, slideId);
                    int rowsDeleted = stmt.executeUpdate();

                    if (rowsDeleted > 0) {
                        out.println("<div class='alert alert-success'>Slide deleted successfully.</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>Failed to delete the slide. It may not exist.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger'>An error occurred while deleting the slide.</div>");
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.println("<div class='alert alert-warning'>No slide ID provided.</div>");
            }
        %>

        <a href="Managecarousel.jsp" class="btn btn-primary">Back to Manage Slides</a>
    </div>

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
