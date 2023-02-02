<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	
		            var fullRoadAddr = data.roadAddress;
		            var extraRoadAddr = '';
		
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if (data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if (extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            if (fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
		
		            document.getElementById('zipcode').value = data.zonecode; 
		            document.getElementById('roadAddress').value = fullRoadAddr;
		            document.getElementById('jibunAddress').value = data.jibunAddress;
		
		        }
		    }).open();
		}
	</script>



<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
	
	$().ready(function () {
		
		$("#checkId").click(function () {
			
			var memberId = $("#memberId");
			if (memberId.val() == '') {
				alert("아이디를 적어주세요");
				memberId.focus();
			}
			
			
			 $.ajax({
		            type:'post',
		            url:'${contextPath}/member/checkDuplicatedId',
		            data : {"memberId" : memberId.val()},
		            success:function(data){  
		            	if (data == "N") {
		            		alert("사용 가능한 아이디 입니다.");
		            	}
		            	else {
		            		alert("사용 불가능한 아이디 입니다.");
		            	}
		            }
		        });

		});
		
	
		
	
		
		$("form").submit(function () {
			
			
			var memberId = $("#memberId");
			if (memberId.val() == "") {
				alert("아이디는 필수 값 입니다.");
				memberId.focus();
				return false;
			}
			
			var memberName = $("#memberName");
			if (memberName.val() == "") {
				alert("이름은 필수 값 입니다.");
				memberName.focus();
				return false;
			}
			
			var pwd = $("#password");
			if (pwd.val() == "") {
				alert("비밀번호를 적어주세요.");
				pwd.focus();
			}
	
			if (pwd.val().length < 8) {
				alert("최소 비밀번호는 8자리 입니다.");
				pwd.focus();
				return false;
			}
			
			var checkPwd = $("#checkPassword");
			if (pwd.val() != checkPwd.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				checkPwd.focus();
				return false;
			}
			
			
			var hp = $("#hp");
			if (hp.val() == "") {
				alert("핸드폰 번호는 필수 값 입니다.");
				hp.focus();
				return false;
			}
			
			var email = $("#email");
			if (email.val() == "") {
				alert("이메일을 입력하세요.");
				email.focus();
				return false;
			}
			
			
		});
		
		 
	});
</script>

<meta charset="UTF-8">
<title>join</title>
</head>
<body>

    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
              <h2>회 원 가 입</h2>
              	<p>
				<form action="${contextPath }/member/join" method="post">
					<div class="row">
                        <div class="col-lg-8 ">
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>아이디<span>*</span></p>
                                    <input type="text" name="memberId" id="memberId" style="width: 60%;" placeholder="아이디를 적어주세요.">
                                    <input type="button" id="checkId" value="중복 확인" style="width: 30%;">
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
                                     <p>비밀번호 확인<span>*</span></p>
                                     <input type="password" id="checkPassword" placeholder="비밀번호를 한번 더 적어주세요.">
                                 </div>
                             </div>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text" name="memberName" id="memberName" placeholder="이름을 적어주세요.">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="checkout__order__widget">
                                    <p>성별 <span style="color:red;">*</span></p>
                                    남 &nbsp;<input type="radio" name="gender" value="M" checked> &emsp;
                                    여 &nbsp;<input type="radio" name="gender" value="F">
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__input">
                                    <p>생년월일 <span>*</span></p>
                                    <input type="date" name="dateBirth" id="dateBirth"/>
                                </div>
                            </div>
                             <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>핸드폰 번호<span>*</span></p>
                                     <input type="text" name="hp" id="hp" placeholder="- 포함 핸드폰 번호를 적어주세요.">
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__order__widget">
                                     <p>문자 수신 동의<span>*</span></p>
                                     <input type="radio" name="smsstsYn" id="smsstsYn" value="Y" checked> 동의
									 <input type="radio" name="smsstsYn" id="smsstsYn" value="N"> 비동의
                                 </div>
                             </div>
                             <br>
                         	 <div class="col-lg-12">
                                 <div class="checkout__input">
                                     <p>이메일<span>*</span></p>
                                     <input type="email" name="email" id="email" placeholder="이메일을 적어주세요.">
                                 </div>
                             </div>
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="checkout__order__widget">
                                     <p>이메일 수신 동의<span>*</span></p>
                                     <input type="radio" name="emailstsYn" id="emailstsYn" value="Y" checked> 동의
									 <input type="radio" name="emailstsYn" id="emailstsYn" value="N"> 비동의
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
	                        	<button type="submit" class="site-btn"><span></span> 가입</button>
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
    <!-- Checkout Section End -->

</body>
</html>