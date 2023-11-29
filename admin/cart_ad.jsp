<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.Product"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

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

    


<% NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("ko", "KR")); %>