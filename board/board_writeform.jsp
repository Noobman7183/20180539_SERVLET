<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.Board_dto"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
    String sessionId = (String) session.getAttribute("userId");
    String name = (String) request.getAttribute("name");	
    if(name == null || name.equals("")) {
        response.sendRedirect("../login/login_user.jsp");
        return;
    }
%>
<html>
<head>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
   function checkForm() {
     if (!document.newWrite.name.value) {
	alert("성명을 입력하세요.");
	return false;
     }
     if (!document.newWrite.subject.value) {
	alert("제목을 입력하세요.");
	return false;
     }
     if (!document.newWrite.content.value) {
	alert("내용을 입력하세요.");
	return false;
     }		
}
</script>
<body style="background-color:#212F3C;">
    <script>
    var sessionId = '<%= sessionId %>';
    </script>
<jsp:include page="../top_menu.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">글쓰기</p>
                </h3>
            </div>
        </nav>
	</div>

   <div class="container" align="center" style="width:80%; background-color:#121a21; padding:20px;">
     <form name="newWrite" action="./BoardWriteAction.do"
	class="form-horizontal" method=“post” onsubmit="return checkForm()">
	<input name="id" type="hidden" class="form-control" value="<%=sessionId%>">
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;">성명</label>
		<div class="col-sm-3">
			<input name="name" type="text" class="form-control" value="<%=name %>" style="background-color: #223245; color: white;">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;">제목</label>
		<div class="col-sm-5">
			<input name="subject" type="text" class="form-control" style="background-color: #223245; color: white;">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;">내용</label>
		<div class="col-sm-8">
			<textarea name="content" cols="50" rows="5" class="form-control" style="background-color: #223245; color: white;"></textarea>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10 ">
		 	<input type="submit" class="btn btn-primary" value="등록 ">				
			<input type="button" class="btn btn-primary" id="cancelButton" value="취소 ">
		</div>
	</div>
</form>
<hr>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>


<script>
      let cancelButton = document.getElementById("cancelButton");
      if (cancelButton) { 
        cancelButton.addEventListener("click", function() {
          window.location.href = "/BoardListAction.do?pageNum=1";
        });
      }  
</script>