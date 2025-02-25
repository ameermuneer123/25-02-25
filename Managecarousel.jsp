<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<html>
<head>
    <title>Manage Slide View</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .slide {
            margin-bottom: 30px;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .slide-img img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Existing Slides</h1>
        <div class="row">
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "root";
                String dbPassword = "";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT * FROM carousel ORDER BY id";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String imageUrl = rs.getString("image_url");
                        String title = rs.getString("title");
                        String subtitle = rs.getString("subtitle");
                        String slideId = rs.getString("id");
            %>
            <div class="col-md-12 slide">
                <div class="row">
                    <div class="col-md-6">
                        <div class="slide-img">
                            <img src="<%= imageUrl %>" alt="Slide Image">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3><%= title %></h3>
                        <p><%= subtitle %></p>
                        <a href="adminedit.jsp?id=<%= slideId %>" class="btn btn-warning">Edit</a>
                        
                        <form action="admindelete.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this slide?');">
                            <input type="hidden" name="slide_id" value="<%= slideId %>">
                            <input type="submit" value="Delete" class="btn btn-danger">
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
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>