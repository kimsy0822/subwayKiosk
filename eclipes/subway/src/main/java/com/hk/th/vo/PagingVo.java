package com.hk.th.vo;

public class PagingVo {
	private String keyWord; //검색 컬럼
	private String keyValue;//검색 값
	private int total;//게시물 총 갯수
	private String pageNum_temp;//현재 페이지번호(문자열)
	private int pageNum;//현재 페이지번호
	private int rowNum=20;//페이지당 보여줄 리스트 수
	private int pageBlock=1;//페이징 블럭 수 <1,2,3,4,5><6,7,8,9,10>
	private int pageCount;//페이징 블럭 전체 수
	private int startPage;//시작페이지
	private int endPage;//끝페이지
	private int limit1;
	private int limit2;
	private String orderWord;
	private String orderValue;
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKeyValue() {
		return keyValue;
	}
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPageNum_temp() {
		return pageNum_temp;
	}
	public void setPageNum_temp(String pageNum_temp) {
		this.pageNum_temp = pageNum_temp;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getLimit1() {
		return limit1;
	}
	public void setLimit1(int limit1) {
		this.limit1 = limit1;
	}
	public int getLimit2() {
		return limit2;
	}
	public void setLimit2(int limit2) {
		this.limit2 = limit2;
	}	
	public String getOrderWord() {
		return orderWord;
	}
	public void setOrderWord(String orderWord) {
		this.orderWord = orderWord;
	}
	public String getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(String orderValue) {
		this.orderValue = orderValue;
	}
}
