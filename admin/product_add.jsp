<%@ page contentType="text/html;charset=utf-8"%>
<html>
<script type ="text/javascript" src ="../js/validation.js"></script>
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
    <div class="container" style="background-color:#121a21; color:white; padding:20px;">
        <form name="newProduct" action="./product_add_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" style="background-color:#223245; color:white;" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" style="background-color:#223245; color:white;" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" style="background-color:#223245; color:white;" >
				</div>
			</div>
            <div class="form-group row">
                <label class="col-sm-2">이미지 썸네일</label>
                <div class="col-sm-5">
                    <input type="file" name="productThumbnail" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">게임 이미지 예시</label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">게임 로고</label>
                <div class="col-sm-5">
                    <input type="file" name="productLogo" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control" style="background-color:#223245; color:white;"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">개발사</label>
				<div class="col-sm-3">
					<input type="text" name="developer" class="form-control" style="background-color:#223245; color:white;">
				</div>
			</div>
            <div class="form-group row">
				<label class="col-sm-2">배급사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" style="background-color:#223245; color:white;">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">장르</label>
				<div class="col-sm-3">
					<input type="text" name="genre" class="form-control" style="background-color:#223245; color:white;">
				</div>
			</div>
            <div class="form-group row">
               <div class="col-sm-offset-2 col-sm-10 ">
                    <input type ="button" class="btn btn-primary" value="등록" onclick ="CheckAddProduct()">
                </div>
            </div>
		</form>
    </div>
</body>
</html>
