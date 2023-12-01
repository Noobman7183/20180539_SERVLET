<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../index.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);

	if (product == null) {
		response.sendRedirect("../exception/product_not_found.jsp");
		return; // 여기서 함수를 종료합니다.
	}

	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}

	boolean isProductInCart = false;
	for (Product item : list) {
		if (item.getProductId().equals(id)) {
			isProductInCart = true;
			break;
		}
	}

	if (!isProductInCart) {
		list.add(product);
	}

	// 성공적으로 상품이 추가된 경우, AJAX 호출에 성공 응답을 보냅니다.
	response.setContentType("text/plain");
	response.getWriter().write("Success");
%>
