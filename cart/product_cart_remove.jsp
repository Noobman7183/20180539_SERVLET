<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<%
    String productId = request.getParameter("id");

    if (productId == null || productId.trim().equals("")) {
        response.sendRedirect("../product_cart.jsp");
        return;
    }


    try {

        // 장바구니에서 해당 상품 제거
        String sql = "DELETE FROM cart WHERE p_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
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
