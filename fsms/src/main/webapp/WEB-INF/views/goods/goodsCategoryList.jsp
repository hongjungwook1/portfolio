<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
	
	function processToCart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인 후 가능합니다.");
			location.href="${contextPath}/member/login";
		}
		else {
			
			$.ajax({
				
				url : "${contextPath}/cart/addCart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartQty" : 1},
				success : function (result) {
					
					if (result == 'duple') {
						alert("이미 추가된 상품 입니다.");
					}
					else {
						alert("장바구니에 추가 되었습니다.");
					}
				}
				
			})
		}
		
	}
	
	function getGoodsListByPrice(){
		location.href =  "${contextPath }/goods/searchGoods?method=price&min="+$("#minamount").val() + "&max=" + $("#maxamount").val();
	}
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Sort By</h4>
                            <ul>
                                <li><a href="${contaxtPath }/fsms/goods/searchGoods?method=keyword&keyword=highPrice">최고 금액순</a></li>
                                <li><a href="${contaxtPath }/fsms/goods/searchGoods?method=keyword&keyword=lowPrice">최저 금액순</a></li>
                            </ul>
                        </div>
                       
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="0" data-max="150000" onmouseup="getGoodsListByPrice()">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                 <div class="range-slider">
                                    <div>
                                     	<p></p>
                                        <span></span>
                                        <input type="text" id="minamount" style="border:none;" size="7" > ~ 
                                        <input type="text" id="maxamount" style="border:none;" size="7">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="latestGoods" items="${latestList }" begin="0" end="2">
			                                <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${latestGoods.goodsCd}" class="latest-product__item">
			                                    <div class="latest-product__item__pic">
			                                        <img src="${contextPath }/thumbnails?goodsFileName=${latestGoods.goodsFileName}" style="width:120px; height:120px;">
			                                    </div>
			                                    <div class="latest-product__item__text">
			                                        <h6>${latestGoods.goodsName }</h6>
			                                        <span>${latestGoods.price }</span>
			                                    </div>
			                                </a>
		                                </c:forEach>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                     <c:forEach var="latestGoods" items="${latestList }" begin="3" end="5">
			                                <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${latestGoods.goodsCd}" class="latest-product__item">
			                                    <div class="latest-product__item__pic">
			                                        <img src="${contextPath }/thumbnails?goodsFileName=${latestGoods.goodsFileName}" style="width:120px; height:120px;">
			                                    </div>
			                                    <div class="latest-product__item__text">
			                                        <h6>${latestGoods.goodsName }</h6>
			                                        <span>${latestGoods.price }</span>
			                                    </div>
			                                </a>
		                                </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${totalGoodsCnt }</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
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
			                                        <li><a href="${contextPath }/goods/goodsDetails?goodsCd=${goodsDto.goodsCd}"><i class="fa fa-heart"></i></a></li>
			                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
			                                        <li><a href="javascript:processToCart(${goodsDto.goodsCd })"><i class="fa fa-shopping-cart"></i></a></li>
			                                    </ul>
			                                </div>
			                                <div class="product__item__text">
			                                    <h6><a href="${contextPath }/goods/goodsDetails?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsName}</a></h6>
			                                   <h5><fmt:formatNumber value="${goodsDto.price }"/></h5>
			                                </div>
			                            </div>
			                        </div>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="product__pagination">
                        <c:forEach var="i" begin="${startPage}" end="${endPage }" >
	          				<a href="${contextPath }/goods/goodsList?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">${i} </a>
	          			</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>