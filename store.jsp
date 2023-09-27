<%@ page contentType = "text/html;charset=utf-8" %>
<% String currentPage = "store"; // 현재 페이지를 설정합니다. %>

<body>	<%-- JSP 주석 처리 --%>
	 <%-- CLASS는 스타일 적용시에 사용 되는 이름, 중첩 가능 --%>
<%! String greeting = "Welcome to Web Shopping Mall";
      String tagline = "Welcome to Web Market!";%>
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