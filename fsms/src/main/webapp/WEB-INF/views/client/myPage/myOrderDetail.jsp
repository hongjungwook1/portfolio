<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>주문  상세</h4>
                <form action="${contextPath }/morder/orderCartGoods" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 성함<span>*</span></p>
                                        <input type="text" name="mOrderName" value="${myOrder.mOrderName }" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 연락처<span>*</span></p>
                                        <input type="text" name="mOrderHp" value="${myOrder.mOrderHp }" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 성함<span>*</span></p>
                                        <input type="text" name="mOrderReceiverName" value="${myOrder.mOrderReceiverName }" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 연락처<span>*</span></p>
                                        <input type="text" name="mOrderReceiverHp" value="${myOrder.mOrderReceiverHp }" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
	                                     <p>배송 방법 <span>*</span></p>
	                                     <input type="text" name="mOrderDeliveryMethod" value="${myOrder.mOrderDeliveryMethod }" disabled>
	                                </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
	                                    <p>지불 방법 <span>*</span></p>
										<input type="text" name="mOrderPayMethod" value="${myOrder.mOrderPayMethod }" disabled>
	                                </div>
                                </div>
                            </div> 
                         <c:choose>
                         	<c:when test="${myOrder.mOrderPayMethod eq 'card'}">
                         		 <div class="row">
		                            <div class="col-lg-6" id="mOrderCardCompanyName" >
		                              <div class="checkout__input">
		                                 <p>카드 회사 <span>*</span></p>
		                               		<input type="text" name="mOrderCardCompanyName" value="${myOrder.mOrderCardCompanyName }" disabled>
		                              </div>
		                            </div>
		                               <div class="col-lg-6" id="mOrderCardPayMonth">
											<div class="checkout__input">
												<p>할부개월 <span>*</span></p>
													<c:choose>
														<c:when test="${myOrder.mOrderCardPayMonth == 0 }">
															<input type="text" name="mOrderCardPayMonth" value="일시불" disabled>
														</c:when>
														<c:otherwise>
															<input type="text" name="mOrderCardPayMonth" value="${myOrder.mOrderCardPayMonth } 개월" disabled>
														</c:otherwise>
													</c:choose>
											</div>
										</div>
									</div> 
                         	</c:when>
                         	<c:otherwise>
                        		<div id="mOrderPayOrdererHp" class="checkout__input" style="display: none">
	                                <div class="checkout__input">
	                                    <p>결제 휴대폰 번호 <span>*</span></p>
	                                    <input type="text" name="mOrderPayOrdererHp" value="${myOrder.mOrderPayOrdererHp }">
	                                </div>
								</div>
                         	</c:otherwise>
                         </c:choose>
                            <div class="checkout__input">
                                <p>배송 상태 <span>*</span></p>
                                <input type="text" name="mOrderDeliveryStatus" value="${myOrder.mOrderDeliveryStatus }" disabled>
                           </div>
                            <div class="checkout__input">
                                   <p>배송메세지 <span>*</span></p>
                                   <input type="text" name="mOrderDeliveryMessage" value="${myOrder.mOrderDeliveryMessage }" disabled>
                               </div>
                            <div class="checkout__input">
                                 <p>우편번호 <span>*</span></p>
                                 <input type="text" id="zipcode" name="mOrderZipcode" value="${myOrder.mOrderZipcode }" style="width: 20%;" disabled >
                                 <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0" disabled >
                            </div>
                            <div class="checkout__input">
                                <p>도로명 주소 <span>*</span></p>
                                <input type="text" id="roadAddress" name="mOrderRoadAddress" value="${myOrder.mOrderRoadAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>지번 주소 <span>*</span></p>
                                <input type="text" id="jibunAddress" name="mOrderJibunAddress" value="${myOrder.mOrderJibunAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>나머지 주소 <span>*</span></p>
                                <input type="text" id="namujiAddress" name="mOrderNamujiAddress" value="${myOrder.mOrderNamujiAddress }">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                               		<li>
                               			<span><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100}"/>원 &emsp;</span>
                               			<input type="hidden" id="price${i.index }" value="${goodsDto.price }">
                               			<input type="hidden" id="discountRate${i.index }" value="${goodsDto.discountRate }">
                               			<input type="hidden" id="orderGoodsQty${i.index }">
                               		</li>
                                </ul>
                                <input type="hidden" name="goodsCdList" value="${goodsCdList }">
                                <input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList }">
                                <input type="hidden" name="cartCdList" value="${cartCdList }">
                                <input type="hidden" name="memberId" value="${orderer.memberId }">
                                <div class="checkout__order__subtotal">Delivery Price <span id="deliveryPrice"></span></div>
                                <div class="checkout__order__total">Total <span id="totalPrice"></span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	


</body>
</html>