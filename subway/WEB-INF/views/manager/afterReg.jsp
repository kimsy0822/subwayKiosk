<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SUBWAY 써브웨이 관리자</title>
<link href="images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
<script>
function window_onload(){
   setTimeout('go_url()',3000)  // 4초후 go_url() 함수를 호출한다.
}
function go_url(){
  location.href="/manager/manLoginForm.do"  // 페이지 이동...
}
</script>
</head>
<body onload="javascript:window_onload()">
<p>관리자를 등록했습니다. 3초 후 로그인페이지로 이동합니다.</p>
</body>
</html>