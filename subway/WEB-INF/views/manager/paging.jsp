<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
  <ul class="pager">
  	<!-- 시작페이지가 한페이지당 블럭수보다 크면 이전버튼 생성 -->	
    <li><a <c:if test="${startPage > pageBlock}">href="${search}${startPage-1}"</c:if>><span class="glyphicon glyphicon-chevron-up"></span></a></li>
    <!-- 끝페이지가 페이지전체수보다 적으면 다음버튼 생성  -->
    <li><a <c:if test="${endPage < pageCount}">href="${search}${startPage + pageBlock}"</c:if>><span class="glyphicon glyphicon-chevron-down"></span></a></li>
  </ul>
</nav>


<%-- 
<div class="text-center">
	<nav id="paging">
		<ul class="pagination pagination-sm">
		<li>
		  <a href="${search}${startPage}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>  
	    <!-- 끝페이지가 페이지전체수보다 크면 마지막페이지를 전체페이지수로 저장 -->
		<c:if test="${endPage > pageCount}">
			<c:set value="${endPage = pageCount}" var="endPage"/>
		</c:if>
		<!-- 시작페이지가 한페이지당 블럭수보다 크면 이전버튼 생성 -->
		<c:if test="${startPage > pageBlock}">
			 <li><a href="${search}${startPage-1}">이전</a></li>
		</c:if>
		<!-- 시작페이지에서 끝페이지 만큼 페이징 버튼 보이기 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}"> 
			<c:choose>
				<c:when test="${pageNum == i}">
					<li class="active"><a href="#">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${search}${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 끝페이지가 페이지전체수보다 적으면 다음버튼 생성  -->
		<c:if test="${endPage < pageCount}">
			<li><a href="${search}${startPage + pageBlock}">다음</a></li>
		</c:if>
		<li>
	      <a href="${search}${endPage}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
		</ul>
	</nav>	
 --%>

</div>