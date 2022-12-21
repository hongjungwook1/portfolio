<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	$().ready(function () {
		
		$("#checkId").click(function () {
			
			var memberId = $("#memberId").val();
			
			if (memberId == '') {
				alert("아이디를 입력하세요.");
				return;
			}
		});
		
		
		$("form").submit(function () {
			
			var smsstsYn = $("#smsstsYn").val();
			
			if (!smsstsYn.checked()) {
				alert("문자 수신 동의를 체크해주세요");
				return false;
			}
			
			if (!$("#emailstsYn").val().prop("checked" , false)) {
				alert("이메일 수신 동의를 체크해주세요");
				return ;
			}
		
		});
		
		
	});
</script>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	
	<div align="center">
		<h2>회 원 가 입</h2>
		<form action="${contextPath }/member/join" method="post">
			<table border="1">
				<tr>
					<td>아이디 : <input type="text" name="memberId" id="memberId" placeholder="아이디를 적어주세요.">
								 <input type="button" id="checkId" value="아이디 중복 체크">
					</td>
				</tr>
				<tr>
					<td>이름 : <input type="text" name="memberName" id="memberName" placeholder="이름을 적어주세요."></td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="password" id="password" placeholder="비밀번호를 적어주세요."></td>
				</tr>
				<tr>
					<td>비밀번호 확인 : <input type="password" id="checkPassword" placeholder="비밀번호를 한번 더 적어주세요."></td>
				</tr>
				<tr>
					<td>성별 :  <input type="radio" name="gender" value="M"> 남자
								<input type="radio" name="gender" value="F"> 여자
					</td>
				</tr>
				<tr>
					<td>생년월일
						<select>
							<c:forEach begin="1950" end="2022" var="i">
								<option selected="2022">
									<c:out value="${i }" />
								</option>
							</c:forEach>
						</select> 년
						<select>
							<c:forEach begin="1" end="12" var="i">
								<c:choose>
									<c:when test="${i < 10 }">
										<option>
											<c:out value="0${i }" />
										</option>
									</c:when>
									<c:otherwise>
										<option>
											<c:out value="${i }" />
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> 월
						<select>
							<c:forEach begin="1" end="31" var="i">
								<c:choose>
									<c:when test="${i < 10 }">
										<option>
											<c:out value="0${i }" />
										</option>
									</c:when>
									<c:otherwise>
										<option>
											<c:out value="${i }" />
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> 일
					</td>
				</tr>
				<tr>
					<td>핸드폰 번호 : <input type="text" name="hp" id="hp" placeholder="- 포함 핸드폰 번호를 적어주세요.">
					</td>
				</tr>
				<tr>
					<td>문자 수신 동의 : <input type="radio" name="smsstsYn" id="smsstsYn" value="Y"> 동의
										 <input type="radio" name="smsstsYn" id="smsstsYn" value="N"> 비동의
					</td>
				</tr>
				<tr>
					<td>이메일 : <input type="email" name="email" id="email" placeholder="이메일을 적어주세요.">
					</td>
				</tr>
				<tr>
					<td>이메일 수신 동의 :  <input type="radio" name="emailstsYn" id="emailstsYn" value="Y"> 동의
											<input type="radio" name="emailstsYn" id="emailstsYn" value="N"> 비동의
					</td>
				</tr>
				<tr>
					<td>우편번호 : <input type="text" name="zipCode" id="zipCode" placeholder="우편번호를 적어주세요.">
					</td>
				</tr>
				<tr>
					<td>도로명 주소 : <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명 주소를 적어주세요."></td>
				</tr>
				<tr>
					<td>지번 주소 : <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번 주소를 적어주세요."></td>
				</tr>
				<tr>
					<td>나머지 주소 : <input type="text" name="namujiAddress" id="namujiAddress" placeholder="나머지 주소를 적어주세요."></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="가입하기">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
			<div align="center">
				이미 회원이시라면
				<a href="${contextPath }/member/login">로그인</a> 하러가기
			</div>
		</form>
	</div>
</body>
</html>