<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertGoods</title>
</head>
<body>
<div align="center" style="padding-top: 100px">
		<form action="${contextPath }/admin/goods/insertGoods " method="post" enctype="multipart/form-data">
			<div  align="center">
				<h2>상품 추가하기</h2>
				<br>
			</div>
			<table border="1" style="width:600px;" >
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="goodsFileName" id="goodsFileName"></td>
					
				</tr>
				<tr>
					<td align="center">상품 이름</td>
					<td><input type="text" name="goodsName" size="70"/></td>
				</tr>
				<tr >
					<td align="center">상품 수량</td>
					<td><input type="text" name=goodsCnt size="70"/></td>
				</tr>
				<tr>
					<td align="center">할인율</td>
					<td><input type="text" name="discountRate" size="70"/></td>
				</tr>
				<tr>
					<td align="center">금액</td>
					<td><input type="text" name="price" size="70"/></td>
				</tr>
				<tr>
					<td align="center">상품 파일명</td>
					<td><input type="text" name="goodsFileName" size="70"/></td>
				</tr>
				<tr>
					<td align="center">상품 분류</td>
					<td><input type="text" name="goodsCategory" size="70"/></td>
				</tr>
				<tr>
					<td align="center">원산지</td>
					<td><input type="text" name="goodsOrigin" size="70"/></td>
				</tr>
				<tr>
					<td align="center">상품 설명</td>
					<td><textarea  rows="10" cols="50" name="goodsInfo" ></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="글쓰기" />
						<input type="reset"  value="다시작성" />
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>