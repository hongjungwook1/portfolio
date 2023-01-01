<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	
	
	
</script>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null }">
		<script>
			alert("로그인 후 이용 가능합니다.");
			location.href="${contextPath}/member/login";
		</script>
	</c:if>

	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>${sessionScope.memberId } 님 장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td>장바구니가 비어 있습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		</c:otherwise>
                            	</c:choose>
                            	
                            	
                            	
                            	<c:forEach var="myCart" items="${myCartList }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="50" height="50">
                                        <a href="${contectPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}"><h5>${myCart.goodsName }</h5></a>
                                    </td>
                                    <td class="shoping__cart__price">
                                      <div class="product__price" >
                                	 	 <span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span><br>
                                   		 <fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>
										 <input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">			                                    
                                   	  </div>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" id="cartQty" value="${myCart.cartQty }">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                   	<div class="product__total" >
                                   		 <p><fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}" pattern="0"/></p>
                                  	</div>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                </c:forEach>
                                
							  <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-3.jpg" alt="">
                                        <h5>Organic Bananas</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $69.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $69.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${contextPath }/goods/goodsList?goodsCategory=all" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">결 제 하 기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
	
</body>
</html>