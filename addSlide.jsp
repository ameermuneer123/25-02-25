<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Carousel Slide</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa; 
            font-family: Arial, sans-serif; 
        }
        .container {
            max-width: 700px;
            margin-top: 50px;
        }
        h2 {
            color: #4b0082;
            text-align: center;
            margin-bottom: 30px;
        }
        .card {
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            width: 100%;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Carousel Slide</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String imageUrl = request.getParameter("imageUrl");
            String title = request.getParameter("title");
            String subtitle = request.getParameter("subtitle");

            // Database connection details
            Connection conn = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";  
            String dbUser = "root";  
            String dbPassword = "";  

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish database connection
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                // SQL query to insert the new slide into the carousel table
                String sql = "INSERT INTO carousel (image_url, title, subtitle) VALUES (?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, imageUrl);  
                stmt.setString(2, title);   
                stmt.setString(3, subtitle);  

                // Execute the update
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<div class='alert alert-success text-center'>New slide added successfully!</div>");
                } else {
                    out.println("<div class='alert alert-danger text-center'>Failed to add the slide.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
            } finally {
                // Close resources
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    %>

    <div class="card">
        <form action="addSlide.jsp" method="POST">
            <div class="mb-3">
                <label for="imageUrl" class="form-label">Image URL:</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" required>
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">Title:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>

            <div class="mb-3">
                <label for="subtitle" class="form-label">Subtitle:</label>
                <input type="text" class="form-control" id="subtitle" name="subtitle" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Slide</button>
        </form>
    </div>

    <br>
    <a href="Managecarousel.jsp" class="btn btn-link">View All Slides</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
