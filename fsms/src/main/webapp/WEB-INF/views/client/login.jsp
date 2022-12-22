<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

	<div align="center">
		<form action="${contextPath }/member/login" method="post">
			<div>
				<p>아이디 <span>*</span></p>
				<input type="text" name="memberId">
			</div>
			<div>
				<p>비밀번호 <span>*</span></p>
				<input type="password" name="password">
			</div>
			<div align="right">
				<button type="submit">로그인</button>
			</div>
		</form>
	</div>
	<div align="center">
		<p>아직 회원이 아니신가요? 바로 <a href="${contextPath }/member/join">회원가입</a>  하러 가기</p>
	</div>
	
	
</body>
</html>