<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	
	<div align="center">
		<form action="${contextPath }/member/update" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${memberDto.memberId }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${memberDto.memberName }</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${memberDto.gender }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="hp" value="${memberDto.hp }"></td>
				</tr>
				<tr>
					<td>문자 수신 동의</td>
					<td><input type="radio" name="smsstsYn" value="${memberDto.smsstsYn }" > 동의
						<input type="radio" name="smsstsYn" value="${memberDto.smsstsYn }" > 비동의</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${memberDto.email }"></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>${memberDto.point }</td>
				</tr>
				<tr align="center">
					<td colspan="3">
						<input type="hidden" value="${memberDto.memberId }" name="memberId"> 
						<input type="submit" value="수정하기">
						<input type="reset" value="다시쓰기">
						<input type="button" value="뒤로가기"> 
					</td>
				</tr>
			</table>		
		</form>
	</div>
	
</body>
</html>