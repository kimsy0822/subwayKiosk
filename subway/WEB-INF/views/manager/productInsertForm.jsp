<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	var category = selectObj.value
	//alert(keyWord + "가 선택 되었습니다.");
	
	if(category =='S' || category =='C'){
		show.innerHTML='<select class="form-control" name="kind" id="" ><option value="cl">클래식</option><option value="fl">프레쉬 앤 라이트</option><option value="pm">프리미엄</option></select>';
	}else if(category == 'D'){
		show.innerHTML = '<select class="form-control" name="kind" id="" ><option value="DR">음료</option><option value="SD">사이드</option></select>';
	}else{
		show.innerHTML = '<select class="form-control" name="kind" id="" ><option value="">없음</option></select>';
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
          <li><a href="/manager/productList.do">상품리스트</a></li>
          <li class="active"><a href="/manager/productInsertForm.do">상품등록</a></li>
        </ul>
      </div>
      <div class="row AMcontents">
        <div>
          <div class="page-header">
            <h1>상품등록</h1>
          </div>
          <div class="col-md-6 col-md-offset-3">
            <form action="/manager/productInsert.do" method="post" enctype="multipart/form-data">
              <table class="table table-bordered table-condensed">
                <colgroup>
                  <col width="100px">
                </colgroup>
                <tr hidden>
                  <th>메뉴번호</th>
                  <td></td>
                </tr>
                <tr>
                <tr>
                  <th>카테고리</th>
                  <td>
                    <select class="form-control" name="category" id="" onChange="javascript:selectEvent(this)">
                      <option value="S" selected>샌드위치</option>
                      <option value="M">아침식사</option>
                      <option value="C">찹샐러드</option>
                      <option value="T">추가토핑</option>
                      <option value="D">사이드/음료</option>
                      <option value="V">야채</option>
                      <option value="P">빵</option>
                      <option value="SS">소스</option>
                    </select>
                  </td>
                </tr>
               <tr>
                 <th>카테고리2</th>
                  <td>
                  <div id="show" style="display:  inline-block;">
              		<select class="form-control" name="kind" id="" >
                      <option value="cl">클래식</option>
                      <option value="fl">프레쉬 앤 라이트</option>
                      <option value="pm">프리미엄</option>
                    </select>
              		</div>
                    
                  </td>
                </tr>
                <tr>
                  <th>상품명</th>
                  <td>
                    <div class="input-group">
                      <input name="name" type="text" class="form-control">
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>가격15</th>
                  <td>
                    <div class="input-group">
                      <span class="input-group-addon">&#8361;</span>
                      <input name="price15" type="text" class="form-control">
                      <span class="input-group-addon">.00</span>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>가격30</th>
                  <td>
                    <div class="input-group">
                      <span class="input-group-addon">&#8361;</span>
                      <input name="price30" type="text" class="form-control">
                      <span class="input-group-addon">.00</span>
                    </div>
                  </td>
                </tr>
                <tr>
                <tr>
                  <th>칼로리</th>
                  <td>
                    <div class="input-group">
                      <input name="cal"  type="text" class="form-control">
                      <span class="input-group-addon">kcal</span>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>이벤트</th>
                  <td>
                    <div class="checkbox">
                      <label>
                        <input name="event" type="checkbox" id="blankCheckbox" value="Y" aria-label="...">
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>이미지</th>
                  <td><input class="btn" type="file" name="fileload" value=""></td>
                </tr>
              </table>
              <button type="button" onclick="location.href='/manager/productList.do'" class="btn btn-default">취소</button>
              <button type="submit" class="btn btn-success">등록</button>
            </form>
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