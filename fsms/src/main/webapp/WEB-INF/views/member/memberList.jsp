<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body>

	<div align="center">
		<table border="1">
			<tr>
				<td>회원 아이디 </td>
				<td>회원 이름 </td>
				<td>회원 전화번호 </td>
				<td>회원 이메일 </td>
				<td>회원 포인트 </td>
				<td>회원 가입일 </td>
			</tr>
			<c:forEach var="memberDto" items="${memberList }">
				<tr>
					<td><a href="${contextPath }/admin/memberInfo?memberId=${memberDto.memberId}">${memberDto.memberId }</a></td>
					<td>${memberDto.memberName }</td>
					<td>${memberDto.hp }</td>
					<td>${memberDto.email }</td>
					<td>${memberDto.point }</td>
					<td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>