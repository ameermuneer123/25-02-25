<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Slide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h2 class="text-center">Update Carousel Slide</h2>
        </div>
        <div class="card-body">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                String url = "jdbc:mysql://localhost:3306/study";
                String dbUser = "root";
                String dbPassword = "";

                // Get parameters safely
                String idParam = request.getParameter("id");
                String title = request.getParameter("title");
                String subtitle = request.getParameter("subtitle");
                String imageUrl = request.getParameter("image_url");

                // Debugging: Print parameters
                System.out.println("Received parameters: id=" + idParam + ", title=" + title + ", subtitle=" + subtitle + ", image_url=" + imageUrl);

                // Validate and parse ID
                if (idParam == null || idParam.isEmpty()) {
                    out.println("<div class='alert alert-danger'>Error: Missing slide ID.</div>");
                } else {
                    try {
                        int id = Integer.parseInt(idParam);

                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(url, dbUser, dbPassword);

                        String sql = "UPDATE carousel SET title = ?, subtitle = ?, image_url = ? WHERE id = ?";
                        ps = conn.prepareStatement(sql);
                        ps.setString(1, title);
                        ps.setString(2, subtitle);
                        ps.setString(3, imageUrl);
                        ps.setInt(4, id);

                        int rowsUpdated = ps.executeUpdate(); 

                        if (rowsUpdated > 0) {
                            out.println("<div class='alert alert-success'>Slide updated successfully!</div>");
                        } else {
                            out.println("<div class='alert alert-danger'>Error: Slide update failed.</div>");
                        }
                    } catch (NumberFormatException e) {
                        out.println("<div class='alert alert-danger'>Error: Invalid slide ID.</div>");
                        e.printStackTrace();
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } finally {
                        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            %>
            <a href="Managecarousel.jsp" class="btn btn-secondary mt-3">Back to Slides</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
