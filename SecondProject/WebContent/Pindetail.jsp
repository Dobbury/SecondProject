<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.pintitle{
	font-size: 26px;
    font-weight: 700;
}
.map{
    width: 100%;
    height: 360px;
    border: 1px solid;
}
.pincomment{
	background-color: rgb(238, 241, 246) !important;
    width: 100%;
    padding: 30px 20px 10px 20px;
       
}
.pincommant-avg{
	    color: #555;
    margin-top: 10px;
     font-size: 14px;
}
button{
  background:#003458;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#003458;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #003458;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include> 
<main style="padding-top:80px;">
   <div class="container" style="      display: table;  max-width: 900px;padding-top: 30px;">
  	<div style="width:100%;  padding: 0 0 20px 0;display: table;">
	
		<p class="pintitle">여기가 핀 제목입니다.</p>
		<div class="pinview">
			<div class="map">핀 찍혀있는 지도</div>
		<p class="pinloc">주소 : 경기도 화성시 능동 자연앤 경남아너스빌</p>
		<p class="pinavg">평점 : 6.5</p>
		
		<div class="pincomment">
		
		<div class="commant-view" style="margin-bottom: 20px;padding-left: 20px; padding-right: 20px;    display: table;
    width: 100%;">	
               <div class="commant-id" style="text-align: left;font-weight: 700;margin-bottom: 3px;display: table;width: 100%;">
               <p style="float: left;">
               a
               </p>
               <p style="float: left;margin-left: 10px;font-weight: 300;font-size: 12px;margin-top: 5px;">
               2018-09-06 14:50
               </p>
              
               
               </div>
               <div class="commant-content" style="width: 88%;word-break: break-all;text-align: left;  color:#555">와우 정말좋네요</div>
               <div class="pincommant-avg">평점 : 6.5</div>
               <hr>
               
            </div>
		
		</div>
		
		</div>
   </div>
	
	

   </div>
   </main>
<jsp:include page="footer.jsp"></jsp:include> 

</body>
</html>