<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%
  String check_productName = request.getParameter("productName");
  // 로직으로 해당 제품 정보 불러오기
%>

<% ProductRepository dao = ProductRepository.getInstance();%>
<% ArrayList<Product> listOfProducts = dao.getAllProducts(); %>
<% ArrayList<Product> filteredList = new ArrayList(); %>


<%
    String sql = "select * from product"; // 조회
    pstmt = conn.prepareStatement(sql); // 연결 생성
    rs = pstmt.executeQuery(); // 쿼리 실행
    while (rs.next()) {
        if (rs.getString("p_name").equals(check_productName.replace("_", " "))) {
            Product product = new Product(); // 새 Product 객체 생성
            // 여기서 product 객체의 필드를 rs에서 얻은 정보로 채워야 합니다.
            product.setPname(rs.getString("p_name"));
            product.setProductId(rs.getString("p_id"));
            product.setUnitPrice(rs.getInt("p_unitPrice"));
            product.setDescription(rs.getString("p_description"));
            product.setCategory(rs.getString("p_category"));
            product.setDeveloper(rs.getString("p_developer"));
            product.setPublisher(rs.getString("p_publisher"));
            product.setThumbnail(rs.getString("p_thumbnail"));
            product.setPicture(rs.getString("p_picture"));
            product.setBiglogo(rs.getString("p_logo"));
            // 그 외 필요한 필드를 설정하세요.

            filteredList.add(product); // Product 객체를 리스트에 추가
        }
    }
%>

<body style="background-color:#212F3C">
    <div style="background-color:#121a21;">
        <nav class="navbar" style="width:900px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:800px; color:white;"><%=check_productName.replace("_", "&nbsp;")%></p>
                </h3>
            </div>
        </nav>
	</div>
    <script>
    $(document).ready(function(){
        $(".show-best-seller").click(function(){
            $("#bestSellerInfo").toggle();
        });
    });
    </script>

</body>

<% NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR")); %>
<% String formattedPrice = formatter.format(filteredList.get(0).getUnitPrice()); %>

<div style="background-color:#212F3C; text-align: center;">
    <div class="navbar navbar-dark bg-dark" style="width:1000px; margin: 0 auto; height:370px; margin-bottom:0px;">
        <div style="width:600px; height:300px; background-color:black; text-align: center;">
            <img src="../<%=filteredList.get(0).getBiglogo()%>" class="img-fluid" alt="game_thumbnail" style="object-fit:contain; width:100%; height:100%;">
        </div>
        <div style="width:350px; height:300px; background-color:black; display: flex; flex-direction: column; text-align:left;">
            <div style="align-self: flex-start;">
                <img src="../<%=filteredList.get(0).getPicture()%>" class="img-fluid" alt="game_biglogo" style="object-fit:contain; width:354px; height:166px;">
                <p style="margin-left:10px; color:white; font-size:13px;"><%=filteredList.get(0).getDescription()%></p>
                <p style="margin-left:10px; color:#00bfff; justify-content:flex-end;">Developer: <%=filteredList.get(0).getDeveloper()%></p>
            </div>
        </div>
    </div>
</div>

<div style="background-color:#212F3C; text-align: center;">
    <div class="navbar navbar-dark bg-dark" style="width:1000px; margin: 0 auto; height:150px; margin-bottom:0px;">
        <div style="background-color:#3B4B59; width:600px; margin-left:10px;">
            <nav class="navbar" style="width:900px; height:80px; margin-bottom:0px">
                <div class="text-center">
                    <h3>
                        <p style="align-items: center; margin-top:5px; margin-right:700px; color:white; font-size:20px;">Buy <%=check_productName.replace("_", "&nbsp;")%></p>
                    </h3>
                </div>
            <div style="margin-left:370px; display: flex; align-items: center; justify-content: space-between;
                    width: 24%; padding: 4px; background-color: #000000; height: 50px;">
            <div style="flex: 1; display: flex; justify-content: center; align-items: center;">
            <span style="font-size: 18px; color:white;"><%=formattedPrice%></span>
            </div>
                <button id="cartButton" style="background-color: #27AE60; color: white; width: 50%; height: 40px;">In Cart</button>
            </div>
            </nav>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#cartButton').click(function() {
            $.ajax({
                url: '../cart/product_cart_add.jsp',
                type: 'POST',
                data: { id: '<%= filteredList.get(0).getProductId() %>' },
                success: function(data) {
                    // AJAX 호출이 성공하면 장바구니 페이지로 리디렉션
                    window.location.href = '../cart/product_cart.jsp';
                },
                error: function(xhr, status, error) {
                    // 에러 처리
                    alert("에러 발생: " + error);
                }
            });
        });
    });
</script>