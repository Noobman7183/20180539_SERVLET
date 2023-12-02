<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type ="text/javascript" src ="../js/validation.js"></script>
    
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 회원을 삭제합니다!!") == true)
		   window.location.href = "../member/member_delete.jsp?id=" + id;
		else
		   return;
	}
</script>
    
<script type="text/javascript">
    $(document).ready(function() {
        $('.editbutton').click(function() {
            var id = $(this).data('id');
            window.location.href = '../member/member_update.jsp?id=' + id;
        });

        $('.deleteButton').click(function() {
            var id = $(this).data('id');
            deleteConfirm(id);
        });
    });
</script>
    <jsp:include page="../admin/top_menu_ad.jsp" />
</head>
<body style="background-color:#212F3C;">    

<div id="memberManagement" style="background-color:#212F3C; text-align: center; padding-top:50px;">
        <%
            String sql = "SELECT * FROM member"; // 멤버 정보 조회
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
        %>
        <nav class="navbar navbar-dark bg-dark" style="width:1000px; margin: 0 auto; height:80px; margin-bottom:10px">
            <p style="color:white;">ID: <%=rs.getString("id")%>, 이름: <%=rs.getString("name")%>, 성별: <%=rs.getString("gender")%>, 생일: <%=rs.getString("birth")%>, 가입일: <%=rs.getString("regist_day")%> </p>
            <button class="editButton" data-id="<%=rs.getString("id")%>" style="background-color: #27AE60; color: white; width: 10%; height: 40px;">수정</button>
            <button class="deleteButton" data-id="<%=rs.getString("id")%>" style="background-color: red; color: white; width: 10%; height: 40px;">삭제</button>
        </nav>
        <%
            }
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        %>
    </div>
    <jsp:include page="../admin/footer_ad.jsp" />
</body>
</html>