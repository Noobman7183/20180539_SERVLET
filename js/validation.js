function CheckAddProduct() {

	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 상품아이디 체크
	if (productId.value.length < 1 || isNaN(productId.value)){
		alert("[상품 코드]\n최소 1자리 이상의 숫자를 입력하세요")
		return false;
    }
	// 상품명 체크
	if (name.value.length < 1 || name.value.length > 40) {
		alert("[상품명]\n최소 1에서 최대 40자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;


	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}

function CheckAddMember() {
    var id = document.getElementById("id").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var name = document.getElementById("name").value;
    var gender = document.getElementById("gender").value;

    // ID 유효성 검증
    if(id == "") {
        alert("ID를 입력해 주세요.");
        return false;
    }

    // 비밀번호 유효성 검증
    if(password == "") {
        alert("비밀번호를 입력해 주세요.");
        return false;
    }

    // 비밀번호 재확인 검증
    if(password != confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    // 이름 유효성 검증
    if(name == "") {
        alert("이름을 입력해 주세요.");
        return false;
    }

    // 성별 유효성 검증 (선택적)
    if(gender == "") {
        alert("성별을 선택해 주세요.");
        return false;
    }

    // 모든 검증을 통과한 경우 폼 제출
    document.newMember.submit();
}
