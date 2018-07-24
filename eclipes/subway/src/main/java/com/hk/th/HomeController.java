package com.hk.th;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.KioskService;
import com.hk.th.service.ManagerService;
import com.hk.th.vo.SubwayVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="KioskService")
	private KioskService service;
	
	@Resource(name="ManagerService")
	private ManagerService mansv;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		//영업시작 전에 키오스크 접근 제한
		int res = mansv.CloseNullCount();
		model.addAttribute("res", res);
		
		return "home";
	}
	
	@RequestMapping(value = "/kiosk/index.do", method = RequestMethod.GET)
	public String index(Model model) {
					
		return "/kiosk/index";
	}
	
	@RequestMapping(value = "/kiosk/sorry.do", method = RequestMethod.GET)
	public String sorry(Model model) {
		
		return "/kiosk/sorry";
	}
	
	@RequestMapping(value = "/kiosk/main.do", method = RequestMethod.GET)
	public String main(Model model) {
					
		//임시테이블 비우기
		service.emptyTable();
				
		return "/kiosk/main";
	}
	
	@RequestMapping(value = "/kiosk/menu.do", method = RequestMethod.GET)
	public String menu(Model model) {
		
		return "/kiosk/menu";
	}
	
	@RequestMapping(value = "/kiosk/menulist.do", method = RequestMethod.GET)
	public String menulist(Model model) {
		
		ArrayList<SubwayVo> list = service.getListAll();
		//System.out.println("컨트롤러"+list.size());
		model.addAttribute("list", list);
		
		return "/kiosk/menulist";
	}
	
	@RequestMapping(value = "/kiosk/order.do", method = RequestMethod.GET)
	public String order(Model model){
		//orderlist.do와 내용 동일함
		//orderlist에 임시테이블 list 출력하기
		ArrayList<SubwayVo> templist = service.getTempList();
		model.addAttribute("templist",templist);
		
		int totalqnt = 0;
		int totalprice = 0;
		
		for(int i=0; i<templist.size(); i++){
			SubwayVo temp = templist.get(i);
			totalqnt += temp.getQnt();
			totalprice += (temp.getPrice()+temp.getOptionprice())*temp.getQnt();
			//System.out.println(i+",totalqnt:"+totalqnt+",totalprice"+totalprice);
		}
		
		model.addAttribute("totalqnt",totalqnt);
		model.addAttribute("totalprice",totalprice);
					
		return "/kiosk/order";
	}
	
	
	@RequestMapping(value = "/kiosk/orderlist.do", method = RequestMethod.GET)
	public String orderlist(Model model) {
		
		//orderlist에 임시테이블 list 출력하기
		ArrayList<SubwayVo> templist = service.getTempList();
		model.addAttribute("templist",templist);
		//System.out.println("임시테이블사이즈"+templist.size());
		
		int totalqnt = 0;
		int totalprice = 0;
		
		for(int i=0; i<templist.size(); i++){
			SubwayVo temp = templist.get(i);
			totalqnt += temp.getQnt();
			totalprice += (temp.getPrice()+temp.getOptionprice())*temp.getQnt();
			//System.out.println(i+",totalqnt:"+totalqnt+",totalprice"+totalprice);
		}
		
		model.addAttribute("totalqnt",totalqnt);
		model.addAttribute("totalprice",totalprice);
					
		return "/kiosk/orderlist";
	}
	
	//옵션 리스트 가져오기
	@RequestMapping(value = "/kiosk/option.do", method = RequestMethod.GET)
	public String option(Model model) {
		
		
		ArrayList<SubwayVo> list = service.getListAll();
		//System.out.println("옵션컨트롤러"+list.size());
		model.addAttribute("list", list);
		
		return "/kiosk/option";
	}

	
	@RequestMapping(value = "/kiosk/selectmenu.do", method = RequestMethod.GET)
	public String selectmenu(HttpServletRequest request, Model model, SubwayVo vo) {

		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String price = request.getParameter("price");
		String option = request.getParameter("options");
		String[] options =  option.split("/");
		String qnt = request.getParameter("qnt");
		
		//model.addAttribute("mid", mid);
		int finalPrice = 0;
		String toppingprice ="";
		int setPrice = 1900;
		
		if(option.equals("옵션없음")){
			finalPrice = Integer.valueOf(price);
			toppingprice = "0";
			
		}else{
			//샌드위치 사이즈
			String size = options[1];
			
			//샌드위치 사이즈에 맞는 가격 불러오기
			if(mid.charAt(0)=='S'){
				finalPrice = service.getPrice(mid, size);
				size = options[1];
			}else{
				size = "15cm";
				finalPrice = service.getPrice(mid, size);
			}
			//System.out.println("샌드위치가격:"+finalPrice);
			
			//샌드위치 사이즈에 맞는 토핑옵션 가격 불러오기 
			toppingprice = service.toppingprice(size,options[4]);
			//System.out.println("토핑가격:"+toppingprice);
		
			//메뉴 총 가격(세트 추가 여부 확인)
			//int finalAllPrice = finalPrice+Integer.valueOf(toppingprice);
				
			if(options[7].contains("세트")){
				int temp = Integer.valueOf(toppingprice) + setPrice;
				toppingprice = String.valueOf(temp);
			}
			//System.out.println("총가격:"+finalAllPrice);	
		}
		
		//임시테이블에 데이터 insert
		vo.setMid(mid);
		vo.setMname(mname);
		vo.setPrice(finalPrice);
		vo.setOptions(option);
		vo.setQnt(Integer.valueOf(qnt));
		vo.setOptionprice(Integer.valueOf(toppingprice));
		
		
		int res = service.insertTemp(vo);
		//System.out.println("insert결과"+res);	
				
		return "/kiosk/orderlist";
			
			
		
		
	}	
	
	//임시테이블에 있는 모든 데이터 삭제 후 메인화면으로 리턴
	@RequestMapping(value = "/kiosk/emptytable.do", method = RequestMethod.GET)
	public String emptytable(HttpServletRequest request, Model model){
				
		service.emptyTable();
		
		return "redirect:/kiosk/main.do";
	}
	
	//버튼누르면 임시테이블 메뉴 삭제
	@RequestMapping(value = "/kiosk/tempdel.do", method = RequestMethod.GET)
	public String tempdel(HttpServletRequest request, Model model) {
		
		String mname=request.getParameter("menu");
		String option=request.getParameter("option");
		//System.out.println(mname);
		//System.out.println("옵션 "+option);
		int res = service.tmepOrderDel(mname, option);
		//System.out.println("res:"+res);
		
		return "redirect:/kiosk/menu.do";
	}

	//메뉴 수량 수정
	@RequestMapping(value="/kiosk/modiqnt.do", method=RequestMethod.GET)
	public String modiqnt(HttpServletRequest request, Model model, SubwayVo vo){
		
		String modiqnt = request.getParameter("modiqnt");
		
		String mname=request.getParameter("menu");
		String qnt=request.getParameter("quant");
		
		//System.out.println(mname);
		//System.out.println(modiqnt);
		//System.out.println(qnt);
		
		int intqnt = 0;
		if(modiqnt.equals("minus")){
			if(Integer.valueOf(qnt)>1){
				intqnt = Integer.valueOf(qnt)-1;
				qnt = Integer.toString(intqnt);	
			}
		}else if(modiqnt.equals("plus")){
			intqnt = Integer.valueOf(qnt)+1;
			qnt = Integer.toString(intqnt);	
		}
		//System.out.println("메뉴"+mname);
		//System.out.println("수량 "+qnt);
		
		service.modiQnt(mname, qnt);		
		
		return "redirect:/kiosk/menu.do";
	}
	
	//주문테이블 insert
	@RequestMapping(value="/kiosk/pay.do", method=RequestMethod.GET)
	public String pay(HttpServletRequest request, Model model, SubwayVo vo){
			
		//주문번호 생성
		Date daynum = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		String todaynum = sdf.format(daynum);
		String todayorder = sdf2.format(daynum);
		
		//System.out.println("오늘날짜: "+ todayorder);
		//System.out.println("오늘날짜주문번호: "+ todaynum);
		
		//주문테이블에 저장된 주문번호 갯수 불러오기
		ArrayList<SubwayVo> orderlistCount = service.orderlistCount(todayorder);
		//System.out.println("주문테이블 주문갯수: "+orderlistCount);
		//System.out.println(orderlistCount.size());
		String num = String.format("%04d", orderlistCount.size()+1);
		String orderNum = todaynum + "-" +num;
		//System.out.println("최종주문번호: "+orderNum);
		
		//주문테이블에 insert
		ArrayList<SubwayVo> templist = service.getTempList();
			
		String togo = request.getParameter("togo");
		//System.out.println("포장여부: " + togo);
		
		for(int i=0; i<templist.size(); i++){	
			SubwayVo temp = templist.get(i);
			
			vo.setOrdernum(orderNum);
			vo.setMid(temp.getMid());
			vo.setStatus("주문완료");		 
			vo.setOptions(temp.getOptions());
			vo.setQnt(Integer.valueOf(temp.getQnt()));
			vo.setTotalprice(Integer.valueOf((temp.getPrice()+temp.getOptionprice())*temp.getQnt()));
			vo.setTogo(togo);
			vo.setCanclenum("");
			
			service.insertOrders(vo);
		}
		model.addAttribute("orderNum", orderNum);
				
		return "/kiosk/pay";
	}
		
	@RequestMapping(value = "/kiosk/finish.do", method = RequestMethod.GET)
	public String finish(HttpServletRequest request, Model model) {
		
		//주문테이블 list 불러오기
		String ordernum = request.getParameter("orderNum");
		//System.out.println(ordernum);
		//ArrayList<SubwayVo> orderlist = service.selectOrdersList(ordernum);
		//model.addAttribute("orderlist", orderlist);
		
		//주문상태 수정
		String status = "결제완료";
		service.modiStatus(ordernum, status);
				
		//주문과 메뉴 조인후 불러오기
		ArrayList<SubwayVo> finishList = service.selectFinishList(ordernum);
		
		int finishprice = 0;
		SubwayVo get = finishList.get(0);
		String regdate = get.getRegdate();
		
		for(int i=0; i<finishList.size(); i++){
			SubwayVo temp = finishList.get(i);
			int price = temp.getTotalprice();
			finishprice += price;
		}
		
		model.addAttribute("finishList", finishList);
		model.addAttribute("ordernum", ordernum);
		model.addAttribute("regdate", regdate);
		model.addAttribute("finishprice", finishprice);
		//System.out.println("조인후"+finishList.size());
		
		return "/kiosk/finish";
	}
	
	
	
}
