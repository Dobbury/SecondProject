<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

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
}​


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
	var id = '<%=dto.getId() %>';
	
	function initialize() {
		modal_Marker_lat=null;
		modal_Marker_lng=null;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 12,
			center: {lat:basic_lat, lng:basic_lng}
		});
		var modal_map = new google.maps.Map(document.getElementById('modal_map'), {
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
   
        // Adds a marker to the map.
		function add_Modal_Marker(location, modal_map) {
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
		function addMarker(location,map) {
			// Add the marker at the clicked location, and add the next-available label
	        // from the array of alphabetical characters.
	        var marker = new google.maps.Marker({
				position: location,
				label: labels[labelIndex++ % labels.length],
				map: map,
				title:"뿌리뿌리"
			});
			//modal_Marker.push(marker);
		}
		
		for(i = 0 ; i < basic_Marker.length ; i++){
			addMarker(basic_Marker[i],map);
		}
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>

  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- logo -->
      <a class="navbar-brand" href="#" target="_blank">
        <strong>MDB</strong>
      </a>

		

        <!-- Right -->
        <ul class="navbar-menu">
          <li><a href="#">뉴스피드</a></li>
          <li><a href="#">마이페이지</a></li>
        </ul>

    </div>
  </nav>

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
<main style="padding-top:80px;">
	<div class="container">
	<div>
	<table align="center">
		<tr>
			<th>숙소</th><th>맛집</th><th>관광지</th>
		</tr>
		<tr>
			<td>
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="hotelSel"></select>
			</td>
			<td>
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="restoSel"></select>
			</td>
			<td>
				<select size="10" style="width: 200px; margin-left:20px; margin-right: 20px" id="tourSel"></select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" style="width: 165px; margin-left:20px" id="hotelMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="hotelMyDBSearch">
			</td>
			<td>
				<input type="text" style="width: 165px; margin-left:20px" id="restoMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="restoMyDBSearch">
			</td>
			<td>
				<input type="text" style="width: 165px; margin-left:20px" id="tourMyDB_input">
				<input type="button" style="width: 30px; margin-right: 20px" id="tourMyDBSearch">
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="hotelMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">숙소 찾기</button>
			</td>
			<td>
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="restoMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">식당 찾기</button>
			</td>
			<td>
				<button type="button" style="width: 200px; margin-left: 20px; margin-right: 20px" id="tourMapSearch"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#placeModal">관광지 찾기</button>
			</td>
		</tr>
	</table>
	<br>
	</div>
	
	<div id="map" style="height: 400px; width: 1100px"></div>
    <br>
    <div>
    	<table border="1">
    		<col style="width: 100px"><col style="width: 1000px">
    		<tr style="height: 30px">
    			<th>맛집: </th>
    			<td>
    				<p id="restoPinArr"></p>
    			</td>
    		</tr>
    		<tr style="height: 30px">
    			<th>숙소: </th>
    			<td>
    				<p id="hotelPinArr"></p>
    			</td>
    		</tr>
    		<tr style="height: 30px">
    			<th>관광지: </th>
    			<td>
    				<p id="tourPinArr"></p>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
			    	<input type="text" class="text text-default" style="width: 1098px" placeholder="여기에 제목을 입력 해 주세요" name="title" id="title">
			    </td>
    		<tr>
    		<tr>
    			<td colspan="2">
			    	<!-- 크기 다시 맞춰야함 그리고 스마트 에디터로 만들어야함 -->
    				<textarea style="height: 600px; width: 1096px" name="ir1" id="ir1" ></textarea>		
    			</td>
    		<tr>
    		<tr style="height: 30px" align="center">
    			<td colspan="2">
    				<input type="button" value="완료" id="diarySavebtn">
 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value="취소" id="#">
    			</td>
    		</tr>
    	</table>
		
    	
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
	     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
   		 <button type="button" class="btn btn-primary" id="placeSaveBtn">Save Place</button>
      </div>
    </div>
  </div>
</div>

<!-- add_Pin Modal -->
<div class="modal fade" id="add_Pin_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">장소 이름 및 별점 등록</h4>
      </div>
      <div class="modal-body" style="height: 400px">
      	<p>장소 이름</p>
      	<form id="pin_info_form">
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
      	
	     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
   		 <button type="button" class="btn btn-primary" data-dismiss="modal" id="pinSaveBtn">Save Place</button>
      </div>
    </div>
  </div>
</div>  
 </div>
    
</main>


<!-- --------------------------------------------------------------------------------- -->


<!--Footer-->
<footer class="page-footer text-center font-small mt-4 wow fadeIn">
 
    <hr class="my-4">

    <div class="pb-4">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fa fa-facebook mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fa fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fa fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fa fa-google-plus mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fa fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fa fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fa fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fa fa-codepen mr-3"></i>
      </a>
    </div>

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2018 Copyright:
      <a href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"> MDBootstrap.com </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->



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
				
				$.ajax({
					url:"DiaryServlet",
					type:"GET",
					data:{
						'command':"insert",
						'content': oEditors.getById["ir1"].getIR(),
						'title': $("#title").val(),
						'tday': tday,
						'id':id,
						'PinArr':JSON.stringify(PinArr)
					},
					datatype:"json",
					success:function(data){
						alert(data);
						
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
					alert(hotellist[0].lat);
					basic_Marker.push(location);
					initialize();
					$("#hotelPinArr").append("<a href='#'>"+$("#addpinname").val()+"</a> / ");
					
				}else if(pin_kind == "resto"){
					for(i = 0 ; i < restolist.length ; i++){
						if($("#addpinname").val() == restolist[i].pin_name){
							basic_lat = Number(restolist[i].lat);
							basic_lng = Number(restolist[i].lng);
							break;
						}
					}
					var location=new google.maps.LatLng(basic_lat,basic_lng);
					alert(restolist[0].lat);
					basic_Marker.push(location);
					initialize();
					$("#restoPinArr").append("<a href='#'>"+$("#addpinname").val()+"</a> / ");
					
				}else if(pin_kind == "tour"){
					for(i = 0 ; i < tourlist.length ; i++){
						if($("#addpinname").val() == tourlist[i].pin_name){
							basic_lat = Number(tourlist[i].lat);
							basic_lng = Number(tourlist[i].lng);
							break;
						}
					}
					var location=new google.maps.LatLng(basic_lat,basic_lng);
					alert(tourlist[0].lat);
					basic_Marker.push(location);
					initialize();
					$("#tourPinArr").append("<a href='#'>"+$("#addpinname").val()+"</a> / ");
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
						alert(hotellist[0].pin_name);
						var o = "";
						for (i = 0; i < hotellist.length; i++) {
							o += '<option value="'+ hotellist[i].pin_name + '">'+ hotellist[i].pin_name+ '</option>';
						}
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
						alert(restolist[0].pin_name);
						var o = "";
						for (i = 0; i < restolist.length; i++) {
							o += '<option value="'+ restolist[i].pin_name + '">' + restolist[i].pin_name + '</option>';
						}
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
						alert(tourlist[0].pin_name);
						var o = "";
						for (i = 0; i < tourlist.length; i++) {
							o += '<option value="'+ tourlist[i].pin_name + '">' + tourlist[i].pin_name + '</option>';
						}
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
				$('#pin_info_form')[0].reset();
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
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
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