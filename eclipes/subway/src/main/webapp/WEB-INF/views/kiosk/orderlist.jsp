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

</head>
<body>
<form action="">
  <table id="tblorder" class="table table-striped">
    <colgroup>
      <col width="40px"/>
      <col width="*"/>
      <col width="100px"/>
      <col width="60px"/>
      <col width="50px"/>
    </colgroup>
    <thead>
      <tr>
        <th>no</th>
        <th>메뉴</th>
        <th>수량</th>
        <th>가격</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="list" items="${templist }" varStatus="num">
    	<tr>
        <td>${num.index +1 }</td>
        <td hidden>${list.mid }</td>
        <td id="menu">${list.mname }</td>
        <td>
          <div class="center">
            <div class="input-group">
              <span class="input-group-btn">
                <button onclick="location.href='/kiosk/modiqnt.do?menu=${list.mname }&quant=${list.qnt }&modiqnt=minus'" id="qty-minus" name="modiqnt" value="minus" type="button" class="btn btn-default btn-number" >
                  <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                </button>
              </span>
              <input id="CC-prodDetails-quantity" type="text" name="quant" class="form-control input-number" value="${list.qnt }">
              <span class="input-group-btn">
                <button onclick="location.href='/kiosk/modiqnt.do?menu=${list.mname }&quant=${list.qnt }&modiqnt=plus'" id="qty-plus" name="modiqnt" value="plus" type="button" class="btn btn-default btn-number">
                  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </button>
              </span>
            </div>
          </div>
        </td>
        <td id="price">${(list.optionprice + list.price)*list.qnt  }</td>
        <td id="del" rowspan="2">
          <div class="input-group">
            <button onclick="location.href='/kiosk/tempdel.do?menu=${list.mname }&option=${list.options}'" id="del-btn" type="button" class="btn btn-default" data-type="del" data-field="">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
          </div>
        </td>
      </tr>
      <tr>
        <td>${num.index + 1 }-OP</td>
        <td colspan="3" id="option">${list.options}</td>
      </tr>
    </c:forEach>


    </tbody>
  </table>
</form>

<div class="row">
 <div class="col-xs-6 col-sm-12 col-md-12">
   <table class="table">
     <tr>
       <th>주문수량</th>
       <td>${totalqnt }</td>
     </tr>
     <tr>
       <th>주문금액</th>
       <td>${totalprice }</td>
     </tr>
   </table>
 </div>
</div>

</body>
</html>