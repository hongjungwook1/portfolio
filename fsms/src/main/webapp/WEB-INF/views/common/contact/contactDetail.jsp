<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Contact Detail</h2>
                    </div>
                </div>
            </div>
            <form action="${contextPath}/removeContact" method="get">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" value=${contactDto.name } >
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" value=${contactDto.email }>
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea>${contactDto.content }</textarea>
                        <button type="submit" class="site-btn">REMOVE MESSAGE</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
	
</body>
</html>