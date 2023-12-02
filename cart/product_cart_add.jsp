<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<%
    String productId = request.getParameter("id");

    if (productId == null || productId.trim().equals("")) {
        response.sendRedirect("../index.jsp");
        return;
    }

    boolean isProductInCart = false;

    try {

        // 장바구니에 동일한 상품이 있는지 확인
        String sql = "SELECT * FROM cart WHERE p_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();
        isProductInCart = rs.next();

        if (!isProductInCart) {
            // 상품 정보를 가져옵니다.
            sql = "SELECT * FROM product WHERE p_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            ResultSet rsProduct = pstmt.executeQuery();

            if (rsProduct.next()) {
                String productName = rsProduct.getString("p_name");
                int unitPrice = rsProduct.getInt("p_unitPrice");
                String thumbnail = rsProduct.getString("p_thumbnail");

                // 장바구니에 상품 추가
                sql = "INSERT INTO cart (p_id, p_name, p_unitPrice, p_thumbnail) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productId);
                pstmt.setString(2, productName);
                pstmt.setInt(3, unitPrice);
                pstmt.setString(4, thumbnail);
                pstmt.executeUpdate();
            }
            rsProduct.close();
        }

    } catch (SQLException e) {
        e.printStackTrace(); // 오류 처리
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        return;
    } finally {
        // 자원 해제
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    // 성공적으로 상품이 추가된 경우, AJAX 호출에 성공 응답을 보냅니다.
    response.setContentType("text/plain");
    response.getWriter().write(isProductInCart ? "Already in cart" : "Success");
%>
