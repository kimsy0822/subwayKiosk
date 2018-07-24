package com.hk.th.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.ManagerVo;
import com.hk.th.vo.PagingVo;
import com.hk.th.vo.SubwayVo;

@Repository("ManagerDao")
public class ManagerDaoImpl implements ManagerDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "Manager.";
	
	//관리자 등록
	@Override
	public int insertMan(ManagerVo manvo) {
		int dbres = sqlSession.insert(ns+"insertMan", manvo);
		//System.out.println("dao");
		return dbres;
	}

	//로그인
	@Override
	public int loginMan(ManagerVo manvo) {
		int dbres = sqlSession.selectOne(ns+"loginMan", manvo);
		//System.out.println("dao dbres: "+dbres);
		return dbres;
	}

	//관리자 검색
	@Override
	public int count() {
		int dbres = sqlSession.selectOne(ns+"count");
		return dbres;
	}

	//관리자 리스트 불러오기
	@Override
	public ManagerVo getManInfo(String id) {
		ManagerVo dbres = sqlSession.selectOne(ns+"ManInfo",id);
		return dbres;
	}
	
	//관리자 정보 수정
	@Override
	public int manUpdate(ManagerVo manvo) {
		int dbres = sqlSession.update(ns+"manUpdate", manvo);
		return dbres;
	}
	
	//관리자 삭제
	@Override
	public int manDel(String id) {
		
		int dbres = sqlSession.delete(ns+"manDel", id);
		return dbres;
	}

	//상품리스트 가져오기
	@Override
	public List<SubwayVo> menulist() {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"menulist");
		return dbres;
	}
	//상품갯수
	@Override
	public int countMenulist() {
		int dbres = sqlSession.selectOne(ns+"countMenulist");
		return dbres;
	}
	
	//상품검색리스트가져오기
	@Override
	public List<SubwayVo> schMenuList(PagingVo pagingVo) {
		
		int limit1 = (pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		int limit2 = pagingVo.getRowNum();
		pagingVo.setLimit1(limit1);
		pagingVo.setLimit2(limit2);
		
		//HashMap hashmap = new HashMap(); 기본선언
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		//HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("searchType", pagingVo.getKeyWord());
		hashmap.put("paging", pagingVo);
		
		List<SubwayVo> dbres = sqlSession.selectList(ns+"schmenulist",hashmap);
		
		return dbres;
		
	}

	//상품검색갯수
	@Override
	public int schcountMenuList(PagingVo pagingVo) {
		
		int limit1 = (pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		int limit2 = pagingVo.getRowNum();
		pagingVo.setLimit1(limit1);
		pagingVo.setLimit2(limit2);
		
		//HashMap hashmap = new HashMap(); 기본선언
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		//HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("searchType", pagingVo.getKeyWord());
		hashmap.put("paging", pagingVo);
		
		int dbres = sqlSession.selectOne(ns+"schmenulistcount",hashmap);
		
		return dbres;
	}
	
	//카테고리별 갯수
	@Override
	public int countCategory(String category) {
		int dbres = sqlSession.selectOne(ns+"countCategory", category);
		return dbres;
	}
	
	//상품등록
	@Override
	public int menuInsert(SubwayVo vo) {
		
		int dbres = sqlSession.insert(ns+"menuInsert", vo);
		return dbres;
	}
	
	//상품 수정
	@Override
	public int updateMenu(SubwayVo vo) {
		int dbres = sqlSession.update(ns+"updateMenu", vo);
		return dbres;
	}

	//상품 vo
	@Override
	public SubwayVo getMenu(String mid) {
		SubwayVo dbres = sqlSession.selectOne(ns+"getMenuInfoById", mid);
		return dbres;
	}
	
	//상품삭제
	@Override
	public int menuDel(String mid) {
		
		int dbres = sqlSession.delete(ns+"menuDel", mid);
		return dbres;
	}
	
	//주문리스트수
	@Override
	public int OrderCount(PagingVo pagingVo) {
		
		int limit1 = (pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		int limit2 = pagingVo.getRowNum();
		pagingVo.setLimit1(limit1);
		pagingVo.setLimit2(limit2);
		
		//HashMap hashmap = new HashMap(); 기본선언
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		//HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("searchType", pagingVo.getKeyWord());
		hashmap.put("paging", pagingVo);
		
		int dbres = sqlSession.selectOne(ns+"orderCount",hashmap); 
		return dbres;
	}
	
	//주문리스트
	@Override
	public List<SubwayVo> orderlist(PagingVo pagingVo) {
		
		int limit1 = (pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		int limit2 = pagingVo.getRowNum();
		pagingVo.setLimit1(limit1);
		pagingVo.setLimit2(limit2);
		
		//HashMap hashmap = new HashMap(); 기본선언
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		//HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("searchType", pagingVo.getKeyWord());
		hashmap.put("paging", pagingVo);
		
		//System.out.println(pagingVo.getKeyWord()+","+pagingVo.getKeyValue());
		List<SubwayVo> dbres = sqlSession.selectList(ns+"orderList", hashmap);
		return dbres;
	}
	
	//제품아이디로 제품정보 검색하기
	@Override
	public SubwayVo getNameById(String mid) {
		SubwayVo dbres = sqlSession.selectOne(ns+"getMenuInfoById",mid); 
		return dbres;
	}

	//주문상세
	@Override
	public List<SubwayVo> getOrderByOrderNum(String ordernum) {
		
		List<SubwayVo> dbres = sqlSession.selectList(ns+"getOrderByOrderNum",ordernum);
		return dbres;
	}

	//취소번호
	@Override
	public List<SubwayVo> selectcanclelistCount(String todaycancle) {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"selectCancleListCount", todaycancle);
		return dbres;
	}

	//주문취소
	@Override
	public int orderUpdate(SubwayVo vo) {
		int dbres = sqlSession.update(ns+"orderUpdate", vo);
		return dbres;
	}

	//매출테이블 마감시간null 데이터 유무 확인
	@Override
	public int CloseNullCount() {
		int dbres = sqlSession.selectOne(ns+"closeNullCount");
		return dbres;
	}

	//매출테이블 영업시작시간등록
	@Override
	public int insertOpen(SubwayVo vo) {
		int dbres = sqlSession.insert(ns+"insertOpen",vo);
		return dbres;
	}

	//영업시작시간가져오기
	@Override
	public SubwayVo getOpentime() {
		SubwayVo dbres = sqlSession.selectOne(ns+"getOpentime");
		return dbres;
	}

	//영업시작시간 이후의 주문테이블 정보 가져오기
	@Override
	public SubwayVo getsalesdata(String opentime) {
		
		//System.out.println(opentime);
		SubwayVo dbres = sqlSession.selectOne(ns+"getsalesdata",opentime);
		return dbres;
	}
	
	//영업시작시간 이후의 주문테이블 정보 리스트로 가져오기
	@Override
	public List<SubwayVo> getsalesdatalist() {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"getsalesdatalist");
		return dbres;
	}
	
	//영업종료등록
	@Override
	public int updateClose(SubwayVo vo) {
		int dbres = sqlSession.update(ns+"updateClose",vo);
		return dbres;
	}

	//일별 매출테이블 리스트
	@Override
	public List<SubwayVo> salesListDaily(PagingVo pagingVo) {

		int limit1 = (pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		int limit2 = pagingVo.getRowNum();
		pagingVo.setLimit1(limit1);
		pagingVo.setLimit2(limit2);
		
		List<SubwayVo> dbres = sqlSession.selectList(ns+"salesListDaily", pagingVo);
		
		return dbres;
	}
	
	//일별 매출테이블 리스트(변수없음)
	@Override
	public List<SubwayVo> salesListDaily() {
		
		List<SubwayVo> dbres = sqlSession.selectList(ns+"salesListDaily2");
		
		return dbres;
	}
	
	//일별 판매순위
	@Override
	public List<SubwayVo> selectDayRank(String yesterday) {
		
		List<SubwayVo> dbres = sqlSession.selectList(ns+"selectDayRank", yesterday);
		return dbres;
	}
	
	//월별 매출테이블 리스트
	@Override
	public List<SubwayVo> salesListMonthly() {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"salesListMonthly");
		return dbres;
	}
	
	//월별 판매순위
	@Override
	public List<SubwayVo> selMonthRank(String monthAgo) {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"selMonthRank", monthAgo);
		return dbres;
	}

	//매출 갯수
	@Override
	public int salesListCount() {
		int dbres = sqlSession.selectOne(ns+"salesListCount");
		return dbres;
	}

}
