<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script type ="text/javascript" src ="../js/validation.js"></script>
</head>
<body style="background-color:#212F3C;">
    <jsp:include page="../top_menu.jsp" />
    <div>
        <nav class="navbar" style="width:1300px; margin: 0 auto; height:80px; margin-bottom:0px">
            <div class="text-center">
                <h3>
                    <p style="margin-right:100px; color:white;">회원가입</p>
                </h3>
            </div>
        </nav>
    </div>
    <div class="container" style="background-color:#121a21; color:white; padding:20px;">
        <form name="newMember" action="../member/member_join_process.jsp" class="form-horizontal" method="post">
            <div class="form-group row">
                <label class="col-sm-2">ID</label>
                <div class="col-sm-3">
                    <input type="text" name="id" class="form-control" style="background-color:#223245; color:white;" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호</label>
                <div class="col-sm-3">
                    <input type="password" name="password" class="form-control" style="background-color:#223245; color:white;" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호 재입력</label>
                <div class="col-sm-3">
                    <input type="password" name="confirmPassword" class="form-control" style="background-color:#223245; color:white;" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">이름</label>
                <div class="col-sm-3">
                    <input type="text" name="name" class="form-control" style="background-color:#223245; color:white;" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">성별</label>
                <div class="col-sm-3">
                    <select name="gender" class="form-control" style="background-color:#223245; color:white;">
                        <option value="Male">남성</option>
                        <option value="Female">여성</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">생년월일</label>
                <div class="col-sm-3">
                    <input type="text" name="birth" class="form-control" style="background-color:#223245; color:white;" placeholder="YYYY-MM-DD">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">이메일</label>
                <div class="col-sm-3">
                    <input type="email" name="mail" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">전화번호</label>
                <div class="col-sm-3">
                    <input type="text" name="phone" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">주소</label>
                <div class="col-sm-5">
                    <input type="text" name="address" class="form-control" style="background-color:#223245; color:white;">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="가입하기" onclick ="CheckAddMember()">
                </div>
            </div>
        </form>
    </div>
</body>
</html>
