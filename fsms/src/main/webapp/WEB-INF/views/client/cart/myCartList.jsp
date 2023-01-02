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
		
		getTotalPrice();
		total();
		
		$("[name='cartCd']").change(function() {
			getTotalPrice();	
		});

	});



	function getTotalPrice() {
		
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function () {
			
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartQty" + tempCartCd).val());
			
		});
		
		$("#totalPrice").html(totalPrice);
		
	}
	
	/*
	domEx22번 레퍼런스
	function total() {
		
		var total = 0;
		$("#cartQty" + cartCd ).click(function () {
		
			var tampCartCd = $(this).val();
			total += Number($("#price" + tempCartCd).val()) * Number($("#cartQty" + tempCartCd).val());
		});
		
		$("#total").html(total);
	}
	
	*/
	
	
	function selectAllCart() {
		
		if ($("#selectAllCart").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}			
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
		
	}	
	
	function modifyCart(cartCd) {
		$.ajax({
			type : "get",
			url	 : "${contextPath}/cart/modifyCart",
			data : {
				"cartCd" 	: cartCd,
				"cartQty"	: $("#cartQty" + cartCd).val()
			},
			success:function() {
				getTotalPrice();
				total();
			},
			error:function(error) {
				console.log(error);
			}
		});
	}
	
	function removeCart() {
		
		var cartCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("#remove").click(function(){
				cartCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/cart/removeCart?cartCdList=" + cartCdList;
		}
		
	}
	
	
	
	function processOrderCart() {
		
		var cartCdList = "";
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		
		$("[name='cartCd']:checked").each(function () {
			
			var cartCd = (this).val();
			var goodsCd = $("#goodCd" + cartCd).val();
			var cartGoodsQty = $("#cartQty" + cartCd).val();
			
			cartCdList += cartCd + ",";
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty + ",";
			
		});
		
		
		if (goodsCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/morder/morderCartGoods";
			url += "?goodsCdList=" + goodsCdList;
			url += "?cartGoodsQtyList=" + cartGoodsQtyList;
			url += "?cartCdList=" + cartCdList;
			
		locaion.href = url;
		
		
	}
	
	
	
	
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
                        	<colgroup>
                        		<col width="8%">
                        		<col width="25%">
                        		<col width="15%">
                        		<col width="22%">
                        		<col width="30%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th>전체선택 <input type="checkbox" id="selectAllCart" onchange="selectAllCart()"></th>
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
                            			<tr align="center" >
                            				<td colspan="5">장바구니가 비어 있습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		</c:otherwise>
                            	</c:choose>
                            	
                            	
                            	
                            	<c:forEach var="myCart" items="${myCartList }">
                                <tr>
                                	<td><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
                                    <td class="shoping__cart__item">
                                        <img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="85" height="85">
                                        <a href="${contextPath }/goods/goodsDetails?goodsCd=${myCart.goodsCd}"><h5>${myCart.goodsName }</h5></a>
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
                                            <div class="pro-qty" onmouseleave="modifyCart(${myCart.cartCd })">
                                                <input type="text" id="cartQty${myCart.cartCd }" value="${myCart.cartQty }">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                   	<div class="product__total" id="total">
                                   		 <p><fmt:formatNumber value="${(myCart.price -  (myCart.price * (myCart.discountRate / 100))) * myCart.cartQty }"/></p>
                                  	</div>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="javascript:removeCart();"><span class="icon_close" id="remove"></span></a>
                                    </td>
                                </tr>
                                </c:forEach>
                                
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
                            <li>Total <span id="totalPrice"></span></li>
                        </ul>
                        <a href="javascript:processOrderCart()" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
	
</body>
</html>