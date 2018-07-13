<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SUBWAY 써브웨이 관리자</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/subwayadmin.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2O/jquery.min.js"></script>-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<link href="images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
<script src="js/subwayadmin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function pwCheck() {
		var id= document.getElementById("InputId").value;
		var pw= document.getElementById("InputPw").value;
		var re_pw = document.getElementById("re_pw").value;
		
		if(pw != re_pw){
			document.getElementById("result"). value = "비밀번호를 다시 확인 해 주세요";
		}else{
			location.href="/manager/manDelete.do?id="+id+"&pw="+pw;
		}
	}
</script>
<style type="text/css">
	#result{border: none; color: red;}
</style>
</head>
<body>
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img alt="Brand" src="images/logo_sub_header.png">
        </a>
        <div class="nav-btn-wrap">
          <button onclick="location.href='/manager/manMenu.do'" type="button" class="nav-homebtn btn btn-success"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></button>
        </div>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="page-header">
          <h1>관리자수정</h1>
        </div>
		<div class="col-md-6 col-md-offset-3">
         <form id="adminform" action="/manager/manUpdate.do" method="get">
           <div class="form-group">
             <label for="InputID">아이디</label>
             <input type="text" class="form-control" id="InputID" name="id" value="${vo.id}" readonly>
           </div>
           <div class="form-group">
             <label for="InputPassword1">비밀번호</label>
             <input type="password" class="form-control" id="InputPassword1" name="pw" value="${vo.pw}" required>
           </div>
           <div class="form-group">
             <label for="InputPassword2">비밀번호 확인</label>
             <input type="password" class="form-control" id="InputPassword2" name="pw2" value="" placeholder="비밀번호 확인" required>
             <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
           </div>
           <div class="form-group">
             <label for="username">이름</label>
             <input type="text" class="form-control" id="username" name="name" value="${vo.name}" required>
           </div>
           <div class="form-group">
             <label for="phnum">휴대폰번호</label>
             <input type="text" class="form-control" id="phnum" name="hpnum" value="${vo.hpnum}" maxlength="13" required>
           </div>
           <div class="form-group">
             <label for="address">주소</label>
             <input type="text" class="form-control" id="address" name="address" value="${vo.address}" required>
           </div>
           <div class="form-group text-center">
             <button type="button" class="btn btn-warning"  data-toggle="modal" data-target="#checkpwd">삭제</button>
             <button type="submit" class="btn btn-info">수정</button>
           </div>
         </form>
       </div>
      </div>
    </div>
  </div>
  
 <!-- Modal -->
    <div class="modal fade" id="checkpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">관리자를 삭제합니다</h4>
          </div>
          <div class="modal-body">
            <form action="/manager/manDelete.do" method="get">
              <div class="form-group">
                <input type="hidden" class="form-control" id="InputId" name="id" value="${vo.id}" required>
                <input type="hidden" class="form-control" id="InputPw" name="pw" value="${vo.pw}" required >
                <label for="recipient-name" class="control-label">비밀번호 확인</label>
                <input type="password" class="form-control" id="re_pw" name="re_pw" >
              </div>
      
              <div class="form-group">
                <input id="result" value="" onclick="pwCheck()">
              </div>
              <div class="form-group">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="pwCheck()">확인</button>
              </div>
              
            </form>
          </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>
  
</section>
<footer>

</footer>
</body>
</html>