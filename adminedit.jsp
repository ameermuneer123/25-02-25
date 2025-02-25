<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Slide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/study";
    String dbUser = "root";
    String dbPassword = "";

    // Get ID from request
    String idParam = request.getParameter("id");
    int slideId = -1; // Default invalid value

    if (idParam != null && !idParam.isEmpty()) {
        slideId = Integer.parseInt(idParam);
    }

    String title = "", subtitle = "", imageUrl = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT * FROM carousel WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, slideId);
        rs = ps.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            subtitle = rs.getString("subtitle");
            imageUrl = rs.getString("image_url");
        } else {
            out.println("<div class='alert alert-danger'>Slide not found.</div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h2 class="text-center">Edit Carousel Slide</h2>
        </div>
        <div class="card-body">
            <form action="adminupdate.jsp" method="post">
                <input type="hidden" name="id" value="<%= slideId %>">

                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" value="<%= title %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Subtitle</label>
                    <input type="text" name="subtitle" class="form-control" value="<%= subtitle %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Image URL</label>
                    <input type="text" name="image_url" class="form-control" value="<%= imageUrl %>" required>
                </div>

                <button type="submit" class="btn btn-success">Update Slide</button>
                <a href="manageSlides.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
