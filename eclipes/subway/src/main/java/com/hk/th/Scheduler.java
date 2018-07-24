package com.hk.th;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hk.th.service.ManagerService;
import com.hk.th.vo.SubwayVo;

@Component 
public class Scheduler { 
	@Resource(name="ManagerService")
	private ManagerService mansv;
	
	/** 
	 *  1. 오후 02:10:00에 호출이 되는 스케쥴러 
	 **/ 
	@Scheduled(cron = "0 20 14 * * *") 
	public void cronTest1(){ 
		System.out.println("오후 02:20:00에 호출이 됩니다 자동영업종료테스트");
		
		int Onsale = mansv.CloseNullCount();
		
		if(Onsale>0){
			
			Date daynum = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			String today = sdf.format(daynum);
			String todaytime = sdf2.format(daynum);
			
			SubwayVo vo = new SubwayVo();
			
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
			
			int res = mansv.updateClose(vo);
			
		}
	} 
	/**
	 * 2. 오후 11:30:00에 호출이 되는 스케쥴러 
	 **/ 
	@Scheduled(cron = "0 30 23 * * *") 
	public void cronTest2(){

		System.out.println("오후 11:30:00에 호출이 됩니다 ");
		int Onsale = mansv.CloseNullCount();
		
		if(Onsale>0){
			
			Date daynum = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			String today = sdf.format(daynum);
			String todaytime = sdf2.format(daynum);
			
			SubwayVo vo = new SubwayVo();
			
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
			
			int res = mansv.updateClose(vo);
			
		}
	} 
}

