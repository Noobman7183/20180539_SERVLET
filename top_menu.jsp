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
    });
</script>

<nav class="navbar navbar-expand navbar-dark bg-dark" style="height:80;">
    <div class="text-center" style="margin-left:300px;">
        <img src="image\NotSTEAM.png" class="img-fluid" alt="logo_image">
    </div>
    
	<div class="dropdown">
        <button class="btn btn-dark dropdown-toggle<%= currentPage.equals("store") ? " active" : "" %>" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            상점
        </button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="#">홈</a>
        <a class="dropdown-item" href="#">탐색 대기열</a>
        <a class="dropdown-item" href="#">찜 목록</a>
        <a class="dropdown-item" href="#">포인트 상점</a>
        <a class="dropdown-item" href="#">뉴스</a>
        <a class="dropdown-item" href="#">통계</a>
     </ul>
	</div>
    
    <div class="dropdown">
        <button class="btn btn-dark dropdown-toggle<%= currentPage.equals("community") ? " active" : "" %>" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		커뮤니티
  		</button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="#">홈</a></li>
        <li><a class="dropdown-item" href="#">토론</a></li>
        <li><a class="dropdown-item" href="#">창작마당</a></li>
        <li><a class="dropdown-item" href="#">장터</a></li>
        <li><a class="dropdown-item" href="#">방송</a></li>
     </ul>
	</div>
    
    <div>
  		<button class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
    		정보
  		</button>
	</div>

    <div>
  		<button class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
    		지원
  		</button>
	</div>
    
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">테스트</a>
		</div>
	</div>
</nav>
