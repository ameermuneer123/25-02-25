<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View About Sections</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        h2 {
            color: #4b0082;
            text-align: center;
            margin-bottom: 30px;
        }
        .card {
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .card img {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>About Us Sections</h2>
    
    <div class="row">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPassword = "";
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);
                stmt = conn.createStatement();
                String sql = "SELECT * FROM about_us";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
        %>
                <div class="col-md-6">
                    <div class="card">
                        <img src="<%= rs.getString("image_url") %>" class="card-img-top" alt="About Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= rs.getString("title") %></h5>
                            <p class="card-text"><%= rs.getString("description") %></p>
                            <form action="aboutedit.jsp" method="GET" class="mt-2">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-primary">Edit</button>
                            </form>
                        </div>
                    </div>
                </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
