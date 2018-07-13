<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">STEP2 옵션선택</h4>
          <div class="choicemenu">
            <div class="img"><img alt="허니오트" src="images/menu/img_recipe_b01.jpg"></div>
            <strong class="tit">허니오트</strong>
            <span class="eng">Honey Oat</span>
            <span class="cal">230 kcal</span>
            <span class="price">5200</span>
            <div class="summary"><p></p></div>
          </div>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div id="option" class="option-wrap">
              <div class="choicepap-wrap">
                  <div class="choicepap-bg">
                    <div class="choicepap">
                      <div class="contents">
                        <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
                        <p><span class="miss-tit">Bread</span>선택 내용을<br> 다시 확인해주세요</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="menu_list_wrapper">
                  <div class="pd_list_wrapper">
                    <!-- Bread -->
                    <div class="bread">
                      <div class="tit">
      									<span class="num">01</span>
      									<strong>Bread<span>(찹샐러드 선택 시 제외)</span></strong>
      								</div>
                      <ul>
                      <c:forEach var="list" items="${list }" >
                      <c:if test="${fn:split(list.mid,'-')[0] eq'P'}">
                        <li class="bread">
                          <div class="img"><img alt="빵이미지" src="images/menu/${list.mid }.jpg"></div>
                          <strong class="tit">${list.name }</strong>
                          <span class="cal">${list.cal } kal</span>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        </c:if>
                        </c:forEach>
                        
                      </ul>
                      <div class="row">
                        <div class="bread-option col-xs-6 col-md-6">
                          <div class="tit">
          									<span class="num">01-2</span>
          									<strong>Size<span>(아침메뉴는 15cm만 가능합니다)</span></strong>
          								</div>
                          <ul>
                            <li class="size">
                              <div class="img"><img alt="15cm" src="images/menu/15cm.jpg"></div>
                              <strong class="tit">15cm</strong>
                              <!-- <span class="cal">40 kcal</span> -->
                              <div id="check"><a href="#"></a></div>
                            </li>
                            <li class="size">
                              <div class="img"><img alt="30cm" src="images/menu/30cm.jpg"></div>
                              <strong class="tit">30cm</strong>
                              <!-- <span class="cal">40 kcal</span> -->
                              <div id="check"><a href="#"></a></div>
                            </li>
                          </ul>
                        </div>
                        <div class="bread-option col-xs-6 col-md-6">
                          <div class="tit">
          									<span class="num">01-3</span>
          									<strong>Heat Up</strong>
          								</div>
                          <ul>
                            <li class="heatup">
                              <div class="img"><img alt="heat" src="images/menu/heat.jpg"></div>
                              <strong class="tit">데워주세요</strong>
                              <span class="eng">Heat up the bread</span>
                              <div id="check"><a href="#"></a></div>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <div id="cover"><p>찹샐러드 선택 시 제외</p></div>
                    </div>
                    <!-- //Bread -->
                    <!-- Cheese -->
                    <div class="cheese">
                      <div class="tit">
                        <span class="num">02</span>
                        <strong>cheese</strong>
                      </div>
                      <ul>
                      
                        <li class="cheese">
                          <div class="img"><img alt="아메리칸 치즈" src="images/menu/T-07.jpg"></div>
                          <strong class="tit">아메리칸 치즈</strong>
                          <span class="eng">American Cheese</span>
                          <span class="cal">40 kcal</span>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        <li class="cheese">
                          <div class="img"><img alt="슈레드 치즈" src="images/menu/img_recipe_c02.jpg"></div>
                          <strong class="tit">슈레드 치즈</strong>
                          <span class="eng">Shredded Cheese</span>
                          <span class="cal">50 kcal</span>
                          <div id="check"><a href="#"></a></div>
                        </li>
                      </ul>
                      <div id="cover"><p>찹샐러드 선택 시 제외</p></div>
                    </div>
                    <!-- //Cheese -->
                    <!--Topping  -->
                    <div class="topping">
                      <div class="tit">
                        <span class="num">03</span>
                        <strong>Extra Topping</strong>
                      </div>
                      <ul>
                      	<c:forEach var="list" items="${list }" >
                      	<c:if test="${fn:split(list.mid,'-')[0] eq'T'}">
                        <li class="topping">
                          <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
                          <strong class="tit">${list.name }</strong>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        
                        </c:if>
                        </c:forEach>
                      </ul>
                    </div>
                    <!-- //Topping -->
                    <!-- Vegetable -->
                    <div class="vegetable">
                      <div class="tit">
                        <span class="num">04</span>
                        <strong>Vegetable</strong>
                        <div id="allselect"><a href="#"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 전체선택</a></div>
                      </div>
                      <ul>
                      	<c:forEach var="list" items="${list }" >
                      	<c:if test="${fn:split(list.mid,'-')[0] eq'V'}">
                        <li class="vegetable">
                          <div class="img"><img alt="${list.name }" src="images/menu/${list.mid }.jpg"></div>
                          <strong class="tit">${list.name }</strong>
                          <span class="cal">${list.cal } kal</span>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        
                        </c:if>
                        </c:forEach>
                      </ul>
                    </div>
                    <!-- //Vegetable -->
                    <!-- Sauce -->
                    <div class="sauce">
                      <div class="tit">
                        <span class="num">05</span>
                        <strong>Sauce<span id="SauceWarning">(! 소스는 최대 3가지까지 선택 가능합니다)</span></strong>
                      </div>
                      <ul>
                      	<c:forEach var="list" items="${list }" >
                      	<c:if test="${fn:split(list.mid,'-')[0] eq'SS'}">
                        <li class="sauce">
                          <div class="img"><img alt="랜치드레싱" src="images/menu/${list.mid }.jpg"></div>
                          <strong class="tit">${list.name }</strong>
                          <span class="cal">${list.cal } kal</span>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        </c:if>
                        </c:forEach>
                      </ul>
                    </div>
                    <!-- //Sauce -->
                    <!-- Set -->
                    <div class="set">
                      <div class="tit">
                        <span class="num">05</span>
                        <strong>Set</strong>
                      </div>
                      <ul>
                        <li class="set">
                          <div class="img"><img alt="단품" src="images/menu/single.png"></div>
                          <strong class="tit">단품</strong>
                          <span class="eng">Single</span>
                          <div class="summary">
                            <p>
                              건강한 브로콜리와 짭쪼름한 체다치즈의<br> 환상적인 조합
                            </p>
                          </div>
                          <div id="check"><a href="#"></a></div>
                        </li>
                        <li class="set">
                          <div class="img"><img alt="세트" src="images/menu/img_store_order05.png"></div>
                          <strong class="tit">세트</strong>
                          <span class="eng">Set</span>
                          <div class="summary">
                            <p>
                              건강한 브로콜리와 짭쪼름한 체다치즈의<br> 환상적인 조합
                            </p>
                          </div>
                          <div id="check"><a href="#"></a></div>
                        </li>
                      </ul>
                      
                      <div class="sides">
                        <div class="tit">
                          <span class="num">05-2</span>
                          <strong>Sides</strong>
                        </div>
                        <ul>
                        <c:forEach var="list" items="${list }" >
                      	<c:if test="${fn:split(list.mid,'-')[1] eq'SD'}">
                          <li class="sides">
                            <div class="img"><img alt="브로콜리 &amp; 체더치즈 수프" src="images/menu/${list.mid }.jpg"></div>
                            <strong class="tit">${list.name }</strong>                    
                            <span class="cal">${list.cal } kal</span>
                            <div id="check"><a href="#"></a></div>
                          </li>
                          </c:if>
                          </c:forEach>
                        </ul>
                        <div class="tit">
                          <span class="num">05-3</span>
                          <strong>Drink</strong>
                        </div>
                        <ul>
                        <c:forEach var="list" items="${list }" >
                      	<c:if test="${fn:split(list.mid,'-')[1] eq'DR'}">
                          <li class="drink">
                            <div class="img"><img alt="탄산음료" src="images/menu/${list.mid }.jpg"></div>
                            <strong class="tit">${list.name}</strong>
                            <div id="check"><a href="#"></a></div>
                          </li>
                          </c:if>
                          </c:forEach>
                        </ul>
                      </div>
                    </div>
                    <!-- //Set -->
                  </div>
                  
                </div>
              </div>
            </div>

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="option-btn">선택 완료</button>
        </div>
</body>
</html>