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
          <h4 class="modal-title" id="gridSystemModalLabel">STEP3 포장</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="container-fluid">
                <div class="row">
                  <div id="option" class="option-wrap">
                    <div class="menu_list_wrapper">
                      <div class="pd_list_wrapper">
                        <!-- Packing -->
                        <div class="packing">
                          <div class="tit">
          									<span class="num"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></span>
          									<strong>packing</strong>
          								</div>
                          <div class="exp">
                            <p>
                              주문리스트를 확인해 주시고<br>
                              <span>매장식사</span> 또는 <span>포장</span>을 선택해 주세요
                            </p>
                          </div>
                          <div class="ordersheet-wrap">
                            <table id="tblorder" class="ordersheet table table-striped">
                              <colgroup>
                                <col width="40px"/>
                                <col width="*"/>
                                <col width="100px"/>
                                <col width="200px"/>
                              </colgroup>
                              <thead>
                                <tr>
                                  <th>no</th>
                                  <th>메뉴</th>
                                  <th>수량</th>
                                  <th>가격</th>
                                </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="list" items="${templist }" varStatus="num">
                              	<tr>
                              		<td>${num.index +1 }</td>
        							<td hidden>${list.mid }</td>
        							<td id="menu">${list.mname }</td>
        							<td>${list.qnt }</td>
        							<td>${(list.optionprice + list.price) *list.qnt  }</td>
                              	</tr>
                              	<tr>
                              		<td>${num.index + 1 }-OP</td>
                              		<td colspan="3">${list.options}</td>
                              	</tr>
                              	</c:forEach>
                              </tbody>
                              </tbody>

                            </table>
                          </div>
                          <p>
                            <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">취소</button>
                          </p>
                          <div class="totalsheet-wrap">
                            <table class="table totalsheet">
                              <tr>
                                <th>총 주문 수량</th>
                                <td>${totalqnt } 개</td>
                                <th>총 결제 금액</th>
                                <td>${totalprice } 원</td>
                              </tr>
                            </table>
                          </div>
                          <div name="togo" class="btn-group btn-group-justified" role="group" aria-label="...">
                            <div class="btn-group" role="group">
                              <button type="button" class="btn btn-default" onclick="location.href='/kiosk/pay.do?togo=매장식사'" value="매장식사">
                                <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
                                매장식사
                              </button>
                            </div>
                            <div class="btn-group" role="group">
                              <button type="button" class="btn btn-default" onclick="location.href='/kiosk/pay.do?togo=포장'" value="포장">
                                <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                                포장
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
       

</body>
</html>