package com.hk.th.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hk.th.vo.SubwayVo;

@Repository("KioskDao")
public class KioskDaoImpl implements KioskDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "Kiosk.";
	
	@Override
	public List<SubwayVo> menulist() {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"menulist");
		//System.out.println("다오"+dbres.size());
		return dbres;
	}

	//샌드위치 사이즈에 따른 가격 불러오기
	@Override
	public int selectprice(String mid, String size) {
		
		int dbres = 0;
		
		if(size.equals("15cm")){
			dbres = sqlSession.selectOne(ns+"selectprice15", mid);
		}else if(size.equals("30cm")){
			dbres = sqlSession.selectOne(ns+"selectprice30", mid);
		}		
		return dbres;
	}

	//토핑이름으로 정보 가져오기
	@Override
	public SubwayVo selectToppingprice(String toppingname) {
		SubwayVo dbres = sqlSession.selectOne(ns+"selectToppingByName",toppingname);
		return dbres;
	}

	//임시테이블에 넣기
	@Override
	public int insertTempOrder(SubwayVo vo) {
		
		int dbres = sqlSession.insert(ns+"insertTempOrder", vo);
		return dbres;
	}

	//임시테이블 리스트 보여주기
	@Override
	public List<SubwayVo> templist() {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"templist");
		//System.out.println("다오"+dbres.size());
		return dbres;
	}

	//메인으로 돌아가면 임시테이블 비우기
	@Override
	public int emptyTable() {
		int dbres = sqlSession.delete(ns+"emptyTable");
		return dbres;
	}
	
	//임시테이블에서 메뉴 지우기
	@Override
	public int tmepDel(SubwayVo vo) {
		int dbres = sqlSession.delete(ns+"tmepDel", vo);
		//System.out.println("dao tempdel:"+dbres);
		return dbres;
	}

	//메뉴 수량 수정
	@Override
	public int modifyQnt(SubwayVo vo) {
		int dbres = sqlSession.update(ns+"modifyQnt", vo);
		return dbres;
	}

	//주문테이블에 저장된 메뉴 갯수 불러오기
	@Override
	public List<SubwayVo> selectOrderListCount(String todaynum) {
		List<SubwayVo> dbres = sqlSession.selectList(ns+"selectOrderListCount", todaynum);
		return dbres;
	}

	//주문테이블 insert
	@Override
	public int insertOrders(SubwayVo vo) {
		int dbres = sqlSession.insert(ns+"insertOrders", vo);
		return dbres;
	}
	
	//주문테이블에서 가져오기
   @Override
   public List<SubwayVo> orderslist(String ordernum) {
      List<SubwayVo> dbres = sqlSession.selectList(ns+"orderslist", ordernum);
      //System.out.println("다오"+dbres.size());
      return dbres;
   }
   
   	//주문과 메뉴 조인후 불러오기
	@Override
	public List<SubwayVo> finishlist(String ordernum) {
		List<SubwayVo> dbres= sqlSession.selectList(ns+"finishlist", ordernum);
		return dbres;
	}

	//주문상태 수정
	@Override
	public int modiStatus(SubwayVo vo) {
		int dbres = sqlSession.update(ns+"modifyStatus", vo);
		return dbres;
	}


}
