<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<%

    try {

        String sql = "DELETE FROM cart";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace(); // 오류 처리
        response.sendRedirect("../exception/error.jsp");
        return;
    } finally {
        // 자원 해제
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    response.sendRedirect("../cart/product_cart.jsp");
%>