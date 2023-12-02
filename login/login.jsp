<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color:#212F3C;">
	<jsp:include page="../top_menu.jsp" />
	<div class="container" align="center" style="background-color:#000000; width:600px; height:400px; margin-top:200px;">
		<div class="col-md-4 col-md-offset-4">
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%> 
        </div>
        <h3 class="form-signin-heading" style="color:white; size:24px; font-weight:bold; padding:10px;">Admin Sign in</h3>
		<form class="form-signin" action="j_security_check" method="post">
			<div class="form-group">
                <div style="text-align:left;">
                <label for="inputUserName" class="sr-only" style="color:#1999FF; font-weight:bold; margin-top:10px; margin-left:20px;">SIGN IN WITH ACCOUNT NAME</label> 
                </div>
				<input type="text" class="form-control" name='j_username' required autofocus style="width:95%; background-color:#223245; color:white; border-color:#223245;">
			</div>
			<div class="form-group">
                <div style="text-align:left;">
				<label for="inputPassword" style="text-align:left; color:#6e6e6e; font-weight:bold; margin-top:10px; margin-left:20px;">PASSWORD</label>                                                                                                                                                
                </div>
				<input type="password" class="form-control" name='j_password' required style="width:95%; background-color:#223245; color:white; border-color:#223245;">
			</div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit" style="background-color:#1999FF; border-color:1999FF; width:50%; margin-top:30px;">Sign in</button>
		</form>
</div>
</body>
</html>
