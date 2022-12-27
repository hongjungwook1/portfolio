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
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
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
                            	<c:when test="${sessionScope.memberId eq null }">
                            		 <div class="header__top__right__language">
		                                <img src="img/language.png" alt="">
		                                <div>회원가입</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="">회원가입</a></li>
		                                    <li><a href="">로그인</a></li>
		                                </ul>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="header__top__right__language">
		                                <img src="img/language.png" alt="">
		                                <div>${memberId }님 환영합니다</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="${contextPath }/member/memberUpdate?memberId=${sessionScope.memberId}">정보 수정하기</a></li>
		                                    <li><a href="${contextPath }/member/logout">로그 아웃</a></li>
		                                </ul>
		                            </div>
                            	</c:otherwise>
                            </c:choose>
                            <c:choose>
                            	<c:when test="${sessionScope.memberId eq null }">
		                            <div class="header__top__right__auth">
		                                <a href="${contextPath }/member/login"><i class="fa fa-user"></i> Login</a>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="header__top__right__auth">
		                                <a href="${contextPath }/member/logout"><i class="fa fa-user"></i>logout</a>
		                            </div>
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
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
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