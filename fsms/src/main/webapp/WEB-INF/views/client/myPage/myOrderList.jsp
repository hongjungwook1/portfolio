<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrderList</title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Order List</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>${sessionScope.memberId } 님 주문 내역</span>
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
                        	<colgroup>
                        		<col width="8%">
                        		<col width="25%">
                        		<col width="15%">
                        		<col width="22%">
                        		<col width="30%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Order Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myOrderList}">
                            			<tr align="center" >
                            				<td colspan="5">주문 내역이 없습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		</c:otherwise>
                            	</c:choose>
                            	
                            	<c:forEach var="myOrder" items="${myOrderList }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="85" height="85">
                                        <div class="cart__product__item__title">
                                            <h6><a href="${contextPath }/member/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}">${myOrder.goodsName }</a></h6>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__price">
                                      <div class="product__price" >
                                      	 <span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myOrder.price }"/></span><br>
                                   		 <p><fmt:formatNumber value="${(myOrder.price - (myOrder.price * (myOrder.discountRate / 100)))}"/></p>
                                   	  </div>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" id="mOrderGoodsQty${myOrder.mOrderCd }" value="${myOrder.mOrderGoodsQty }" disabled>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                   	<div class="product__total" id="total">
                                   		 <p><fmt:formatNumber value="${(myOrder.price -  (myOrder.price * (myOrder.discountRate / 100))) * myOrder.mOrderGoodsQty }"/>원</p>
                                  	</div>
                                    </td>
                                    <td><td class="cart__total"><fmt:formatDate value="${myOrder.mOrderPayOrderTime }" pattern="yyyy-MM-dd"/> </td></td>
                                </tr>																
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- Shoping Cart Section End -->

	

</body>
</html>