<%@page import="dto.pinCommentDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.PinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
PinDto dto = (PinDto)request.getAttribute("pin");
List<pinCommentDto> list = (List<pinCommentDto>)request.getAttribute("pinCList");
String grade_AVG = (String)request.getAttribute("grade_AVG");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
 .starR1{
    background: url('img/ico_review.png') no-repeat -34px 0;
    background-size: auto 100%;
    width: 10px;
    height: 20px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('img/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 10px;
    height: 20px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-10px 0;}

 
.pintitle{
	font-size: 26px;
    font-weight: 700;
    text-align: center;
    margin-bottom: -7px;
}
.map{
    width: 100%;
    height: 360px;
}
.pincomment{
	background-color: rgba(0,0,0,0.1) !important;
    width: 100%;
    padding: 30px 20px 10px 20px;
       
}
.pincommant-avg{
	        color: #555;
    margin-top: 3px;
    font-size: 14px;
    display: inline-block;
    margin-left: 7px;
    font-size: 13px;
}

.pintable{
	  width:100%;
}
.pintable td{
	  padding: 14px;
    font-size: 16px;
        border: 1px solid #dee2e6;
            background-color: #f9f9f9;
}
.fa{
	margin-right: 5px;
	    width: 10px;
}
.title{
	margin-top: 40px;
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 5px;
}
.title:before {
	width: 5px;
	height: 10px;
	display: inline-block;
	background-color: #104aab;
	content: "";
	margin-right: 5px;
	    margin-bottom: 2px;
}

main{
   background-image: url('img/bgSample09.jpg');
    background-size: 100% 100%;
    background-position: center center;
    transition: all 40s;
    display: block;
    position: relative;
    width: 100%;


    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;

} 



</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBp3NXTPG792Eg4zSYGpEGr8wYdAe3g4MI&libraries=places"></script>
<script type="text/javascript">
var pinlat = <%=dto.getLat() %>;
var pinlng = <%=dto.getLng() %>;
function initialize() {
	
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 12,
		center: {lat:pinlat, lng:pinlng}
	});
	
	//Adds a marker to the map.
	function addMarker(location) {
	  var marker = new google.maps.Marker({
	    position: location,
	    map: map
	  });
	  markers.push(marker);
	}
	var location=new google.maps.LatLng(pinlat,pinlng);
	addMarker(location);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

</head>
<body>
 <jsp:include page="header.jsp"></jsp:include> 
<main style="padding-top:80px;">
   <div class="container" style="      display: table;  max-width: 900px;padding-top: 30px;">
  	<div style="width:100%;  padding: 0 0 20px 0;display: table;">
	
		<p class="pintitle"><%=dto.getPin_name() %></p>
		
		<hr>
		
		<div class="pinview">
			<div id="map" class="map"></div>
		<%-- <p class="pinloc"><small class="fa fa-map-marker"></small>주소 : <%=dto.getLocation() %></p>
		<p class="pinavg"><small class="fa fa-star"></small>평점 : <%=grade_AVG %> </p> --%>
		
		<p class="title">정보</p>
		<table class="pintable">
		<colgroup>
		<col width="30%">
		<col width="70%">
		</colgroup>
		
		<tr>
              <td class="align-middle"><small class="fa fa-map-marker"></small> <small>주소</small></td>
               <td class="align-middle"><small><%=dto.getLocation() %></small></td>
         </tr>
		<tr>
              <td class="align-middle"><small class="fa fa-star"></small> <small>평점</small></td>
               <td class="align-middle"><small><%=grade_AVG %> </small></td>
         </tr>
		</table>
		
		<p class="title">댓글</p>
		<div class="pincomment"">
		<%
		for(int i = 0; i < list.size();i++){
			
		%>
		<div class="commant-view" style="margin-bottom: 20px;padding-left: 20px; padding-right: 20px;    display: table;
    width: 100%;">	
               <div class="commant-id" style="text-align: left;font-weight: 700;margin-bottom: 3px;display: table;width: 100%;">
               <p style="float: left;margin-bottom: 10px;">
               <%=list.get(i).getId() %>
               </p>
               
               
               </div>
               <div class="commant-content" style="width: 99%;word-break: break-all;text-align: left;  color:#555"><%=list.get(i).getPcomment() %></div>
              
               <div class="starRev" style="margin-top: 10px;">
						<%
						for(int j = 1 ; j<=10 ; j++){ 
							if(j%2==1){
								if(j <= (int)list.get(i).getGrade()){
						%>
				  					<span class="starR1 on"></span>
				  			<%
								}else{
				  			%>
				  					<span class="starR1"></span>
				  			<%
				  				}
							}else if(j%2==0){
								if(j <= (int)list.get(i).getGrade()){
							%>
		  							<span class="starR2 on"></span>
							<% 
								}else{
							%>
									<span class="starR2"></span>
							<%
								}
							}
						}
						%>	
						 <span class="pincommant-avg">평점 : <%=list.get(i).getGrade() %></span>
				</div>
               <hr>
               
            </div>
       	<%
		}
		%>
		</div>
		
		</div>
   </div>
	
	

   </div>
   </main>
<jsp:include page="footer.jsp"></jsp:include> 

</body>
</html>