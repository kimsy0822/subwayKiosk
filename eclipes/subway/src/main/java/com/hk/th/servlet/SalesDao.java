package com.hk.th.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.hk.th.vo.SubwayVo;

public class SalesDao {
	
	//static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//static String url = "jdbc:mysql://localhost:3306/dbweb";
	static String url = "jdbc:mysql://visualsvn:3306/stsweb3";
	static String user = "stsdb";
	static String password = "sts";
	static Connection conn = null;
	static Statement stmt = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	// JDBC DRIVER INIT
	static {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// CONNECTION
	protected static Connection getConnect() {
		
	  Connection tempConn = null;
	  if(conn==null) {
	    try {
			tempConn = DriverManager.getConnection(url, user, password);
			//System.out.println("DB CONN SUCCESS");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  }
	  return tempConn;
	}
	
	// DB CLOSE()
	protected static void DBClose() {
		if(conn!=null) {try{conn.close(); conn=null;} 
			catch (SQLException e) {e.printStackTrace();}
		}
		if(stmt!=null) {try{stmt.close(); stmt=null;} 
			catch (SQLException e) {e.printStackTrace();}
		}
		if(pstmt!=null) {try{pstmt.close(); pstmt=null;} 
		catch (SQLException e) {e.printStackTrace();}
		}
		if(rs!=null) {try{rs.close(); rs=null;} 
		catch (SQLException e) {e.printStackTrace();}
		}
				
	}
	
	//매출테이블 마감시간 null 값 체크
	public int CloseNullCount(){
		
		int result = 0;
		conn = getConnect();
		String sql = "select count(*) from sales where closetime is null";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		return result;
	}
	
	//매출테이블 마감시간 null의 오픈시간 가져오기
	public SubwayVo getOpentime(){
		
		SubwayVo SubwayVo = null;
		conn = getConnect();
		String sql = "select * from sales where closetime is null";
		
		try{
			pstmt=conn.prepareStatement(sql);			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				SubwayVo = new SubwayVo();
				SubwayVo.setOpentime(rs.getString("opentime"));
				SubwayVo.setRegdate(rs.getString("regdate"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return SubwayVo;
		
	}
	
	
	public SubwayVo getsalesdatalist(String opentime){
		
		ArrayList<SubwayVo> svres = new ArrayList<SubwayVo>();
		conn = getConnect();
		String sql = "select * from orders where status='결제완료'";
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				SubwayVo SubwayVo = new SubwayVo();
				
				SubwayVo.setOrdernum(rs.getString("ordernum"));
				SubwayVo.setMid(rs.getString("mid"));
				SubwayVo.setCanclenum(rs.getString("canclenum"));
				SubwayVo.setStatus(rs.getString("status"));
				SubwayVo.setOptions(rs.getString("options"));
				SubwayVo.setQnt(rs.getInt("qnt"));
				SubwayVo.setTotalprice(rs.getInt("totalprice"));
				SubwayVo.setRegdate(rs.getString("regdate"));
				SubwayVo.setTogo(rs.getString("togo"));
				
				svres.add(SubwayVo);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		int ordercount=0, totalorder=0, cancount=0, totalcan=0; //주문건수,주문금액,취소건수,취소금액
		int salcount=0 , totalsal=0; //매출건수,매출금액
		
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

		DBClose();
		return temp;
		
	}
	
	//매출테이블 마감등록
	public int updateClose(SubwayVo vo){
		
		Date daynum = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String today = sdf.format(daynum);
		String todaytime = sdf2.format(daynum);
		
		int rs = 0;
		conn = getConnect();
		String sql = "update sales set closetime = ?, salcount = ?, totalsal = ? where regdate = ? and opentime = ?";
		
		try{
			System.out.println(todaytime);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, todaytime);
			pstmt.setInt(2, vo.getSalcount());
			pstmt.setInt(3, vo.getTotalsal());
			pstmt.setString(4, vo.getRegdate());
			pstmt.setString(5, vo.getOpentime());

			rs = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return rs;
	}

	
}
