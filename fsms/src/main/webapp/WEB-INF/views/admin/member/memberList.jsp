<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
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
                        		<col width="16%">
                        		<col width="16%">
                        		<col width="16%">
                        		<col width="16%">
                        		<col width="16%">
                        		<col width="16%">
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th class="shoping__product">회원 아이디</th>
                                    <th>회원 이름</th>
                                    <th>회원 전화번호</th>
                                    <th>회원 생년월일</th>
                                    <th>회원 이메일</th>
                                    <th>회원 가입일</th>
                                </tr><tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty memberList}">
                            			<tr align="center" >
                            				<td colspan="5">등록된 회원이 없습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		
	                            		<c:forEach var="memberDto" items="${memberList }">
			                                <tr>
			                                    <td class="shoping__cart__item"><a href="${contextPath }/admin/memberInfo?memberId=${memberDto.memberId}">${memberDto.memberId }</a></td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${memberDto.memberName }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${memberDto.hp }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${memberDto.dateBirth }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${memberDto.email }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 <fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"></fmt:formatDate>			                                    
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






<!-- 

	<div align="center">
		<table border="1">
			<tr>
				<td>회원 아이디 </td>
				<td>회원 이름 </td>
				<td>회원 전화번호 </td>
				<td>회원 생년월일</td>
				<td>회원 이메일 </td>
				<td>회원 포인트 </td>
				<td>회원 가입일 </td>
			</tr>
			<c:forEach var="memberDto" items="${memberList }">
				<tr>
					<td><a href="${contextPath }/admin/memberInfo?memberId=${memberDto.memberId}">${memberDto.memberId }</a></td>
					<td>${memberDto.memberName }</td>
					<td>${memberDto.hp }</td>
					<td>${memberDto.dateBirth }</td>
					<td>${memberDto.email }</td>
					<td>${memberDto.point }</td>
					<td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
				</tr>
			</c:forEach>
		</table>
	</div>

 -->

</body>
</html>