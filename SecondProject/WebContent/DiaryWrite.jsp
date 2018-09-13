<%@page import="dto.memberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
request.setCharacterEncoding("utf-8");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>site</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="Design/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="Design/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="Design/css/style.min.css" rel="stylesheet">
  

 <style type="text/css">
  
 .starR1{
    background: url('img/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('img/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

  .style_prevu_kit
{
    display:inline-block;
    border:0;
    position: relative;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1); 
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1); 
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1);
    transition: all 200ms ease-in;
    transform: scale(1);   
	cursor: pointer;
}

.style_prevu_kit:hover
{
    box-shadow: 0px 0px 30px #AAB9FF;
    z-index: 2;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1);   
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1);
    transition: all 200ms ease-in;
    transform: scale(1);
}

/* Necessary for full page carousel*/
html, body, header, .view {
   height: 100%;
}

.navbar-menu {
   margin-bottom: 0;
}

.navbar-menu li {
   width: 100px;
   height: 30px;
   border: 1px solid blue;
   list-style: none;
   display: inline-block;
}


    .navbar-menu{
    margin-bottom: 0;
    }
    .navbar-menu li {
       width: 120px;
    height: 30px;
    list-style: none;
    display: inline-block;
    margin-top: 10px;
    text-align: center;
    font-weight: 700;
    color: #fff;
    border: none;
    font-size: 14px;
       
    }
    .navbar-menu li:hover > a {
    letter-spacing: 3px;
       
    }
    .navbar-menu li a{
        
       color: #fff;
       
    }
    .navbar.scrolling-navbar.top-nav-collapse{
           padding-top: 10px;
    padding-bottom: 10px;
    opacity: 0.9;
    }

    .navbar-brand {
       background-image: url('img/logo.png');
       background-size: 100% 100%;
       width: 130px;
       height: 30px;
           margin-bottom: 5px;
    }

    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
          background: #1C2331!important;
      }
  }

@media ( min-width : 800px) and (max-width: 850px) {
   .navbar:not (.top-nav-collapse ) {
      background: #1C2331 !important;
   }
}

.modal{
    z-index: 20;   
}
.modal-backdrop{
    z-index: 10;        
}


.selectbox{
   margin-right: 60px;
   display: inline-block;
   text-align: center;
}
.selectbox p {
       font-size: 21px;
    font-weight: 700;
       border-bottom: 1px solid #ccc;
    width: 200px;
    margin: 0 auto;
    margin-bottom: 6px;
    padding: 5px;
    
}


.pintable{
     width:100%;
}
.pintable td{
     padding: 14px;
    font-size: 16px;
           border: 1px solid #ccc;
            background-color: #f9f9f9;
}
.fa{
       margin-right: 15px;
       width: 10px;
}
.pin_info{
   display: inline-block;
    color: blue;
    font-weight: 700;
    margin-right: 6px;
    background-color: none;
}

.searchbtn{
       height: 30px;
    margin-left: -2px;
    border: none;
    margin-top: 1px;
    background-image: url(img/searchicon.png);
    background-size: 80% 80%;
    background-repeat: no-repeat;
    background-position: center;
    vertical-align: bottom;
    cursor: pointer;
    border-radius: 3px;
    border: 1px solid #ccc;
}


 main{
   background-image: url('img/bgSample13.jpg');
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
<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBp3NXTPG792Eg4zSYGpEGr8wYdAe3g4MI&libraries=places"></script>
<script>
   // In the following example, markers appear when the user clicks on the map.
   // Each marker is labeled with a single alphabetical character.
   <% 
   memberDto dto = (memberDto)session.getAttribute("user");
   %>
   var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   var labelIndex = 0;
   var basic_lat = 1;
   var basic_lng = 1;
   var basic_Marker=[];
   var modal_lat= 5.980408;
   var modal_lng = 116.0734568;
   var modal_Marker_lat=null;
   var modal_Marker_lng=null;
   var modal_Marker= [];
   var address = '';
   var tday =  '<%=request.getParameter("tday") %>';
   var id = '<%=dto.getId()%>';
   var map;
   var modal_map;
   
   function initialize() {
      modal_Marker_lat=null;
      modal_Marker_lng=null;
      map = new google.maps.Map(document.getElementById('map'), {
         zoom: 12,
         center: {lat:basic_lat, lng:basic_lng}
      });
      modal_map = new google.maps.Map(document.getElementById('modal_map'), {
         zoom: 12,
         center: {lat:modal_lat, lng:modal_lng}
      });
      // This event listener calls addMarker() when the map is clicked.
      google.maps.event.addListener(modal_map, 'click', function(event) {
         //Marker 초기화 부분 modal은 마커 1개만 필요하기 떄문에 누를떄마다 선 초기화
         if(modal_Marker.length!=0){
            modal_Marker[0].setMap(null);
            modal_Marker=[];   
         }
              
         modal_Marker_lat=event.latLng.lat();
         modal_Marker_lng=event.latLng.lng();
              
         add_Modal_Marker(event.latLng, modal_map);
      });
         
      //자동완성    
        var input = document.getElementById('search');

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', modal_map);

        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);


        autocomplete.addListener('place_changed', function() {
         var place = autocomplete.getPlace();
         if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
               // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
         }
         // If the place has a geometry, then present it on a map.
         if (place.geometry.viewport) {
            modal_map.fitBounds(place.geometry.viewport);
         } else {
            modal_map.setCenter(place.geometry.location);
            modal_map.setZoom(17);  // Why 17? Because it looks good.
         }
         if (place.address_components) {
            address = [
               (place.address_components[0] && place.address_components[0].short_name || ''),
               (place.address_components[1] && place.address_components[1].short_name || ''),
               (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
         }
          
      });
   
   }
   
   // Adds a marker to the map.
   function add_Modal_Marker(location) {
      // Add the marker at the clicked location, and add the next-available label
      // from the array of alphabetical characters.
      var marker = new google.maps.Marker({
         position: location,
         label: labels[labelIndex++ % labels.length],
         map: modal_map,
         title:"뿌리뿌리"
      });
      modal_Marker.push(marker);
   }
      
   // Adds a marker to the map.
   function addMarker(location) {
      // Add the marker at the clicked location, and add the next-available label
        // from the array of alphabetical characters.
        map.zoom=15;
		map.panTo(location);
        var marker = new google.maps.Marker({
         position: location,
         label: labels[labelIndex++ % labels.length],
         map: map,
         title:"뿌리뿌리"
      });
      basic_Marker.push(marker);
   }
   
// Sets the map on all markers in the array.
	function setMapOnAll(map) {
	  for (var i = 0; i < basic_Marker.length; i++) {
		  basic_Marker[i].setMap(map);
	  }
	}

	// Removes the markers from the map, but keeps them in the array.
	function clearMarkers() {
	  setMapOnAll(null);
	}

	// Shows any markers currently in the array.
	function showMarkers() {
	  setMapOnAll(map);
	}

	// Deletes all markers in the array by removing references to them.
	function deleteMarkers() {
	  clearMarkers();
	  basic_Marker = [];
	}

   google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>

   <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- logo -->
      <a class="navbar-brand" href="DiaryServlet?command=goNewspeed">
       
      </a>

      

        <!-- Right -->
        <ul class="navbar-menu">


          <li><a href="DiaryServlet?command=goNewspeed">뉴스피드</a></li>
          <li><a href="PinServlet?command=goPinspeed">장소정보</a></li>
          <li><a href="DiaryServlet?command=Lanking">이달의 명소</a></li>

          <li><a href="DiaryServlet?command=goMyPage">마이페이지</a></li>

        </ul>

    </div>
  </nav>
  <%--  <jsp:include page="header.jsp"></jsp:include>  --%>
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
<main style="padding-top:80px;">
   <div class="container">
   
   <h2 style="font-weight: 700;
    border-bottom: 2px solid #ccc;
    width: 99%;
    padding-bottom: 10px;
    padding-top: 10px;
    text-align: center;
    margin-top: 30px;">일지 작성</h2>   
   <div id="map" style="height: 400px; width: 1100px"></div>
    <br>
    
    <!-- <div>
	<table align="center" class="insertbox">
		<tr>
			<th>숙소</th><th>맛집</th><th>관광지</th>
		</tr>
		<tr>
			<td style=" width: 330px;text-align: center;">
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="hotelSel"></select>
			</td>
			<td style=" width: 330px;text-align: center;">
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="restoSel"></select>
			</td>
			<td style=" width: 330px;text-align: center;">
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="tourSel"></select>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<input type="text" style="width: 165px; margin-left:20px" id="hotelMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="hotelMyDBSearch">
			</td>
			<td style="text-align: center;">
				<input type="text" style="width: 165px; margin-left:20px" id="restoMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="restoMyDBSearch">
			</td>
			<td style="text-align: center;">
				<input type="text" style="width: 165px; margin-left:20px" id="tourMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="tourMyDBSearch">
			</td>
		</tr>
		<tr>

			<td style="text-align: center;">
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="hotelMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">숙소 추가</button>
			</td>
			<td style="text-align: center;">
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="restoMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">식당 추가</button>
			</td>
			<td style="text-align: center;">
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="tourMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">관광지 추가</button>

			</td>
		</tr>
	</table>
	<br>
	</div> -->
    
    <div style="padding: 30px 0 40px 115px; background-color: #f9f9f9;border: 1px solid #ccc; border-bottom: none;">
    
     <div class="selectbox">

        <p><i class="fa fa fa-home"></i>&nbsp;숙소</p>
        <div>
        <select size="10" style="width: 200px; height:200px;margin-left:20px; margin-right: 20px" id="hotelSel"></select>
        </div>
        <div style="margin-top: 8px">
           <input type="text" style="width: 165px; margin-left:20px" id="hotelMyDB_input">
         <input type="button" style="width: 30px;vertical-align: bottom; margin-right: 20px" id="hotelMyDBSearch" class="searchbtn">
      </div>
        <div>
        <button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="hotelMapSearch"  
        class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">숙소 추가</button>
        </div>
     
     </div>
     
     <div class="selectbox">

        <p><i class="fa fa fa-bed"></i>&nbsp;맛집</p>
        <div>
            <select size="10" style="width: 200px;height:200px; margin-left:20px; margin-right: 20px" id="restoSel"></select>
        </div>
        <div style="margin-top: 8px">
           <input type="text" style="width: 165px; margin-left:20px" id="restoMyDB_input">
            <input type="button" style="width: 30px;vertical-align: bottom; margin-right: 20px" id="restoMyDBSearch" class="searchbtn">
      </div>
        <div>
                    <button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="restoMapSearch"  
                    class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">식당 추가</button>

        </div>
     
     </div>
     
     <div class="selectbox">

        <p><i class="fa fa-plane"></i>&nbsp;관광지</p>
        <div>
            <select size="10" style="width: 200px;height:200px; margin-left:20px; margin-right: 20px" id="tourSel"></select>
        </div>
        <div style="margin-top: 8px">
           <input type="text" style="width: 165px; margin-left:20px" id="tourMyDB_input">
            <input type="button" style="width: 30px;vertical-align: bottom; margin-right: 20px" id="tourMyDBSearch" class="searchbtn">
      </div>
        <div>
                    <button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="tourMapSearch" 
                     class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">관광지 추가</button>

        </div>
     
     </div>
    
    </div>
    
    <div>
    <table class="pintable">
      <colgroup>
      <col width="15%">
      <col width="85%">
      </colgroup>
      
      <tbody><tr>
              <td class="align-middle"><small class="fa fa fa-home"></small> <small>맛집</small></td>
               <td class="align-middle"><small><span id="restoPinArr"></span></small></td>
         </tr>
      <tr>
              <td class="align-middle"><small class="fa fa fa-bed"></small> <small>숙소</small></td>
               <td class="align-middle"><small><span id="hotelPinArr"></span></small></td>
         </tr>
         <tr>
              <td class="align-middle"><small class="fa fa-plane"></small> <small>관광지</small></td>
               <td class="align-middle"><small><span id="tourPinArr"></span></small></td>
         </tr>
      </tbody>
      </table>
    
    
       <table style="margin-top: 10px; background-color:white;">
          <col style="width: 100px"><col style="width: 1000px">
          
          <tr>
             <td colspan="2">
                <input type="text" class="text text-default" style="width: 1100px;    height: 50px;  font-size: 18px;" placeholder="여기에 제목을 입력 해 주세요" name="title" id="title">
             </td>
          <tr>
          <tr>
             <td colspan="2">
                <!-- 크기 다시 맞춰야함 그리고 스마트 에디터로 만들어야함 -->
                <textarea style="height: 600px; width: 1096px" name="ir1" id="ir1" ></textarea>      
             </td>
          <tr>
       </table>
      <div>
	      <div align="center">
	           <input type="button"  class="btn btn-primary"value="완료" id="diarySavebtn">
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           <input type="button" class="btn btn-primary" value="취소" onclick="location.href='CalendarWrite.jsp'">
	             
	      </div>
      </div>
    </div>
    
 
<!-- place_Marker Modal -->
<div class="modal fade" id="placeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">장소 찾기</h4>
      </div>
      <div class="modal-body">
        <form id="Modal_form">
           <div id="modal_map" style="height: 400px; width: 470px"></div>
           <br>
           <div>
              <input type="text" class="text text-default" id="search" placeholder="검색할 장소를 입력해주세요" style="width: 100%">
         </div>
         <br>
            <p>장소 이름</p>
             <div>
              <input type="text" class="text text-default" id="pin_name" style="width: 100%">
         </div>
      </form>
      </div>
      <div class="modal-footer">
	     <button type="button" class="btn btn-outline-default" data-dismiss="modal">Close</button>
   		 <button type="button" class="btn btn-outline-primary" id="placeSaveBtn">Save Place</button>
      </div>
    </div>
  </div>
</div>

<!-- add_Pin Modal -->
<div class="modal fade" id="add_Pin_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="top:5%">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">장소 이름 및 별점 등록</h4>
      </div>
      <div class="modal-body" style="height: 400px">
         <p>장소 이름</p>
         <form id="add_Pin_Form">
           <div>
              <input type="text" class="text text-default" id="addpinname" readonly="readonly" style="width: 100%">
         </div>
         <br>
         <p>별점</p>
         <div class="starRev">
              <span class="starR1">1</span>
              <span class="starR2">2</span>
              <span class="starR1">3</span>
              <span class="starR2">4</span>
              <span class="starR1">5</span>
              <span class="starR2">6</span>
              <span class="starR1">7</span>
              <span class="starR2">8</span>
              <span class="starR1">9</span>
              <span class="starR2">10</span>
              <h3 id="grade">&nbsp;&nbsp;0</h3>
         </div>
         <br>
         <p>Comment</p>
         <div>
         <textarea style="width: 100%; height: 150px" id="pincomment"></textarea>
         </div>
      </form>
     </div>
    
      <div class="modal-footer">

      	
	     <button type="button" class="btn btn-outline-default" data-dismiss="modal">Close</button>
   		 <button type="button" class="btn btn-outline-primary" data-dismiss="modal" id="pinSaveBtn">Save Place</button>
      </div>
    </div>
  </div>
</div>  

<!-- Pin_Info Modal -->
<div class="modal fade" id="Pin_Info_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="top:5%">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Pin 정보</h4>
      </div>
      <div class="modal-body" style="height: 400px">
         <p>장소 이름</p>
         <form id="pin_info_form">
           <div>
              <input type="text" class="text text-default" id="pin_info_name" readonly="readonly" style="width: 100%">
         </div>
         <br>
         <p>별점</p>
         <div class="starRev">
              <span class="starR1" id="s1">1</span>
              <span class="starR2" id="s2">2</span>
             <span class="starR1" id="s3">3</span>
            <span class="starR2" id="s4">4</span>
            <span class="starR1" id="s5">5</span>
            <span class="starR2" id="s6">6</span>
             <span class="starR1" id="s7">7</span>
            <span class="starR2" id="s8">8</span>
            <span class="starR1" id="s9">9</span>
            <span class="starR2" id="s10">10</span>
            <h3 id="pin_info_grade">&nbsp;&nbsp;0</h3>
         </div>
         <br>
         <p>Comment</p>
         <div>
         <textarea style="width: 100%; height: 150px" id="add_pincomment"></textarea>
         </div>
      </form>
     </div>
    
      <div class="modal-footer"> 	
	     <button type="button" class="btn btn-outline-default" data-dismiss="modal">Close</button>
   		 <button type="button" class="btn btn-outline-primary" data-dismiss="modal" id="pinUpdateBtn">Pin Update</button>

      </div>
    </div>
  </div>
</div>  
 </div>
    
</main>


<!-- --------------------------------------------------------------------------------- -->

<jsp:include page="footer.jsp"></jsp:include> 




  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="Design/js/popper.min.js"></script>
  <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="Design/js/mdb.min.js"></script>
<script type="text/javascript">
      var result = new Array();
      var selectPlace_id = "";
      var place_kind = "";
      var grade = 0;
      var pin_kind = "";
      var hotellist = [];
      var restolist = [];
      var tourlist = [];
      var PinArr = new Array();
      $(function() {
         $("#diarySavebtn").click(function () {
            if($("#title").val() == ""){
               alert("제목을 입력해 주세요");
               return;
            }
            
            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
            var cont = document.getElementById("ir1").value;
            var obj = new Object();
            obj.PinObj =  PinArr;
            $.ajax({
               url:"DiaryServlet",
               type:"GET",
               data:{
                  'command':"insert",
                  'content': cont,
                  'title': $("#title").val(),
                  'tday': tday,
                  'id':id,
                  'PinObj':JSON.stringify(obj)
               },
               datatype:"json",
               success:function(data){
                  alert("일지 기록 성공!");
                  location.href="CalendarWrite.jsp";
                  
               },
               error:function(){
                  alert("ajax error");
               }
               
            });
            
         });
            
         
         
         $("#pinSaveBtn").click(function() {
            
            PinArr.push({
               'pcomment' : $("#pincomment").val(),
               'grade' : grade,
               'pin_name' : $("#addpinname").val(),
               'id' : id
            });
            
            if(pin_kind == "hotel"){
               for(i = 0 ; i < hotellist.length ; i++){
                  if($("#addpinname").val() == hotellist[i].pin_name){
                     basic_lat = Number(hotellist[i].lat);
                     basic_lng = Number(hotellist[i].lng);
                     break;
                  }
               }
               var location=new google.maps.LatLng(basic_lat,basic_lng);
               addMarker(location);
               $("#hotelPinArr").append("<div class='style_prevu_kit' style='display:inline-block; background-color:#96A5FF;padding: 2px; margin-right:4px;'>"
                     +"<input class='pin_info_val' type='hidden' value='"+$("#addpinname").val()+"'>"
                     +"<div class='pin_info' style='color:white; padding-left:8px;'>"
                     +$("#addpinname").val()
                     +"</div><input type='button' style='background-color: rgba(0, 0, 0, 0); border:0; outline:0;' class='delete_pin_info' value='x'></div>");
               $("#hotelSel").html("");
               
            }else if(pin_kind == "resto"){
               for(i = 0 ; i < restolist.length ; i++){
                  if($("#addpinname").val() == restolist[i].pin_name){
                     basic_lat = Number(restolist[i].lat);
                     basic_lng = Number(restolist[i].lng);
                     break;
                  }
               }
               var location=new google.maps.LatLng(basic_lat,basic_lng);
               addMarker(location);
               $("#restoPinArr").append("<div class='style_prevu_kit' style='display:inline-block; background-color:#96A5FF;padding: 2px; margin-right:4px;'>"
                     +"<input class='pin_info_val' type='hidden' value='"+$("#addpinname").val()+"'>"
                     +"<div class='pin_info' style='color:white; padding-left:8px;'>"
                     +$("#addpinname").val()
                     +"</div><input type='button' style='background-color: rgba(0, 0, 0, 0); border:0; outline:0;' class='delete_pin_info' value='x'></div>");
               $("#restoSel").html("");
            }else if(pin_kind == "tour"){
               for(i = 0 ; i < tourlist.length ; i++){
                  if($("#addpinname").val() == tourlist[i].pin_name){
                     basic_lat = Number(tourlist[i].lat);
                     basic_lng = Number(tourlist[i].lng);
                     break;
                  }
               }
               var location=new google.maps.LatLng(basic_lat,basic_lng);
               addMarker(location);
               $("#tourPinArr").append("<div class='style_prevu_kit' style='display:inline-block; background-color:#96A5FF;padding: 2px; margin-right:4px;' >"
                     +"<input class='pin_info_val' type='hidden' value='"+$("#addpinname").val()+"'>"
                     +"<div class='pin_info' style='color:white; padding-left:8px;'>"
                     +$("#addpinname").val()
                     +"</div><input type='button' style='background-color: rgba(0, 0, 0, 0); border:0; outline:0;' class='delete_pin_info' value='x'></div>");

               $("#tourSel").html("");
            }
            
         });
         
         //select의 새롭게 추가된 option에 이벤트 걸어줌
         $(document).on("dblclick", "#hotelSel option", function() {
            pin_kind="hotel";
            $("#add_Pin_Modal").modal("show");
            $("#addpinname").val($(this).val());

         });
         $(document).on("dblclick", "#restoSel option", function() {
            pin_kind="resto";
            $("#add_Pin_Modal").modal("show");
            $("#addpinname").val($(this).val());

         });
         $(document).on("dblclick", "#tourSel option", function() {
            pin_kind="tour";
            $("#add_Pin_Modal").modal("show");
            $("#addpinname").val($(this).val());

         });

         $("#hotelMyDBSearch").click(function() {
            if ($("#hotelMyDB_input").val() == "") {
               alert("검색할 숙소명을 입력해 주세요");
               return;
            }
            $.ajax({
               url : "PinServlet",
               type : "GET",
               data : {
                  command : "PinSearch",
                  pin_name : $("#hotelMyDB_input").val(),
                  place_kind : "hotel"
               },
               datatype : "json",
               success : function(data) {
                  hotellist = JSON.parse(data);
                  
                  var o = "";
                  for (i = 0; i < hotellist.length; i++) {
                     o += '<option value="'+ hotellist[i].pin_name + '">'+ hotellist[i].pin_name+ '</option>';
                  }

                  $("#hotelSel").html("");
                  $("#hotelSel").append(o);
               },
               error : function() {
               }
            });
         });
         $("#restoMyDBSearch").click(function() {
            if ($("#restoMyDB_input").val() == "") {
               alert("검색할 식당명을 입력해 주세요");
               return;
            }
            $.ajax({
               url : "PinServlet",
               type : "GET",
               data : {
                  command : "PinSearch",
                  pin_name : $("#restoMyDB_input").val(),
                  place_kind : "resto"
               },
               datatype : "json",
               success : function(data) {
                  restolist = JSON.parse(data);
                  
                  var o = "";
                  for (i = 0; i < restolist.length; i++) {
                     o += '<option value="'+ restolist[i].pin_name + '">' + restolist[i].pin_name + '</option>';
                  }
                  $("#restoSel").html("");
                  $("#restoSel").append(o);
               },
               error : function() {
               }
            });
         });
         $("#tourMyDBSearch").click(function() {
            if ($("#tourMyDB_input").val() == "") {
               alert("검색할 관광지명을 입력해 주세요");
               return;
            }
            $.ajax({
               url : "PinServlet",
               type : "GET",
               data : {
                  command : "PinSearch",
                  pin_name : $("#tourMyDB_input").val(),
                  place_kind : "tour"
               },
               datatype : "json",
               success : function(data) {
                  tourlist = JSON.parse(data);
                  
                  var o = "";
                  for (i = 0; i < tourlist.length; i++) {
                     o += '<option value="'+ tourlist[i].pin_name + '">' + tourlist[i].pin_name + '</option>';
                  }
                  $("#tourSel").html("");
                  $("#tourSel").append(o);
               },
               error : function() {
               }
            });
         });

         $("#hotelMapSearch").click(function() {
            initialize();
            place_kind = "hotel";
         });
         $("#restoMapSearch").click(function() {
            initialize();
            place_kind = "resto";
         });
         $("#tourMapSearch").click(function() {
            initialize();
            place_kind = "tour";
         });

         $("#pinSaveBtn").click(function() {
            //(별점)모달 창 초기화 코드
            $('#add_Pin_Form')[0].reset();
            $('.starRev span').parent().children('span').removeClass('on');
            grade = 0;
            $("#grade").html("&nbsp;&nbsp;" + grade);
         });

         $("#placeSaveBtn").click(
               function() {
                  if (modal_Marker_lat == null || modal_Marker_lng == null || $("#place_name").val() == "") {
                     alert("마커가 없거나 저장할 장소의 이름을 기입하지 않으셨습니다.");
                     return;
                  }
                  $.ajax({
                     url : "PinServlet",
                     data : {
                        "command" : "insert",
                        "place_kind" : place_kind,
                        "lat" : modal_Marker_lat,
                        "lng" : modal_Marker_lng,
                        "pin_name" : $("#pin_name").val(),
                        "location" : address
                     },
                     type : "GET",
                     success : function() {
                        alert("추가 성공!");
                        $('#Modal_form')[0].reset();
                        $('#placeModal').modal('hide');

                     },
                     error : function(x, o, e) {
                        alert("ajax error");
                        alert(x.status + ":" + o + ":" + e);
                     }
                  });
               });

      });
      
      //별점
      $('.starRev span').click(function() {
         grade = $(this).text();
         $("#grade").html("&nbsp;&nbsp;" + $(this).text());
         $(this).parent().children('span').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');
         return false;
      });
      
      $('.starRev span').click(function() {
         grade = $(this).text();
         $("#pin_info_grade").html("&nbsp;&nbsp;" + $(this).text());
         $(this).parent().children('span').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');
         return false;
      });
      
      //////////////////////////////////////////////////////////////////
      var updateP;
      var sel;
      $(document).on("click",".pin_info",function(){
         
         updateP=this;
         for(i = 0 ; i <PinArr.length ; i++){
            if(PinArr[i].pin_name == $(this).parent().children('.pin_info_val').val()){
               sel=i;
               break;
            }
         }
         
         $("#pin_info_name").val(PinArr[sel].pin_name);
         $("#Pin_Info_Modal").modal("show");
         
         $(".starRev #s"+PinArr[sel].grade).parent().children('span').removeClass('on');
         $(".starRev #s"+PinArr[sel].grade).addClass('on').prevAll('span').addClass('on');
         $("#pin_info_grade").html("&nbsp;&nbsp;" + PinArr[sel].grade);
         $("#add_pincomment").val(PinArr[sel].pcomment);
      });
      
      $("#pinUpdateBtn").click(function () {
         $(updateP).parent().html($("#pin_info_name").val()
               +"<input class='pin_info_val' type='hidden' value='"+$("#pin_info_name").val()+"'>"
               +"<input type='button' val='x'>");
         PinArr[sel].grade=grade;
         PinArr[sel].pcomment=$("#add_pincomment").val();
         
         //(별점)모달 창 초기화 코드
         $('#pin_info_form')[0].reset();
         $('.starRev span').parent().children('span').removeClass('on');
         grade = 0;
         $("#pin_info_grade").html("&nbsp;&nbsp;" + grade);
         $("#grade").html("&nbsp;&nbsp;" + grade);
      });
      ////////////////////////////////////////////////////////////////////////
      $(document).on("click",".delete_pin_info",function () {
    	  clearMarkers();
			for(i = 0 ; i <PinArr.length ; i++){
				if(PinArr[i].pin_name == $(this).parent().children('.pin_info_val').val()){
					PinArr.splice(i,1);	//i번째에서 1개 제거
					basic_Marker.splice(i,1);
					break;
				}
			}
			
			
			$(this).parent().remove();
			
			showMarkers();
         
      });
   </script>
   <script type="text/javascript">
      var oEditors = [];

      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "ir1",
         sSkinURI : "smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });

      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
      }

      function showHTML() {
         var sHTML = oEditors.getById["ir1"].getIR();
         alert(sHTML);
      }

      function submitContents(elClickedObj) {
         oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

         try {
            elClickedObj.form.submit();
         } catch (e) {
         }
      }

      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
      }
   </script>
   <!-- Initializations --><!-- 
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script> -->
</body>
</html>