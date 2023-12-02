<%@ page contentType="text/html; charset=utf-8"%>
<% String currentPage = "store"; // 현재 페이지를 설정합니다. %>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
    session = request.getSession();
    String userId = (String) session.getAttribute("userId"); // 로그인 시 저장된 사용자 ID
    boolean isLoggedIn = (userId != null); // 로그인 여부 체크
%>

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
      let communityButton = document.getElementById("communityButton");
      if (communityButton) { // Always good to check
        communityButton.addEventListener("click", function() {
          window.location.href = "/BoardListAction.do?pageNum=1";
        });
      }
      let loginButton = document.getElementById("loginButton");
      if (loginButton) { // Always good to check
        loginButton.addEventListener("click", function() {
          window.location.href = "../login/login_user.jsp";
        });
      }
      let adminButton = document.getElementById("adminButton");
      if (adminButton) { // Always good to check
        adminButton.addEventListener("click", function() {
          window.location.href = "../admin/index_ad.jsp";
        });
      }
    document.getElementById('logoutButton')?.addEventListener('click', function() {
        window.location.href = '../login/logout_process.jsp'; // 로그아웃 처리 페이지로 이동
    });
    });
</script>

<nav class="navbar navbar-expand navbar-dark bg-dark" style="height:80;">
    <div class="text-center" style="margin-left:300px;">
        <img src="..\image\NotSTEAM.png" class="img-fluid" alt="logo_image" style="width:50%;">
    </div>
    
	<div class="dropdown">
        <button id="storeButton" class="btn btn-dark dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            상점
        </button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="/index.jsp">홈</a>
        <!--
        <a class="dropdown-item" href="#">탐색 대기열</a>
        <a class="dropdown-item" href="#">찜 목록</a>
        <a class="dropdown-item" href="#">포인트 상점</a>
        <a class="dropdown-item" href="#">뉴스</a>
        <a class="dropdown-item" href="#">통계</a>
        -->
     </ul>
	</div>
    
    <div class="dropdown">
        <button id="communityButton" class="btn btn-dark dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		커뮤니티
  		</button>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="/BoardListAction.do?pageNum=1">홈</a></li>
        <!--
        <li><a class="dropdown-item" href="#">토론</a></li>
        <li><a class="dropdown-item" href="#">창작마당</a></li>
        <li><a class="dropdown-item" href="#">장터</a></li>
        <li><a class="dropdown-item" href="#">방송</a></li>
-->
     </ul>
	</div>
    <div>
    <% if(!isLoggedIn) { %>
        <!-- 로그인되지 않았을 때 보여줄 내용 -->
        <button id="loginButton" class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
            로그인
        </button>
    <% } else { %>
        <!-- 로그인되었을 때 보여줄 내용 -->
        <button id="logoutButton" class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
            로그아웃
        </button>
    <% } %>
	</div>
    <!--
    <div>
  		<button class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
    		지원
  		</button>
	</div>
    -->
    
    <div>
  		<button id="adminButton" class="btn btn-dark" type="button" aria-haspopup="true" aria-expanded="false">
    	    관리자 모드
  		</button>
	</div>
</nav>
<div style="background-color:black;">
            <% if(isLoggedIn) { %>
        <span style="color: white; margin-left:20px;">환영합니다, <%=userId%>!</span>
        <% } %>
</div>
