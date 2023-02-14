<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
	
</script>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
	                            <span>All departments</span>
	                        </div>
	                        <c:choose>
	                        	<c:when test="${sessionScope.memberId eq null }">
			                        <ul>
			                            <li><a href="${contextPath }/member/join">Sign Up</a></li>
			                            <li><a href="${contextPath }/member/login">Login</a></li>
			                            <li><a href="${contextPath }/goods/goodsCategory?goodsCategory=beef">Beef</a></li>
			                            <li><a href="${contextPath }/cart/myCartList?memberId=${sessionScope.memberId}">My Cart</a></li>
			                            <li><a href="${contextPath }/member/myOrderList?memberId=${sessionScope.memberId}">My Order</a></li>
			                            <li><a href="${contextPath }/member/update?memberId=${sessionScope.memberId}">My Info</a></li>
			                            <li><a href="${contextPath }/contact">Contact</a></li>
			                        </ul>
	                        	</c:when>
	                        	<c:otherwise>
			                        <ul>
			                            <li><a href="${contextPath }/cart/myCartList?memberId=${sessionScope.memberId}">My Cart</a></li>
			                            <li><a href="${contextPath }/member/myOrderList?memberId=${sessionScope.memberId}">My Order</a></li>
			                            <li><a href="${contextPath }/member/update?memberId=${sessionScope.memberId}">My Info</a></li>
			                        	<li><a href="${contextPath }/contact">Contact</a></li>
			                            <li><a href="${contextPath }/member/delete?memberId=${sessionScope.memberId}">WithDraw</a></li>
			                        </ul>
	                        	</c:otherwise>
	                        </c:choose>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${contaxtPath }/fsms/goods/goodsList" method="get">
                                <div class="hero__search__categories">
                                    All Categories
                                </div>
                                <input type="text" placeholder="What do yo u need?" id="searchWord" name="searchWord" value="${searchWord}" >
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+82 010-5129-1633</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/메인고기.jpg" style="width:750px; height:450px;">
                        <div class="hero__text">
                            <span>FRUIT MEAT</span>
                            <h2>Food Stuffs <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="${contextPath }/goods/goodsList" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

     <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/한우-모듬.jpg">
                            <h5><a href="${contextPath }/goods/goodsList?goodsCategory=beef">Beef</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/양고기-모듬.jpg">
                            <h5><a href="${contextPath }/goods/goodsList?goodsCategory=lamb">Lamb</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/돼지고기메인.jpg">
                            <h5><a href="${contextPath }/goods/goodsList?goodsCategory=pork">Pork</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/닭메인.jpg">
                            <h5><a href="${contextPath }/goods/goodsList?goodsCategory=chicken">Chicken</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/categories/오리메인.jpg">
                            <h5><a href="${contextPath }/goods/goodsList?goodsCategory=duckMeat">Duck Meat</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>ALL Product</h2>
                    </div>
                </div>
            </div>
         <div class="row featured__filter">
             <c:choose>
             	<c:when test="${empty goodsList }">
             		<div class="product__item">
	           			<h3>등록된 상품이 없습니다.</h3>
                   </div>
             	</c:when>
             	<c:otherwise>
             		<c:forEach var="goodsDto" items="${goodsList }" begin="0" end="11">
             			<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
		                    <div class="featured__item">
		                        <div class="featured__item__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}">
		                            <ul class="featured__item__pic__hover">
		                                <li><a href="${contextPath }/goods/goodsDetails?goodsCd=${goodsDto.goodsCd}"><i class="fa fa-heart"></i></a></li>
		                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
		                                <li><a href="javascript:processToCart(${goodsDto.goodsCd })"><i class="fa fa-shopping-cart"></i></a></li>
		                            </ul>
		                        </div>
		                        <div class="featured__item__text">
		                            <h6><a href="${contextPath }/goods/goodsDetails?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsName }</a></h6>
		                            <h5><fmt:formatNumber value="${goodsDto.price }" /></h5>
		                        </div>
		                    </div>
		                </div>
             		</c:forEach>
             	</c:otherwise>
             </c:choose>
          </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
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
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Price Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="topPrice" items="${topPriceList }" begin="0" end="2">
	                                <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${topPrice.goodsCd}" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${contextPath }/thumbnails?goodsFileName=${topPrice.goodsFileName}" style="width:120px; height:120px;">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                       <h6>${topPrice.goodsName }</h6>
	                                       <span>${topPrice.price }</span>
	                                    </div>
	                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                               <c:forEach var="topPrice" items="${topPriceList }" begin="3" end="5">
	                                <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${topPrice.goodsCd}" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${contextPath }/thumbnails?goodsFileName=${topPrice.goodsFileName}" style="width:120px; height:120px;">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                       <h6>${topPrice.goodsName }</h6>
	                                       <span>${topPrice.price }</span>
	                                    </div>
	                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Lowest Price Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                               <c:forEach var="lowestPrice" items="${lowestPriceList }" begin="0" end="2">
                                 <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${lowestPrice.goodsCd}" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${contextPath }/thumbnails?goodsFileName=${lowestPrice.goodsFileName}" style="width:120px; height:120px;">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                       <h6>${lowestPrice.goodsName }</h6>
	                                       <span>${lowestPrice.price }</span>
	                                    </div>
	                                </a>
                               </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                               <c:forEach var="lowestPrice" items="${lowestPriceList }" begin="3" end="5">
                                 <a href=" ${contextPath }/goods/goodsDetails?goodsCd=${lowestPrice.goodsCd}" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${contextPath }/thumbnails?goodsFileName=${lowestPrice.goodsFileName}" style="width:120px; height:120px;">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                       <h6>${lowestPrice.goodsName }</h6>
	                                       <span>${lowestPrice.price }</span>
	                                    </div>
	                                </a>
                               </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->


</body>
</html>