<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String productId = request.getParameter("id");
if (productId != null && !productId.isEmpty()) {
    
    try {
        String sql = "SELECT p_thumbnail, p_picture, p_logo FROM product WHERE p_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String thumbnail = rs.getString("p_thumbnail");
            String picture = rs.getString("p_picture");
            String logo = rs.getString("p_logo");

            if (thumbnail != null && !thumbnail.isEmpty()) {
                File file = new File(thumbnail);
                if (file.exists()) {
                    file.delete();
                }
            }
            if (picture != null && !picture.isEmpty()) {
                File file = new File(picture);
                if (file.exists()) {
                    file.delete();
                }
            }
            if (logo != null && !logo.isEmpty()) {
                File file = new File(logo);
                if (file.exists()) {
                    file.delete();
                }
            }

            sql = "DELETE FROM product WHERE p_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            pstmt.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace(); 
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}

response.sendRedirect("product_edit.jsp");

%>