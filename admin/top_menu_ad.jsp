<%@ page contentType="text/html; charset=utf-8"%>
<% String currentPage = "store"; // 현재 페이지를 설정합니다. %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    .btn.dropdown-toggle::after {
        display: none;
    }
    .btn.active {
        color: #00aaff !important;
        text-decoration: underline !important;
    }
    </style>
</head>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
      let dropdowns = document.querySelectorAll('.dropdown');
      dropdowns.forEach(dropdown => {
        dropdown.addEventListener('mouseover', (e) => {
          dropdown.querySelector('.dropdown-menu').classList.add('show');
        });
        dropdown.addEventListener('mouseout', (e) => {
          dropdown.querySelector('.dropdown-menu').classList.remove('show');
        });
      });
      let storeButton = document.getElementById("storeButton");
      if (storeButton) { // Always good to check
        storeButton.addEventListener("click", function() {
          window.location.href = "/index.jsp";
        });
      }
    });
</script>

<nav class="navbar navbar-expand navbar-dark bg-dark" style="height:80;">
    <div class="text-center" style="margin-left:300px;">
        <img src="image\NotSTEAM.png" class="img-fluid" alt="logo_image">
    </div>

	<div class="dropdown">
        <button id="membermanage" class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            회원 관리
        </button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="/index.jsp">회원 관리</a>
        <a class="dropdown-item" href="#">회원 추가</a>
        <a class="dropdown-item" href="#">회원 수정</a>
        <a class="dropdown-item" href="#">회원 삭제</a>
     </ul>
	</div>
	<div class="dropdown">
        <button id="storemanage" class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            상품 관리
        </button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="/index.jsp">상품 보기</a>
        <a class="dropdown-item" href="product_add.jsp">상품 등록</a>
        <a class="dropdown-item" href="#">상품 수정</a>
        <a class="dropdown-item" href="#">상품 삭제</a>
     </ul>
	</div>
    
    <div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/index.jsp">일반 모드</a>
		</div>
	</div>
    <div class="form-group row">
       <div class="col-sm-offset-2 col-sm-10 ">
            <a href="../login/logout.jsp" class="btn btn-sm btn-success pull-right">로그아웃</a>
        </div>
    </div>
</nav>
