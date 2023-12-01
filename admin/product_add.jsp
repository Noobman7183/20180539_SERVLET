<%@ page contentType="text/html;charset=utf-8"%>
<html>
<script type ="text/javascript" src ="../js/validation.js"></script>
<body>
	<jsp:include page="top_menu_ad.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
    </div>
    <div class="container">
        <form name="newProduct" action="./product_add_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" >
				</div>
			</div>
            <div class="form-group row">
                <label class="col-sm-2">이미지 썸네일</label>
                <div class="col-sm-5">
                    <input type="file" name="productThumbnail" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">게임 이미지 예시</label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">게임 로고</label>
                <div class="col-sm-5">
                    <input type="file" name="productLogo" class="form-control">
                </div>
            </div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">개발사</label>
				<div class="col-sm-3">
					<input type="text" name="developer" class="form-control">
				</div>
			</div>
            <div class="form-group row">
				<label class="col-sm-2">배급사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">장르</label>
				<div class="col-sm-3">
					<input type="text" name="genre" class="form-control" >
				</div>
			</div>
            <div class="form-group row">
               <div class="col-sm-offset-2 col-sm-10 ">
                    <input type ="button" class="btn btn-primary" value="등록" onclick ="CheckAddProduct()">
                    <a href="../login/logout.jsp" class="btn btn-sm btn-success pull-right">로그아웃</a>
                </div>
            </div>
		</form>
    </div>
</body>
</html>
