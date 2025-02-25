<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    String url = "jdbc:mysql://localhost:3306/study?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";
    String dbPassword = "";
    
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String imageUrl = request.getParameter("image_url");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "UPDATE about_us SET title = ?, description = ?, image_url = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, description);
        pstmt.setString(3, imageUrl);
        pstmt.setString(4, id);
        
        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            response.sendRedirect("viewabout.jsp?success=true");
        } else {
            response.sendRedirect("viewabout.jsp?error=true");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("viewabout.jsp?error=true");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
