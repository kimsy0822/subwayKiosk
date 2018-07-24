package com.hk.th.service;

import java.util.ArrayList;
import com.hk.th.vo.SubwayVo;

public interface KioskService {

	// 메뉴 리스트 전체 불러오기
	public ArrayList<SubwayVo> getListAll();
	
	//배열에 있는 옵션값 불러오기
	
	//샌드위치 사이즈에 따른 가격 불러오기
	public int getPrice(String mid, String size);
	
	//샌드위치 사이즈에 따른 토핑가격 불러오기
	public String toppingprice(String size, String toppings);
	
	//임시테이블에 넣기
	public int insertTemp(SubwayVo vo);
	
	//임시테이블 리스트 부르기
	public ArrayList<SubwayVo> getTempList();
	
	//메인으로 돌아가면 임시테이블 비우기
	public int emptyTable();
	
	//임시테이블에서 메뉴 지우기
	public int tmepOrderDel(String mname, String option);
	
	//메뉴 수량 수정
	public int modiQnt(String mname, String qnt);
	
	//주문테이블에 저장된 메뉴 갯수 불러오기
	public ArrayList<SubwayVo> orderlistCount(String todaynum);
	
	//주문테이블 insert
	public int insertOrders(SubwayVo vo);
	
	//주문테이블에서 가져오기
	public ArrayList<SubwayVo> selectOrdersList(String ordernum);
	
	//주문과 메뉴 조인후 불러오기
	public ArrayList<SubwayVo> selectFinishList(String ordernum);
	
	//주문상태 수정
	public int modiStatus(String ordernum, String status);
	
}
