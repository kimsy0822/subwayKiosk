package com.hk.th.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.ManagerDao;
import com.hk.th.vo.ManagerVo;
import com.hk.th.vo.PagingVo;
import com.hk.th.vo.SubwayVo;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService{

	@Resource(name="ManagerDao")
	private ManagerDao mandao;
	
	//관리자 등록
	@Override
	public int regMan(ManagerVo manvo) {
		int svres = mandao.insertMan(manvo);
		//System.out.println("service");
		return svres;
	}

	//로그인
	@Override
	public int getLoginMan(ManagerVo manvo) {
		int svres = mandao.loginMan(manvo);
		//System.out.println("svres: "+svres);
		return svres;
	}

	//관리자 검색
	@Override
	public int getManager() {
		int svres = mandao.count();
		return svres;
	}
	
	//관리자 리스트 불러오기
	@Override
	public ManagerVo getManagerInfo(String id) {
		ManagerVo svres = mandao.getManInfo(id);
		return svres;
	}
	
	//관리자 정보 수정
	@Override
	public int manModi(ManagerVo manvo) {
		int svres = mandao.manUpdate(manvo);
		return svres;
	}
	
	//관리자 삭제
	@Override
	public int managerDel(String id) {
		
		int svres = mandao.manDel(id);
		return svres;
	}

	//상품리스트 가져오기
	@Override
	public ArrayList<SubwayVo> getMenulist() {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.menulist();
		return svres;
	}
	//상품검색리스트 가져오기
	@Override
	public ArrayList<SubwayVo> getschMenuList(PagingVo pagingVo) {
		
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.schMenuList(pagingVo);
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = new SubwayVo();
			temp = svres.get(i);
			String category = mandao.getNameById(temp.getMid()).getCategory();
			String category2 = "";
			if(category.equals("S")){
				category2 = "샌드위치";
			}else if(category.equals("M")){
				category2 = "아침메뉴";
			}else if(category.equals("C")){
				category2 = "찹샐러드";
			}else if(category.equals("T")){
				category2 = "토핑";
			}else if(category.equals("D")){
				category2 = "사이드/음료";
			}else if(category.equals("V")){
				category2 = "야채";
			}else if(category.equals("P")){
				category2 = "빵";
			}else if(category.equals("SS")){
				category2 = "소스";
			}
		
		temp.setCategory(category2);
		}
		return svres;
	}
	//상품갯수
	@Override
	public int getCountMenulist() {
		int svres= mandao.countMenulist();
		return svres;
	}
	//상품검색갯수
		@Override
		public int getschCountMenuList(PagingVo pagingVo) {
			int svres = mandao.schcountMenuList(pagingVo);
			return svres;
		}
		
	//카테고리별 갯수
	@Override
	public int getCountCategory(String category) {
		int svres = mandao.countCategory(category);
		return svres;
	}
	
	//상품등록
	@Override
	public int newmenuInsert(SubwayVo vo) {
		
		int svres=mandao.menuInsert(vo);
		return svres;
	}
	//상품vo
	@Override
	public SubwayVo getMenu(String mid) {
		SubwayVo svres = mandao.getMenu(mid);
		return svres;
	}

	//상품 수정
	@Override
	public int modiMenu(SubwayVo vo) {
		int svres = mandao.updateMenu(vo);
		return svres;
	}
	
	//상품삭제
	@Override
	public int menuDelete(String mid) {
		
		int svres = mandao.menuDel(mid);
		return svres;
	}
	
	//주문갯수
	@Override
	public int OrderCount(PagingVo pagingVo) {

		int svres = mandao.OrderCount(pagingVo);
		return svres;
	}

	//페이징
	@Override
	public PagingVo setPagingInfo(PagingVo pagingVo) {

		String pageNum_temp = pagingVo.getPageNum_temp();
		
		if (pageNum_temp == null)
			pageNum_temp = "1"; //만약 값이 NULL값이면 초기값을 1페이지로 세팅 
		int pageNum = Integer.parseInt(pageNum_temp); //그 값을 pageNum에 대입 
		int pageCount = (pagingVo.getTotal() / pagingVo.getRowNum()) + (pagingVo.getTotal() % pagingVo.getRowNum() == 0 ? 0 : 1); //페이징 개수 전체 카운트 
		int startPage = (pagingVo.getPageBlock() * ((pageNum - 1) / pagingVo.getPageBlock())) + 1; //시작페이지 
		int endPage = startPage + (pagingVo.getPageBlock() - 1); //끝페이지 
		
		pagingVo.setPageNum(pageNum);
		pagingVo.setPageCount(pageCount);
		pagingVo.setStartPage(startPage);
		pagingVo.setEndPage(endPage);
		
		return pagingVo;
	}

	//주문리스트
	@Override
	public ArrayList<SubwayVo> getOrderList(PagingVo pagingVo) {
		
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)mandao.orderlist(pagingVo);
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = new SubwayVo();
			temp = svres.get(i);
			int finalprice = 0;
			
			String name = mandao.getNameById(temp.getMid()).getName();
			String category = mandao.getNameById(temp.getMid()).getCategory();
			String category2 = "";
			if(category.equals("S")){
				category2 = "샌드위치";
			}else if(category.equals("M")){
				category2 = "아침메뉴";
			}else if(category.equals("C")){
				category2 = "찹샐러드";
			}else if(category.equals("T")){
				category2 = "토핑";
			}else if(category.equals("D")){
				category2 = "사이드/음료";
			}else if(category.equals("V")){
				category2 = "야채";
			}else if(category.equals("P")){
				category2 = "빵";
			}else if(category.equals("SS")){
				category2 = "소스";
			}
			int totalprice =  temp.getTotalprice()*temp.getQnt();
			finalprice += totalprice;
			
			temp.setName(name);	
			temp.setCategory(category2);
			temp.setTotalprice(finalprice);
		}
		
		return svres;
	}

	//주문상세
	@Override
	public ArrayList<SubwayVo> getOrderByOrderNum(String ordernum) {
		
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)mandao.getOrderByOrderNum(ordernum);
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = new SubwayVo();
			temp = svres.get(i);
			
			String name = mandao.getNameById(temp.getMid()).getName();
			String category = mandao.getNameById(temp.getMid()).getCategory();
			String category2 = "";
			if(category.equals("S")){
				category2 = "샌드위치";
			}else if(category.equals("M")){
				category2 = "아침메뉴";
			}else if(category.equals("C")){
				category2 = "찹샐러드";
			}else if(category.equals("T")){
				category2 = "토핑";
			}else if(category.equals("D")){
				category2 = "사이드/음료";
			}else if(category.equals("V")){
				category2 = "야채";
			}else if(category.equals("P")){
				category2 = "빵";
			}else if(category.equals("SS")){
				category2 = "소스";
			}
			int price = mandao.getNameById(temp.getMid()).getPrice15();
			
			temp.setName(name);
			temp.setCategory(category2);
			temp.setPrice(price);
		}
		return svres;
	}

	//주문테이블에 저장된 취소 갯수 불러오기
	@Override
	public ArrayList<SubwayVo> canclelistCount(String todaycancle) {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)mandao.selectcanclelistCount(todaycancle);
		return svres;
	}

	//주문취소
	@Override
	public int odercancle(SubwayVo vo) {
		int svres = mandao.orderUpdate(vo);
		return svres;
	}

	//매출테이블 마감시간null 데이터 유무 확인
	@Override
	public int CloseNullCount() {
		int svres = mandao.CloseNullCount();
		return svres;
	}

	//매출테이블 영업시작시간등록
	@Override
	public int insertOpen(SubwayVo vo) {
		int svres = mandao.insertOpen(vo);
		return svres;
	}

	//영업시작시간 가져오기
	@Override
	public SubwayVo getOpentime() {
		SubwayVo svres = mandao.getOpentime();
		return svres;
	}

	//영업시작시간 이후의 주문테이블 정보 가져오기
	@Override
	public SubwayVo getsalesdata(String opentime) {
		SubwayVo svres = mandao.getsalesdata(opentime);
		//System.out.println("service: "+svres.getTotalsal());
		return svres;
	}
	
	//영업시작시간 이후의 주문테이블 정보 리스트로 가져오기
	@Override
	public SubwayVo getsalesdatalist(String opentime) {
		
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)mandao.getsalesdatalist();
		int ordercount=0, totalorder=0, cancount=0, totalcan=0; //주문건수,주문금액,취소건수,취소금액
		int salcount=0 , totalsal=0; //매출건수,매출금액
		
		//opentime="yyyy-MM-dd hh:mm:ss"
		String open1 = opentime.replace("-","");
		String open2 = open1.replaceAll(" ","");
		String open3 = open2.replaceAll(":","");
		long open = Long.parseLong(open3);
		
		ArrayList<SubwayVo> TOL = new ArrayList<SubwayVo>(); //주문리스트
		ArrayList<SubwayVo> TCL = new ArrayList<SubwayVo>(); //취소리스트
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = svres.get(i);
			String status = temp.getStatus(); //상태확인
			
			if(status.equals("결제완료")){
				
				String getordernum = temp.getOrdernum();
				String ordernum[] = getordernum.split("-");
				String orderdate = "20"+ordernum[0]+ordernum[1]+"00"; //주문번호 초단위 없음 00처리
				long ordertime = Long.parseLong(orderdate);
				
				if(open<ordertime){		
					//System.out.println(svres.get(i).getOrdernum());
					TOL.add(svres.get(i));
				}		
					
			}
			
			if(status.equals("결제취소")){
				
				String getcannum = temp.getCanclenum();
				String canclenum[] = getcannum.split("-");
				String cancledate ="20"+canclenum[1]+canclenum[2]+"00"; //취소번호 초단위 없음 00처리
				long cancletime = Long.parseLong(cancledate);
				
				if(open<cancletime){
					//System.out.println(svres.get(i).getCanclenum());
					TCL.add(svres.get(i));
				}
			}
		}
		
		String ordertemp = "";
		String cancletemp = "";
		
		for(int i=0; i<TOL.size(); i++){
			//ordercount = TOL.size();	
			String ordernum = TOL.get(i).getOrdernum();
			if(!ordertemp.equals(ordernum)){
				ordercount ++;
				ordertemp = ordernum;
			}
			
			SubwayVo temp = TOL.get(i);
			int totalprice = temp.getTotalprice();
			totalorder += totalprice;
		}
		
		for(int i=0; i<TCL.size(); i++){
			//cancount = TCL.size();
			String canclenum = TCL.get(i).getCanclenum();
			if(!cancletemp.equals(canclenum)){
				cancount ++;
				cancletemp = canclenum;
			}
			
			SubwayVo temp = TCL.get(i);
			int totalprice = temp.getTotalprice();
			totalcan += totalprice;
			
		}
			
		salcount = ordercount-cancount;
		totalsal = totalorder-totalcan;
		
		SubwayVo temp = new SubwayVo();
		temp.setSalcount(salcount);
		temp.setTotalsal(totalsal);

		return temp;
	}

	//영업종료등록
	@Override
	public int updateClose(SubwayVo vo) {
		int svres = mandao.updateClose(vo);
		return svres;
	}

	//일별 매출테이블 리스트
	public ArrayList<SubwayVo> salesListDaily(PagingVo pagingVo) {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.salesListDaily(pagingVo);		
		return svres;
	}
	
	//일별 매출테이블 리스트(변수없음)
	public ArrayList<SubwayVo> salesListDaily() {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.salesListDaily();		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = svres.get(i);
			String str_time1 = temp.getSaltime();
			String str_time2 = str_time1.substring(0,2);
			int time = Integer.valueOf(str_time2);
					
			//System.out.println(time);
			temp.setQnt(time);
		}
		return svres;
	}
	

	//일별 판매순위
	@Override
	public ArrayList<SubwayVo> getDayRank(String yesterday) {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.selectDayRank(yesterday);
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = new SubwayVo();
			temp = svres.get(i);

			String category = mandao.getNameById(temp.getMid()).getCategory();
			String category2 = "";
			if(category.equals("S")){
				category2 = "샌드위치";
			}else if(category.equals("M")){
				category2 = "아침메뉴";
			}else if(category.equals("C")){
				category2 = "찹샐러드";
			}else if(category.equals("T")){
				category2 = "토핑";
			}else if(category.equals("D")){
				category2 = "사이드/음료";
			}else if(category.equals("V")){
				category2 = "야채";
			}else if(category.equals("P")){
				category2 = "빵";
			}else if(category.equals("SS")){
				category2 = "소스";
			}
			temp.setCategory(category2);
		}
		return svres;
	}
	
	//월별 매출테이블 리스트
	public ArrayList<SubwayVo> salesListMonthly() {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>) mandao.salesListMonthly();
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = svres.get(i);
			String str_time1 = temp.getSaltime();
			String str_time2 = str_time1.substring(0,2);
			int time = Integer.valueOf(str_time2);
					
			//System.out.println(time);
			temp.setQnt(time);
		}
		return svres;
	}
	
	//월별 판매순위
	@Override
	public ArrayList<SubwayVo> getMonthRank(String monthAgo) {
		ArrayList<SubwayVo> svres = (ArrayList<SubwayVo>)mandao.selMonthRank(monthAgo);
		
		for(int i=0; i<svres.size(); i++){
			SubwayVo temp = new SubwayVo();
			temp = svres.get(i);

			String category = mandao.getNameById(temp.getMid()).getCategory();
			String category2 = "";
			if(category.equals("S")){
				category2 = "샌드위치";
			}else if(category.equals("M")){
				category2 = "아침메뉴";
			}else if(category.equals("C")){
				category2 = "찹샐러드";
			}else if(category.equals("T")){
				category2 = "토핑";
			}else if(category.equals("D")){
				category2 = "사이드/음료";
			}else if(category.equals("V")){
				category2 = "야채";
			}else if(category.equals("P")){
				category2 = "빵";
			}else if(category.equals("SS")){
				category2 = "소스";
			}
			temp.setCategory(category2);
		}
		return svres;
	}

	//매출 갯수
	@Override
	public int salesListCount() {
		int svres = mandao.salesListCount();
		return svres;
	}


	
}
