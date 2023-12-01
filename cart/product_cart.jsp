<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="java.util.Date"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<html>
<head>
    <style>
        td, th{
            border: red;
        }
    </style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <%
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR"));
	String cartId = session.getId(); // 세션 정보 얻기
    %>
<title>장바구니</title>
</head>
<body style="background-color:#212F3C;">
	<jsp:include page="../top_menu.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">장바구니</p>
                </h3>
            </div>
        </nav>
	</div>
	<div class="container" style="background-color:#121a21;" >
	<div style="padding-top: 50px">
		<table class="table table-borderless">
			<tr>
				<th style="color:white;">상품</th>
				<th style="color:white;">가격</th>
				<th></th>
				<th style="color:white;">비고</th>
			</tr>
			<%				
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice();
					sum = sum + total;
			%>
			<tr>
                <td style="color:white;"><img src="../<%=product.getThumbnail()%>", class="img-fluid" alt="game_thumbnail" style="width:120px; height:45px;"> <%=product.getPname()%></td>
				<td style="color:white;"><%=formatter.format(product.getUnitPrice())%></td>
                <td></td>
				<td style="color:white;"><a href="product_cart_remove.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">제거</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th></th>
				<th></th>
				<th style="color:white;">예상 합계</th>
				<th style="color:white;"><%=formatter.format(sum)%></th>
			</tr>
		</table>
        	<div class="row">
		<table width="100%">
			<tr>
                <td align="right">
                    <a href="../order/order_info.jsp?cartId=<%= cartId %>" class="btn btn-success">구매</a>
                    <a href="product_cart_remove_all.jsp?cartId=<%=cartId%>" class="btn btn-danger" style="margin-right:200px;">모든 항목 제거</a>
                </td>
			</tr>
		</table>
	</div>
        <td align="left"><a href="../index.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a></td>
	</div>
	<hr>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>
