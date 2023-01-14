<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertGoods</title>
</head>
<body>

	 <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
              <h2>상품 추가</h2>
              	<p>
				<form action="${contextPath }/admin/goods/insertGoods " method="post" enctype="multipart/form-data">
					<div class="row">
                        <div class="col-lg-8 ">
                           <div class="col-lg-12">
                               <div class="checkout__input">
                                   <p>상품 이미지<span>*</span></p>
                                   <input type="file" name="goodsFileName"  >
                               </div>
                           </div>
                           <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 이름<span>*</span></p>
                                    <input type="text" name="goodsName">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 수량<span>*</span></p>
                                    <input type="text" name="goodsCnt">
                                </div>
                            </div>
                           <div class="col-lg-12">
                               <div class="checkout__input">
                                   <p>할인율<span>*</span></p>
                                   <input type="text" name="discountRate" >
                               </div>
                           </div>
                           <div class="col-lg-12">
                              	<div class="checkout__input">
                                   <p>금액 <span style="color:red;">*</span></p>
								   <input type="text" name="price" />
                               </div>
                           </div>
                           <div class="col-lg-12">
                               <div class="checkout__input">
                                   <p>상품 분류<span>*</span></p>
                                   <input type="text" name="goodsCategory" >
                               </div>
                           </div>
                        	 <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>원산지<span>*</span></p>
                                    <input type="text" name="goodsOrigin" >
                                </div>
                            </div>
                             <div class="col-lg-12">
                               <div class="checkout__input">
                                   <p>상품 설명 <span>*</span></p>
								   <textarea  rows="10" cols="50" name="goodsInfo" ></textarea>
                               </div>
                           </div>
                           <div align="center">
                       	   <button type="submit" class="site-btn"><span class="icon_plus"></span>상품 추가하기</button>
                        </div>
                     </div>
		           </div>
                </form>
            </div>
           </div>
    </section>
    <!-- Checkout Section End -->

<!-- 
<div align="center" style="padding-top: 100px">
		<form action="${contextPath }/admin/goods/insertGoods " method="post" enctype="multipart/form-data">
			<div  align="center">
				<h2>상품 추가하기</h2>
				<br>
			</div>
			<table border="1" style="width:600px;" >
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="goodsFileName" id="goodsFileName"></td>
				</tr>
				<tr>
					<td align="center">상품 이름</td>
					<td><input type="text" name="goodsName" size="70"/></td>
				</tr>
				<tr >
					<td align="center">상품 수량</td>
					<td><input type="text" name=goodsCnt size="70"/></td>
				</tr>
				<tr>
					<td align="center">할인율</td>
					<td><input type="text" name="discountRate" size="70"/></td>
				</tr>
				<tr>
					<td align="center">금액</td>
					<td><input type="text" name="price" size="70"/></td>
				</tr>
				<tr>
					<td align="center">상품 분류</td>
					<td><input type="text" name="goodsCategory" size="70"/></td>
				</tr>
				<tr>
					<td align="center">원산지</td>
					<td><input type="text" name="goodsOrigin" size="70"/></td>
				</tr>
				<tr>
					<td align="center">상품 설명</td>
					<td><textarea  rows="10" cols="50" name="goodsInfo" ></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="글쓰기" />
						<input type="reset"  value="다시작성" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
 -->
	
</body>
</html>