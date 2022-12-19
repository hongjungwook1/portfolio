<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteGoods</title>
</head>
<body>
	
	<div align="center">
		<form action="${contextPath }/admin/goods/deleteGoods" method="post">
			<table border="1">
				<tr>
					<td>상품코드</td>
					<td>${goodsDto.goodsCd }</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${goodsDto.goodsName }</td>
				</tr>
				<tr>
					<td>상품금액</td>
					<td>${goodsDto.price }</td>
				</tr>
				<tr>
					<td>상품정보</td>
					<td>${goodsDto.goodsInfo }</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
						<input type="submit" value="삭제하기">
						<input type="button" value="목록보기" onclick="location.href='${contextPath}/admin/goods/goodsList'">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>