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
<style>
.tit {position:relative;}
.tit h2{display: inline-block;}
.tit span{position:absolute; right:0; bottom:0; font-size: 0.7em;}
table{font-size: 0.7em;}
</style>
<script>
function selectEvent(selectObj) {
	var date = selectObj.value
	//alert(date + "가 선택 되었습니다.");
	location.href="/manager/salesMonthlyRank.do?date="+date;
}
</script>

</head>
<body>
			 <div class="tit">
              <h2>판매순위</h2>
            </div>
            <form name="searchOrder" method="get" class="form-inline" role="search">
                 <div class="form-group">
                 	<label for="search">
				<select size="1" name="Date" class="select_type_1" onChange="javascript:selectEvent(this)">
               		<c:forEach items="${ sel}" var="sel">
               		<option value="${sel.date}" <c:if test="${sel.date eq chDate }" >selected="selected"</c:if>>${sel.date}</option>
					</c:forEach>
             		</select>
             		</label>
                 </div>
               </form>
            <table class="table">
              <thead>
                <tr>
                  <th>순위</th>
                  <th>제품명</th>
                  <th>판매량</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="list" items="${ rankList}" varStatus="num" begin="0" end="9">
                <tr>
                  <td>${num.index +1 }</td>
                  <td>(${list.category}) ${list.name }</td>
                  <td>${list.qnt}</td>
                </tr>
                </c:forEach>

              </tbody>
            </table>
</body>
</html>