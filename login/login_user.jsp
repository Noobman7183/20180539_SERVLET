<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<% String error = request.getParameter("error"); %>
<body style="background-color:#212F3C;">
    <jsp:include page="../top_menu.jsp" />
        <%  if (error != null) { %>
    <div class="container" align="center" style="background-color:#181A17; width:600px; height:450px; margin-top:200px;">
    <%
       }
        else{ %>
    <div class="container" align="center" style="background-color:#181A17; width:600px; height:400px; margin-top:200px;">
    <%
        }
    %>
        <div class="col-md-4 col-md-offset-4">
            <h3 class="form-signin-heading" style="color:white; font-size:30px; font-weight:bold; padding:10px;">Sign in</h3>
            <%  if (error != null) { %>
            <h3 class="form-signin-heading" style="color:red; font-size:20px; font-weight:bold; padding:2px;">Login failed.</h3>
            <%
               }
            %>
        </div>
        <form class="form-signin" action="login_user_process.jsp" method="post">
            <div class="form-group">
                <div style="text-align:left;">
                    <label for="inputUserName" style="color:#1999FF; font-weight:bold; margin-top:10px; margin-left:20px;">SIGN IN WITH ACCOUNT NAME</label>
                </div>
                <input type="text" class="form-control" name='sign_username' required autofocus style="width:95%; background-color:#32353C; color:white; border-color:#223245;">
            </div>
            <div class="form-group">
                <div style="text-align:left;">
                    <label for="inputPassword" style="color:#6e6e6e; font-weight:bold; margin-top:10px; margin-left:20px;">PASSWORD</label>
                </div>
                <input type="password" class="form-control" name='sign_password' required style="width:95%; background-color:#32353C; color:white; border-color:#223245;">
            </div>
            <button class="btn btn-lg btn-success" type="submit" style="background-color:#1999FF; border-color:#1999FF; width:50%; margin-top:30px;">Sign in</button>
        </form>
        <form action="member_join.jsp" method="post">
            <button class="btn btn-lg btn-success" type="submit" style="background-color:#1999FF; border-color:#1999FF; width:50%; margin-top:10px;">Create an account</button>
        </form>
    </div>
</body>
</html>