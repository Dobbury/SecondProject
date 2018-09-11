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
		<div class="pinview">
			<div id="map" class="map"></div>
		<p class="pinloc">주소 : <%=dto.getLocation() %></p>
		<p class="pinavg">평점 : <%=grade_AVG %> </p>
		
		<div class="pincomment">
		<%
		for(int i = 0; i < list.size();i++){
			
		%>
		<div class="commant-view" style="margin-bottom: 20px;padding-left: 20px; padding-right: 20px;    display: table;
    width: 100%;">	
               <div class="commant-id" style="text-align: left;font-weight: 700;margin-bottom: 3px;display: table;width: 100%;">
               <p style="float: left;">
               <%=list.get(i).getId() %>
               </p>
               
               
               </div>
               <div class="commant-content" style="width: 88%;word-break: break-all;text-align: left;  color:#555"><%=list.get(i).getPcomment() %></div>
               <div class="pincommant-avg">평점 : <%=list.get(i).getGrade() %></div>
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