<%@ page contentType="text/html; charset=utf-8" %>
<%
    // 세션을 가져옴
    session = request.getSession();

    // 세션을 무효화하여 로그아웃 처리
    session.invalidate();

    // 로그인 페이지나 홈페이지로 리디렉션
    response.sendRedirect("../index.jsp"); // 메인 페이지로 돌아감
%>