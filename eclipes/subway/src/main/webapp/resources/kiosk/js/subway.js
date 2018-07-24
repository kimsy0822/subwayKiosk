//가격 콤마찍기
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    numberWithCommas($('.price'));
    
    function order(){
		  $.ajax({
			  url: "/kiosk/order.do",
			  success: function(result){
		        $("div#orderformmodal .modal-content").html(result);
		      }
		  });
	  }

////////////////////////메뉴////////////////////////
$(document).ready(function(){
  $('nav ul li a').click(function(){
    $('nav ul li').removeClass('active');
    $(this).parent().addClass('active');
  })

  $('.pd_tab ul li a').click(function(){
    var div_id = $(this).parents('div.tab-pane').attr('id');
    var tab_id = $(this).parent().attr('data-tab');
    //alert(tab_id+"/"+div_id);
    if(tab_id==="all"){
      $('div#'+div_id+' .pd_list_wrapper ul li').css({
        'opacity':'1',
        'display':'block',
        'transform':'matrix(1,0,0,1,0,0)'
      });
    }else {
      $('div#'+div_id+' .pd_list_wrapper ul li').css({
        'opacity':'0',
        'display':'none',
        'transform':'matrix(0.8, 0, 0, 0.8, 0, 0)'
      });
      $('div#'+div_id+' li.'+tab_id).css({
        'opacity':'1',
        'display':'block',
        'transform':'matrix(1,0,0,1,0,0)'
      });
    }
    $('div#'+div_id+' .pd_tab ul li').removeClass('active');
    $(this).parent().addClass('active');

  })

  $('#myTab a[href="#profile"]').tab('show')

})

function TempOrderList(){	
	$.ajax({
		type: "get",
		url: "/kiosk/orderlist.do",
		error: function(error){
			alert("목록가져오기 실패");
		},
		success: function(result){
		//responseText가 result에 저장됨.
			//alert("목록가져오기 성공")
			$("div#orderlist").html(result);
		}
	});
}

////////////////////////샌드위치 선택 메뉴 팝업 & 선택개수 제어////////////////////////

$(document).ready(function(){
	
	
	
  // 샌드위치선택
  $(".pd_list_wrapper li a.btn_view").click(function(){
	
	//옵션선택오류팝업 숨기기
	$('div.choicepap-wrap').hide();
	
	//모닝메뉴 옵션선택시 사이즈 15cm 자동 active 30cm 선택비활성화 초기화
	$('#optionmodal div.bread-option ul li.size:eq(0) div#check').removeClass('active');
    $('#optionmodal div.bread-option ul li.size:eq(1) div#check a').css({ 'pointer-events': 'auto' });
    
    //찹샐러드 선택시 빵옵션 선택 불가 초기화
    $('#optionmodal div.bread ul').css('display','block');
    $('#optionmodal div.cheese ul').css('display','block');
    //$('#optionmodal div.bread').css('position','relative');
    $('#optionmodal div#cover').removeClass('active');

    //옵션 선택 없는 메뉴 체크
    var nonop = $(this).parent().attr('class');
    //alert(nonop);

    $("div#check").removeClass('active');
    $("div#allselect").removeClass('active');
    //처음 세트 사이드 메뉴 숨김
    $('div.sides').css('display','none');

    var img = $(this).siblings('div.img').children('img').attr('src');
    var tit = $(this).siblings('strong.tit').text();
    var mid = $(this).siblings('div.summary').children('p').text();
    var cal = $(this).siblings('span.cal').text();
    var price = $(this).siblings('span.price').text();

    //최상위 탭 id값 확인하기
    var idname=$(this).parent().parent().parent().parent().parent().attr('id');
    //alert(idname);

    if ( nonop.indexOf('nonop') != -1 || idname.indexOf('SidesDrink') != -1) {
      var con = confirm(tit+'를 주문목록에 추가하시겠습니까?');
      if(con == true){

        function nonop_orderadd(e){

          //제품명
          var SelectMenu = tit;
          //제품아이디
          var SelectMenuID = mid;
          //가격
          var SelectMenuPrice = price;
          //옵션
          var ARSelectOption = '옵션없음';
          //수량
          var quantity = 1;
          
          var param="mid="+SelectMenuID+"&mname="+SelectMenu+"&price="+SelectMenuPrice+"&options="+ARSelectOption+"&qnt="+quantity;
          //alert(param);
          
          $.ajax({
  			type: "GET",
  			url: "/kiosk/selectmenu.do",
  			data: param,
  			error: function(){
  				alert("실패입니다");
  			},
  			success: function(){
  				//alert("메뉴가 등록되었습니다.");
  				TempOrderList();
  			}
  		});
     
          $('#optionmodal').modal('hide')


        }

        nonop_orderadd();
      }

    }else{
    	
      $('#optionmodal').modal('show');
      $('#optionmodal div.choicemenu img').attr('src',img);
      $('#optionmodal div.choicemenu strong.tit').text(tit);
      $('#optionmodal div.choicemenu div.summary p').text(mid);
      $('#optionmodal div.choicemenu span.cal').text(cal);
      $('#optionmodal div.choicemenu span.price').text(price);
      //alert(idname);
      
      //모닝메뉴 옵션선택시 사이즈 15cm 자동 active 30cm 선택비활성화
      if(idname==='MorningMenu'){
	      $('#optionmodal div.bread-option ul li.size:eq(0) div#check').addClass('active');
	      $('#optionmodal div.bread-option ul li.size:eq(1) div#check a').css({ 'pointer-events': 'none' });
      }
      
      //찹샐러드 선택시 빵옵션 선택 불가
      if(idname==='ChoppedSalad'){
        $('#optionmodal div.bread ul').css('display','none');
        $('#optionmodal div.cheese ul').css('display','none');
        $('#optionmodal div.bread').css('position','relative');
        $('#optionmodal div.cheese').css('position','relative');
        $('#optionmodal div#cover').addClass('active');
      }

    }

  })

  // 옵션선택
  
  $('div#check a').click(function(){
    $(this).parent().toggleClass('active');
  });

  //빵선택
  
  $('div.bread ul li.bread div#check a').click(function(){
    $('div.bread ul li.bread div#check').removeClass('active');
    $(this).parent().addClass('active');
  })

  //사이즈선택
  $('div.bread-option ul li.size div#check a').click(function(){
    $('div.bread-option ul li.size div#check').removeClass('active');
    $(this).parent().addClass('active');
  })

  //치즈선택
  $('div.cheese ul li.cheese div#check a').click(function(){
    $('div.cheese ul li.cheese div#check').removeClass('active');
    $(this).parent().addClass('active');
  })

  // 야채전체선택
  $('div#allselect a').click(function(){
    $(this).parent().toggleClass('active');
    var classname=$('div#allselect').attr('class');

    if(classname==='active'){
      $('div.vegetable li div#check').addClass('active');
    }else{
      $('div.vegetable li div#check').removeClass('active');
    }
  })
  // 야채전체선택
  $('div.vegetable li div#check').click(function(){
    var count=$('div.vegetable li div.active').length;

    if(count<8){
      $('div#allselect').removeClass('active');
    }else{
      $('div#allselect').addClass('active');
    }
    //alert($('div.vegetable li div.active').length);

  })

  //소스선택
  $('div.sauce li div#check a').click(function(){
    $('div.sauce strong span').removeClass('on');
    var count=$('div.sauce li div.active').length;

    if(count===4){
      $(this).parent().removeClass('active');
      $('div.sauce strong span').addClass('on');     
      
    }
    //alert($('div.vegetable li div.active').length);

  })

  // 세트선택
  $('div.set ul li.set div#check a').click(function(){
      $('div.set ul li.set div#check').removeClass('active');
      $(this).parent().addClass('active');

    var set = $(this).parent().siblings('strong.tit').text();
     if(set==='세트'){
       $('div.sides').slideDown();
       $('.modal-backdrop').css('height','5300px');
     }else{
       $('div.sides').css('display','none');
     }
  })

  //사이드선택(칩or쿠키)
  $('div.sides ul li.sides div#check a').click(function(){
    $('div.sides ul li.sides div#check').removeClass('active');
    $(this).parent().addClass('active');
  })

  //사이드선택(음료)
  $('div.sides ul li.drink div#check a').click(function(){
    $('div.sides ul li.drink div#check').removeClass('active');
    $(this).parent().addClass('active');
  })

});







////////////////////////옵션선택값////////////////////////
$(document).ready(function(){

  
  $("#option-btn").click(orderadd);

  var count = 0; //전역변수 초기값 0 지정
  function orderadd(e){
	  
	//제품명
    var SelectMenu = $('#optionmodal div.choicemenu strong.tit').text();
    //제품아이디
    var SelectMenuID = $('#optionmodal div.choicemenu div.summary p').text();
    //가격
    var SelectMenuPrice = $('#optionmodal div.choicemenu span.price').text();
    //수량
    var quantity = 1;

    var chap = $('#optionmodal div#cover').attr('class');
    //alert(chap)
    if(chap == 'active'){
    	var Bread = '선택사항x';
    	var Size = '선택사항x';
    	var Cheese = '선택사항x';
    	var HeatUP = '선택사항x';
    }else{
    	var Bread = $('#optionmodal li.bread div.active').siblings('strong.tit').text();
    	var Size = $('#optionmodal li.size div.active').siblings('strong.tit').text();
    	var Cheese = $('#optionmodal li.cheese div.active').siblings('strong.tit').text();
    	var HeatUP = $('#optionmodal li.heatup div.active').siblings('strong.tit').text();
        if( HeatUP ==='데워주세요'){
          HeatUP = 'H';
        }else {
          HeatUP = 'NoH';
        }
    }
    
	 
    
    //선택옵션

    //토핑선택배열담기
    var tps = $('#optionmodal div.topping li div.active');

    var ARTopping = new Array();
    if(tps.length === 0){
      Topping="추가없음";
    }else{
      for(i = 0; i<tps.length; i++){
        var child = "#optionmodal div.topping li div.active:eq("+i+")"
        ARTopping[i]= $(child).siblings('strong.tit').text();
      }
      Topping='추가:'+ARTopping;
    }

    //야채선택배열담기
    var vgs = $('#optionmodal li.vegetable div.active');
    var ARVegetable = new Array();
    if( vgs.length === 8 ){
      Vegetable = '야채전체';
    }else{
      var allvg = new Array("양상추","토마토","오이","피망","양파","피클","올리브","할라피뇨");
      for (i = 0; i < vgs.length; i++) {
        var child = "#optionmodal li.vegetable div.active:eq("+i+")"
        ARVegetable[i]= $(child).siblings('strong.tit').text();
        allvg.splice(allvg.indexOf(ARVegetable[i]),1);
        //alert(ARVegetable[i]);
      }
      //alert("ARVegetable"+ARVegetable);
      Vegetable = allvg+" 제외";
    }
    //var Vegetable = $('#optionmodal li.vegetable div.active').siblings('strong.tit').text();

    //소스
    var sas = $('#optionmodal li.sauce div.active');
    var ARSauce = new Array();
    if(sas.length===0){
      Sauce="NoS";
    }else{
      for(i = 0; i<sas.length; i++){
        var child = "#optionmodal li.sauce div.active:eq("+i+")"
        ARSauce[i]= $(child).siblings('strong.tit').text();
      }
      Sauce=ARSauce;
    }
    
  //세트
    var sets = $('#optionmodal div.set li div.active');
    var ARSet = new Array();
    
    for(i = 0; i<3; i++){
        var child = "#optionmodal div.set li div.active:eq("+i+")"
        ARSet[i]= $(child).siblings('strong.tit').text();
      }
    if(ARSet[0]=='단품'){
    	CSet='단품';
    }else{
    	CSet=ARSet;
    }
      
      //alert(ARSet[1]+','+ARSet[2]);


    var OJSelectOption = new Object();
      OJSelectOption.Bread = $('#optionmodal li.bread div.active').siblings('strong.tit').text();
      OJSelectOption.Size = $('#optionmodal li.size div.active').siblings('strong.tit').text();
      OJSelectOption.HeatUp = $('#optionmodal li.heatup div.active').siblings('strong.tit').text();
      OJSelectOption.Cheese = $('#optionmodal li.cheese div.active').siblings('strong.tit').text();
      OJSelectOption.Topping = $('#optionmodal li.topping div.active').siblings('strong.tit').text();
      OJSelectOption.Vegetable = $('#optionmodal li.vegetable div.active').siblings('strong.tit').text();
      OJSelectOption.Sauce = $('#optionmodal li.sauce div.active').siblings('strong.tit').text();
      OJSelectOption.CSet = $('#optionmodal li.side div.active').siblings('strong.tit').text();

    var SelectOption = $('#optionmodal div.active').siblings('strong.tit').text();

    var ARSelectOption = [
      OJSelectOption.Bread,
      OJSelectOption.Size,
      HeatUP,
      OJSelectOption.Cheese,
      Topping,
      Vegetable,
      Sauce,
      CSet
    ];
    
    function showOptionPap(){
    	
  	  $('#optionmodal .choicepap-wrap').show();
  		setTimeout(function(){
  			$('#optionmodal .choicepap-wrap').hide(500);
  		}, 500);
    }

    
    
    if(Bread.length==0){
    	$('#optionmodal .choicepap-wrap .miss-tit').text('Bread');
    	showOptionPap();
    }else if(Size.length==0){
    	$('#optionmodal .choicepap-wrap .miss-tit').text('Size');
    	showOptionPap();
    }else if(Cheese.length==0){
    	$('#optionmodal .choicepap-wrap .miss-tit').text('Cheese');
    	showOptionPap();
    }else if(sets.length==0){
    	$('#optionmodal .choicepap-wrap .miss-tit').text('Set');
    	showOptionPap();	
    }else if(ARSet[0]==='세트'&&ARSet[1]===''){
    	$('#optionmodal .choicepap-wrap .miss-tit').text('Set');
    	showOptionPap();   	
    }else if(ARSet[0]==='세트'&&ARSet[2]===''){
		$('#optionmodal .choicepap-wrap .miss-tit').text('Set');
    	showOptionPap();
	}    else{
    	
    	var SelectOption = $('#optionmodal div.active').siblings('strong.tit').text();

        var ARSelectOption = [Bread,Size,HeatUP,Cheese,Topping,Vegetable,Sauce,CSet];
        //document.getElementById("option").innerHTML = ARSelectOption.join("/");
        var strTemp = ARSelectOption.join('/');
        
        var param="mid="+SelectMenuID+"&mname="+SelectMenu+"&price="+SelectMenuPrice+"&options="+strTemp+"&qnt="+quantity;
        //alert(param);
        
        $.ajax({
			type: "GET",
			url: "/kiosk/selectmenu.do",
			data: param,
			error: function(){
				alert("실패입니다");
			},
			success: function(){
				//alert("메뉴가 등록되었습니다.");
				TempOrderList();
			}
		});
   
        $('#optionmodal').modal('hide')
    	
    }


    

  }

})

////////////////////////결제하기버튼////////////////////////
$(document).ready(function(){
  $("#pay-btn").click(function(){
	  
	  order();

    $('#orderformmodal').modal('show');
    $('#orderformmodal .ordersheet-wrap table#tblorder tbody .input-group button').css({
      'display':'none'
    })
    $('#orderformmodal .ordersheet-wrap table#tblorder tbody .input-group input').css({
      'box-shadow':'none',
      'border':'0',
      'background':'none'
    })
    $('#orderformmodal .ordersheet-wrap table#tblorder tbody td#del').attr('rowspan','1')


  })
})
