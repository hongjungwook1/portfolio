<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            
                            <c:choose>
                            	<c:when test="${sessionScope.adminId eq 'fsadmin' }">
                            		<div class="header__top__right__language">
		                                <img src="img/language.png" alt="">
		                                <div>관리자 로그인 중</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="${contextPath }/admin/memberList">MemberList</a></li>
		                                    <li><a href="${contextPath }/admin/cartList">CartList</a></li>
		                                    <li><a href="${contaxtPath }/fsms/admin/order/orderList">OrderList</a></li>
		                                    <li><a href="${contextPath }/contactList">ContactList</a></li>
		                                </ul>
                        		  	 </div>
                            		<div class="header__top__right__auth">
                               			 <a href="${contextPath }/member/logout"><i class="fa fa-user"></i>logout</a>
                    			    </div>
                            	</c:when>
                            	<c:otherwise>
                            		<c:choose>
										<c:when test="${sessionScope.memberId eq null }">
										 <div class="header__top__right__language">
											<img src="img/language.png" alt="">
											<div>회원가입</div>
											<span class="arrow_carrot-down"></span>
											<ul>
												<li><a href="${contextPath }/member/join">회원가입</a></li>
												<li><a href="${contextPath }/member/login">로그인</a></li>
											</ul>
										</div>
										<div class="header__top__right__auth">
			                                <a href="${contextPath }/member/login"><i class="fa fa-user"></i> Login</a>
			                            </div>
										</c:when>
										<c:otherwise>
										<div class="header__top__right__language">
											<img src="img/language.png" alt="">
											<div>${memberId }님 환영합니다</div>
											<span class="arrow_carrot-down"></span>
											<ul>
												<li><a href="${contextPath }/member/update?memberId=${sessionScope.memberId}">My Info</a></li>
												<li><a href="${contextPath }/cart/myCartList">My Cart</a></li>
												<li><a href="${contextPath }/member/myOrderList">My Order</a></li>
											</ul>
										</div>
										<div class="header__top__right__auth">
			                                <a href="${contextPath }/member/logout"><i class="fa fa-user"></i>Logout</a>
			                            </div>
										</c:otherwise>
									</c:choose>
                            	</c:otherwise>
                            </c:choose>
                            
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <c:choose>
                	<c:when test="${sessionScope.adminId eq 'fsadmin' }">
                	
                		<div class="col-lg-6">
		                 <nav class="header__menu">
		                     <ul>
		                         <li class="active"><a href="${contextPath }/admin/adminMain">Home</a></li>
		                         <li><a href="${contextPath }/goods/goodsList?goodsCategory=all">Shop</a></li>
		                         <li><a href="${contextPath }/admin/cartList">CartList</a></li>
		                         <li><a href="${contaxtPath }/fsms/admin/order/orderList">OrderList</a></li>
		                         <li><a href="${contextPath }/contactList">Contact</a></li>
		                     </ul>
		                  </nav>
			             </div>
			             
                	</c:when>
                	<c:otherwise>
                	
                		<div class="col-lg-6">
		                 <nav class="header__menu">
		                     <ul>
		                         <li class="active"><a href="${contextPath }/">Home</a></li>
		                         <li><a href="${contextPath }/goods/goodsList?goodsCategory=all">Shop</a></li>
		                         <li><a href="${contaxtPath }/fsms/cart/myCartList?memberId=${sessionScope.memberId}">My Cart</a></li>
		                         <li><a href="${contaxtPath }/fsms/member/myOrderList?memberId=${sessionScope.memberId}">My Order</a></li>
		                         <li><a href="${contextPath }/contact">Contact</a></li>
		                     </ul>
		                  </nav>
			             </div>
			             
                	</c:otherwise>
                </c:choose>
                
                <div class="col-lg-3">
                    <div class="header__cart">
                    	<c:choose>
                    		<c:when test="${sessionScope.role == 'client' }">
		                        <ul>
		                            <li><a href="${contextPath }/cart/myCartList"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cartCnt }</span></a></li>
		                        </ul>
		                        <div class="header__cart__price">Order: <span>${sessionScope.orderCnt }</span></div>
                    		</c:when>
                    		<c:otherwise>
		                        <ul>
		                            <li><a href="${contextPath }/cart/myCartList"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
		                        </ul>
		                        <div class="header__cart__price">Order: <span>0</span></div>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>

</body>
</html>