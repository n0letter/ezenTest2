package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import dto.InquiryDto;
import project_ezen.DBConnection;

public class InquiryDao {
	
  public static void inquiry(HttpServletRequest request) {	
	Connection conn = null;    
    PreparedStatement pstmt = null;
		            
	String inq_type = request.getParameter("inq_type");
	String inq_title = request.getParameter("inq_title");
	String inq_name = request.getParameter("inq_name");
	String inq_content = request.getParameter("inq_content");
	String inq_state = request.getParameter("inq_state");
	String inq_re_content = request.getParameter("inq_re_content");
	int inq_member_idx = Integer.parseInt(request.getParameter("inq_member_idx"));
		    
	try {		
      conn = DBConnection.getConnection();
	  String query = "INSERT INTO gym_inquiry (inq_idx, inq_type, inq_title, inq_name,"
		   	         + "inq_content, inq_state, inq_re_content, inq_member_idx, inq_date)"
		    		 + "values(gym_inquiry_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		    
	  pstmt= conn.prepareStatement(query);
	  pstmt.setString(1, inq_type);
	  pstmt.setString(2, inq_title);
	  pstmt.setString(3, inq_name);
	  pstmt.setString(4, inq_content);
	  pstmt.setString(5, inq_state);
	  pstmt.setString(6, inq_re_content);
	  pstmt.setInt(7, inq_member_idx);
		    					
	  int inqresult = pstmt.executeUpdate();
	  System.out.println("update:" + inqresult); 
	}catch (Exception e) {
	  e.printStackTrace();
	  System.out.println("1:1문의 에러");
	}
  }	
  // (마이페이지)
  // 1:1문의
  public static ArrayList<InquiryDto> inq_list(String inq_member_idx) {
    ArrayList<InquiryDto> inq_list = new ArrayList<InquiryDto>();  
	  
    Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	try {
	  conn = DBConnection.getConnection(); 
		
      String query = "select * from gym_inquiry where inq_member_idx = ?"
    		         + "order by inq_date desc";
      pstmt = conn.prepareStatement( query );
      pstmt.setInt(1, Integer.parseInt( inq_member_idx ) );
      
      rs = pstmt.executeQuery();
		
	  while( rs.next() ) {
	    int inq_idx = rs.getInt("inq_idx");
    	String inq_type = rs.getString("inq_type");
    	String inq_title = rs.getString("inq_title");
    	String inq_name = rs.getString("inq_name");
    	String inq_content = rs.getString("inq_content");
    	String inq_state = rs.getString("inq_state");
    	String inq_re_content = rs.getString("inq_re_content");
        Date inq_date = rs.getTimestamp("inq_date");
        int inq_member_idx_int = rs.getInt("inq_member_idx"); 
            
        InquiryDto dto = new InquiryDto(inq_idx, inq_type, inq_title, inq_name, 
        		         inq_content, inq_state, inq_re_content, 
        		         inq_date, inq_member_idx_int);
    		
        inq_list.add(dto);
      }	
	}catch(Exception e) {
	  e.printStackTrace();
	}	
    return inq_list;
  }
  // 1:1문의 상세보기
  public static InquiryDto inq_view(String inq_idx) {
    InquiryDto dto = null;
		
	Connection conn = null;    
    PreparedStatement pstmt = null;    
    ResultSet rs = null;    
       
    try {
      conn = DBConnection.getConnection();
      
      String query = "select * from gym_inquiry where inq_idx=?";
      pstmt = conn.prepareStatement( query );
      pstmt.setInt(1, Integer.parseInt( inq_idx ));
      
      rs = pstmt.executeQuery(); 
        	
      while( rs.next() ) {
    	int inq_idx_int = rs.getInt("inq_idx");
      	String inq_type = rs.getString("inq_type");
      	String inq_title = rs.getString("inq_title");
      	String inq_name = rs.getString("inq_name");
      	String inq_content = rs.getString("inq_content");
      	String inq_state = rs.getString("inq_state");
      	String inq_re_content = rs.getString("inq_re_content");
        Date inq_date = rs.getTimestamp("inq_date");
        int inq_member_idx = rs.getInt("inq_member_idx"); 
	            
	    dto = new InquiryDto(inq_idx_int, inq_type, inq_title, inq_name,
	    	  inq_content, inq_state, inq_re_content, inq_date, inq_member_idx);
      }
    }
    catch( Exception e ) {
      e.printStackTrace();    	
    }
    return dto;
  }
  
}