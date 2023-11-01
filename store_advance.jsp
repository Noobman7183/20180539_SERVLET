<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<%@ page import="java.util.stream.Collectors"%>

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

<% ArrayList<Product> filteredList = new ArrayList(); %>
<%
for (Product product : listOfProducts) {
    if (product.getPname().equals(check_productName.replace("_", " "))) {
        filteredList.add(product);
    }
}%>
    
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
    <div class="navbar navbar-dark bg-dark" style="width:1000px; margin: 0 auto; height:400px; margin-bottom:0px;">
        <div style="width:600px; height:300px; background-color:black; text-align: center;">
            <img src="<%=filteredList.get(0).getPicture()%>" class="img-fluid" alt="game_thumbnail" style="object-fit:contain; width:100%; height:100%;">
        </div>
        <div style="width:350px; height:300px; background-color:black; display: flex; flex-direction: column; text-align:left;">
            <div style="align-self: flex-start;">
                <img src="<%=filteredList.get(0).getBiglogo()%>" class="img-fluid" alt="game_biglogo" style="object-fit:contain; width:100%; height:auto;">
                <p style="margin-left:10px; color:white; font-size:13px;"><%=filteredList.get(0).getDescription()%></p>
                <p style="margin-left:10px; color:white; justify-content:flex-end;"><%=filteredList.get(0).getManufacturer()%></p>
            </div>
        </div>
    </div>
</div>