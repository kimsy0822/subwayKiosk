$(document).ready(function(){
  $('#submit-btn').click(function(){

    if($('#InputPassword1').val()!=$('#InputPassword2').val()){
     $('p.help-block').text('비밀번호가 일치하지 않습니다!!!').css('color','red').slidedown();
     //$('font[name=check]').html("암호틀림");
    }else{
     $("form#adminform").submit();
    }
  });
})


$(document).ready(function(){

  $('#InputPassword1').keyup(function(){
  }); //#user_pass.keyup

  $('#InputPassword2').keyup(function(){
   if($('#InputPassword1').val()!=$('#InputPassword2').val()){
    $('p.help-block').text('비밀번호가 일치하지 않습니다.').css('color','red');
    //$('font[name=check]').html("암호틀림");
   }else{
    $('p.help-block').text('비밀번호가 일치합니다').css('color','green');
    //$('font[name=check]').html("암호맞음");
   }
  });

  function autoHypenPhone(str){
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if( str.length < 4){
    return str;
  }else if(str.length < 7){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3);
    return tmp;
  }else if(str.length < 11){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 3);
    tmp += '-';
    tmp += str.substr(6);
    return tmp;
  }else{
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 4);
    tmp += '-';
    tmp += str.substr(7);
    return tmp;
  }
  return str;
  }

  var phnum = document.getElementById('phnum');
  phnum.onkeyup = function(event){
          event = event || window.event;
          var _val = this.value.trim();
          this.value = autoHypenPhone(_val) ;
  }

})
