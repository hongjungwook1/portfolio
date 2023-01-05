<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/style.css" type="text/css">
</head>
<body>


<section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
              <h2>로 그 인</h2>
              	<p>
				<form action="${contextPath }/member/login" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>아이디<span>*</span></p>
                                    <input type="text" name="memberId" placeholder="아이디를 적어주세요.">
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>비밀번호<span>*</span></p>
                                     <input type="password" name="password" placeholder="비밀번호를 적어주세요.">
                                 </div>
                             </div>
                             <div align="center">
								<button type="submit" class="site-btn"><span class="icon_plus"></span>로그인</button>
							</div>
	                        <p><div align="center">
								이미 회원이시라면
								<a href="${contextPath }/member/login">로그인</a> 하러가기
							</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>



<!-- 
	<div align="center">
		<form action="${contextPath }/member/login" method="post">
			<div>
				<p>아이디 <span>*</span></p>
				<input type="text" name="memberId">
			</div>
			<div>
				<p>비밀번호 <span>*</span></p>
				<input type="password" name="password">
			</div>
			<div align="right">
				<button type="submit">로그인</button>
			</div>
		</form>
	</div>
	<div align="center">
		<p>아직 회원이 아니신가요? 바로 <a href="${contextPath }/member/join">회원가입</a>  하러 가기</p>
	</div>
	
 -->
	
</body>
</html>