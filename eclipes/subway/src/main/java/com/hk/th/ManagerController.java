package com.hk.th;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.th.service.ManagerService;
import com.hk.th.vo.ManagerVo;
import com.hk.th.vo.PagingVo;
import com.hk.th.vo.SubwayVo;


/**
 * Handles requests for the application home page.
 */

@Controller
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	@Resource(name="ManagerService")
	private ManagerService mansv;
	
	//최초 (관리자미등록) 페이지
	@RequestMapping(value = "/manager/manMain.do", method = RequestMethod.GET)
	public String manMain(Model model, HttpSession session) {
		
		/*
		int res = mansv.getManager();
		
		if(res != 0){
			//session.getAttribute("user");
			return "redirect:/manager/manLoginForm.do";
		}else{
			return "/manager/manMain";
		}
		*/
		
		return "/manager/manMain";

	}
	
	//관리자등록폼
	@RequestMapping(value = "/manager/manInsertForm.do", method = RequestMethod.GET)
	public String manInsert(Model model) {
			
		return "/manager/manInsertForm";
	}
	
	//관리자등록
	@RequestMapping(value = "/manager/manInsert.do", method = RequestMethod.GET)
	public String manInsert(Model model, ManagerVo manvo, HttpServletResponse response) throws Throwable {
				
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int admincheck = mansv.getManager();
		
		if(admincheck != 0){
			out.println("<script>alert('이미 등록된 관리자가 확인되어 로그인페이지로 이동합니다'); location.href='/manager/manLoginForm.do';</script>");
			return null;
		}else{
			int res = mansv.regMan(manvo);
			return "redirect:/manager/afterReg.do";
		}
		
	}
	
	@RequestMapping(value = "/manager/afterReg.do", method = RequestMethod.GET)
	public String afterReg(Model model) {
			
		return "/manager/afterReg";
	}
	
	//로그인폼
	@RequestMapping(value = "/manager/manLoginForm.do", method = RequestMethod.GET)
	public String manLoginForm(HttpServletRequest request, Model model) {
		
		
			
		return "/manager/manLoginForm";
	}
	
	//로그인
	@RequestMapping(value = "/manager/manLogin.do", method = RequestMethod.GET)
	public String manLogin(HttpServletRequest request, ManagerVo manvo, Model model, HttpSession session) {
		
		int res= mansv.getLoginMan(manvo);
		
		if(res==1){
			request.getSession().setAttribute("loginflag", true);
			ManagerVo vo = mansv.getManagerInfo(manvo.getId());
			session.setAttribute("user", vo) ;
			//
			session.setAttribute("id", vo.getId());
			
			return "redirect:/manager/manMenu.do";
		}else{
			model.addAttribute("loginres", res);
			return "/manager/manLoginForm";
		}
		
	}
	
	//로그아웃
		@RequestMapping(value = "/manager/manLogout.do", method = RequestMethod.GET)
		public String manLogout(HttpServletRequest request, Model model) {
			
			request.getSession().invalidate(); //로그아웃하면 세션을 삭제
			return "redirect:/manager/manLoginForm";
		}
	
	//메인메뉴
	@RequestMapping(value = "/manager/manMenu.do", method = RequestMethod.GET)
	public String manMenu(HttpServletRequest request,Model model, HttpSession session) {
		
		
		int Onsale = mansv.CloseNullCount();	
		String userID = (String)session.getAttribute("id");
		ManagerVo vo = mansv.getManagerInfo(userID);
		
		model.addAttribute("Onsale", Onsale);
		model.addAttribute("user", vo);
			
		return "/manager/manMenu";
	}
	
	//관리자수정폼
	@RequestMapping(value = "/manager/manUpdateForm.do", method = RequestMethod.GET)
	public String manUpdateForm(HttpServletRequest request, Model model) {
			
		String id = request.getParameter("id");				
		ManagerVo vo = mansv.getManagerInfo(id);
		model.addAttribute("vo", vo);
		
		return "/manager/manUpdateForm";
	}
	
	//관리자수정
	@RequestMapping(value = "/manager/manUpdate.do", method = RequestMethod.GET)
	public String manUpdate(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ManagerVo manvo = new ManagerVo();
		manvo.setId(request.getParameter("id"));
		manvo.setPw(request.getParameter("pw"));
		manvo.setName(request.getParameter("name"));
		manvo.setHpnum(request.getParameter("hpnum"));
		manvo.setAddress(request.getParameter("address"));
		
		int res = mansv.manModi(manvo);
		
		if(res != 0){
			out.println("<script>alert('정보 수정 성공!'); location.href='/manager/manMenu.do';</script>");
			return null;
		}else{
			out.println("<script>alert('수정 실패! 다시 확인해주세요');</script>");
			return "redirect:/manager/manUpdateForm.do";
		}
		
	}
	
	//관리자삭제
	@RequestMapping(value = "/manager/manDelete.do", method = RequestMethod.GET)
	public String manDelete(HttpServletRequest request, Model model) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int res = mansv.managerDel(id);
		//System.out.println("delres "+res);
		return "/manager/manMain";
	
	}
	
	//상품리스트
	@RequestMapping(value = "/manager/productList.do", method = RequestMethod.GET)
	public String productList(HttpServletRequest request, Model model) {
			
		//ArrayList<SubwayVo> res = mansv.getMenulist();
		//model.addAttribute("productList", res);
		//int countlist = mansv.getCountMenulist();
		//model.addAttribute("countList", countlist);
		
		PagingVo pagingVo = new PagingVo();
		
		String keyWord = request.getParameter("keyWord");
		String keyValue = request.getParameter("keyValue");
		
		if(keyWord==null || keyWord.equals("")){
			keyWord="name";
		}
		if(keyValue==null || keyValue.equals("")){
			keyValue="";
		}
		pagingVo.setKeyWord(keyWord);
		pagingVo.setKeyValue(keyValue);
		
		int countList = mansv.getschCountMenuList(pagingVo);
		String pageNum_temp=request.getParameter("pageNum");
		
		pagingVo.setTotal(countList);
		pagingVo.setPageNum_temp(pageNum_temp);
		pagingVo = mansv.setPagingInfo(pagingVo);
		
		ArrayList<SubwayVo> productList = mansv.getschMenuList(pagingVo);
		
		StringBuffer search = new StringBuffer(request.getContextPath());
		search.append("/manager/productList.do?keyWord="+keyWord);
		search.append("&keyValue="+keyValue);
		search.append("&pageNum=");
		
		request.setAttribute("countList", countList);
		request.setAttribute("productList",productList);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pagingVo.getPageNum());
		request.setAttribute("pageBlock", pagingVo.getPageBlock());
		request.setAttribute("pageCount", pagingVo.getPageCount());
		request.setAttribute("endPage", pagingVo.getEndPage());
		request.setAttribute("startPage", pagingVo.getStartPage());
		request.setAttribute("rowNum", pagingVo.getRowNum());
		
		int indexnum=(pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		request.setAttribute("indexnum", indexnum);
		
		return "/manager/productList";
	}
	
	//상품등록폼
	@RequestMapping(value = "/manager/productInsertForm.do", method = RequestMethod.GET)
	public String productInsertForm(Model model) {
			
		return "/manager/productInsertForm";
	}
	
	//상품등록
	@RequestMapping(value = "/manager/productInsert.do", method = RequestMethod.POST)
	public String productInsert(Model model, SubwayVo vo, HttpServletRequest request,
			@RequestParam(value="fileload", required=false)MultipartFile fileload) throws IOException {
		
		//mid 생성
		String mid = "";
		String category =vo.getCategory(); 
		String kind=request.getParameter("kind");
		//System.out.println(kind);
		String maxnum=String.format("%02d",mansv.getCountCategory(category)+1);
		
		if (category.equals("S") || category.equals("C") || category.equals("D")) {
			mid = category+"-"+kind+"-"+maxnum;
		}else if(category.equals("M")){
			mid = category+"-"+maxnum +"-01";
		}else{
			mid = category+"-"+maxnum;
		}
		System.out.println(mid);
		vo.setMid(mid);
		
		//이미지 업로드
		String orgFileName = fileload.getOriginalFilename();
		String newFileName = mid+".jpg"; 
		
		vo.setImg(newFileName);
		String saveFolder = "d:\\workspace_java\\stsweb3\\src\\main\\webapp\\resources\\kiosk\\images\\menu";
		File file = new File(saveFolder +"\\" + newFileName);
		FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
		//상품등록 쿼리 실행
		int res= mansv.newmenuInsert(vo);
		
		return "redirect:/manager/productList.do";
	}
	
	//상품수정폼
	@RequestMapping(value = "/manager/productUpdateForm.do", method = RequestMethod.GET)
	public String productUpdateForm(HttpServletRequest request, Model model) {
		
		String mid = request.getParameter("mid");
		SubwayVo res = mansv.getMenu(mid);
		model.addAttribute("menu", res);
		
		return "/manager/productUpdateForm";
	}
			
	//상품수정
	@RequestMapping(value = "/manager/productUpdate.do", method = RequestMethod.POST)
	public String productUpdate(Model model, SubwayVo vo, HttpServletRequest request,
			@RequestParam(value="fileload", required=false)MultipartFile fileload) throws IOException {
		
		String mid = request.getParameter("mid");
		
		//이미지 업로드
	    String orgFileName = fileload.getOriginalFilename();
	    String newFileName = mid+".jpg"; 
	      
	    vo.setImg(newFileName);
	    String saveFolder = "d:\\workspace_java\\stsweb3\\src\\main\\webapp\\resources\\kiosk\\images\\menu";
	    File file = new File(saveFolder +"\\" + newFileName);
	    FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	   
	    vo.setMid(mid);
	    vo.setPrice15(Integer.valueOf(request.getParameter("price15")));
	    vo.setPrice30(Integer.valueOf(request.getParameter("price30")));
	    vo.setEvent(request.getParameter("event"));
	    vo.setCal(Integer.valueOf(request.getParameter("cal")));
		int res = mansv.modiMenu(vo);
				
		return "redirect:/manager/productList.do";
	}
	
	//상품삭제
	@RequestMapping(value = "/manager/productDel.do", method = RequestMethod.GET)
	public String productDel(HttpServletRequest request,Model model) {
		
		String mid=request.getParameter("mid");
		//System.out.println("삭제"+mid);
		int res = mansv.menuDelete(mid);
		return "redirect:/manager/productList.do";
	}

	//일별매출
	@RequestMapping(value = "/manager/salesDaily.do", method = RequestMethod.GET)
	public String salesDaily(Model model) {

		//한달전 어제날짜~어제날짜 
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA); // date 포맷형식
		Calendar cal = Calendar.getInstance(); // 캘린더 객체
		cal.add(Calendar.DATE, -1);        // 하루 전 날짜로 설정
		java.util.Date result_date = cal.getTime(); // calendar -> date
		String yesterday = dateForm.format(result_date); 
		
		cal.add(Calendar.MONTH, -1);        // 1달전으로 설정
		java.util.Date result_date2 = cal.getTime();
		String aMonthAgo = dateForm .format(result_date2); // date -> string (yyyyMMdd)
		
		model.addAttribute("yesterday", yesterday); //오늘날짜
		model.addAttribute("aMonthAgo", aMonthAgo); //한달전날짜
		
		//그래프에 리스트뿌리기
		ArrayList<SubwayVo> list = mansv.salesListDaily();
		model.addAttribute("list", list);
	
       return "/manager/salesDaily";
	}
	
	//일별랭킹분리
	@RequestMapping(value = "/manager/salesDailyRank.do", method = RequestMethod.GET)
	public String salesDailyRank(HttpServletRequest request, Model model) {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		//어제
		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.DATE, -1);
		
		//어제로부터 한달전
	    Calendar cal2= Calendar.getInstance ();
	    cal2.add(Calendar.DATE, -1);
	    cal2.add(Calendar.MONTH, -1);

	    //두날짜사이 일 수 구하기
	    Calendar temp= Calendar.getInstance ();
	    temp.setTime(cal2.getTime());
	    int day = 0;
	    while ( !temp.after (cal1) ){
	        day++;
	        temp.add ( Calendar.DATE, 1 );
	    }
		ArrayList<SubwayVo> sel= new ArrayList<SubwayVo>();
		for(int i=0; i<day; i++){
			SubwayVo d = new SubwayVo();
			
			cal.add(Calendar.DATE,-1);
	    	String date = sdformat.format(cal.getTime());
	    	
			d.setDate(date);
			sel.add(d);
		}
		model.addAttribute("sel", sel);
		
		String date = request.getParameter("date");
		if (date==null || date=="") {
			String yesterday = sdformat.format(cal1.getTime());
			date = yesterday;
		}
				
		//판매순위
	    ArrayList<SubwayVo> rankList = mansv.getDayRank(date);
	    model.addAttribute("rankList", rankList);
	    model.addAttribute("chDate", date);
	
		return "/manager/salesDailyRank";
	}
		
	//일별매출리스트분리
	@RequestMapping(value = "/manager/salesDailyList.do", method = RequestMethod.GET)
	public String salesDailyList(HttpServletRequest request, Model model) {
		
		//한달전 어제날짜~어제날짜 
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA); // date 포맷형식
		Calendar cal = Calendar.getInstance(); // 캘린더 객체
		cal.add(Calendar.DATE, -1);        // 하루 전 날짜로 설정
		java.util.Date result_date = cal.getTime(); // calendar -> date
		String yesterday = dateForm.format(result_date); 
		
		cal.add(Calendar.MONTH, -1);        // 1달전으로 설정
		java.util.Date result_date2 = cal.getTime();
		String monthAgo = dateForm .format(result_date2); // date -> string (yyyyMMdd)
		
		model.addAttribute("yesterday", yesterday); //오늘날짜
		model.addAttribute("monthAgo", monthAgo); //한달전날짜
				
		PagingVo pagingVo = new PagingVo();
		
		//리스트 갯수
		int countList = mansv.salesListCount();
		String pageNum_temp=request.getParameter("pageNum");
		int rowNum = 12;
		pagingVo.setTotal(countList);
		pagingVo.setPageNum_temp(pageNum_temp);
		pagingVo.setRowNum(rowNum);
		pagingVo = mansv.setPagingInfo(pagingVo);
		
		//리스트 뿌리기
		ArrayList<SubwayVo> list = mansv.salesListDaily(pagingVo);
		
		StringBuffer search = new StringBuffer(request.getContextPath());
		search.append("/manager/salesDailyList.do?pageNum=");
		
		request.setAttribute("total", countList);
		model.addAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pagingVo.getPageNum());
		request.setAttribute("pageBlock", pagingVo.getPageBlock());
		request.setAttribute("pageCount", pagingVo.getPageCount());
		request.setAttribute("endPage", pagingVo.getEndPage());
		request.setAttribute("startPage", pagingVo.getStartPage());
		request.setAttribute("rowNum", pagingVo.getRowNum());
		
		int indexnum=(pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		request.setAttribute("indexnum", indexnum);
				
		return "/manager/salesDailyList";
	}
	
	//월별매출
	@RequestMapping(value = "/manager/salesMonthly.do", method = RequestMethod.GET)
	public String salesMonthly(HttpServletRequest request, Model model) {
		
		//1년전 지난달~지난달 
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM",Locale.KOREA); 
		Calendar cal = Calendar.getInstance(); 
		
		cal.add(Calendar.MONTH, -1);        
		java.util.Date result_date1 = cal.getTime();
		String monthAgo = dateForm .format(result_date1); 
		
		cal.add(Calendar.MONTH, -11);        
		java.util.Date result_date2 = cal.getTime();
		String yearAgo = dateForm .format(result_date2); 
		
		model.addAttribute("yearAgo", yearAgo); //1년전
		model.addAttribute("monthAgo", monthAgo); //한달전
		
		
		//리스트 뿌리기
		ArrayList<SubwayVo> list = mansv.salesListMonthly();
		model.addAttribute("list", list);
		
		//월별 판매순위
		ArrayList<SubwayVo> rankList = mansv.getMonthRank(monthAgo);
		model.addAttribute("rankList", rankList);
		
		return "/manager/salesMonthly";
	}
		
		
	//월별판매 순위 분리
	@RequestMapping(value = "/manager/salesMonthlyRank.do", method = RequestMethod.GET)
	public String salesMonthlyRank(HttpServletRequest request, Model model) {
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM",Locale.KOREA); 
		Calendar cal = Calendar.getInstance(); 
		
		//지난달
		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.MONTH, -1);
		
		//지난달로부터 1년 전
	    Calendar cal2= Calendar.getInstance ();
	    cal2.add(Calendar.MONTH, -1);
	    cal2.add(Calendar.MONTH, -11);

	    //두날짜사이 일 수 구하기
	    Calendar temp= Calendar.getInstance ();
	    temp.setTime(cal2.getTime());
	    int month = 0;
	    while ( !temp.after (cal1) ){
	        month++;
	        temp.add ( Calendar.MONTH, 1 );
	    }
		ArrayList<SubwayVo> sel= new ArrayList<SubwayVo>();
		for(int i=0; i<month; i++){
			SubwayVo d = new SubwayVo();
			
			cal.add(Calendar.MONTH,-1);
	    	String date = dateForm.format(cal.getTime());
	    	
			d.setDate(date);
			sel.add(d);
		}
		model.addAttribute("sel", sel);
		
		String date = request.getParameter("date");
		//System.out.println("월"+date);
		if (date==null || date=="") {
			String lastmonth = dateForm.format(cal1.getTime());
			date = lastmonth;
		}

		//월별 판매순위
		ArrayList<SubwayVo> rankList = mansv.getMonthRank(date);
		model.addAttribute("rankList", rankList);
		model.addAttribute("chDate", date);
		
		return "/manager/salesMonthlyRank";
	}
	
	
	//주문리스트
	@RequestMapping(value = "/manager/salesOrderList.do", method = RequestMethod.GET)
	public String salesOrderList(HttpServletRequest request, Model model) {
		
		PagingVo pagingVo = new PagingVo();
		
		String keyWord = request.getParameter("keyWord");
		String keyValue = request.getParameter("keyValue");
		
		if(keyWord==null || keyWord.equals("")){
			keyWord="ordernum";
		}
		if(keyValue==null || keyValue.equals("")){
			keyValue="";
		}
		pagingVo.setKeyWord(keyWord);
		pagingVo.setKeyValue(keyValue);
		
		int total = mansv.OrderCount(pagingVo);
		String pageNum_temp=request.getParameter("pageNum");
		
		pagingVo.setTotal(total);
		pagingVo.setPageNum_temp(pageNum_temp);
		pagingVo = mansv.setPagingInfo(pagingVo);
		
		ArrayList<SubwayVo> orderlist = mansv.getOrderList(pagingVo);
		
		StringBuffer search = new StringBuffer(request.getContextPath());
		search.append("/manager/salesOrderList.do?keyWord="+keyWord);
		search.append("&keyValue="+keyValue);
		search.append("&pageNum=");
		
		request.setAttribute("total", total);
		request.setAttribute("orderlist",orderlist);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pagingVo.getPageNum());
		request.setAttribute("pageBlock", pagingVo.getPageBlock());
		request.setAttribute("pageCount", pagingVo.getPageCount());
		request.setAttribute("endPage", pagingVo.getEndPage());
		request.setAttribute("startPage", pagingVo.getStartPage());
		request.setAttribute("rowNum", pagingVo.getRowNum());
		
		int indexnum=(pagingVo.getPageNum()-1)*pagingVo.getRowNum();
		request.setAttribute("indexnum", indexnum);
					
		return "/manager/salesOrderList";
	}		
	
	//주문상세
	@RequestMapping(value = "/manager/salesOrderDetail.do", method = RequestMethod.GET)
	public String salesOrderDetail(HttpServletRequest request, Model model) {
		
		String ordernum = request.getParameter("ordernum");
		ArrayList<SubwayVo> orderinfo = mansv.getOrderByOrderNum(ordernum);
		
		SubwayVo order = orderinfo.get(0);
		String status = order.getStatus();
		String canclenum = "";
			if(status.equals("결제취소")){
	
				canclenum = order.getCanclenum();
			}
		String togo = order.getTogo();
		int finalprice = 0;
		for(int i=0; i<orderinfo.size(); i++){
			SubwayVo temp = orderinfo.get(i);
			int totalprice = temp.getTotalprice();
			finalprice += totalprice;
		}
				
		int tax = finalprice/11;
		String regdate = order.getRegdate();

		model.addAttribute("ordernum",ordernum);
		model.addAttribute("canclenum",canclenum);
		model.addAttribute("status",status);
		model.addAttribute("togo",togo);
		model.addAttribute("tax",tax);
		
		model.addAttribute("finalprice",finalprice);
		model.addAttribute("regdate",regdate);
		model.addAttribute("orderinfo", orderinfo);
		
		model.addAttribute("canclenum",canclenum);
		return "/manager/salesOrderDetail";
	}
	
	//주문취소
	@RequestMapping(value = "/manager/salesOrderCancle.do", method = RequestMethod.GET)
	public String salesOrderCancle(HttpServletRequest request, Model model, HttpServletResponse response) throws Throwable {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String ordernum = request.getParameter("ordernum");
		
		SubwayVo vo = new SubwayVo();
				
		//취소번호 생성
		Date daynum = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		String todaynum = sdf.format(daynum);
		String todaycancle = sdf2.format(daynum);
		
		//주문테이블에 저장된 취소번호 갯수 불러오기
		ArrayList<SubwayVo> canclelistCount = mansv.canclelistCount(todaycancle);
		
		String num = String.format("%04d", canclelistCount.size()+1);
		String canclenum ="C-"+ todaynum + "-" +num;

		//totalprice
		
		ArrayList<SubwayVo> orderinfo = mansv.getOrderByOrderNum(ordernum);
		
		for(int i=0; i<orderinfo.size(); i++){
			SubwayVo temp = orderinfo.get(i);
			
			int tp = temp.getTotalprice();
			
			vo.setOrdernum(ordernum);
			vo.setCanclenum(canclenum);
			vo.setStatus("결제취소");
			vo.setTotalprice(tp*1); //-1 * 하지않기로
		}
		
		int res = mansv.odercancle(vo);
		return "redirect:/manager/salesOrderDetail.do?ordernum="+ordernum;
	}
	
	//영업시작
	@RequestMapping(value = "/manager/salesTime.do", method = RequestMethod.GET)
	public String salesTime(Model model) {
		
		int Onsale = mansv.CloseNullCount();	
		model.addAttribute("Onsale", Onsale);
			
		return "/manager/salesTime";
	}	
	
	//영업종료 비밀번호확인
	@RequestMapping(value = "/manager/salesTimeClose.do", method = RequestMethod.GET)
	public String salesTimeClose(HttpServletRequest request, Model model, HttpSession session) {

		String id=(String)session.getValue("id");
		//System.out.println("id"+id);
	
		ManagerVo res = mansv.getManagerInfo(id);
		String pw=res.getPw();
		model.addAttribute("pw", pw);
		//String inPw=request.getParameter("inPw");
		//System.out.println("pw"+pw);
		//System.out.println("inpw"+inPw);
		
		return "/manager/salesTimeClose";
	}	
	
	//영업시작, 마감 시간 insert
	@RequestMapping(value = "/manager/setTime.do", method = RequestMethod.GET)
	public String setTime(HttpServletRequest request, Model model, HttpSession session) {

		Date daynum = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String today = sdf.format(daynum);
		String todaytime = sdf2.format(daynum);
		
		String sales = request.getParameter("sales");
		SubwayVo vo = new SubwayVo();
		int res = 0;
		
		if(sales.equals("영업시작")){
			vo.setRegdate(today);
			vo.setOpentime(todaytime);
			res = mansv.insertOpen(vo);
			request.getSession().setAttribute("Onsale", true);
		}else if(sales.equals("영업종료")){
			
			SubwayVo open = new SubwayVo();
			open = mansv.getOpentime();
			String opentime = open.getOpentime();
			
			SubwayVo salesdata = new SubwayVo();
			//salesdata = mansv.getsalesdata(opentime);
			salesdata = mansv.getsalesdatalist(opentime);
			
			vo.setRegdate(open.getRegdate());
			vo.setOpentime(open.getOpentime());
			vo.setClosetime(todaytime);
			vo.setSalcount(salesdata.getSalcount());
			vo.setTotalsal(salesdata.getTotalsal());
			
			res = mansv.updateClose(vo);
			request.getSession().setAttribute("Onsale", false);
		}
	
		return "redirect:/manager/manMenu.do";
	}
	
	
}
