<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsInfo</title>
</head>
<body>

	<div align="center">
		<table border="1">
			<tr>
				<td>상품 명</td>
				<td>${goodsDto.goodsName }</td>
			</tr>
			<tr>
				<td>상품 수량</td>
				<td>${goodsDto.goodsCnt }</td>
			</tr>
			<tr>
				<td>상품 할인율</td>
				<td>${goodsDto.discountRate }</td>
			</tr>
			<tr>
				<td>상품 금액</td>
				<td>${goodsDto.price }</td>
			</tr>
			<tr>
				<td>상품 파일명</td>
				<td>${goodsDto.goodsFileName }</td>
			</tr>
			<tr>
				<td>상품 정보</td>
				<td>${goodsDto.goodsInfo }</td>
			</tr>
			<tr>
				<td>원산지</td>
				<td>${goodsDto.goodsOrigin }</td>
			</tr>
			<tr>
				<td>상품 분류</td>
				<td>${goodsDto.goodsCategory }</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="수정하기" onclick="location.href='${contextPath}/admin/updateGoods?goodsCd=${goodsDto.goodsCd }'">
					<input type="button" value="삭제하기">
					<input type="button" value="목록보기">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>