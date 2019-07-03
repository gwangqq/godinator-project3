<%@page import="com.kitri.godinator.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.sendRedirect(request.getContextPath()+"/board/movewrite");


MemberDto memberDto = new MemberDto();

memberDto.setUserId("gwangq");
memberDto.setUserName("박광규");
memberDto.setEmail("pgg0406@naver.com");

session.setAttribute("userInfo", memberDto);
%>