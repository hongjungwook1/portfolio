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
        <div class="row">
        </div>
        <div class="checkout__form">
          <h2>관리자 로그인</h2>
          	<p>
			<form action="${contextPath }/admin/fsms/login" method="post" >
              <div class="row">
                  <div class="col-lg-8 col-md-6">
                      <div class="col-lg-12">
                          <div class="checkout__input">
                              <p>아이디<span>*</span></p>
                              <input type="text" name="adminId" placeholder="관리자 아이디를 적어주세요.">
                          </div>
                      </div>
                       <div class="col-lg-12">
                           <div class="checkout__input">
                               <p>비밀번호<span>*</span></p>
                               <input type="password" name="adminPw" placeholder="관리자 비밀번호를 적어주세요.">
                           </div>
                       </div>
                       <div align="center">
						<button type="submit" class="site-btn"><span class="icon_plus"></span>로그인</button>
						</div>
                  </div>
              </div>
          </form>
      </div>
  </div>
</section>
</body>
</html>