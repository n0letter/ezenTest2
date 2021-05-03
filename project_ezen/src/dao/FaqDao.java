package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import dto.FaqDto;
import project_ezen.DBConnection;

public class FaqDao {
	
  public static void Faq(HttpServletRequest request) {	
	Connection conn = null;    
    PreparedStatement pstmt = null;
		            
	String faq_title = request.getParameter("faq_title");
	String faq_content = request.getParameter("faq_content");
		    
	try {		
      conn = DBConnection.getConnection();
	  String query = "INSERT INTO gym_faq (faq_idx, faq_title, faq_content, faq_date)"
		    		 + "values(gym_faq_seq.nextval, ?, ?, sysdate)";
		    
	  pstmt= conn.prepareStatement(query);
	  pstmt.setString(1, faq_title);
	  pstmt.setString(2, faq_content);
		    					
	  int faqresult = pstmt.executeUpdate();
	  System.out.println("update:" + faqresult); 
	}catch (Exception e) {
	  e.printStackTrace();
	  System.out.println("Faq 에러");
	}
  }
  // (고객센터)
  // Faq목록
  public static ArrayList<FaqDto> faq_list() {
    ArrayList<FaqDto> faq_list = new ArrayList<FaqDto>();
		
	Connection conn = null; 
	Statement stmt = null;
	ResultSet rs = null; 
		
	try {
	  conn = DBConnection.getConnection(); 
	  stmt = conn.createStatement(); 
			
	  String query = "select * from gym_faq order by faq_date desc";
	  rs = stmt.executeQuery(query);
			
	  while( rs.next() ) {
	    int faq_idx = rs.getInt("faq_idx");
	    String faq_title = rs.getString("faq_title");
	    String faq_content = rs.getString("faq_content");
	    Date faq_date = rs.getTimestamp("faq_date");
	            
	    FaqDto dto = new FaqDto(faq_idx, faq_title, faq_content, faq_date);
	            
	    faq_list.add(dto);
	  }
    }catch(Exception e) {
	  e.printStackTrace();
	}	
	return faq_list;
  }
  
}