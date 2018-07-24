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
</head>
<body>
			<div class="tit">
              <h2>통계리스트</h2>(${monthAgo} ~ ${yesterday})
              <span>(총 ${total }개, ${pageNum }/${pageCount })</span>
            </div>
            <table class="table table-bordered">
           	  <col width="15px"/>
              <thead>
                <tr>
                  <th>no</th>
                  <th>날짜</th>
                  <th>총 매출액</th>
                  <th>총 매출수</th>
                  <th>영업시간</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="list" items="${list}" varStatus="num">
                <tr>
                  <td>${indexnum + num.index +1}</td>
                  <td>${list.regdate}</td>
                  <td><fmt:formatNumber value= "${list.totalsal}" groupingUsed="true"/></td>
                  <td>${list.salcount}</td>
                  <td>${list.saltime}</td>
                </tr>
              </c:forEach> 
              </tbody>
            </table>
            <div class="">
              <c:if test="${total !=0 }">
				<jsp:include page="paging.jsp"></jsp:include>
			  </c:if>
            </div>
</body>
</html>