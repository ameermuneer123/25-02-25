<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ECOURSES - Online Courses HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center py-4 px-xl-5">
            <div class="col-lg-3">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0"><span class="text-primary">E</span>COURSES</h1>
                </a>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-map-marker-alt text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Our Office</h6>
                        <small>123 Street, New York, USA</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                        <small>info@example.com</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-phone text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Call Us</h6>
                        <small>+012 345 6789</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Subjects</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Web Design <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">HTML</a>
                                <a href="" class="dropdown-item">CSS</a>
                                <a href="" class="dropdown-item">jQuery</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">Apps Design</a>
                        <a href="" class="nav-item nav-link">Marketing</a>
                        <a href="" class="nav-item nav-link">Research</a>
                        <a href="" class="nav-item nav-link">SEO</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">E</span>COURSES</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="about.jsp" class="nav-item nav-link">About</a>
                            <a href="course.html" class="nav-item nav-link">Courses</a>
                            <a href="teacher.jsp" class="nav-item nav-link">Teachers</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Blog</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="blog.html" class="dropdown-item">Blog List</a>
                                    <a href="single.html" class="dropdown-item">Blog Detail</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                            <a href="register.jsp" class="nav-item nav-link">Register</a>
                            <a href="login.jsp" class="nav-item nav-link">Login</a>
                        </div>
                        
                        <a class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block" href="join.jsp">Join Now</a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<div class="container-fluid p-0 pb-5 mb-5">
    <div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators">
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "root";
                String dbPassword = "";
                int index = 0;

                try {
                    // Load MySQL driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Connect to database
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    
                    // Query to fetch slides
                    String sql = "SELECT * FROM carousel ORDER BY id";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    if (!rs.isBeforeFirst()) { 
                        out.println("<p>No slides found in the database.</p>"); 
                    }

                    while (rs.next()) {
                        String activeClass = (index == 0) ? "active" : "";
            %>
            <li data-target="#header-carousel" data-slide-to="<%= index %>" class="<%= activeClass %>"></li>
            <%
                        index++;
                    }
                    rs.beforeFirst(); // Reset ResultSet for the next loop
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p style='color: red;'>Error fetching slides: " + e.getMessage() + "</p>");
                }
            %>
        </ol>
        <div class="carousel-inner">
            <%
                index = 0;
                if (rs != null) { // Check if rs is initialized before using it
                    while (rs.next()) {
                        String activeClass = (index == 0) ? "active" : "";
                        String imageUrl = rs.getString("image_url");
                        String title = rs.getString("title");
                        String subtitle = rs.getString("subtitle");
            %>
            <div class="carousel-item <%= activeClass %>" style="min-height: 300px;">
                <img class="position-relative w-100" src="<%= imageUrl %>" style="min-height: 300px; object-fit: cover;">
                <div class="carousel-caption d-flex align-items-center justify-content-center">
                    <div class="p-5" style="width: 100%; max-width: 900px;">
                        <h5 class="text-white text-uppercase mb-md-3"><%= title %></h5>
                        <h1 class="display-3 text-white mb-md-4"><%= subtitle %></h1>
                    </div>
                </div>
            </div>
            <%
                        index++;
                    }
                } else {
                    out.println("<p style='color: red;'>No data available in the ResultSet.</p>");
                }
            %>
        </div>
    </div>
</div>

<%
    // Close database resources
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>



 <%@ page import="java.sql.*" %>
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="row align-items-center">
            <%
                // Database connection variables
                
                PreparedStatement pstmt = null;

                try {
                    // Load MySQL JDBC Driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish Connection
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // SQL Query
                    String sql = "SELECT * FROM about_us ORDER BY id LIMIT 1"; 
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    // Check if there is data before closing ResultSet
                    if (rs.next()) {
                        // Store values in variables before closing ResultSet
                        String imageUrl = rs.getString("image_url");
                        String title = rs.getString("title");
                        String description = rs.getString("description");
                    %>

                    <div class="col-lg-5">
                        <img class="img-fluid rounded mb-4 mb-lg-0" src="<%= (imageUrl != null) ? imageUrl : "default.jpg" %>" alt="About Us Image">
                    </div>
                    <div class="col-lg-7">
                        <div class="text-left mb-4">
                            <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">About Us</h5>
                            <h1><%= title %></h1>
                        </div>
                        <p><%= description %></p>
                    </div>

                    <%
                    } else {
                        out.println("<p>No data available.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Close resources safely
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close(); // Close PreparedStatement
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</div>


     

<!-- Category Section Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Subjects</h5>
            <h1>Explore Top Subjects</h1>
        </div>
        <div class="row">
            <!-- Web Design Category -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="cat-item position-relative overflow-hidden rounded mb-2">
                    <img class="img-fluid" src="img/cat-1.jpg" alt="">
                    <a class="cat-overlay text-white text-decoration-none" href="#" 
                       data-bs-toggle="modal" data-bs-target="#categoryModal" 
                       data-title="Web Design" 
                       data-desc="Web design is the planning and creation of websites. This includes a number of separate skills that all fall under the umbrella of web design. Some examples of these skills are information architecture, user interface, site structure, navigation, layout, colors, fonts, and overall imagery." 
                       data-img="img/cat-1.jpg" 
                       data-video="https://www.youtube.com/embed/qthkkHPNAYQ?start=5"
                       data-price="2000"> 
                        <h4 class="text-white font-weight-medium">Web Design</h4>
                        <span>&#8377;2000</span>
                    </a>
                </div>
            </div>
            
            <!-- Data Science Category -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="cat-item position-relative overflow-hidden rounded mb-2">
                    <img class="img-fluid" src="img/cat-2.jpg" alt="">
                    <a class="cat-overlay text-white text-decoration-none" href="#" 
                       data-bs-toggle="modal" data-bs-target="#categoryModal" 
                       data-title="Data Science" 
                       data-desc="Data science is an interdisciplinary field that uses scientific methods, processes, algorithms, and systems to extract knowledge and insights from structured and unstructured data. In simpler terms, data science is about obtaining, processing, and analyzing data to gain insights for many purposes." 
                       data-img="img/cat-2.jpg" 
                       data-video="https://www.youtube.com/embed/FsSrzmRawUg"
                       data-price="2500"> 
                        <h4 class="text-white font-weight-medium">Data Science</h4>
                        <span>&#8377;2500</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Category Section End -->

<!-- Bootstrap Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="categoryModalLabel">Category Title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img id="categoryImg" src="" class="img-fluid mb-3" alt="">
                <div class="text-center mt-4">
                    <a href="#" id="purchaseNowBtn" class="btn btn-primary">Purchase Now</a>
                </div>
                <p id="categoryDesc"></p>
                <div id="videoContainer" class="mt-3">
                    <iframe id="categoryVideo" width="100%" height="315" src="" frameborder="0" allowfullscreen></iframe>
                </div>
                
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    var categoryModal = document.getElementById('categoryModal');
    categoryModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var title = button.getAttribute('data-title');
        var desc = button.getAttribute('data-desc');
        var imgSrc = button.getAttribute('data-img');
        var videoSrc = button.getAttribute('data-video');
        var price = button.getAttribute('data-price');

        document.getElementById('categoryModalLabel').textContent = title;
        document.getElementById('categoryDesc').textContent = desc;
        document.getElementById('categoryImg').src = imgSrc;
        document.getElementById('categoryVideo').src = videoSrc;

        // Ensure the Rupee symbol displays correctly
        var purchaseBtn = document.getElementById('purchaseNowBtn');
        purchaseBtn.href = "purchasenow.jsp?courseTitle=" + encodeURIComponent(title) + "&coursePrice=" + encodeURIComponent("₹" + price);
    });

    categoryModal.addEventListener('hidden.bs.modal', function () {
        document.getElementById('categoryVideo').src = "";
    });
</script>



   <!-- Courses Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Courses</h5>
            <h1>Our Popular Courses</h1>
        </div>
        <div class="row">
            <!-- Web Design Course -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img class="img-fluid" src="img/course-1.jpg" alt="">
                    <div class="bg-secondary p-4">
                        <div class="d-flex justify-content-between mb-3">
                            <small class="m-0"><i class="fa fa-users text-primary mr-2"></i>25 Students</small>
                            <small class="m-0"><i class="far fa-clock text-primary mr-2"></i>01h 30m</small>
                        </div>
                        <a class="h5" href="#" data-toggle="modal" data-target="#courseModal1">Graphic Design </a>
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i>4.5 <small>(250)</small></h6>
                                <h5 class="m-0">&#8377;3500/month</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Marketing Course -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="rounded overflow-hidden mb-2">
                    <img class="img-fluid" src="img/course-2.jpg" alt="">
                    <div class="bg-secondary p-4">
                        <div class="d-flex justify-content-between mb-3">
                            <small class="m-0"><i class="fa fa-users text-primary mr-2"></i>25 Students</small>
                            <small class="m-0"><i class="far fa-clock text-primary mr-2"></i>01h 30m</small>
                        </div>
                        <a class="h5" href="#" data-toggle="modal" data-target="#courseModal2"> Digital Marketing</a>
                        <div class="border-top mt-4 pt-4">
                            <div class="d-flex justify-content-between">
                                <h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i>4.5 <small>(250)</small></h6>
                                <h5 class="m-0">&#8377;1500/month</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Add More Courses Here with unique data-target -->

        </div>
    </div>
</div>
<!-- Courses End -->

<!-- Course Modals -->
<!-- Web Design & Development Modal -->
<div class="modal fade" id="courseModal1" tabindex="-1" role="dialog" aria-labelledby="courseModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="courseModalLabel1">Graphic Design</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Master the principles of graphic design, including typography, color theory, branding, and Adobe Creative Suite.</p>
                <p><strong>Duration:</strong> 3 Months</p>
                <p><strong>Price:</strong> ₹3500/month</p>
                <p><strong>Rating:</strong> 4.7 ⭐ (280 reviews)</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="enroll.jsp?course=graphicdesign" class="btn btn-primary">Enroll Now</a>
            </div>
        </div>
    </div>
</div>


<!-- Marketing Course Modal -->
<div class="modal fade" id="courseModal2" tabindex="-1" role="dialog" aria-labelledby="courseModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="courseModalLabel2">Digital Marketing</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Learn digital marketing strategies, including SEO, PPC advertising, social media marketing, email marketing, and content marketing.</p>
                <p><strong>Duration:</strong> 2 Months</p>
                <p><strong>Price:</strong> ₹1500/month</p>
                <p><strong>Rating:</strong> 4.6 ⭐ (280 reviews)</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="enroll.jsp?course=digitalmarketing" class="btn btn-primary">Enroll Now</a>
            </div>
        </div>
    </div>
</div>

<!-- Add More Modals Here for Other Courses -->

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <!-- Registration Offers Section -->
<div class="container-fluid bg-registration py-5" style="margin: 90px 0;">
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-lg-7 mb-5 mb-lg-0">
                <div class="row">
                    <%
                        Connection con = null;
                        PreparedStatement ps = null;   
                        try {
                            Class.forName("com.mysql.jdbc.Driver"); // Updated driver
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/study", "root", "");
                            String query = "SELECT * FROM registrationoffers LIMIT 3"; // Fetch max 3 offers
                            ps = con.prepareStatement(query);
                            rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <div class="col-md-12">
                        <div class="offer-card text-center">
                            <h3><%= rs.getString("title") %></h3>
                            <h4><%= rs.getString("discount") %> % Off</h4>
                            <p><%= rs.getString("description") %></p>
                            <p><strong>Feature 1:</strong> <%= rs.getString("feature_1") %></p>
                            <p><strong>Feature 2:</strong> <%= rs.getString("feature_2") %></p>
                            <p><strong>Feature 3:</strong> <%= rs.getString("feature_3") %></p>
                        </div>
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (con != null) con.close();
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                    %>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="card border-0">
                    <!-- You can add a form or image here if needed -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Registration Offers Section End -->
    <%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Teachers</h5>
            <h1>Meet Our Teachers</h1>
        </div>
        <div class="row">
            <%

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/study", "root", "");

                    String sql = "SELECT * FROM teachers";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
            <div class="col-md-6 col-lg-3 text-center team mb-4">
                <div class="team-item rounded overflow-hidden mb-2">
                    <div class="team-img position-relative">
                        <img class="img-fluid" src="<%= rs.getString("image") %>" alt="Teacher Image">
                        <div class="team-social">
                            <% if (rs.getString("twitter") != null && !rs.getString("twitter").isEmpty()) { %>
                                <a class="btn btn-outline-light btn-square mx-1" href="<%= rs.getString("twitter") %>" target="_blank"><i class="fab fa-twitter"></i></a>
                            <% } %>
                            <% if (rs.getString("facebook") != null && !rs.getString("facebook").isEmpty()) { %>
                                <a class="btn btn-outline-light btn-square mx-1" href="<%= rs.getString("facebook") %>" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            <% } %>
                            <% if (rs.getString("linkedin") != null && !rs.getString("linkedin").isEmpty()) { %>
                                <a class="btn btn-outline-light btn-square mx-1" href="<%= rs.getString("linkedin") %>" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                            <% } %>
                        </div>
                    </div>
                    <div class="bg-secondary p-4">
                        <h5><%= rs.getString("name") %></h5>
                        <p class="m-0"><%= rs.getString("designation") %></p>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
                    try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
                }
            %>
        </div>
    </div>
</div>
    <!-- Testimonial Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Testimonial</h5>
                <h1>What Say Our Students</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="owl-carousel testimonial-carousel">
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">The interface is user-friendly and intuitive! I found it easy to navigate between courses and lessons</h4>
                            <img class="img-fluid mx-auto mb-3" src="img/testimonial-1.jpg" alt="">
                            <h5 class="m-0">Client Name</h5>
                            <span>Profession</span>
                        </div>
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">The lessons are well-structured and engaging, with plenty of practical examples</h4>
                            <img class="img-fluid mx-auto mb-3" src="img/testimonial-2.jpg" alt="">
                            <h5 class="m-0">Client Name</h5>
                            <span>Profession</span>
                        </div>
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">The course materials are up-to-date and incredibly helpful for understanding complex topics.</h4>
                            <img class="img-fluid mx-auto mb-3" src="img/testimonial-3.jpg" alt="">
                            <h5 class="m-0">Client Name</h5>
                            <span>Profession</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


    <!-- Blog Start -->
    <!-- 
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-5">
            <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Our Blog</h5>
            <h1>Latest From Our Blog</h1>
        </div>
        <div class="row pb-3">
            <div class="col-lg-4 mb-4">
                <div class="blog-item position-relative overflow-hidden rounded mb-2">
                    <img class="img-fluid" src="img/blog-1.jpg" alt="">
                    <a class="blog-overlay text-decoration-none" href="">
                        <h5 class="text-white mb-3">Lorem elitr magna stet eirmod labore amet labore clita at ut clita</h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="blog-item position-relative overflow-hidden rounded mb-2">
                    <img class="img-fluid" src="img/blog-2.jpg" alt="">
                    <a class="blog-overlay text-decoration-none" href="">
                        <h5 class="text-white mb-3">Lorem elitr magna stet eirmod labore amet labore clita at ut clita</h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="blog-item position-relative overflow-hidden rounded mb-2">
                    <img class="img-fluid" src="img/blog-3.jpg" alt="">
                    <a class="blog-overlay text-decoration-none" href="">
                        <h5 class="text-white mb-3">Lorem elitr magna stet eirmod labore amet labore clita at ut clita</h5>
                        <p class="text-primary m-0">Jan 01, 2050</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
-->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
        <div class="row pt-5">
            <div class="col-lg-7 col-md-12">
                <div class="row">
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        <div class="d-flex justify-content-start mt-4">
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-light btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Our Courses</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Web Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Apps Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Marketing</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Research</a>
                            <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>SEO</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-12 mb-5">
                <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Newsletter</h5>
                <p>Welcome to our latest edition!

We’re excited to share updates, stories, and insights just for you. This month, we’re exploring fascinating topics and bringing you valuable tips to help you stay informed and inspired.</p>
                <div class="w-100">
                    <div class="input-group">
                        <input type="text" class="form-control border-light" style="padding: 30px;" placeholder="Your Email Address">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="row">
            <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                <p class="m-0 text-white">&copy; <a href="#">Domain Name</a>. All Rights Reserved. Designed by <a href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-lg-6 text-center text-md-right">
                <ul class="nav d-inline-flex">
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Privacy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Help</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>