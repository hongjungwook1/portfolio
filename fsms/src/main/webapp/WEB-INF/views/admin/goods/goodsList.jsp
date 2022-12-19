<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsList</title>
</head>
<body>
	<div align="center">
		<table border="1" >
			<tr>
				<td>상품 코드</td>
				<td>상품명</td>
				<td>상품 금액</td>
				<td>원산지</td>
				<td>상품 정보</td>
				<td>상품 분류</td>
			</tr>
			<c:forEach var="goodsDto" items="${goodsList }">
				<tr>
					<td>${goodsDto.goodsCd }</td>					
					<td><a href="${contextPath }/admin/goods/goodsInfo?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsName }</a></td>					
					<td>${goodsDto.price }</td>					
					<td>${goodsDto.goodsOrigin }</td>					
					<td>${goodsDto.goodsInfo }</td>					
					<td>${goodsDto.goodsCategory }</td>					
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>