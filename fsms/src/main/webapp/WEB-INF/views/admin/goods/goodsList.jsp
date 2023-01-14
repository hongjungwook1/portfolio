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

    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    
                    <div class="row">
                    
                    	<c:choose>
                    		<c:when test="${empty goodsList}">
                    			<div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach var="goodsDto" items="${goodsList }">
			                        <div class="col-lg-4 col-md-6 col-sm-6">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}">
			                                    <ul class="product__item__pic__hover">
			                                    </ul>
			                                </div>
			                                <div class="product__item__text">
			                                    <h6><a href="${contextPath }/admin/goods/goodsInfo?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsName }</a></h6>
			                                </div>
			                            </div>
			                        </div>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </div>
                    
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>



<!-- 
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
			<tr align="center">
				<td colspan="6"><a href="${contextPath }/admin/adminMain"><input type="button" value="메인화면으로"></a></td>
			</tr>
		</table>
	</div>
 -->

</body>
</html>