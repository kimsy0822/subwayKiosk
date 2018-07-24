package com.hk.th.vo;

public class SubwayVo {
	
	//메뉴 테이블
	private String mid;
	private String category;
	private String name;
	private String size;
	private int price15;
	private int price30;
	private String event;
	private int cal;
	private String img;
	
	//임시주문 테이블
	//private String mid;
	private String mname;
	private int price;
	private String options;
	private int qnt;
	private int optionprice;
	private String date;
	
	//주문 테이블
	private String ordernum;
	//private String mid;
	private String canclenum;
	private String status;
	//private String options;
	//private int qnt;
	private int totalprice;
	private String togo;
	private String regdate;
	private int except;
	private int finalprice;

	//매출 테이블
	private String m;
	private String opentime;
	private String closetime;
	private int salcount;
	private int canclecount;
	private int totalsal;
	private String saltime;
	
	

	//Getter, Setter	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getPrice15() {
		return price15;
	}
	public void setPrice15(int price15) {
		this.price15 = price15;
	}
	public int getPrice30() {
		return price30;
	}
	public void setPrice30(int price30) {
		this.price30 = price30;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public int getQnt() {
		return qnt;
	}
	public void setQnt(int qnt) {
		this.qnt = qnt;
	}
	public int getOptionprice() {
		return optionprice;
	}
	public void setOptionprice(int optionprice) {
		this.optionprice = optionprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getCanclenum() {
		return canclenum;
	}
	public void setCanclenum(String canclenum) {
		this.canclenum = canclenum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTogo() {
		return togo;
	}
	public void setTogo(String togo) {
		this.togo = togo;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getExcept() {
		return except;
	}
	public void setExcept(int except) {
		this.except = except;
	}
	public int getFinalprice() {
		return finalprice;
	}
	public void setFinalprice(int finalprice) {
		this.finalprice = finalprice;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	public int getSalcount() {
		return salcount;
	}
	public void setSalcount(int salcount) {
		this.salcount = salcount;
	}
	public int getCanclecount() {
		return canclecount;
	}
	public void setCanclecount(int canclecount) {
		this.canclecount = canclecount;
	}
	public int getTotalsal() {
		return totalsal;
	}
	public void setTotalsal(int totalsal) {
		this.totalsal = totalsal;
	}
	
	public String getSaltime() {
		return saltime;
	}
	public void setSaltime(String saltime) {
		this.saltime = saltime;
	}
	public String getM() {
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}	
	
}