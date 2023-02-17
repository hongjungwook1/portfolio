<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				data : {"goodsCd" : goodsCd , "cartQty" : $("#mOrderGoodsQty").val()},
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
	
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인 후 가능합니다.");
			location.href="${contextPath}/member/login";
		}
		else {
			location.href="${contextPath}/morder/orderGoods?goodsCd=" + goodsCd + "&mOrderGoodsQty=" + $("#mOrderGoodsQty").val();
		}
		
	}
	
	
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${goodsDto.goodsCategory }</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <a href="${contextPath }/goods/goodsList">${goodsDto.goodsCategory }</a>
                            <span>${goodsDto.goodsCategory } Package</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                           <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" >
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${goodsDto.goodsName } </h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <div class="product__details__price"><fmt:formatNumber value="${goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100) }" /></div>
                        <p>${goodsDto.goodsInfo }</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="mOrderGoodsQty" name="mOrderGoodsQty">
                                </div>
                            </div>
                        </div>
                        <a href="javascript:processToCart(${goodsDto.goodsCd })" class="primary-btn">ADD TO CARD</a>
                        <a href="javascript:processToOrder(${goodsDto.goodsCd })" class="primary-btn">ORDER NOW</a>
                        <ul>
                        	<c:choose>
                        		<c:when test="!${goodsDto.goodsCnt }">
		                            <li><b>No Quantity</b> <span>재고 없음</span></li>
                        		</c:when>
                        		<c:otherwise>
		                            <li><b>Quantity</b> <span>${goodsDto.goodsCnt }개</span></li>
                        		</c:otherwise>
                        	</c:choose>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.6 kg</span></li>
                            <li><b>Origin</b>
                            	<span>${goodsDto.goodsOrigin }산</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description & Infomation</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Description & Infomation</h6>
                                    <br><br>
                                    <p>${goodsDto.goodsInfo }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

</body>
</html>