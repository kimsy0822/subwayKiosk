package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;
import com.hk.th.vo.SubwayVo;

public interface KioskDao {
	
	// 메뉴 리스트 전체 불러오기
	public List<SubwayVo> menulist();
	
	//샌드위치 사이즈에 따른 가격 불러오기
	public int selectprice(String mid, String size);
	
	//토핑이름으로 정보 가져오기
	public SubwayVo selectToppingprice(String toppingname);

	//임시테이블에 넣기
	public int insertTempOrder(SubwayVo vo);

	//임시테이블 리스트 불러오기
	public List<SubwayVo> templist();
	
	//메인으로 돌아가면 임시테이블 비우기
	public int emptyTable();
	
	//임시테이블에서 메뉴 지우기
	public int tmepDel(SubwayVo vo);
	
	//메뉴 수량 수정
	public int modifyQnt(SubwayVo vo);
	
	//주문테이블에 저장된 메뉴 갯수 불러오기
	public List<SubwayVo> selectOrderListCount(String todaynum);
	
	//주문테이블 insert
	public int insertOrders(SubwayVo vo);
	
	//주문테이블에서 불러오기
	public List<SubwayVo> orderslist(String ordernum);
	
	//주문과 메뉴 조인후 불러오기
	public List<SubwayVo> finishlist(String ordernum);
	
	//주문상태 수정
	public int modiStatus(SubwayVo vo);
	
}
