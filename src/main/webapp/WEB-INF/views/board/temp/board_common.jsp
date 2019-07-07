<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var = "boardCategory" value = "${parameter.boardCategory}"/>
<c:set var = "pg" value = "${parameter.pg}"/>
<c:set var = "key" value = "${parameter.key}"/>
<c:set var = "word" value = "${parameter.word}"/>
<c:set var = "boardNo" value = "${boardNo}"/>
<form id = "commonForm">
	<input type="hidden" name = "boardCategory" id = "boardCategory">
	<input type="hidden" name = "pg" id = "pg">
	<input type="hidden" name = "key" id = "key">
	<input type="hidden" name = "word" id = "word">
	<input type="hidden" name = "boardNo" id = "boardNo">
</form>