<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberDelete</title>
</head>
<body>
	
	<div align="center">
		<form action="${contextPath }/admin/memberDelete?memberId=${memberDto.memberId }" method="post">
			<input type="submit" value="삭제하시겠습니까?">
			<input type="button" value="뒤로가기" onclick="history.go(-1)">
		</form>
	</div>
	
</body>
</html>