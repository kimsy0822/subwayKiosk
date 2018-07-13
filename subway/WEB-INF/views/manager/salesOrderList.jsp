<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
<script>
function selectEvent(selectObj) {
	var keyWord = selectObj.value
	//alert(keyWord + "가 선택 되었습니다.");
	
	if(keyWord =='ordernum'){
		show.innerHTML='<input name="keyValue" input id="search" type="text" class="form-control" placeholder="Search">';
	}else if(keyWord =='status'){
		show.innerHTML ='<select size="1" name="keyValue" class="select_type_1"><option value="결제완료">결제완료</option><option value="결제취소">결제취소</option></select>';
	}else if(keyWord == 'regdate'){
		show.innerHTML = '<div class="docs-datepicker"><div class="input-group"><input type="text" class="form-control docs-date" name="keyValue" placeholder=""></div><div class="docs-datepicker-container" style="display: none;"></div></div>';
	}
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
               
          <div class="orderlist-wrap col-xs-11">
            <div class="tit">
              <div class="search-wrap">
                <form name="searchOrder" method="get" class="form-inline" role="search">
                  <div class="form-group">
                  	<label for="search">
					<select size="1" name="keyWord" class="select_type_1" onChange="javascript:selectEvent(this)">
                		<option value="ordernum">주문번호</option>
                		<option value="regdate">날짜</option>
                		<option value="status">상태</option>
              		</select>
              		</label>
              		<div id="show" style="display:  inline-block;">
              			<input name="keyValue" input id="search" type="text" class="form-control" placeholder="Search">
              		</div>
                    <button id="search-btn" type="submit" class="btn btn-default">Submit</button>
                  </div>
                </form>
              </div>
              <span>(총 ${total }개, ${pageNum }/${pageCount })</span>
            </div>
            <table class="table table-condensed table-bordered table-hover">

              <col width="15px"/>
              <col width="120px"/>
              <col width="*"/>
              <col width="70px"/>
              <col width="70px"/>
              <col width="120px"/>

              <thead>
                <tr>
                  <th>no</th>
                  <th>주문번호</th>
                  <th>제품명</th>
                  <th>상태</th>
                  <th>총 결제액</th>
                  <th>날짜</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="list" items="${orderlist }" varStatus="num">
                <tr>
                  <td>${indexnum + num.index +1}</td>
                  <td><a href="/manager/salesOrderDetail.do?ordernum=${list.ordernum }">${list.ordernum }</a></td>
                  <td>(${list.category }) ${list.name } <c:if test="${list.except > 1 }">외 ${list.except-1 } 건</c:if></</td>
                  <td <c:if test="${list.status eq '결제취소' }">style="color:#dc0000;"</c:if> >${list.status }</td>
                  <td style="text-align:right;"><fmt:formatNumber value= "${list.finalprice }" groupingUsed="true"/></td>
                  <td>
                  <fmt:parseDate value="${list.regdate }" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss.s"/>
				  <fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd HH:mm"/>
                  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="col-xs-1"style="height: 100%; padding: 0;">
            <div class="pagging perpendpagebtn ">
	            <div class="pagewrap">
					<c:if test="${total !=0 }">
						<jsp:include page="paging.jsp"></jsp:include>
					</c:if>
				</div>
            </div>
          </div>

      </div>
    </div>
  </div>

</section>
<footer>

</footer>
<!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
  <script src="https://fengyuanchen.github.io/js/common.js"></script>
  <script src="js/datepicker.js"></script>
  <script src="js/datepicker.en-US.js"></script>
  <script src="js/datepicker.ko-KR.js"></script>
  <script src="js/main.js"></script>
</body>
</html>