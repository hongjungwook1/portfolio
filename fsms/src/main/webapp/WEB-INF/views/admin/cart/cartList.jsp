<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                        	<colgroup>
                        		<col width="10%">
                        		<col width="10%">
                        		<col width="30%">
                        		<col width="30%">
                        		<col width="20%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th class="shoping__product">번호</th>
                                    <th>주문자</th>
                                    <th>상품 코드</th>
                                    <th>주문 갯수</th>
                                    <th>장바구니 등록일</th>
                                </tr><tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty cartList}">
                            			<tr align="center" >
                            				<td colspan="5">등록 된 장바구니가 없습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		
	                            		<c:forEach var="cartDto" items="${cartList }">
			                                <tr>
			                                    <td class="shoping__cart__item"><a href="#">${cartDto.cartCd }</a></td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${cartDto.memberId }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${cartDto.goodsCd }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${cartDto.cartQty }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 <fmt:formatDate value="${cartDto.cartDate }" pattern="yyyy-MM-dd"></fmt:formatDate>			                                    
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

</body>
</html>