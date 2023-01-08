<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	
	<c:if test="${sessionScope.memberId eq null }">
		<script>
			alert("로그인 후 이용 가능합니다.");
			location.href="${contextPath}/member/login";
		</script>
	</c:if>
	
	
	 <section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
              <h2>개인 정보 수정</h2>
              	<p>
				<form action="${contextPath }/member/update" method="post">
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
                                     <p>비밀번호<span>*</span></p>
                                     <input type="password" name="password" id="password" placeholder="비밀번호를 적어주세요.">
                                 </div>
                             </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text" value="${memberDto.memberName }" readonly>
                                </div>
                            </div>
                             <div class="row">
	                            <div class="col-lg-6">
									<div class="checkout__input">
	                                    <p>성별 <span >*</span></p>
	                                  	<input type="text" value="${memberDto.gender }" readonly>
	                                </div>
	                            </div>
	                            <div class="col-lg-6">
	                                <div class="checkout__input">
	                                    <p>생년월일 <span>*</span></p>
	                                    <select id="birthY">
	                                    	<c:forEach var="i" begin="0" end="2022" >
	                                    		<option>${2022 - i}</option>
	                                    	</c:forEach>
	                                    </select>년 
	                                    <select id="birthM">
	                                    	<c:forEach var="i" begin="1" end="12" >
	                                    		<c:choose>
		                                    		<c:when test="${i < 10 }">
			                                    		<option>0${i}</option>
		                                    		</c:when>
		                                    		<c:otherwise>
			                                    		<option>${i}</option>
		                                    		</c:otherwise>
	                                    		</c:choose>
	                                    	</c:forEach>
	                                    </select>월
	                                    <select id="birthD">
	                                    	<c:forEach var="i" begin="1" end="31" >
	                                    		<c:choose>
		                                    		<c:when test="${i < 10 }">
			                                    		<option>0${i}</option>
		                                    		</c:when>
		                                    		<c:otherwise>
			                                    		<option>${i}</option>
		                                    		</c:otherwise>
	                                    		</c:choose>
	                                    	</c:forEach>
	                                    </select>일	
	                                    <input type="hidden" name="dateBirth"/>
	                                </div>
	                            </div>
                            </div>
                            <br>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>핸드폰 번호<span>*</span></p>
                                     <input type="text" name="hp" value="${memberDto.hp }">
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__order__widget">
                                     <p>문자 수신 동의<span>*</span></p>
                                    <input type="radio" name="smsstsYn" value="Y" <c:if test="${memberDto.smsstsYn eq 'Y'}">checked</c:if>> 동의
									<input type="radio" name="smsstsYn" value="N" <c:if test="${memberDto.smsstsYn eq 'N'}">checked</c:if>> 비동의
                                 </div>
                             </div>
                             <br>
                         	 <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>이메일<span>*</span></p>
                                     <input type="email" name="email" value="${memberDto.email }">
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__order__widget">
                                     <p>이메일 수신 동의<span>*</span></p>
                                     <input type="radio" name="emailstsYn" value="Y" <c:if test="${memberDto.emailstsYn eq 'Y'}">checked</c:if>> 동의
									<input type="radio" name="emailstsYn" value="N" <c:if test="${memberDto.emailstsYn eq 'N'}">checked</c:if>> 비동의
                                 </div>
                             </div>
                             <br>
                             
                              <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>우편번호 <span>*</span></p>
                                    <input type="text" id="zipcode" name="zipcode" style="width: 20%;">
                                    <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                </div>
                                <div class="checkout__input">
                                    <p>도로명 주소 <span>*</span></p>
                                    <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>지번 주소 <span>*</span></p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요.">
                                </div>
                                <div class="checkout__input">
                                    <p>나머지 주소 <span>*</span></p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                            </div>
                             <div align="center">
	                        	<button type="submit" class="site-btn"><span class="icon_plus"></span>수정하기</button>
	                        	<input type="hidden" value="${memberDto.memberId }" name="memberId">
	                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	
</body>
</html>