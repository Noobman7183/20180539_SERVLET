<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cartId = session.getId(); // 세션 id 얻기

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";

	NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR"));

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
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp" />
	<div class="jumbotron">
	   <div class="container">
		<h1 class="display-3">주문 정보</h1>
	   </div>
	</div>

	<div class="container col-8 alert alert-info">
	   <div class="text-center ">
		<h1>영수증</h1>
	   </div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
			우편번호 : <% out.println(shipping_zipCode);%><br> 
			주소 : <% out.println(shipping_addressName);%>(<% out.println(shipping_country);%>) <br>
		</div>
	</div>
	<div>
		<table class="table table-hover">			
		<tr>
			<th class="text-center">도서</th>
			<th class="text-center">#</th>
			<th class="text-center">가격</th>
			<th class="text-center">소계</th>
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
			<td class="text-center"><em><%=product.getPname()%> </em></td>
			<td class="text-center"></td>
			<td class="text-center"><%=formatter.format(total)%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td> </td>
			<td> </td>
			<td class="text-right">	<strong>총액: </strong></td>
			<td class="text-center text-danger"><strong><%=formatter.format(sum)%> </strong></td>
		</tr>
		</table>
		
			<a href="order_info.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
			<a href="order_end.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
			<a href="order_cancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>			
	   </div>
	</div>	
</body>
</html>