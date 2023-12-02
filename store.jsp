<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<script>
$(document).ready(function(){
    $(".show-best-seller").click(function(){
        $("#bestSellerInfo").toggle();
    });
});
</script>



<body style="background-color:#121a21;">
    <div id="bestSellerInfo" style="background-color:#212F3C; text-align: center;">
    <h3 style="color:white;">Best Seller Information</h3>
    <p style="color:white;">Here is the information about the best selling product...</p>
        <%
            String sql = "select * from product"; // 조회
            pstmt = conn.prepareStatement(sql); // 연결 생성
            rs = pstmt.executeQuery(); // 쿼리 실행
            while (rs.next()) { // 결과 ResultSet 객체 반복
        %>
        <a href="index.jsp?productName=<%=rs.getString("p_name") != null ? rs.getString("p_name").replace(" ", "_") : ""%>" style="text-decoration: none; color: inherit; display: inline-block;">
            <nav class="navbar navbar-dark bg-dark" style="width:1000px; margin: 0 auto; height:80px; margin-bottom:10px">
                <div class="text">
                    <img src="<%=rs.getString("p_thumbnail")%>", class="img-fluid" alt="game_thumbnail" style="width:120px; height:45px;">
                </div>
                <p style="margin-left:10px; color:white;"><%=rs.getString("p_name")%></p>
                <%
                    java.text.NumberFormat formatter = java.text.NumberFormat.getInstance();
                %>
                <p style="margin-left:auto; margin-right:10px; color:white;">\ <%=formatter.format(rs.getInt("p_unitPrice"))%></p>            
            </nav>
        </a>
        <%
    }
    if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
    %>
</div>
</body>

<!--
<nav class="navbar navbar-expand navbar-dark bg-dark" style="height:20;">    
	<div style="margin-left:300px">
        <button type="button" class="btn btn-secondary btn-sm">신규 및 인기 신제품</button>
	</div>
    
    <div>
        <button type="button" class="btn btn-secondary btn-sm show-best-seller">최고 인기 제품</button>
	</div>
    
    <div>
        <button type="button" class="btn btn-secondary btn-sm">인기 출시 예정 상품</button>
	</div>

    <div>
        <button type="button" class="btn btn-secondary btn-sm">특별 할인</button>
	</div>
</nav>
-->

<%
    ProductRepository dao = ProductRepository.getInstance();
    ArrayList<Product> listOfProducts = dao.getAllProducts();
%>
