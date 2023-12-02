<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.Locale"%>
<%@ include file="../db/db_conn.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
	String cartId = session.getId(); // 세션 id 얻기

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR"));

    ArrayList<Product> cartList = new ArrayList<Product>();
    int sum = 0;

	Cookie[] cookies = request.getCookies(); // 쿠키 배열로부터 정보 얻기

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) { // 길이만큼 쿠키 읽기
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8"); // 원본 형태 문자열로 반환
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}

    try {

        // 모든 장바구니 항목 조회
        String sql = "SELECT * FROM cart";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            Product product = new Product();
            product.setProductId(rs.getString("p_id"));
            product.setPname(rs.getString("p_name"));
            product.setUnitPrice(rs.getInt("p_unitPrice"));
            product.setThumbnail(rs.getString("p_thumbnail"));
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
%>


<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body style="background-color:#212F3C;">
	<jsp:include page="../top_menu.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">주문 정보</p>
                </h3>
            </div>
        </nav>
	</div>
	<div class="container col-8 alert" style="background-color:#121a21; color:white;">
	   <div class="text-center ">
		<h1>영수증</h1>
	   </div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
			우편번호 : <% out.println(shipping_zipCode);%><br> 
			주소 : <% out.println(shipping_addressName);%>(<% out.println(shipping_country);%>)<br>
		</div>
	</div>
	<div>
		<table class="table table-hover custom-table">			
		<tr style="color:white;">
			<th>상품</th>
			<th class="text-center"></th>
			<th class="text-center"></th>
			<th>가격</th>
		</tr>
        <% 
        for(Product product : cartList) { // 반복문 안에서 product 객체 사용
        %>
		<tr style="color:white;">
			<td><img src="../<%=product.getThumbnail()%>", class="img-fluid" alt="game_thumbnail" style="width:120px; height:45px;"> <%=product.getPname()%></td>
			<td></td>
            <td></td>
			<td><%=formatter.format(product.getUnitPrice())%></td>
		</tr>
		<%
			}
		%>
		<tr style="color:white;">
			<td> </td>
			<td> </td>
			<td class="text-right">	<strong>총액: </strong></td>
			<td class="text-center"><strong><%=formatter.format(sum)%> </strong></td>
		</tr>
		</table>
		
			<a href="order_info.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
			<a href="order_end.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
			<a href="order_cancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>			
	   </div>
	</div>	
</body>
</html>