package com.hk.th.dao;

import java.util.List;

import com.hk.th.vo.ManagerVo;
import com.hk.th.vo.PagingVo;
import com.hk.th.vo.SubwayVo;

public interface ManagerDao {
	
	//관리자 등록
	public int insertMan(ManagerVo manvo);
	
	//로그인
	public int loginMan(ManagerVo manvo);

	//관리자 검색
	public int count();

	//관리자 리스트 불러오기
	public ManagerVo getManInfo(String id);
	
	//관리자 정보 수정
	public int manUpdate(ManagerVo manvo);
		
	//관리자 삭제
	public int manDel(String id);
	
	//상품 리스트
	public List<SubwayVo> menulist();
	//상품검색리스트
	public List<SubwayVo> schMenuList(PagingVo pagingVo);
	//상품갯수
	public int countMenulist();
	//상품검색갯수
	public int schcountMenuList(PagingVo pagingVo);
	
	//카테고리별 갯수
	public int countCategory(String category);
	
	//상품등록
	public int menuInsert(SubwayVo vo);
	
	//상품수정
	public int updateMenu(SubwayVo vo);
		
	//상품vo
	public SubwayVo getMenu(String mid);

	//상품삭제
	public int menuDel(String mid);
	
	//주문개수
	public int OrderCount(PagingVo pagingVo);
	
	//주문리스트
	public List<SubwayVo> orderlist(PagingVo pagingVo);
	
	//제품아이디로 제품명검색하기
	public SubwayVo getNameById(String mid);
	
	//주문상세
	public List<SubwayVo> getOrderByOrderNum(String ordernum);
	
	//취소번호
	public List<SubwayVo> selectcanclelistCount(String todaycancle);
	
	//주문취소
	public int orderUpdate(SubwayVo vo);

	//매출테이블 마감시간null 데이터 유무 확인
	public int CloseNullCount();

	//매출테이블 영업시작시간등록
	public int insertOpen(SubwayVo vo);

	//영업시작시간가져오기
	public SubwayVo getOpentime();

	//영업시작시간 이후의 주문테이블 정보 가져오기
	public SubwayVo getsalesdata(String opentime);
	public List<SubwayVo> getsalesdatalist();

	//영업종료등록
	public int updateClose(SubwayVo vo);
	
	//일별 매출테이블 리스트
	public List<SubwayVo> salesListDaily(PagingVo pagingVo);
	
	//일별 매출테이블 리스트(변수없음)
	public List<SubwayVo> salesListDaily();
	
	//일별 판매 순위
	public List<SubwayVo> selectDayRank(String yesterday);
	
	//월별 매출테이블 리스트
	public List<SubwayVo> salesListMonthly();
	
	//월별 판매순위
	public List<SubwayVo> selMonthRank(String monthAgo);
	
	//매출 갯수
	public int salesListCount();

	
}
