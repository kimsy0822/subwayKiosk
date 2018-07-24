package com.hk.th.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.hk.th.vo.SubwayVo;

public class SctServlet implements ServletContextListener {
	
	//웹어플리이션이 종료될때 작동 (가장 늦게 실행)
		@Override
		public void contextDestroyed(ServletContextEvent sce) {

			//컨텍스트를 얻어온다
			System.out.println("======================destroying servlet======================");
					
			SalesDao sales = new SalesDao();
			
			int Onsale = sales.CloseNullCount();
			//System.out.println("Onsale:"+Onsale);

			int res = 0;
			
			if(Onsale > 0){

				SubwayVo vo = new SubwayVo();
	    		
				String regdate = sales.getOpentime().getRegdate();
	    		String opentime = sales.getOpentime().getOpentime();
				
				int salesdata1 = sales.getsalesdatalist(opentime).getSalcount();
				int saledata2 =sales.getsalesdatalist(opentime).getTotalsal();
				//System.out.println("regdate"+regdate);
				//System.out.println("opentime"+opentime);
				//System.out.println("salesdata1"+salesdata1);
				//System.out.println("saledata2"+saledata2);
				vo.setRegdate(regdate);
				vo.setOpentime(opentime);
				vo.setSalcount(salesdata1);
				vo.setTotalsal(saledata2);
				
				res = sales.updateClose(vo);
				//System.out.println("===========================================================");
				//System.out.println("res:"+res);
				
	    	}	

		}
	 
		//웹어플리이션이 실행될때 작동 (가장 먼저 실행)
	    @Override
	    public void contextInitialized(ServletContextEvent sce) {

	        System.out.println("======================initialized servlet======================");

	    }

}
