package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.ManagerVo;
import com.hk.th.vo.PagingVo;
import com.hk.th.vo.SubwayVo;

public interface ManagerService {

	//관리자테이블 데이터 수 검색
	public int getManager();
	
	//관리자 등록
	public int regMan(ManagerVo manvo);
	
	//로그인
	public int getLoginMan(ManagerVo manvo);

	//관리자 리스트 불러오기
	public ManagerVo getManagerInfo(String id);
	
	//관리자 정보 수정
	public int manModi(ManagerVo manvo);
	
	//관리자 삭제
	public int managerDel(String id);
	
	//상품리스트 가져오기
	public ArrayList<SubwayVo> getMenulist();
	//상품검색리스트가져오기
	public ArrayList<SubwayVo> getschMenuList(PagingVo pagingVo);
	//상품갯수
	public int getCountMenulist();
	//상품검색갯수
	public int getschCountMenuList(PagingVo pagingVo);
	
	//카테고리별 갯수
	public int getCountCategory(String category);
	
	//상품등록
	public int newmenuInsert(SubwayVo vo);
	
	//상품 수정
	public int modiMenu(SubwayVo vo);

	//상품vo
	public SubwayVo getMenu(String mid);

	//상품삭제
	public int menuDelete(String mid);
	
	//주문리스트개수
	public int OrderCount(PagingVo pagingVo);
	
	//페이징
	public PagingVo setPagingInfo(PagingVo pagingVo);
	
	//주문리스트
	public ArrayList<SubwayVo> getOrderList(PagingVo pagingVo);
	
	//주문상세
	public ArrayList<SubwayVo> getOrderByOrderNum(String ordernum);

	//취소번호
	public ArrayList<SubwayVo> canclelistCount(String todaycancle);

	//주문취소
	public int odercancle(SubwayVo vo);
	
	//매출테이블 마감시간null 데이터 유무 확인
	public int CloseNullCount();

	//매출테이블 영업시작시간등록
	public int insertOpen(SubwayVo vo);

	//영업시작시간가져오기
	public SubwayVo getOpentime();

	//영업시작시간 이후의 주문테이블 정보 가져오기
	public SubwayVo getsalesdata(String opentime);
	//영업시작시간 이후의 주문테이블 정보 리스트로 가져오기
	public SubwayVo getsalesdatalist(String opentime);

	//영업종료등록
	public int updateClose(SubwayVo vo);
	
	//일별 매출테이블 리스트
	public ArrayList<SubwayVo> salesListDaily(PagingVo pagingVo);
	
	//일별 매출테이블 리스트(변수없음)
	public ArrayList<SubwayVo> salesListDaily();
	
	//일별 판매순위
	public ArrayList<SubwayVo> getDayRank(String yesterday);
	
	//월별 매출테이블 리스트
	public ArrayList<SubwayVo> salesListMonthly();
	
	//월별 판매순위
	public ArrayList<SubwayVo> getMonthRank(String monthAgo);

	//매출 갯수
	public int salesListCount();

}
