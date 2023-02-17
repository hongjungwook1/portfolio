<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
	
	$().ready(function () {
		
		
		var totalPrice = 0;
		var orderGoodsQtyList = "${orderGoodsQtyList}".split(",");
		var deliveryPrice = 3000;
		
		for (var i = 0; i < orderGoodsQtyList.length -1; i++) {
			
			$("#qty" + i).text(orderGoodsQtyList[i] + " 개");
			$("#orderGoodsQty"+i).val(orderGoodsQtyList[i] );
			
			var price = Number($("#price"+i).val());
			var discountRate = Number($("#discountRate"+i).val());
			var orderGoodsQty = Number($("#orderGoodsQty"+i).val());
			
			totalPrice += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty;
		}
		
		if (totalPrice > 50000) {
			$("#deliveryPrice").html("무료");
		}
		else {
			$("#deliveryPrice").html("3000원");
			totalPrice += deliveryPrice;
		}
		
		$("#totalPrice").html(totalPrice);
		
		
	});
	
	
	function setPayMethod() {
		
		var method = $("[name='mOrderPayMethod']").val();
		
		if (method == 'card') {
			$("#mOrderCardPayMonth,#mOrderCardCompanyName").show();
			$("#mOrderPayOrdererHp").hide();
		}
		else {
			$("#mOrderCardPayMonth,#mOrderCardCompanyName").hide();
			$("#mOrderPayOrdererHp").show();
		}
		
	}
	
	
	
	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>주문  상세</h4>
                <form action="${contextPath }/morder/orderCartGoods" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 성함<span>*</span></p>
                                        <input type="text" name="mOrderName" value="${orderer.memberName }">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 연락처<span>*</span></p>
                                        <input type="text" name="mOrderHp" value="${orderer.hp }">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 성함<span>*</span></p>
                                        <input type="text" name="mOrderReceiverName">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는분 연락처<span>*</span></p>
                                        <input type="text" name="mOrderReceiverHp">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__order__widget">
	                                     <p>배송방법 <span>*</span></p>
	                                     <input type="radio" name="mOrderDeliveryMethod" value="normal" checked> 일반배송 &emsp; 
										 <input type="radio" name="mOrderDeliveryMethod" value="rocket"> 로켓배송 &emsp;
	                                </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__order__widget">
	                                    <p>지불방법 <span>*</span></p>
	                                    <select name="mOrderPayMethod" onchange="setPayMethod()">
	                                    	<option value="card">카드결제</option>
	                                    	<option value="phone">휴대폰결제</option>
	                                    </select>
	                                </div>
                                </div>
                            </div> 
                         <br>
                          <div class="row">
                            <div class="col-lg-6" id="mOrderCardCompanyName" >
                              <div class="checkout__order__widget">
                                 <p>카드회사 <span>*</span></p>
	                               <select name="mOrderCardCompanyName">
									<option value="삼성">삼성</option>
									<option value="하나SK">하나SK</option>
									<option value="현대">현대</option>
									<option value="KB">KB</option>
									<option value="신한">신한</option>
									<option value="롯데">롯데</option>
									<option value="BC">BC</option>
									<option value="시티">시티</option>
									<option value="NH농협">NH농협</option>
							   </select>
                              </div>
                            </div>
                               <div class="col-lg-6" id="mOrderCardPayMonth">
									<div class="checkout__order__widget">
										<p>할부개월 <span>*</span></p>
											<select name="mOrderCardPayMonth">
											<option value="0">일시불</option>                                    
											<option value="1">1개월</option>                                    
											<option value="2">2개월</option>                                    
											<option value="3">3개월</option>                                    
											<option value="4">4개월</option>                                    
											<option value="5">5개월</option>                                    
											<option value="6">6개월</option>                                    
											</select>
										</div>
									</div>
								</div> 
				 			<div id="mOrderPayOrdererHp" class="checkout__input" style="display: none">
                                <div class="checkout__input">
                                    <p>결제 휴대폰 번호 <span>*</span></p>
                                    <input type="text" name="mOrderPayOrdererHp" value="${orderer.hp }">
                                </div>
                            </div>
								
								<br>                          
                               <div class="checkout__input">
                                   <p>배송메세지 <span>*</span></p>
                                   <input type="text" name="mOrderDeliveryMessage" placeholder="배송메세지를 입력하세요.">
                               </div>
                              <div id="mOrderPayOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
                                <div class="checkout__form__input">
                                    <p>결제 휴대폰 번호 <span>*</span></p>
                                    <input type="text" name="mOrderPayOrdererHp" value="${orderer.hp }">
                                </div>
                            </div>
                            <div class="checkout__input">
                                 <p>우편번호 <span>*</span></p>
                                 <input type="text" id="zipcode" name="mOrderZipcode" value="${orderer.zipCode }" style="width: 20%;">
                                 <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                            </div>
                            <div class="checkout__input">
                                <p>도로명 주소 <span>*</span></p>
                                <input type="text" id="roadAddress" name="mOrderRoadAddress" value="${orderer.roadAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>지번 주소 <span>*</span></p>
                                <input type="text" id="jibunAddress" name="mOrderJibunAddress" value="${orderer.jibunAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>나머지 주소 <span>*</span></p>
                                <input type="text" id="namujiAddress" name="mOrderNamujiAddress" value="${orderer.namujiAddress }">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                	<c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
                                		<li>
                                			${i.index + 1 }. ${goodsDto.goodsName } 
                                			<span><fmt:formatNumber value="${(goodsDto.price - (goodsDto.price * (goodsDto.discountRate / 100)))}"/>원 </span>&emsp;
                                			<span id="qty${i.index }">()</span>
                                			<input type="hidden" id="price${i.index }" value="${goodsDto.price }">
                                			<input type="hidden" id="discountRate${i.index }" value="${goodsDto.discountRate }">
                                			<input type="hidden" id="orderGoodsQty${i.index }">
                                		</li>
                                	</c:forEach>
                                </ul>
                                <input type="hidden" name="goodsCdList" value="${goodsCdList }">
                                <input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList }">
                                <input type="hidden" name="cartCdList" value="${cartCdList }">
                                <input type="hidden" name="memberId" value="${orderer.memberId }">
                                <div class="checkout__order__subtotal">Delivery Price <span id="deliveryPrice"></span></div>
                                <div class="checkout__order__total">Total <span id="totalPrice"></span></div>
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