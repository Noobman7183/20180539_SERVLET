<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>

<script>
$(document).ready(function(){
    $(".show-best-seller").click(function(){
        $("#bestSellerInfo").toggle();
    });
});
</script>

<body>	<%-- JSP 주석 처리 --%>
	 <%-- CLASS는 스타일 적용시에 사용 되는 이름, 중첩 가능 --%>
<%! String greeting = "Welcome to Web Shopping Mall";
      String tagline = "Welcome t123123o Web Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
	</div>	
</body>

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

<%
    ProductRepository dao = ProductRepository.getInstance();
    ArrayList<Product> listOfProducts = dao.getAllProducts();
%>

<div id="bestSellerInfo" style="display:none; background-color:#212F3C; text-align: center;">
    <h3 style="color:white;">Best Seller Information</h3>
    <p style="color:white;">Here is the information about the best selling product...</p>
    <% for (int i = 0; i< listOfProducts.size(); i++){ 
        Product product = listOfProducts.get(i);%>
        <a href="index.jsp?productName=<%=product.getPname() != null ? product.getPname().replace(" ", "_") : ""%>" style="text-decoration: none; color: inherit; display: inline-block;">
            <nav class="navbar navbar-dark bg-dark" style="width:900px; margin: 0 auto; height:80px; margin-bottom:10px">
                <div class="text">
                    <img src="<%=product.getThumbnail()%>", class="img-fluid" alt="game_thumbnail" style="width:120px; height:45px;">
                </div>
                <p style="margin-left:10px; color:white;"><%=product.getPname()%></p>
                <%
                    java.text.NumberFormat formatter = java.text.NumberFormat.getInstance();
                    String formattedPrice = formatter.format(product.getUnitPrice());
                %>
                <p style="margin-left:auto; margin-right:10px; color:white;">\ <%=formattedPrice%></p>            
            </nav>
        </a>
        <%
    }
    %>
</div>