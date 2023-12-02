<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>

<%
    // 사용자가 입력한 아이디와 비밀번호를 받아옵니다.
    String id = request.getParameter("sign_username");
    String password = request.getParameter("sign_password");


    try {
        // 데이터베이스 연결

        // 아이디와 비밀번호가 일치하는 사용자 찾기
        String sql = "SELECT * FROM member WHERE id=? AND password=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공
            session.setAttribute("userId", id); // 세션에 사용자 아이디 저장
            response.sendRedirect("../index.jsp"); // 로그인 성공 시 리디렉션
        } else {
            // 로그인 실패
            response.sendRedirect("login_user.jsp?error=true"); // 로그인 실패 시 에러 메시지와 함께 리디렉션
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) try { rs.close(); } catch (SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
%>
