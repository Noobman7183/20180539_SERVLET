<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

pstmt = null;

try {
    // 데이터베이스 연결 및 SQL 쿼리 실행
    String sql = "UPDATE member SET name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    
    // 쿼리 파라미터 설정
    pstmt.setString(1, name);
    pstmt.setString(2, gender);
    pstmt.setString(3, birth);
    pstmt.setString(4, mail);
    pstmt.setString(5, phone);
    pstmt.setString(6, address);
    pstmt.setString(7, id);
    
    // 쿼리 실행
    pstmt.executeUpdate();
} catch(Exception e) {
    e.printStackTrace(); // 오류 처리
} finally {
    // 리소스 해제
    if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}

// 완료 후 리디렉션
response.sendRedirect("../member/member_view.jsp");
%>
