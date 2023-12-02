<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String userId = request.getParameter("id");
if (userId != null && !userId.isEmpty()) {
    
    try {
        String sql = "DELETE FROM member WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace(); 
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}

response.sendRedirect("member_view.jsp");

%>