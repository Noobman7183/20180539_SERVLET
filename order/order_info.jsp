<%@ page contentType="text/html; charset=utf-8"%>

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
                    <p style="margin-right:100px; color:white;">결제 수단</p>
                </h3>
            </div>
        </nav>
	</div>
	<div class="container" style="background-color:#121a21; color:white; width:80%; height:55%; padding:20px;">
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
                <option value="">--</option>
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
	     <a href="../cart/product_cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 뒤로 </a> 
		<input type="submit" class="btn btn-primary btn-success" value="계속" />
		<a href="order_cancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
	   </div>
	</div>
  </form>
  </div>
</body>
</html>
