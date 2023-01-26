<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>

	<section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
              <h2>${memberDto.memberId }님의 개인정보 상세보기</h2>
              	<p>
				<form action="${contextPath}/admin/memberDelete?memberId=${memberDto.memberId }" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>아이디<span>*</span></p>
                                    <input type="text" value="${memberDto.memberId }" readonly>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text" value="${memberDto.memberName }" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
								<div class="checkout__input">
                                    <p>성별 <span >*</span></p>
                                  	<input type="text" value="${memberDto.gender }" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                 <p>생년월일 <span>*</span></p>
                                  	 <input type="date" value="${memberDto.dateBirth }" readonly/>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>핸드폰 번호<span>*</span></p>
                                     <input type="text"  value="${memberDto.hp }" readonly>
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__input">
                                     <p>문자 수신 동의<span>*</span></p>
                                     <input type="text" value="${memberDto.smsstsYn }" readonly>
                                 </div>
                             </div>
                         	 <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>이메일<span>*</span></p>
                                     <input type="email" value="${memberDto.email }" readonly>
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__input">
                                     <p>이메일 수신 동의<span>*</span></p>
                                     <input type="text" value="${memberDto.emailstsYn }" readonly>
                                 </div>
                             </div>
                              <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>회원 가입일<span>*</span></p>
                                    <input type="text" value="<fmt:formatDate value='${memberDto.joinDt }' pattern="yyyy-MM-dd"></fmt:formatDate>" readonly>
                                </div>
                              </div>
                             <div align="center">
	                        	<button type="submit" class="site-btn">삭제하기</button>
	                        	<button type="button" class="site-btn" onclick="location.href='${contextPath}/admin/memberList'">목록보기</button>
	                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

</body>
</html>