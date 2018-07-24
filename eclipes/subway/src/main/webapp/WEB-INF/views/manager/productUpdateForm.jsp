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
          <button onclick="location.href='/manager/menu.do'" type="button" class="nav-homebtn btn btn-success"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></button>
        </div>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="menu-nav">
        <ul>
          <li><a href="/manager/productList.do">상품리스트</a></li>
          <li class=""><a href="/manager/productInsertForm.do">상품등록</a></li>
        </ul>
      </div>
      <div class="row AMcontents">
        <div>
          <div class="page-header">
            <h1>상품수정</h1>
          </div>
          <div class="col-md-6 col-md-offset-3">
            <form action="/manager/productUpdate.do" method="post" enctype="multipart/form-data">
              <table class="table table-bordered table-condensed">
              	<colgroup>
                  <col width="100px">
                </colgroup>
                <tr>
                  <th>메뉴번호</th>
                  <td>
                  	<input type="text" class="nostyle" name="mid" value="${menu.mid}" style="border: 0;" readonly>
				  </td>
                </tr>
                <tr>
                <tr>
                  <th>카테고리</th>
                  <td>
                    <select class="form-control" name="category" id="" disabled>
                      <option value="S" <c:if test="${menu.category eq 'S'}">selected</c:if>>샌드위치</option>
                      <option value="M" <c:if test="${menu.category eq 'M'}">selected</c:if>>아침식사</option>
                      <option value="C" <c:if test="${menu.category eq 'C'}">selected</c:if>>찹샐러드</option>
                      <option value="T" <c:if test="${menu.category eq 'T'}">selected</c:if>>추가토핑</option>
                      <option value="D" <c:if test="${menu.category eq 'D'}">selected</c:if>>사이드/음료</option>
                      <option value="V" <c:if test="${menu.category eq 'V'}">selected</c:if>>야채</option>
                      <option value="P" <c:if test="${menu.category eq 'P'}">selected</c:if>>빵</option>
                      <option value="SS" <c:if test="${menu.category eq 'SS'}">selected</c:if>>소스</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <th>상품명</th>
                  <td>${menu.name}</td>
                </tr>
                <tr>
                  <th>가격15</th>
                  <td>
                    <div class="input-group">
                      <span class="input-group-addon">&#8361;</span>
                      <input type="text" class="form-control" name="price15" value="${menu.price15}">
                      <span class="input-group-addon"></span>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>가격30</th>
                  <td>
                    <div class="input-group">
                      <span class="input-group-addon">&#8361;</span>
                      <input type="text" class="form-control" name="price30" value="${menu.price30}">
                      <span class="input-group-addon"></span>
                    </div>
                  </td>
                </tr>
                <tr>
                <tr>
                  <th>칼로리</th>
                  <td>
                    <div class="input-group">
                      <input type="text" class="form-control" name="cal" value="${menu.cal}">
                      <span class="input-group-addon"></span>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>이벤트</th>
                  <td>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" id="blankCheckbox" name="event" value="Y" aria-label="..." <c:if test="${menu.event eq 'Y'}">checked</c:if>>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>이미지</th>
                  <td><input class="btn" type="file" name="fileload" value=""><img src="/kiosk/images/menu/${menu.img}" style="width: 200px;" onerror="this.src='/manager/images/default-thumbnail.jpg'"></td>
                </tr>
              </table>
              <button type="button" onclick="location.href='/manager/productList.do'" class="btn btn-default">취소</button>
              <button type="submit" class="btn btn-success">수정</button>
            </form>
          </div>
        
        </div>

      </div>
    </div>
  </div>
</section>
<footer>

</footer>
</body>
</html>