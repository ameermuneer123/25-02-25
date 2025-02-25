<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Join Now - ECOURSES</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Join Now Page" name="keywords">
    <meta content="Join Now Page for ECOURSES" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Header -->
    <div class="container-fluid bg-primary py-5 mb-5">
        <div class="text-center text-white">
            <h1 class="display-4 font-weight-bold">Join Now</h1>
            <p class="lead">Start your learning journey today!</p>
        </div>
    </div>

    <!-- Form Section -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-lg p-4">
                    <h3 class="text-center mb-4">Create Your Account</h3>

                    <!-- Form for creating an account -->
                    <form method="post" action="join.jsp">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="course">Select Course</label>
                            <select id="course" name="course" class="form-control" required>
                                <option value="">Choose a course</option>
                                <option value="web_dev">Web Development</option>
                                <option value="data_science">Data Science</option>
                                <option value="graphic_design">Graphic Design</option>
                                <option value="digital_marketing">Digital Marketing</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>

                    <% 
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String name = request.getParameter("name");
                            String email = request.getParameter("email");
                            String course = request.getParameter("course");
                            String phone = request.getParameter("phone");

                            Connection conn = null;
                            PreparedStatement stmt = null;
                            String url = "jdbc:mysql://localhost:3306/study"; // Update DB details
                            String dbUser = "root";
                            String dbPassword = ""; // Set password

                            try {
                                Class.forName("com.mysql.jdbc.Driver"); // Updated driver class
                                conn = DriverManager.getConnection(url, dbUser, dbPassword);
                                String sql = "INSERT INTO joinnow (name, email, course, phone, registration_date) VALUES (?, ?, ?, ?, current_timestamp)";
                                stmt = conn.prepareStatement(sql);
                                stmt.setString(1, name);
                                stmt.setString(2, email);
                                stmt.setString(3, course);
                                stmt.setString(4, phone);

                                int rowsAffected = stmt.executeUpdate();
                                if (rowsAffected > 0) {
                                    out.println("<div class='alert alert-success'>Account created successfully!</div>");
                                } else {
                                    out.println("<div class='alert alert-danger'>Failed to create an account.</div>");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                            } finally {
                                try {
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException se) {
                                    se.printStackTrace();
                                }
                            }
                        }
                    %>

                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="container-fluid bg-dark text-white mt-5 py-4">
        <div class="text-center">
            <p class="m-0">&copy; <a href="#" class="text-primary">ECOURSES</a>. All Rights Reserved.</p>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>
