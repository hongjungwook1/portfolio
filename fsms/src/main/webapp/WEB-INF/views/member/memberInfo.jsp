<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>

	<div align="center">
		<table border="1">
			<tr>
				<td>회원 아이디</td>
				<td>${memberDto.memberId }</td>
			</tr>
			<tr>
				<td>회원 이름</td>
				<td>${memberDto.memberName }</td>
			</tr>
			<tr>
				<td>회원 성별</td>
				<td>${memberDto.gender }</td>
			</tr>
			<tr>
				<td>회원 생년월일</td>
				<td>${memberDto.dateBirth }</td>
			</tr>
			<tr>
				<td>회원 전화번호</td>
				<td>${memberDto.hp }</td>
			</tr>
			<tr>
				<td>문자 수신 동의</td>
				<td>${memberDto.smsstsYn }</td>
			</tr>
			<tr>
				<td>회원 이메일</td>
				<td>${memberDto.email }</td>
			</tr>
			<tr>
				<td>이메일 수신 동의</td>
				<td>${memberDto.emailstsYn }</td>
			</tr>
			<tr>
				<td>회원 포인트</td>
				<td>${memberDto.point }</td>
			</tr>
			<tr>
				<td>회원 가입일</td>
				<td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="삭제하기" onclick="location.href='${contextPath}/admin/memberDelete?memberId=${memberDto.memberId }'">
					<input type="button" value="목록보기" onclick="location.href='${contextPath}/admin/memberList'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>