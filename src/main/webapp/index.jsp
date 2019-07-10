<%@page import="com.kitri.godinator.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.sendRedirect(request.getContextPath()+"/board/main");

MemberDto memberDto = new MemberDto();

memberDto.setUserId("hwang");
memberDto.setUserName("황희찬");
memberDto.setEmail("hwang@naver.com");

session.setAttribute("userInfo", memberDto);
%>