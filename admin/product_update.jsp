<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<script type ="text/javascript" src ="../js/validation.js"></script>
<script>
    // 새 창에서 이미지를 표시하는 함수
    function openImageWindow(imageUrl) {
        window.open(imageUrl, 'Image', 'width=600,height=600');
    }
</script>
<body style="background-color:#212F3C;">
	<jsp:include page="../admin/top_menu_ad.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">상품등록</p>
                </h3>
            </div>
        </nav>
	</div>
    <%@ include file="../db/db_conn.jsp"%>
    <%
        String productId = request.getParameter("id");
        String sql = "select * from product where p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String thumbnailUrl = rs.getString("p_thumbnail");
            String imageUrl = rs.getString("p_picture");
            String logoUrl = rs.getString("p_logo");
    %>
    <div class="container" style="background-color:#121a21; color:white; padding:20px;">
        <form name="newProduct" action="./product_update_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드 (수정 불가!)</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_id")%>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_name")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_unitPrice")%>">
				</div>
			</div>
            <div>
                <button type="button" onclick="openImageWindow('../<%=thumbnailUrl%>')">현재 썸네일 보기</button>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">교체할 썸네일</label>
                <div class="col-sm-5">
                    <input type="file" name="productThumbnail" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_thumbnail")%>">
                </div>
            </div>
            <div>
                <button type="button" onclick="openImageWindow('../<%=imageUrl%>')">현재 이미지 보기</button>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">교체할 이미지</label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_picture")%>">
                </div>
            </div>
            <div>
                <button type="button" onclick="openImageWindow('../<%=logoUrl%>')">현재 로고 보기</button>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">교체할 로고</label>
                <div class="col-sm-5">
                    <input type="file" name="productLogo" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_logo")%>">
                </div>
            </div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control" style="background-color:#223245; color:white;"><%=rs.getString("p_description")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">개발사</label>
				<div class="col-sm-3">
					<input type="text" name="developer" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_developer")%>">
				</div>
			</div>
            <div class="form-group row">
				<label class="col-sm-2">배급사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_publisher")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">장르</label>
				<div class="col-sm-3">
					<input type="text" name="genre" class="form-control" style="background-color:#223245; color:white;" value="<%=rs.getString("p_category")%>">
				</div>
			</div>
            <div class="form-group row">
               <div class="col-sm-offset-2 col-sm-10 ">
                    <input type ="button" class="btn btn-primary" value="등록" onclick ="CheckAddProduct()">
                </div>
            </div>
		</form>
    </div>
    <%
	}
	if (rs != null)
		rs.close();
		if (pstmt != null)
			pstmt.close();
	if (conn != null)
		conn.close();
 %>
</body>
</html>
