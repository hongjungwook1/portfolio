<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                        	<colgroup>
                        		<col width="70%">
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="10%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th class="shoping__product">주문 정보</th>
                                    <th>주문자</th>
                                    <th>주문 날짜</th>
                                    <th>배송 상태</th>
                                </tr><tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty orderList}">
                            			<tr align="center" >
                            				<td colspan="5">주문 내역이 없습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		
	                            		<c:forEach var="orderDto" items="${orderList }">
			                                <tr>
			                                    <td class="shoping__cart__item">
			                                    <img src="${contextPath }/thumbnails?goodsFileName=${orderDto.goodsFileName }" width="70" height="70">
			                                    <a href="${contextPath }/member/myOrderDetail?mOrderCd=${orderDto.mOrderCd}&memberId=${orderDto.memberId}">
			                                    상품명 : ${orderDto.goodsName } / 상품가격 : <fmt:formatNumber value="${orderDto.price }"/> 원 / 주문수량 : ${orderDto.mOrderGoodsQty }개 
			                                    </a>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${orderDto.memberId }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${orderDto.mOrderPayOrderTime }
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${orderDto.mOrderDeliveryStatus }
			                                   	  </div>
			                                    </td>
			                                </tr>
		                                </c:forEach>
		                                
                            		</c:otherwise>
                            	</c:choose>
                            	
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