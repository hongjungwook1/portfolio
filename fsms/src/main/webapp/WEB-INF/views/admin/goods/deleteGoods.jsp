<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteGoods</title>
</head>
<body>
	
	 <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
              <h2>상품 상세 보기</h2>
              	<p>
				<form action="${contextPath }/admin/goods/deleteGoods" method="post">
					<div class="row">
                        <div class="col-lg-8 ">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 코드<span>*</span></p>
                                    <input type="text" value="${goodsDto.goodsCd }" readonly>
                                    <input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 명<span>*</span></p>
                                    <input type="text" value="${goodsDto.goodsName }" readonly>
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 수량<span>*</span></p>
                                     <input type="text" value="${goodsDto.goodsCnt }개" readonly>
                                 </div>
                             </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 할인율<span>*</span></p>
                                     <input type="text" value="${goodsDto.discountRate }%" readonly>
                                 </div>
                             </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 금액<span>*</span></p>
                                    <input type="text" value="${goodsDto.price }원" readonly>
                                </div>
                            </div>
                            <div class="col-lg-12">
                               <div class="checkout__input">
                                    <p>상품 이미지 파일명 <span style="color:red;">*</span></p>
                                    <input type="text" value="${goodsDto.goodsFileName }" readonly>
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 정보<span>*</span></p>
                                     <input type="text" value="${goodsDto.goodsInfo }" readonly>
                                 </div>
                             </div>
                              <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>원산지<span>*</span></p>
									 <input type="text" value="${goodsDto.goodsOrigin }" readonly>
                                 </div>
                             </div>
                         	 <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 분류<span>*</span></p>
                                     <input type="text" value="${goodsDto.goodsCategory }" readonly>
                                 </div>
                             </div>
                             
                             <div align="center">
	                        	<button type="submit" class="site-btn"> 삭제하기</button>
	                        	<button type="button" class="site-btn" onclick="location.href='${contextPath}/admin/goods/goodsList'"> 목록보기</button>
	                        </div>
                     </div>
		           </div>
                </form>
            </div>
           </div>
    </section>
	

</body>
</html>