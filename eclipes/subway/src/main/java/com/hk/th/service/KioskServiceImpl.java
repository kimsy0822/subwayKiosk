package com.hk.th.service;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.hk.th.dao.KioskDao;
import com.hk.th.vo.SubwayVo;

@Service("KioskService")
public class KioskServiceImpl implements KioskService{

	@Resource(name="KioskDao")
	private KioskDao dao;
	
	@Override
	public ArrayList<SubwayVo> getListAll() {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)dao.menulist();
		//System.out.println("서비스"+svres.size());
		return svres;
	}

	//샌드위치 사이즈에 맞는 가격 가져오기
	@Override
	public int getPrice(String mid, String size) {
		int svres = dao.selectprice(mid, size);
		return svres;
	}

	//샌드위치 사이즈에 맞는 토핑옵션 가격 가져오기
	@Override
	public String toppingprice(String size, String toppings) {
		
		int toppingTotalPrice = 0;
		
		if(toppings.equals("추가없음")){
			toppingTotalPrice = 0;
		}else{
			String toppings2 = toppings.replace("추가:", "");
			String[] toppingTemp =  toppings2.split(",");
			
			for(int i=0; i<toppingTemp.length; i++){
				//System.out.println(toppingTemp[i]);
				String toppingname = toppingTemp[i];
				SubwayVo svres = dao.selectToppingprice(toppingname);
				
				int price=svres.getPrice15();
				toppingTotalPrice += price;
				}
			if(size.equals("30cm")){
				toppingTotalPrice=toppingTotalPrice*2;
			}
		}
		
		String result = Integer.toString(toppingTotalPrice);                                                           
		return result;
	}
	
	//임시테이블에 insert
	@Override
	public int insertTemp(SubwayVo vo) {
		int svres = dao.insertTempOrder(vo);
		return svres;
	}

	@Override
	public ArrayList<SubwayVo> getTempList() {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)dao.templist();
		//System.out.println("서비스"+svres.size());
		return svres;
	}

	//메인으로 돌아가면 임시테이블 비우기
	@Override
	public int emptyTable() {
		int svres = dao.emptyTable();
		return svres;
	}
	
	//임시테이블에서 메뉴 지우기
	@Override
	public int tmepOrderDel(String mname, String option) {
		
		SubwayVo vo=new SubwayVo();
		vo.setMname(mname);
		vo.setOptions(option);
		
		int svres= dao.tmepDel(vo);
		//System.out.println("svdel:"+svres);
		return svres;
	}

	//메뉴 수량 수정
	@Override
	public int modiQnt(String mname, String qnt) {
		SubwayVo vo=new SubwayVo();
		vo.setMname(mname);
		vo.setQnt(Integer.valueOf(qnt));
		int svres = dao.modifyQnt(vo);
		return svres;
	}

	//주문테이블에 저장된 메뉴 갯수 불러오기
	@Override
	public ArrayList<SubwayVo> orderlistCount(String todaynum) {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)dao.selectOrderListCount(todaynum);
		return svres;
	}

	//주문테이블 insert
	@Override
	public int insertOrders(SubwayVo vo) {
		int svres = dao.insertOrders(vo);
		return svres;
	}
	
	//주문테이블에서 가져오기
   @Override
   public ArrayList<SubwayVo> selectOrdersList(String ordernum) {
      ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)dao.orderslist(ordernum);
      //System.out.println("서비스"+svres.size());
      return svres;
   }

   	//주문과 메뉴 조인후 불러오기
	@Override
	public ArrayList<SubwayVo> selectFinishList(String ordernum) {
		
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) dao.finishlist(ordernum);
		return svres;
	}

	//주문상태 수정
	@Override
	public int modiStatus(String ordernum, String status) {
		SubwayVo vo=new SubwayVo();
		vo.setOrdernum(ordernum);
		vo.setStatus(status);
		int svres = dao.modiStatus(vo);
		return svres;
	}
   
   
}
