<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" type="text/css" media="print" href="css/subwayadmin.css">
<script>
function print(){

  document.querySelector('#printarea').print();
  const html = document.querySelector('html');
  const printContents = document.querySelector('#printarea').innerHTML;
  const printDiv = document.createElement(&quot;DIV&quot;);
  printDiv.className = &quot;print-div&quot;;

  html.appendChild(printDiv);
  printDiv.innerHTML = printContents;
  document.body.style.display = 'none';
  window.print();
  document.body.style.display = 'block';
  printDiv.style.display = 'none';
}
</script>
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
      <div class="menu-nav">
        <ul>
          <li><a href="/manager/salesDaily.do">일별매출</a></li>
          <li><a href="/manager/salesMonthly.do">월별매출</a></li>
          <li class="active"><a href="/manager/salesOrderList.do">주문내역</a></li>
        </ul>
      </div>
      <div class="row AMcontents marginright0">
        <div class="col-xs-8">
          <div class="page-header">
            <h1>주문 상세</h1>
          </div>
          <div id="printarea">
            <div class="receipt-wrap">
              <div class="tit">${ordernum } 영수증</div>
              <c:if test="${status eq '결제취소'}">
              <div class="tit">${canclenum } 결제취소</div>
              </c:if>
              <div class="receipt">
                <div class="receipt-header">
                  <img src="images/Subway_logo_emblem.png" alt="서브웨이로고">
                  <p><span class="storename">${user.address}</span></p>
                  <p>대표자: ${user.name}<span class="right">TEL: ${user.hpnum}</span></p>
                  <p class="center">www.subwaykorea.co.kr</p>

                </div>
                <div class="receipt-body">
                  <p style="text-align:  right;">${status }/${togo }</p>
                  <p>${regdate } <span class="right">호출번호:${fn:split(ordernum,'-')[2]}</span></p>
                  <table>
                    <thead>
                      <tr>
                        <th>상품명</th>
                        <th>단가</th>
                        <th>수량</th>
                        <th>금액</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${orderinfo }" varStatus="num">
                      <tr>
                        <td>(${list.category })${list.name }</td>
                        <td><fmt:formatNumber value= "${list.price }" groupingUsed="true"/></td>
                        <td>${list.qnt }</td>
                        <td><fmt:formatNumber value= "${list.totalprice}" groupingUsed="true"/></td>
                      </tr>
                      <c:if test="${list.options ne '옵션없음' }">
                      <tr>
                      	<td style="font-size:  0.5em;">${fn:split(list.options,'/')[1]}/${fn:split(list.options,'/')[4]}/${fn:split(list.options,'/')[7]}</td>
                      	<td style="font-size:  0.5em;">
                      	
                      	<c:if test="${list.totalprice < 0 }">
                      	(<fmt:formatNumber value= "${(list.totalprice*-1) - list.price }" groupingUsed="true"/>)
                      	</c:if>
                      	<c:if test="${list.totalprice - list.price > 0 }">
                      	(<fmt:formatNumber value= "${list.totalprice - list.price }" groupingUsed="true"/>)
                      	</c:if>
                      	
                      	</td>
                      	<td colspan="2"></td>
                      </tr>
                      </c:if>
                    </c:forEach>
                      <tr>
                        <td></td>
                        <td colspan="2">과세물품가액</td>
                        <td><fmt:formatNumber value= "${finalprice-tax }" groupingUsed="true"/></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td colspan="2">부가세</td>
                        <td>${tax }</td>
                      </tr>
                    </tbody>
                  </table>
                  <p class="total">합계: <span class="right">&#8361;<fmt:formatNumber value= "${finalprice }" groupingUsed="true"/></span></p>
                  <c:if test="${status eq '결제취소'}">
                  <div class="cancelstamp"><img src="images/Cancel.png" alt="cancel"></div>
				  </c:if>
                </div>
              </div>
            </div>
            
          </div>

        </div>
        <div class="col-xs-4">
          <div class="orderbut-wrap">
            <button type="button" onclick="location.href='/manager/salesOrderList.do'" class="btn btn-success">목록으로</button>
            <button type="button" class="btn btn-info" value="Print" onclick="javascript:print()" >출력하기</button>
            <button type="button" onclick="orderCancle()" class="btn btn-danger"<c:if test="${status eq '결제취소'}">disabled</c:if>>주문취소</button>
          </div>
        </div>
        
        <script>
	        function orderCancle(){
	        	var con = confirm('주문을 취소하시겠습니까?');
	        	 if(con==true){
	        		 location.href="/manager/salesOrderCancle.do?ordernum="+'${ordernum }';
	        	 	}
	        }
        
        </script>
        
      </div>
    </div>
  </div>
  <div class="printit"></div>
</section>
<footer>

</footer>
</body>
</html>