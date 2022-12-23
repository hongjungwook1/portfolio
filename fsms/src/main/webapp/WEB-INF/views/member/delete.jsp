<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
	/*
	
	$().ready(function () {
		
		$("form").click(function () {
		
			var deleteMe = $("#deleteme").val();
			var searchWord = "Deleteme";
			
			
			if (deleteMe != searchWord) {
				alert("Deleteme를 다시 적어주세요");
			}
			else {
				alert("삭제 되었습니다");
				location.href="${contextPath}/member/main";
			}
			
		});
		
	});
	*/
	
</script>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>

	<div align="center">
		<form action="${contextPath }/member/delete" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${memberDto.memberId }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${memberDto.memberName }</td>
				</tr>
				<tr>
					<td>hp</td>
					<td>${memberDto.hp }</td>
				</tr>
			</table>
			<div align="center">
				<input type="text" name="deleteMe" id="deleteMe" placeholder="DeleteMe를 따라 치세요."> DeleteMe를 따라 치세요.
				<input type="submit" value="삭제하기">
			</div>
		</form>
	</div>

</body>
</html>