<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 <!-- Breadcrumb Begin -->
 <h2>관리자 로그인</h2>
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Admin</a>
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

 <section class="checkout spad">
        <div class="container">
            	<form action="${contextPath }/admin/fsms/login" method="post" class="checkout__form">
                   <div class="col-lg-8">
                       <h5>로그인</h5>
                       <div class="row">
                           <div class="col-lg-12">
                               <div class="checkout__form__input">
                                   <p>아이디 <span>*</span></p>
                                   <input type="text" name="adminId">
                               </div>
                               <div class="checkout__form__input">
                                   <p>비밀번호 <span>*</span></p>
                                   <input type="password" name="adminPw">
                               </div>
                               <div align="right">
	                               <button type="submit" class="site-btn">로그인</button>
                               </div>
                           </div>
                       </div>
                   </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->


</body>
</html>