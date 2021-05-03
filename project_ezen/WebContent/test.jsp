<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
  <!DOCTYPE html> 
<html> 
<head> 
<meta charset="utf-8"> 
</head> 
<body>
<body>
	
	
	<input  type="button" value="클릭하기"  onclick="a();">
	
	 <script>
/* 	 function a(){
		 const str = "2021-05-05";

		 const strArr = str.split('-');

		 const date = new Date(strArr[0], strArr[1]-1, strArr[2]);

	      
		 var date2    = new Date();
     
    alert(date);
    alert(date2);
      
      if(eval(date) < eval(date2)) {

    	  alert("현재날짜가 더크다");

    	}else if(eval(date) = eval(date2)) {

      	  alert("날짜가 같다");

      	}else if(eval(date) > eval(date2)) {

        	  alert("선택한날짜가 더크다");

        	}
      
	 } */
	 
	 function a(){ 
		 var date = new Date();
		 var month   = date.getMonth() + 1;
		 var day = date.getDate(); 
		 var year    = date.getFullYear();
	   
		 if(month.length <2)month = '0'+month;
		 if(day.length <2)day = '0'+day;
		 
		 var newdate = year +(month<10? "0"+month:month) + (day<10? "0"+day:day);
		 
		 
		 const str = "";

		 const strArr = str.split('-');

		 const aa = new Date(strArr[0], strArr[1]-1, strArr[2]);
		 var monthA   = aa.getMonth() + 1;
		 var dayA = aa.getDate(); 
		 var yearA    = aa.getFullYear();
		 
		 var dd = yearA +(monthA<10? "0"+monthA:monthA) + (dayA<10? "0"+dayA:dayA);
		 
		 
		 
		    alert(newdate);
		    alert(dd);
		 
		 
	      if(dd < newdate) {

	    	  alert("현재날짜가 더크다");

	    	}else if(dd == newdate) {

	      	  alert("날짜가 같다");

	      	}else if(dd > newdate) {

	        	  alert("선택한날짜가 더크다");

	        	}
	 }
	 
	 
  </script>
</body>
  </body>
  </html>