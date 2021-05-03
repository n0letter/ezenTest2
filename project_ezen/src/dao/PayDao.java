package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dto.PayDto;
import project_ezen.DBConnection;

public class PayDao {
  
  public static void payment(HttpServletRequest request) {	
    Connection conn = null;    
    PreparedStatement pstmt = null;
            
    String pay_name = request.getParameter("pay_name");
    String pay_membership = request.getParameter("pay_membership");
    int pay_coupon_num = Integer.parseInt(request.getParameter("pay_coupon_num"));
    int pay_amount = Integer.parseInt(request.getParameter("pay_amount"));
    String pay_start_date = request.getParameter("pay_start_date");
    String pay_end_date = request.getParameter("pay_end_date");
    int pay_member_idx = Integer.parseInt(request.getParameter("pay_member_idx"));
    			
    try {		
      conn = DBConnection.getConnection();
      request.setCharacterEncoding("UTF-8");
      String query = "INSERT INTO gym_pay (pay_idx, pay_name, pay_membership, pay_coupon_num, pay_amount,"
   	     			 + "pay_start_date, pay_end_date, pay_member_idx, pay_payment_date)"
    				 + "values(gym_pay_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
    
      System.out.println(query);
      
      pstmt= conn.prepareStatement(query);
      pstmt.setString(1, pay_name);
      pstmt.setString(2, pay_membership);
      pstmt.setInt(3, pay_coupon_num);
      pstmt.setInt(4, pay_amount);
      pstmt.setString(5, pay_start_date);
      pstmt.setString(6, pay_end_date);
      pstmt.setInt(7, pay_member_idx);
    					
      int payresult = pstmt.executeUpdate();
      System.out.println("update:" + payresult); 
    }catch (Exception e) {
      e.printStackTrace();
      System.out.println("결제 에러");
    }
  }	
  // (온라인결제)
  // 상품선택
  public static PayDto choice(HttpServletRequest request) {
	PayDto dto = null;  
	
	HttpSession session = request.getSession();
	  
    Connection conn = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null;  
	
	int pay_member_idx = Integer.parseInt(request.getParameter("pay_member_idx"));
    
    try {
      conn = DBConnection.getConnection();
      
      String query = "select pay_end_date from gym_pay where pay_member_idx=?";
      pstmt = conn.prepareStatement( query );
      pstmt.setInt(1, pay_member_idx);
      rs = pstmt.executeQuery(); 
      	   	
      while( rs.next() ) {	
        String pay_end_date = rs.getString("pay_end_date");
              
        session.setAttribute("pay_end_date",pay_end_date);
      }
    }
    catch( Exception e ) {
      e.printStackTrace();
    }
	return dto;
  }  
  // 회원 결제 금액 합산 
  public static void paySum(HttpServletRequest request) throws Exception {	
    Connection conn = null;    
    PreparedStatement pstmt = null;
    
	int pay_member_idx = Integer.parseInt(request.getParameter("pay_member_idx"));
	    
	try {		
	  conn = DBConnection.getConnection();
	  request.setCharacterEncoding("UTF-8");
	  String query = "update gym_member set member_pay_sum = (select sum(pay_amount) "
	      	         + "from gym_pay where pay_member_idx = ?) where member_idx = ?";    		  
	  System.out.println(query);
	  pstmt= conn.prepareStatement(query);
	  pstmt.setInt(1, pay_member_idx);
	  pstmt.setInt(2, pay_member_idx);
	 
	  int paySumResult = pstmt.executeUpdate();
	  System.out.println("paySumResult:" + paySumResult); 
	}catch (Exception e) {
	  e.printStackTrace();
	  System.out.println("결제 에러");
	}
  }	
  // 1주년 쿠폰빼기
  public static void paySub01(HttpServletRequest request) throws Exception {	
    Connection conn = null;    
    PreparedStatement pstmt = null;
    
    int pay_member_idx = Integer.parseInt(request.getParameter("pay_member_idx"));
	    
	try {		
	  conn = DBConnection.getConnection();
	  request.setCharacterEncoding("UTF-8");
	  String query = "update gym_member set member_coupon01 = (select member_coupon01 - 1 "
	  		         + "from gym_member where member_idx = ?) where member_idx = ?";    		  
	  System.out.println(query);
	  pstmt= conn.prepareStatement(query);
	  pstmt.setInt(1, pay_member_idx);
	  pstmt.setInt(2, pay_member_idx);
	 
	  int paySub01Result = pstmt.executeUpdate();
	  System.out.println("paySub01Result:" + paySub01Result); 
	}catch (Exception e) {
	  e.printStackTrace();
	  System.out.println("결제 에러");
	}
  }	
  //이용후기 쿠폰빼기
  public static void paySub02(HttpServletRequest request) throws Exception {	
    Connection conn = null;    
    PreparedStatement pstmt = null;
   
    int pay_member_idx = Integer.parseInt(request.getParameter("pay_member_idx"));
	    
    try {		
	  conn = DBConnection.getConnection();
	  request.setCharacterEncoding("UTF-8");
	  String query = "update gym_member set member_coupon02 = (select member_coupon02 - 1 "
		  		     + "from gym_member where member_idx = ?) where member_idx = ?";    		  
	  System.out.println(query);
	  pstmt= conn.prepareStatement(query);
	  pstmt.setInt(1, pay_member_idx);
	  pstmt.setInt(2, pay_member_idx);
		 
	  int paySub01Result = pstmt.executeUpdate();
	  System.out.println("paySub01Result:" + paySub01Result); 
    }catch (Exception e) {
	  e.printStackTrace();
	  System.out.println("결제 에러");
	}
  }	
  // (마이페이지)
  // 결제내역
  public static ArrayList<PayDto> pay_list(String pay_member_idx) {
    ArrayList<PayDto> pay_list = new ArrayList<PayDto>();  
	  
    Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	try {
	  conn = DBConnection.getConnection(); 
		
      String query = "select * from gym_pay where pay_member_idx = ?"
    		         + "order by pay_payment_date desc";
      pstmt = conn.prepareStatement( query );
      pstmt.setInt(1, Integer.parseInt( pay_member_idx ) );
      
      rs = pstmt.executeQuery();
		
	  while( rs.next() ) {
	    int pay_idx = rs.getInt("pay_idx");
    	String pay_name = rs.getString("pay_name");
    	String pay_membership = rs.getString("pay_membership");
    	int pay_coupon_num = rs.getInt("pay_coupon_num");
        int pay_amount = rs.getInt("pay_amount");      
        String pay_start_date = rs.getString("pay_start_date");
        String pay_end_date = rs.getString("pay_end_date");
        Date pay_payment_date = rs.getTimestamp("pay_payment_date");
        int pay_member_idx_int = rs.getInt("pay_member_idx"); 
            
        PayDto dto = new PayDto(pay_idx, pay_name, pay_membership, pay_coupon_num, 
        		     pay_amount, pay_start_date, pay_end_date, 
        		     pay_payment_date, pay_member_idx_int);
    		
        pay_list.add(dto);
      }	
	}catch(Exception e) {
	  e.printStackTrace();
	}	
    return pay_list;
  }
 
}