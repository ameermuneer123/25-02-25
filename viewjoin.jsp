<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
        }
        .course-title {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand mx-auto" href="#">Student Management</a>
    </nav>

    <div class="container">
        <div class="card p-4">
            <h2>All Students by Course</h2>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/study";
                String dbUser = "root";
                String dbPassword = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT * FROM joinnow ORDER BY course, name";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    String currentCourse = "";
                    
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String course = rs.getString("course");
                        String phone = rs.getString("phone");

                        // Display course heading when course changes
                        if (!course.equals(currentCourse)) {
                            if (!currentCourse.equals("")) {
                                out.println("</tbody></table>"); // Close previous table
                            }
                            out.println("<div class='course-title'>" + course + "</div>");
                            out.println("<table class='table table-striped table-hover'>");
                            out.println("<thead class='table-dark'>");
                            out.println("<tr><th>Name</th><th>Email</th><th>Phone</th></tr>");
                            out.println("</thead><tbody>");
                            currentCourse = course;
                        }

                        out.println("<tr>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>" + phone + "</td>");
                        out.println("</tr>");
                    }

                    if (!currentCourse.equals("")) {
                        out.println("</tbody></table>"); // Close the last table
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
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

</body>
</html>
