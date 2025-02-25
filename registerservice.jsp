<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>

<%
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");  // Updated MySQL driver class
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/study", "root", "");

    // Check if the email already exists
    PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM register WHERE email = ?");
    checkStmt.setString(1, email);
    ResultSet rs = checkStmt.executeQuery();
    rs.next();
    int count = rs.getInt(1);

    if (count > 0) {
%>
        <script type="text/javascript">
            alert("Email already exists. Please login.");
            window.location.href = "login.jsp";
        </script>
<%
    } else {
        // Insert the new user
        String sql = "INSERT INTO register (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, first_name);
        stmt.setString(2, last_name);
        stmt.setString(3, email);
        stmt.setString(4, hashedPassword);

        int rows = stmt.executeUpdate();

        if (rows > 0) {
%>
            <script type="text/javascript">
                alert("Registration successful. Please login.");
                window.location.href = "login.jsp";
            </script>
<%
        } else {
%>
            <script type="text/javascript">
                alert("Registration failed. Please try again later.");
                window.location.href = "register.jsp";
            </script>
<%
        }
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("JDBC Driver not found. Please contact the administrator.");
        window.location.href = "register.jsp";
    </script>
<%
} catch (SQLException e) {
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("Database error: <%= e.getMessage() %>. Please contact the administrator.");
        window.location.href = "register.jsp";
    </script>
<%
} catch (Exception e) {
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("An unexpected error occurred: <%= e.getMessage() %>. Please try again later.");
        window.location.href = "register.jsp";
    </script>
<%
} finally {
    try {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
