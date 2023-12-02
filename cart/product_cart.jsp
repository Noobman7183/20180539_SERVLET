<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ include file="../db/db_conn.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>장바구니</title>
</head>
<body style="background-color:#212F3C;">
    <jsp:include page="../top_menu.jsp" />
    <div class="container" style="background-color:#121a21;">
        <div style="padding-top: 50px">
            <table class="table table-borderless">
                <tr>
                    <th style="color:white;">상품</th>
                    <th style="color:white;">가격</th>
                    <th style="color:white;">비고</th>
                </tr>
                <%
                    String cartId = session.getId(); 
                    ArrayList<Product> cartList = new ArrayList<Product>();
                    int sum = 0;
                    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR"));
                    
                    try {
                        String sql = "SELECT * FROM cart";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();
                        while (rs.next()) {
                            Product product = new Product();
                            product.setProductId(rs.getString("p_id"));
                            product.setPname(rs.getString("p_name"));
                            product.setUnitPrice(rs.getInt("p_unitPrice"));
                            product.setThumbnail(rs.getString("p_thumbnail"));
                            // 필요한 나머지 정보를 product 객체에 설정
                            cartList.add(product);
                            sum += product.getUnitPrice();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace(); // 오류 처리
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }

                    for (Product product : cartList) {
                        // 상품 목록 출력
                %>
                <tr>
                    <td style="color:white;">
                        <img src="../<%=product.getThumbnail()%>", class="img-fluid" alt="game_thumbnail" style="width:120px; height:45px;"> <%=product.getPname()%>
                    </td>
                    <td style="color:white;"><%=formatter.format(product.getUnitPrice())%></td>
                    <td style="color:white;"><a href="product_cart_remove.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">제거</a></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th></th>
                    <th style="color:white;">예상 합계</th>
                    <th style="color:white;"><%=formatter.format(sum)%></th>
                </tr>
            </table>
            <div style="text-align: right;">
                <a href="../order/order_info.jsp" class="btn btn-success">구매</a>
                <a href="product_cart_remove_all.jsp" class="btn btn-danger" style="margin-right:200px;">모든 항목 제거</a>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
