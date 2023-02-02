<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>

	<section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
              <h2>회 원 탈 퇴</h2>
				<form action="${contextPath }/member/delete?memberId=${memberDto.memberId}" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>아이디<span>*</span></p>
                                    <input type="text" value="${memberDto.memberId }" readonly="readonly">
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>이름<span>*</span></p>
                                     <input type="text" value="${memberDto.memberName }" readonly="readonly">
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__input">
                                    <p>생년월일 <span>*</span></p>
                                    <input type="date"  value="${memberDto.dateBirth }" readonly="readonly"/>
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>핸드폰 번호<span>*</span></p>
                                     <input type="text" value="${memberDto.hp }" readonly="readonly">
                                 </div>
                             </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>이메일<span>*</span></p>
                                     <input type="email" value="${memberDto.email }" readonly="readonly">
                                 </div>
                             </div>
                             <div align="center">
								<button type="submit" class="site-btn">탈퇴하기</button>
							</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
</body>
</html>