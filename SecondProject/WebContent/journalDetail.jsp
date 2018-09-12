<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.CalendarDao"%>
<%@page import="Impl.CalendarImpl"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="dto.JournalDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.DiarycommentDto"%>
<%@page import="dto.memberDto"%>
<%@page import="dto.DiaryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%!
       
      //빈문자열 여부
      public boolean nvl(String msg){
          return msg == null || msg.trim().equals("")?true:false;
      }
       
      //숫자 한자리를 1 > 01로 바꾸기
      public String two(String msg){
          return msg.trim().length()<2?"0"+msg:msg.trim();
      }
       
      
       
      //날짜 클릭하면 이동 
      public String calllist(int year, int month, int day,boolean h){
               
         String s = "";
                
         String tday = year + "" + two((month+1)+"") +"" +  two((day)+"") + "";
         
         if(h == false){
            s += "<div style='width:50px; height:50px;' data-toggle='buttons'>";
                 
            return s;   
         }else{
            return tday;
         }
      }
      
      
      // 다이어리 타이틀 뿌리기
      public String dTitle(int year, int month, int day, List<DiaryDto> list){
               
         String s = "";
                   
         String tday= calllist(year,month, day , true);
                  
         for(int i=0;i<list.size();i++){         
            // list 안에는 (로그인한 사용자 , 다이어리쓴날짜)
            String today = list.get(i).getTday().replace("-", "");
            today = today.substring(0,8);
            if(today.equals(tday)){
               
               /* 
               if(list.get(i).getJour_check()==1){
                  s += "<div style='width:50px; height:50px; background-color:black;' class='toggleMarker'>";
                  s += "<input type='hidden' value="+list.get(i).getSeq()+">";
                  s += String.format("%2d", day); //day를 2칸으로 다시 정정
                  s += "</div>";
               }
                */
               if(list.get(i).getJour_check()==1){
                  s += "<label  class='btn' style=' background-color:#96A5FF; font-size:20px; width: 100%; height: 100%; margin:0px; padding:13px;'>";
                  s += "<input type='checkbox' autocomplete='off' value="+list.get(i).getSeq()+">";
                  s += "<span class='glyphicon glyphicon-ok' ></span>";
                  s += "</label>";
               }
            }
         }
         if(s == "")
            s += String.format("%2d", day); //day를 2칸으로 다시 정정
         s += "</div>";
         return s;
      }   
%>
<%

		 
		Calendar cal = Calendar.getInstance();
		 
		//연도 받아오기 
		//달 받아오기  0부터 시작함 
		int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
		int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
		 
		cal.set(year, month, 1); //연 월 일 세팅!
		
		 
		
	 
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //요일 구하기 (1~7)
		System.out.println("확인용 날짜 : " + year+"년 "+ month+" 월");
		 
		
		//로그인한 사람의 id
		memberDto dto = (memberDto)request.getSession().getAttribute("user");   //뉴스피드 --서블릿 -- 캘린더write
		System.out.println("로그인한 사람의 id 확인" +dto.getId()); 
		 
		 
		//caledar list
		CalendarImpl cdao = CalendarDao.getInstance();
	
		boolean b = true;
		String tday = calllist(year	,month,1,b);		
		System.out.println("tday는 : " + tday);
				
		//List<DiaryDto> list = cdao.getCalList(dto.getId());

%>
<%


   request.setCharacterEncoding("utf-8");
   DiaryImpl dao = DiaryDao.getInstance();

  
   String loginid = dto.getId();
   JournalDto journalDto = (JournalDto) request.getAttribute("JournalDto");

   List<DiaryDto> list = (List<DiaryDto>)request.getAttribute("DiaryList");
   List<DiarycommentDto> commentview = (List<DiarycommentDto>)request.getAttribute("DiarycommentDto");
   Map<Integer,List<String[]>> locationMap = (Map<Integer,List<String[]>>)request.getAttribute("locations");   //각 날짜별(시퀀스로 관리) 위도 경도
   int Likeckheack = dao.Likecheack(journalDto.getSeq(), loginid);
 
 
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>-->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>site</title>


<style type="text/css">

.btn span.glyphicon {             
   opacity: 0;   
}
.btn.active span.glyphicon {            
   opacity: 1;      
      
}

/* Necessary for full page carousel*/
html, body, header, .view {
   height: 100%;
}

.container {
   display: table;
}

.navbar-menu {
   margin-bottom: 0;
}
.days{
     border: 1px solid #ddd; 
}
.navbar-menu li {
   width: 100px;
   height: 30px;
   border: 1px solid blue;
   list-style: none;
   display: inline-block;
}
.journal-title{
   margin-top: 20px;
   margin-bottom: 10px;
}
.journal-id{
       font-size: 18px;
    font-weight: 700;
    color: #777;
    display: inline-block;
    margin-right: 12px;
    margin-left: 3px;
}
.journal-date{
   font-size: 14px;
    color: #888;
}
.diary-t {
   margin-top: 20px;
   width: 100%;
  
}

.diary-t div {
   width: 50%;
   border: 1px solid;
    height: 400px;
}
.diary-cont{
    padding: 40px;
    margin-top: 20px;
    background-color: #fff;
    -webkit-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
    -moz-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
    box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);

}




.diary-t .calendar {
   float: right;
}

.diary-cont .diary-title {
   display: inline-block;
   font-size: 28px;
   margin-right: 5px;
}

.diary-b {
   margin-top: 40px;
}

.diary-b .diary-title {
   display: inline-block;
   font-size: 28px;
   margin-right: 5px;
}

@media ( min-width : 800px) and (max-width: 850px) {
   .navbar:not (.top-nav-collapse ) {
      background: #1C2331 !important;
   }
}
.like_box{
   margin-top: 10px;
}
.like_off {
   width: 25px;
   height: 25px;
   background-image: url('img/heart_off.png');
   background-size: 100% 100%;
       display: inline-block;
    vertical-align: middle;
}.like_on {
   width: 25px;
   height: 25px;
   background-image: url('img/heart_on.png');
   background-size: 100% 100%;
       display: inline-block;
    vertical-align: middle;
}
.like_view{
       margin-top: 15px;
    font-size: 14px;
    color: #555;
}
.commant-write{
       padding-left: 20px;
    padding-right: 20px;
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

.diary-cont{
 padding: 40px;margin-top:20px;
    background-color: #fff;
       -webkit-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
-moz-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);3
}
#maps{
   width: 50%;
    position: relative;
    overflow: hidden;
    height: 370px;
    display: inline-block;
    margin-right: 60px;
}
.calendar{
       display: inline-block;
    height: 370px;
}

.diary-m img{
	width: 100%;
}


</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBp3NXTPG792Eg4zSYGpEGr8wYdAe3g4MI&libraries=places"></script>
<script type="text/javascript">

var pins={
      <%   Iterator<Integer> it = locationMap.keySet().iterator();
         while(it.hasNext()){
            int seq = it.next();
      %>
            seq_<%=seq %> : [
         <%
            List<String[]> locationlist = locationMap.get(seq);
            for(int i = 0 ; i < locationlist.size() ; i++){
               %>
               {
                  lat:<%=locationlist.get(i)[0] %>,
                  lng:<%=locationlist.get(i)[1] %>
               }
               <%
                  if(i != locationlist.size()-1){
               %>
                  ,
               <%
                  }
            }
            %>
            ]
            
         <%   
            if(it.hasNext()){
         %>
            ,
         <%
            }
         }
      %>
      
};

var map;
var markers = [];

var basic_lat = 1;
var basic_lng = 1;

function initialize() {
   
   map = new google.maps.Map(document.getElementById('maps'), {
      zoom: 12,
      center: {lat:basic_lat, lng:basic_lng}
   });
   
}
//Adds a marker to the map.
function addMarker(location) {
	map.zoom=15;
	map.panTo(location);
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
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
  markers = [];
}
/* for(i = 0 ; i < basic_Marker.length ; i++){
   addMarker(basic_Marker[i],map);
} */
google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body style="    background-color: #e9e9e9e9;" >

 <jsp:include page="header.jsp"></jsp:include> 




   <!-- ----------------------------------------html----------------------------------------- -->
   <!--여기서 하시면 됩니다-->
   <main style="padding-top:80px;">
   <div class="container" style="    max-width: 900px;">

   <div class="journal-title" >
   <h1>
      <%=journalDto.getTitle() %>
      </h1>
       <span class="journal-id">  <%=journalDto.getId() %></span>
      <span class="journal-date"><%=journalDto.getWdate().substring(0,16) %></span>
     
   </div>

      <div style="width: 100%">
         <!-- 지도영역 -->
       <div id="maps" style="width: 50%;">
         </div>
        
<!--          <div class="map">
            <div id="maps" style="width: 100%; height: 100%"></div>
         </div> -->
         <!-- 달력영역 -->
         <div class="calendar" align="center" >
            <table style="background-color: white; opacity: 0.95; box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);" >
            <!-- 너비 -->
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
             
                <tr>
                    <td align="center" colspan="7" class="modalcal">
                       <h2>          
                                 
                                 <% 
                                   String MONTH2="";
                                  
                                  if( month+1 == 1){
                                      MONTH2 = "JANUARY";
                                  }else if( month+1 == 2){
                                     
                                     MONTH2 = "FEBRUARY";
                                  }else if( month+1 == 3){
                                     MONTH2 = "MARCH";
                                  }else if( month+1 == 4){
                                     MONTH2 = "APRIL";
                                  }else if( month+1 == 5){
                                     MONTH2 = "MAY";
                                  }else if( month+1 == 6){
                                     MONTH2 = "JUNE";
                                  }else if( month+1 == 7){
                                     MONTH2 = "JULY";
                                  }else if( month+1 == 8){
                                     MONTH2 = "AUGUST";
                                  }else if( month+1 == 9){
                                     MONTH2 = "SEPTEMBER";
                                  }else if( month+1 == 10){
                                     MONTH2 = "OCTOBER";
                                  }else if( month+1 == 11){
                                     MONTH2 = "NOVEMBER";
                                  }else if( month+1 == 12){
                                     MONTH2 = "DECEMBER";
                                  }

                                  %>
                                  <%=MONTH2 %>
                                  &nbsp;
                                <%=year%> 
                         </h2>
                     </td>
                </tr>
             
               <tr height="25" style="background-color: #C8D7FF; border-bottom: 2px solid #003458" >
						<td align="center">S</td>
						<td align="center">M</td>
						<td align="center">T</td>
						<td align="center">W</td>
						<td align="center">T</td>
						<td align="center">F</td>
						<td align="center">S</td>
                </tr>
                <tr height="50" align="left" valign="top">
                    <%
                        //빈칸 구하는 공식 (월 빈칸)     >> 시작 요일까지 이동
                        for(int i=1; i<dayOfWeek; i++){
                            %>
                                <td class="days">&nbsp;</td>
                            <%
                        }
                        //그 달의 최대 일자
                        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                        
                        //해당 날짜의 모든 일정을 보이게
                        for(int i=1; i<lastDay+1; i++){   
                            %>
                              <td class="days"><!-- 날짜 뿌리기 -->
                                 <%=calllist(year, month, i ,false) %>                          
                               
                                  <!-- 다이어리 타이틀 뿌리기-->                                                              
                                  <%=dTitle(year, month, i, list) %>        
                                </td>
                            <%
                            if((i+dayOfWeek-1)%7==0){
                                %>
                                    </tr>
                                    <tr height="50" align="left" valign="top">
                                <%
                            }
                        }
                        
                        for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){
                            %>
                                <td class="days">&nbsp;</td>
                            <%
             }
            %>
            </tr>
                      
         </table>
         </div>
      </div>
      
   
      <div class="diary-m" style="width: 870px;">
      <%
               for(int i=0; i<list.size(); i++ ){
            %>
         <div class="diary-cont">
            <p class="diary-title"><%=list.get(i).getTitle() %></p>
            <span class="diary-date" style="color:#555"><%=list.get(i).getTday().substring(0,11) %></span>
            <hr>
            

            <div class="diary-content" style="word-break: break-all;">
                <%=list.get(i).getContent() %>
            </div>

         </div>
         <%
               }
      %>
      </div>

   <div class="like_view">
      <%=journalDto.getLike_cnt() %> 명이 좋아합니다
   </div>
   <div class="like_box">
   <% if(Likeckheack == 0) {%>
   <a id="like_box"onclick="likefuc()"><span class="like_off"></span><span style="font-size: 13px;"> 좋아요</span></a>
   <% 
   }else{
   %>
   <a id="like_box" onclick="likedelfuc()"><span class="like_on"></span><span style="font-size: 13px;"> 좋아요</span></a>
   <%
   }
   %>

   
   
   
   </div>

      <div class="diary-b">
         <div class="diary-commant">
          <h4>댓글</h4>
            <div class="diary-commant"style="padding: 30px; text-align: center; background: rgb(238, 241, 246) !important;">
            
            <%
               for(int i=0; i<commentview.size(); i++ ){
            %>
            <div class="commant-view" style="margin-bottom: 20px;padding-left: 20px; padding-right: 20px;">
               <div class="commant-id"style="text-align: left;font-weight: 700;margin-bottom: 3px;display: table;width: 100%;">
               <p style="float: left;    font-size: 17px;">
               <%=commentview.get(i).getId() %>
               </p>
               <p style="float: left;margin-left: 10px;font-weight: 300;font-size: 12px;margin-top: 5px;">
               <%=commentview.get(i).getDday().substring(0,16) %>
               </p>
               <form action="DiaryServlet">
               <input type="hidden" name="command" value="deletecomment">
                <input type="hidden" name="seq" value="<%=journalDto.getSeq() %>">
               <input type="hidden" name="commentseq" value="<%=commentview.get(i).getSeq() %>">
               <input type="submit" style="float: right; cursor: pointer;" value="x">
               </form>
               <%-- <span style="float: right; cursor: pointer;"  onclick="deletefuc(' <%=commentview.get(i).getSeq() %>')">x</span> --%>
               </div>
               <div class="commant-content"style="width: 88%;word-break: break-all;    font-size: 15px;text-align: left;  color:#555"><%=commentview.get(i).getDcomment() %></div>
               <hr>
               
            </div>
            
            <%
               }
            %>
            
            
               <div class="commant-write">
                  <div class="commant-id"style="font-size: 17px;text-align: left;margin-left:10px;font-weight: 700; margin-bottom: 8px;"><%=loginid %></div>
                  <form action="DiaryServlet" method="get" >
                     <input type="hidden" name="command" value="commentwrite">
                     <input type="hidden" name="seq" value="<%=journalDto.getSeq() %>">
                     <textarea rows="2" cols="20" name="dcomment" style="width: 89%; height: 70px;     width: 90%;vertical-align: text-bottom;"></textarea>
                      <input type="submit" value="댓글달기"style="vertical-align: text-bottom; height: 70px;">

                  </form>
               </div>

            </div>




         </div>

      </div>


   </div>
   </main>

<script type="text/javascript">

  function combtn(){
     location.href='DiaryServlet?command=commentwrite&seq='+<%=journalDto.getSeq() %>+'&loginid='+<%=loginid %>;
     
  }

  
  function likefuc() {
     
     //var likebox = document.getElementById("like_box"); 
     location.href='DiaryServlet?command=like&seq='+<%=journalDto.getSeq() %>+'&loginid=+'+'<%=loginid %>';
     //likebox.classList.add( 'like_off' );
    
   
     
}
  function likedelfuc(){
     location.href='DiaryServlet?command=likedel&seq='+<%=journalDto.getSeq() %>+'&loginid=+'+'<%=loginid %>';
      //likebox.classList.add( 'like_on' );
     
  }
  
</script>

   
<!-- Modal -->
<div class="modal fade" id="commantdelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
      <form action="DiaryServlet?command=commentdelet" method="post">
      <div class="modal-body" style="text-align: center;">
      <p>댓글을 삭제하시겠습니까?</p>
      <input type="button" class="btn btn-primary" value="예" onclick="deletefucsend()">
        <input type="button" class="btn btn-red" data-dismiss="modal" aria-label="Close" value="아니요" style="float: none">
      </div>
     
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
   
   /* 댓글삭제 */
   function deletefuc(seq) {
      
      alert('삭제되었습니다.');
      location.href='DiaryServlet?command=deletecomment&seq='+seq
            
      //$("#commantdelete").modal();
      
   }
   
   function deletefucsend() {
      location.href='DiaryServlet?command=deletecomment&seq='+seq
           
   }
   
   $(".btn").click(function () {

	   //alert($(this).children('input').val());
	   if(!$(this).children('input').prop("checked")){
			
		   for(var i = 0 ; i < pins['seq_'+$(this).children('input').val()].length ; i++){
				
				var location=new google.maps.LatLng(pins['seq_'+$(this).children('input').val()][i].lat,pins['seq_'+$(this).children('input').val()][i].lng);
				addMarker(location);
				basic_lat=location.lat();
			   	basic_lat=location.lng();
		   }
		    
			showMarkers();	
			
	   }else{
		   clearMarkers();
		  
		   for(var i = 0 ; i < markers.length ; i++){
			   //alert(markers[i].position.lat());
			   
			   for(var j = 0 ; j < pins['seq_'+$(this).children('input').val()].length ; j++){
				   var location=new google.maps.LatLng(pins['seq_'+$(this).children('input').val()][j].lat,
						   								pins['seq_'+$(this).children('input').val()][j].lng);
					
				   if(markers[i].position.lat()==location.lat() && markers[i].position.lng()==location.lng()){
					   markers.splice(i,1);
					   
					  
					}	
			   }
			   
		   }
		   
		   showMarkers();
	   }

   });
   
   
   </script>
   
   <!-- --------------------------------------------------------------------------------- -->


<jsp:include page="footer.jsp"></jsp:include> 




</body>
</html>