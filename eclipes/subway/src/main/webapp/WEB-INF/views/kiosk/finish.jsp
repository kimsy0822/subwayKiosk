<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="images/common/subway_favicon.ico" rel="shortcut icon" type="image/x-icon">
<script>
function window_onload(){
   setTimeout('go_url()',4000)  // 4초후 go_url() 함수를 호출한다.
}
function go_url(){
  location.href="/kiosk/main.do"  // 페이지 이동...
}
</script>
</head>
<body onload="javascript:window_onload()">
<header>
  <div id="header" class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12">
        <h1 class="logo"><a href="/kiosk/main.do">SUBWAY</a></h1>
      </div>
    </div>
  </div>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container maxwidth finish-wrap">
      <div class="row">
        <div class="tit">
          <h2>결제완료</h2>
        </div>
        <div class="content finish-pap">
          <h5>결제가 완료되었습니다.</h5>
          <p>메뉴가 준비되면<br>
            주문번호를 호출모니터로 안내해드립니다.<br>
            감사합니다.
          </p>
          <div class="order-num">
           
            <h3>주문번호: ${fn:split(ordernum,'-')[2]}</h3>
            <p>영수증나오는곳</p>
            <div class="receipt-wrap">
              <div class="container">
                <div class="tab"></div>
                <div class="receipt">
                  <div class="paper">
                    <div class="title">Receipt</div>
                    <div class="date">Date: ${regdate }</div>
                    <table>
                      <tbody>
                      <c:forEach var="list" items="${ finishList}" >
                        <tr><td>${list.name } x ${list.qnt } </td> 
                        <td class="right">${list.totalprice } </td></tr>
                      </c:forEach>
                    </tbody>
                    <tr><td colspan="2">=======================================</td></tr>
                    <tr>
                    <td colspan="2" class="right">결제금액: &#8361; ${ finishprice}</td>
                    </tr>
                    </table>
                  </div>
                  <div class="sign center">
                    <div class="barcode"></div>
                    <br/>
                    0123456789
                    <br/>
                    <div class="thankyou">
                    Thank you for your business
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
  
</section>
<footer>
  <div id="footer">
    <div class="content">
      <p class="copyright">SUBWAY® is a Registered Trademark of Subway IP Inc.© 2018 Subway IP Inc.All Rights Reserved.</p>
    </div>
  </div>
</footer>
</body>
</html>
