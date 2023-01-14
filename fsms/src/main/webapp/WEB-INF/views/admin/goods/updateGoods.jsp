<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateGoods</title>
</head>
<body>

    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
              <h2>상품 수정</h2>
              	<p>
				<form action="${contextPath }/admin/goods/updateGoods" method="post" enctype="multipart/form-data">
					<input type="hidden" id="goodsCd" name="goodsCd" value="${goodsDto.goodsCd }">
					<div class="row">
                        <div class="col-lg-8 ">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 명<span>*</span></p>
                                    <input type="text" name="goodsName" value="${goodsDto.goodsName }" >
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 수량<span>*</span></p>
                                     <input type="text" name="goodsCnt" value="${goodsDto.goodsCnt }">
                                 </div>
                             </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 할인율<span>*</span></p>
                                     <input type="text" name="discountRate" value="${goodsDto.discountRate }" >
                                 </div>
                             </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>상품 금액<span>*</span></p>
                                    <input type="text" name="price" value="${goodsDto.price }">
                                </div>
                            </div>
                            <div class="col-lg-12">
                               <div class="checkout__input">
                                    <p>상품 이미지 파일명 <span style="color:red;">*</span></p>
                                    <input type="file" name="goodsFileName" value="${goodsDto.goodsFileName }">
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 정보<span>*</span></p>
                                     <input type="text" name="goodsInfo" value="${goodsDto.goodsInfo }">
                                 </div>
                             </div>
                              <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>원산지<span>*</span></p>
									 <input type="text" name="goodsOrigin" value="${goodsDto.goodsOrigin }">
                                 </div>
                             </div>
                         	 <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>상품 분류<span>*</span></p>
                                     <input type="text" name="goodsCategory" value="${goodsDto.goodsCategory }" >
                                 </div>
                             </div>
                             <div align="center">
	                        	<button type="submit" class="site-btn"> 수정하기</button>
	                        	<button type="reset" class="site-btn"> 다시쓰기</button>
	                        </div>
                     </div>
		           </div>
                </form>
            </div>
           </div>
    </section>
    




<!-- 
	<div align="center" style="padding-top: 100px">
		<form action="${contextPath }/admin/goods/updateGoods " method="post" enctype="multipart/form-data">
			<div  align="center">
				<h2>상품 수정하기</h2>
				<br>
			</div>
			<table border="1" style="width:600px;" >
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td align="center">상품 이름</td>
					<td><input type="text" name="goodsName" size="70" value="${goodsDto.goodsName }"/></td>
				</tr>
				<tr >
					<td align="center">상품 수량</td>
					<td><input type="text" name=goodsCnt size="70" value="${goodsDto.goodsCnt }"/></td>
				</tr>
				<tr>
					<td align="center">할인율</td>
					<td><input type="text" name="discountRate" size="70" value="${goodsDto.discountRate }"/></td>
				</tr>
				<tr>
					<td align="center">금액</td>
					<td><input type="text" name="price" size="70" value="${goodsDto.price }"/></td>
				</tr>
				<tr>
					<td align="center">상품 파일명</td>
					<td><input type="file" name="goodsFileName" size="70" value="${goodsDto.goodsFileName }"/></td>
				</tr>
				<tr>
					<td align="center">상품 분류</td>
					<td><input type="text" name="goodsCategory" size="70" value="${goodsDto.goodsCategory }"/></td>
				</tr>
				<tr>
					<td align="center">원산지</td>
					<td><input type="text" name="goodsOrigin" size="70" value="${goodsDto.goodsOrigin }"/></td>
				</tr>
				<tr>
					<td align="center">상품 설명</td>
					<td><textarea  rows="10" cols="50" name="goodsInfo" >${goodsDto.goodsInfo }</textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
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