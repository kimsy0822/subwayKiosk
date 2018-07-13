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
#chartdiv {
  width: 100%;
  height: 300px;
}

</style>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript">
$(function(){
	var chart = AmCharts.makeChart("chartdiv", {
	  "type": "serial",
	  "theme": "light",
	  "dataDateFormat": "YYYY-MM-DD",
	  "precision": 0,
	  "valueAxes": [{
	    "id": "v1",
	    "title": "Sales",
	    "position": "left",
	    "autoGridCount": false,
	    "labelFunction": function(value) {
	    	var value2 = value * (0.0001)
	      return "₩" + Math.round(value2) + "만원";
	    }
	  }, {
	    "id": "v2",
	    "title": "Market Days",
	    "gridAlpha": 0,
	    "position": "right",
	    "autoGridCount": false,
	    "labelFunction": function(value) {
	    	var value3 = value * (1)
	      return Math.round(value3) + "시간";
	    }
	  }],
	  "graphs": [{
	    "id": "g4",
	    "valueAxis": "v1",
	    "lineColor": "#62cf73",
	    "fillColors": "#62cf73",
	    "fillAlphas": 1,
	    "type": "column",
	    "title": "총매출",
	    "valueField": "sales1",
	    "clustered": false,
	    "columnWidth": 0.3,
	    "legendValueText":"₩[[value]]원",
	    "balloonText": "[[title]]<br/><b style='font-size: 130%'>₩[[value]]원</b>"
	  }, {
	    "id": "g1",
	    "valueAxis": "v2",
	    "bullet": "round",
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#FFFFFF",
	    "bulletSize": 5,
	    "hideBulletsCount": 50,
	    "lineThickness": 2,
	    "lineColor": "#20acd4",
	    "type": "smoothedLine",
	    "title": "영업시간",
	    "legendValueText": "[[value]]"+"시간",
	    "useLineColorForBulletBorder": true,
	    "valueField": "market1",
	    "balloonText": "[[title]]<br/><b style='font-size: 130%'>[[value]]시간</b>"
	  }],
	  "chartScrollbar": {
	    "graph": "g1",
	    "oppositeAxis": false,
	    "offset": 30,
	    "scrollbarHeight": 50,
	    "backgroundAlpha": 0,
	    "selectedBackgroundAlpha": 0.1,
	    "selectedBackgroundColor": "#888888",
	    "graphFillAlpha": 0,
	    "graphLineAlpha": 0.5,
	    "selectedGraphFillAlpha": 0,
	    "selectedGraphLineAlpha": 1,
	    "autoGridCount": true,
	    "color": "#AAAAAA"
	  },
	  "chartCursor": {
	    "pan": true,
	    "valueLineEnabled": true,
	    "valueLineBalloonEnabled": true,
	    "cursorAlpha": 0,
	    "valueLineAlpha": 0.2
	  },
	  "categoryField": "date",
	  "categoryAxis": {
	    "parseDates": false,
	    "dashLength": 1,
	    "minorGridEnabled": true,
	  },
	  "legend": {
	    "useGraphSettings": true,
	    "position": "top"
	  },
	  "balloon": {
	    "borderThickness": 1,
	    "shadowAlpha": 0
	  },
	  "export": {
	   "enabled": true
	  },
	  "dataProvider": [
		  <c:forEach items="${list}" var="list">
		  {
		    "date": "${list.regdate}",
		    "market1": "${list.qnt}",
		    "sales1": "${list.totalsal}"
		  },
		 </c:forEach>]
		});
})

$(document).ready(function(){

	  //orderlist();
	  
	  function orderlist(){
		  $.ajax({
		      url: "/manager/salesDailyList.do",
		      success: function(result){
		        $("div.statistics-list").html(result);
		      }
		    });
	  }
})


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
          <li class="active"><a href="/manager/salesDaily.do">일별매출</a></li>
          <li><a href="/manager/salesMonthly.do">월별매출</a></li>
          <li><a href="/manager/salesOrderList.do">주문내역</a></li>
        </ul>
      </div>
      <div class="AMcontents">
        <div class="row marginright0">
          <div class="statistics-wrap col-xs-12">
            <div class="tit">
              <h2>통계그래프</h2>
              <span>(${aMonthAgo}~${yesterday})</span>
            </div>
            <div class="statistics-graph">

              <div id="chartdiv"></div>

            </div>
          </div>
        </div>
        <div class="row marginright0">
        
          <div class="statistics-list col-xs-9">
            <iframe src="/manager/salesDailyList.do" style="width: 100%;height: 500px;border: 0;"  scrolling="no"></iframe>
          </div>
          <div class="rank-wrap col-xs-3">
          	<iframe src="/manager/salesDailyRank.do" style="width: 100%;height: 500px;border: 0;"  scrolling="no"></iframe>
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