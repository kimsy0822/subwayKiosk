<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import = "java.sql.*" %> 
    
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
	var keyWord = selectObj.value
	//alert(keyWord + "가 선택 되었습니다.");
	
	if(keyWord =='mid'){
		show.innerHTML='<input name="keyValue" input id="search" type="text" class="form-control" placeholder="Search">';
	}else if(keyWord =='name'){
		show.innerHTML='<input name="keyValue" input id="search" type="text" class="form-control" placeholder="Search">';
	}else if(keyWord == 'category'){
		show.innerHTML = '<select size="1" name="keyValue" class="select_type_1"><option value="S">샌드위치</option><option value="M">아침메뉴</option><option value="C">찹샐러드</option><option value="T">토핑</option><option value="D">사이드/음료</option><option value="V">야채</option><option value="P">빵</option><option value="SS">소스</option></select>';
	}
}

  function delcheck(mid){
    var con = confirm('정말 삭제하시겠습니까?')
    if(con==true){
      location.href='/manager/productDel.do?mid='+mid;
      alert(mid+'삭제되었습니다')
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
          <li class="active"><a href="/manager/productList.do">상품리스트</a></li>
          <li><a href="/manager/productInsertForm.do">상품등록</a></li>
        </ul>
      </div>
      <div class="row AMcontents">
        <div class="table-wrap col-xs-11">
        	<div class="tit">
              <div class="search-wrap">
                <form name="searchMenu" method="get" class="form-inline" role="search">
                  <div class="form-group">
                  	<label for="search">
					<select size="1" name="keyWord" class="select_type_1" onChange="javascript:selectEvent(this)">
                		<option value="mid">제품번호</option>
                		<option value="name" selected>제품명</option>
                		<option value="category">카테고리</option>
              		</select>
              		</label>
              		<div id="show" style="display:  inline-block;">
              			<input name="keyValue" input id="search" type="text" class="form-control" placeholder="Search">
              		</div>
                    <button id="search-btn" type="submit" class="btn btn-default">Submit</button>
                  </div>
                </form>
              </div>
              <span>(총  ${countList } 개, ${pageNum }/${pageCount })</span>
            </div>
          <table class="table table-condensed table-bordered table-hover">
            <col width="15px"/>
            <col width="70px"/>
            <col width="*"/>
            <col width="20px"/>
            <col width="20px"/>
            <thead>
              <tr>
                <th>no</th>
                <th>MID</th>
                <th>제품명</th>
                <th>수정</th>
                <th>삭제</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="list" items="${productList }" varStatus="num">
              <tr>
                <td>${indexnum + num.index +1}</td>
                <td>${list.mid }</td>
                <td>(${list.category}) ${list.name }</td>
                <td><button class="btn btn-default" onclick="location.href='/manager/productUpdateForm.do?mid=${list.mid }'">수정</button></td>
                <td><button class="btn btn-default" onclick="delcheck('${list.mid }');">삭제</button></td>
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
</body>
</html>