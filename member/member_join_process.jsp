<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ include file="../db/db_conn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터 받기
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String confirmPassword = request.getParameter("confirmPassword");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	// 비밀번호 재확인 검증
	if(!password.equals(confirmPassword)) {
		// 비밀번호가 서로 다르면 오류 메시지를 표시하고 회원가입 폼으로 리디렉션
		response.sendRedirect("../login/member_join.jsp?error=passwordMismatch");
		return;
	}

	// 현재 날짜/시간 구하기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String registDay = sdf.format(new Date());


	try {

		// 쿼리 준비
		String sql = "INSERT INTO member (id, password, name, gender, birth, mail, phone, address, regist_day) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		// 쿼리 파라미터 설정
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, mail);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, registDay);

		// 쿼리 실행
		pstmt.executeUpdate();

	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		// 리소스 해제
		if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if(conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

	// 세션 체크 후 전체 삭제
	request.getSession().invalidate();

	// 리디렉션
	response.sendRedirect("../index.jsp");
%>
