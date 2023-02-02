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
                                    <th class="shoping__product">컨텐트 번호</th>
                                    <th>작성자</th>
                                    <th>작성자 이메일</th>
                                    <th>내용</th>
                                    <th>작성일</th>
                                    <th></th>
                                </tr><tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr align="center" >
                            				<td colspan="5">등록된 컨텐트가 없습니다!</td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            		
	                            		<c:forEach var="contactDto" items="${contactList }">
			                                <tr>
			                                    <td class="shoping__cart__item"><a href="${contextPath }/contactDetail?contactCd=${contactDto.contactCd}">${contactDto.contactCd }</a></td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${contactDto.name }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${contactDto.email }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 ${contactDto.content }			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__price">
			                                      <div class="product__price" >
			                                	 	 <fmt:formatDate value="${contactDto.regDt }" pattern="yyyy-MM-dd"></fmt:formatDate>			                                    
			                                   	  </div>
			                                    </td>
			                                    <td class="shoping__cart__item__close">
			                                        <a href="javascript:removeContact(${contactDto.contactCd});"><span class="icon_close" id="remove"></span></a>
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