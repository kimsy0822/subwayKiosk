<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SUBWAY 써브웨이</title>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/subway.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<link href="images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
<script>

	function realDelete(){
	 var con = confirm('메뉴를 전체 삭제하시겠습니까?');
	 if(con==true){
		 location.href="/kiosk/emptytable.do";
	 	}
	 }
	 
  $(document).ready(function(){
	  
	  menulist();
	  orderlist();
	  option();
	  order();
	  
	  function menulist(){
		  $.ajax({
		      url: "/kiosk/menulist.do",
		      success: function(result){
		        $("div#menulist").html(result);
		      }
		    });
	  }
	  
	  function orderlist(){
		  $.ajax({
		      url: "/kiosk/orderlist.do",
		      success: function(result){
		        $("div#orderlist").html(result);
		      }
		    });
	  }
	  
	  function option(){
		  $.ajax({
		      url: "/kiosk/option.do",
		      success: function(result){
		        $("div#optionmodal .modal-content").html(result);
		      }
		    });
	  }
	  
	  function order(){
		  $.ajax({
			  url: "/kiosk/order.do",
			  success: function(result){
		        $("div#orderformmodal .modal-content").html(result);
		      }
		  });
	  }
	  
	 
	 
	    

    //$("#menulist").load("menulist.html");
  });

</script>
</head>
<body>
<header>
  <div id="header" class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12">
        <h1 class="logo"><a href="#" onclick="realDelete();">SUBWAY</a></h1>
      </div>
    </div>
  </div>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-7">

          <div role="tabpanel">
            <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" data-tab="Sandwich" class="active" ><a href="#Sandwich" aria-controls="Sandwich" role="tab" data-toggle="tab">샌드위치</a></li>
              <li role="presentation" data-tab="MorningMenu"><a href="#MorningMenu" aria-controls="MorningMenu" role="tab" data-toggle="tab">아침메뉴</a></li>
              <li role="presentation" data-tab="ChoppedSalad"><a href="#ChoppedSalad" aria-controls="ChoppedSalad" role="tab" data-toggle="tab">찹샐러드</a></li>
              <li role="presentation" data-tab="SidesDrink"><a href="#SidesDrink" aria-controls="SidesDrink" role="tab" data-toggle="tab">사이드&amp;음료</a></li>
            </ul>
            <div id="menulist"></div>

          </div>
        </div>

        <div class="col-xs-12 col-sm-6 col-md-5">
          <div class="order-list" id="orderlist"></div>
          
          
            <div class="col-xs-6 col-sm-12 col-md-12 orderbtn-group">
              <a href="#" onclick="realDelete();" class="btn btn-default"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>전체취소</a>
              <a href="#" class="btn btn-success" id="pay-btn" data-target="orderformmodal"><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>신용카드결제</a>
            </div>
          </div>
        </div>

      </div>
    </div>
    
   <div id="orderformmodal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
      </div>
    </div>
  </div>
  
  <div id="optionmodal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">

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
