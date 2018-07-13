<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SUBWAY 써브웨이</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/subway.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="js/subway.js"></script>
</head>
<body>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane fade active in" id="Sandwich">
    <div class="menu_list_wrapper">
      <!-- 상품별 정렬 tab -->
      <div class="pd_tab">
        <ul>
          <li data-tab="all" class="active"><a class="eng" href="#">All</a></li>
          <li data-tab="cl"><a href="#">클래식</a></li>
          <li data-tab="fl"><a href="#">프레쉬&amp;라이트</a></li>
          <li data-tab="pm"><a href="#">프리미엄</a></li>
        </ul>
      </div>
      <!--// 상품별 정렬 tab -->
      <!-- 상품목록 -->
      <div class="pd_list_wrapper">
        <ul>      
        <c:forEach var="list" items="${list }" varStatus="num">
        <c:if test="${list.category eq'S' }">
          <li class="${fn:split(list.mid,'-')[1]}">
          <c:if test="${list.event eq'Y' }">
          	<!-- label -->
            <div class="label">
              <span class="event">Event</span>
            </div>
            <!--// label -->
          </c:if>
            <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
            <strong class="tit">${list.name }</strong>
            <span class="cal">${list.cal } kcal</span>
            <span class="price">${list.price15 }</span>
            <div class="summary"><p>${list.mid }</p></div>
            <a class="btn_view" data-id="pm09" href="#"></a>
          </li>
          </c:if>
          </c:forEach>        
        </ul>
      </div>
      <!--// 상품목록 -->
    </div>
  </div>
  
  
  <div role="tabpanel" class="tab-pane fade" id="MorningMenu">
    <div class="menu_list_wrapper">
      <!-- 상품목록 -->
      <div class="pd_list_wrapper">
        <ul>
        <c:forEach var="list" items="${list }" varStatus="num">
        <c:if test="${list.category eq'M' }">       
          <li class="bf <c:if test="${fn:split(list.mid,'-')[1] eq'05'}">nonop</c:if>">
          <c:if test="${list.event eq'Y' }">
          	<!-- label -->
            <div class="label">
              <span class="event">Event</span>
            </div>
            <!--// label -->
          </c:if>
            <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
            <strong class="tit">${list.name }</strong>
            <span class="cal">${list.cal } kcal</span>
            <span class="price">${list.price15 }</span>
            <div class="summary"><p>${list.mid }</p></div>
            <a class="btn_view" data-id="bf01" href="#"></a>
          </li>
         </c:if>
         </c:forEach>
        </ul>
      </div>
      <!--// 상품목록 -->
    </div>
  </div>
  <div role="tabpanel" class="tab-pane fade" id="ChoppedSalad">
    <div class="menu_list_wrapper">
      <!-- 상품별 정렬 tab -->
      <div class="pd_tab">
        <ul>
          <li data-tab="all" class="active"><a class="eng" href="all">All</a></li>
          <li data-tab="cl"><a href="#">클래식</a></li>
          <li data-tab="fl"><a href="#">프레쉬&amp;라이트</a></li>
          <li data-tab="pm"><a href="#">프리미엄</a></li>
        </ul>
      </div>
      <!--// 상품별 정렬 tab -->
      <!-- 상품목록 -->
      <div class="pd_list_wrapper">
        <ul>
        <c:forEach var="list" items="${list }" varStatus="num">
        <c:if test="${list.category eq'C' }">  
          <li class="${fn:split(list.mid,'-')[1]}">
          <c:if test="${list.event eq'Y' }">
          	<!-- label -->
            <div class="label">
              <span class="event">Event</span>
            </div>
            <!--// label -->
          </c:if>
            <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
            <strong class="tit">${list.name }</strong>
            <span class="cal">${list.cal } kcal</span>
            <span class="price">${list.price15 }</span>
            <div class="summary"><p>${list.mid }</p></div>
            <a class="btn_view" href="#"></a>
          </li>
         </c:if>
         </c:forEach>        
        </ul>
      </div>
      <!--// 상품목록 -->
    </div>
  </div>
  
  
  <div role="tabpanel" class="tab-pane fade" id="SidesDrink">
    <div class="menu_list_wrapper">
      <!-- 상품별 정렬 tab -->
      <div class="pd_tab">
        <ul>
          <li data-tab="all" class="active"><a class="eng" href="#">All</a></li>
          <li data-tab="sides"><a href="#">사이드메뉴</a></li>
          <li data-tab="drink"><a href="#">음료</a></li>
        </ul>
      </div>
      <!--// 상품별 정렬 tab -->
      <!-- 상품목록 -->
      <div class="pd_list_wrapper">
        <ul>
        <c:forEach var="list" items="${list }" varStatus="num">
        <c:if test="${list.category eq'D' }"> 
            <li class="<c:if test="${fn:split(list.mid,'-')[1] eq'SD'}">sides</c:if> <c:if test="${fn:split(list.mid,'-')[1] eq'DR'}">drink</c:if>">
            <c:if test="${list.event eq'Y' }">
	          	<!-- label -->
	            <div class="label">
	              <span class="event">Event</span>
	            </div>
	            <!--// label -->
	          </c:if>
            
            <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
            <strong class="tit">${list.name }</strong>
            <span class="cal">${list.cal } kcal</span>
            <span class="price">${list.price15 }</span>
            <div class="summary"><p>${list.mid }</p></div>
            <a class="btn_view" href="#"></a>
          </li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <!--// 상품목록 -->
    </div>
  </div>
</div>
</body>
</html>

