<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>


<script>
$(document).ready(function(){
    $(".show-best-seller").click(function(){
        $("#bestSellerInfo").toggle();
    });
});
</script>

<%
  String check_productName = request.getParameter("productName");
  // 로직으로 해당 제품 정보 불러오기
%>

<% ArrayList<Product> listOfProducts = productDAO.getAllProducts(); %>

<body>
    <div style="background-color:#121a21;">
        <nav class="navbar" style="width:900px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:800px; color:white;"><%=check_productName.replace("_", "&nbsp;")%></p>
                </h3>
            </div>
        </nav>
	</div>
</body>

<div style="background-color:#212F3C; text-align: center;">
    <% for (int i = 0; i< listOfProducts.size(); i++){ 
        Product product = listOfProducts.get(i);%>
        <a href="index.jsp?productName=<%=product.getPname().replace(" ", "_")%>" style="text-decoration: none; color: inherit; display: inline-block;">
            <nav class="navbar navbar-dark bg-dark" style="width:900px; margin: 0 auto; height:80px; margin-bottom:10px">
                <div class="text">
                    <img src="<%=product.getBiglogo()%>", class="img-fluid" alt="portal2_thumbnail">
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