<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.Board_dto"%>

<%
     Board_dto notice = (Board_dto) request.getAttribute("board");
     int num = ((Integer) request.getAttribute("num")).intValue();
     int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>고객센터 게시판</title>
</head>
<body style="background-color:#212F3C;">
	<jsp:include page="../top_menu.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">커뮤니티</p>
                </h3>
            </div>
        </nav>
	</div>
   <div class="container" align="center" style="width:80%; background-color:#121a21; padding:20px;">
     <form name="newUpdate"
	action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
	class="form-horizontal" method="post">
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;" >성명</label>
		<div class="col-sm-3">
			<input name="name" class="form-control"	style="background-color: #223245; color: white;" value=" <%=notice.getName()%>">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;">제목</label>
		<div class="col-sm-5">
			<input name="subject" class="form-control" style="background-color: #223245; color: white;" value=" <%=notice.getSubject()%>" >
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="color:white;">내용</label>
		<div class="col-sm-8" style="word-break: break-all;">
			<textarea name="content" class="form-control" cols="50" rows="5" style="background-color: #223245; color: white;"> <%=notice.getContent()%></textarea>
		</div>
	</div>
	<div class="form-group row">
	   <div class="col-sm-offset-2 col-sm-10 ">
		<c:set var="userId" value="<%=notice.getId()%>" />
		<c:if test="${sessionId==userId}">
		<p>
		<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger"> 삭제</a> 
			<input type="submit" class="btn btn-success" value="수정 ">
		</c:if>
		<a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary"> 목록</a>
	   </div>
	</div>
</form>
<hr>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>
