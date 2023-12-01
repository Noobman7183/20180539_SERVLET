<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
부트스트랩 링크….
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp" />
	<div class="jumbotron">
	   <div class="container">
		<h1 class="display-3">배송 정보</h1>
	   </div>
	</div>
	<div class="container">
        <form action="order_info_process.jsp" class="form-horizontal" method="post">
	        <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
	        <div class="form-group row">
	            <label class="col-sm-2">성명</label>
	                <div class="col-sm-3">
	            <input name="name" type="text" class="form-control" />
	                </div>
            </div>
    <div class="form-group row">
        <label class="col-sm-2">신용카드 번호</label>
        <div class="col-sm-3">
            <input name="card_number" type="text" class="form-control" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2">유효기간</label>
        <div class="col-sm-3">
            <select name="card_date_mon" class="form-control">
                <option value="">--</option>
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
                <option value="4">04</option>
                <option value="5">05</option>
                <option value="6">06</option>
                <option value="7">07</option>
                <option value="8">08</option>
                <option value="9">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2"></label>
        <div class="col-sm-3">
            <select name="card_date_year" class="form-control">
                <option value="">--</option>
                <% for(int year = 2023; year <= 2048; year++) { %>
                    <option value="<%= year %>"><%= year %></option>
                <% } %>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2">보안 코드</label>
        <div class="col-sm-3">
            <input name="card_security_num" type="text" class="form-control" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2">국가명</label>
        <div class="col-sm-3">
            <select name="country" class="form-control">
                <option value="">국가를 선택하세요</option>
                <option value="South Korea">대한민국</option>
                <option value="China">중국</option>
                <option value="United States">미국</option>
                <option value="Japan">일본</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2">우편번호</label>
        <div class="col-sm-3">
            <input name="zipCode" type="text" class="form-control" />
        </div>
    </div>
	<div class="form-group row">
	   <label class="col-sm-2">청구지 주소</label>
	     <div class="col-sm-5">
		<input name="addressName" type="text" class="form-control" />
	     </div>
	</div>
	<div class="form-group row">
	   <div class="col-sm-offset-2 col-sm-10 ">
	     <a href="../cart/product_cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
		<input type="submit" class="btn btn-primary" value="등록" />
		<a href="order_cancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
	   </div>
	</div>
  </form>
  </div>
</body>
</html>
