
<%@page import="dto.PinDto"%>
<%@page import="dao.PinDao"%>
<%@page import="Impl.PinImpl"%>
<%@page import="java.util.List"%>
<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%

request.setCharacterEncoding("utf-8");
PinImpl dao = PinDao.getInstance();
String stext = request.getParameter("stext");
int paging = (int)request.getAttribute("page");
int pagecount = (int)request.getAttribute("pagecount"); 
List<String[]> pinlist = (List<String[]>)request.getAttribute("pinlist");


int startPage = 0;
int endPage = 0;
if(paging > 5){
	startPage = paging-5;
}
if(pagecount < paging+5){
	startPage = pagecount-10;
}
if(pagecount < 5){
	startPage = 0;
}
if(paging < 6){
	endPage = 10;
}else{
	endPage = paging+5;
}


%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>site</title>

 <style type="text/css">
 
 
 .scene {display: block; position: relative; width: 100%; 
	height: 100vh; background-repeat: no-repeat; background-attachment: fixed; background-size: cover;}
 .searchbg {
width:100%;height: 100%;padding-top: 280px;background-image: url('img/main_bg06.png');background-size: 100% 100%;
background-position: center center ;
transition: all 40s;
	
 }
 .searchbg:hover{
 	background-size: 150% 150%;
 }
 .searchbtn{
 	height: 40px;
    margin-left: -4px;
    background-color: #aaa;
    display: inline-block;
    width: 45px;
    vertical-align: top;
    font-size: 12px;
    padding-top: 6px;
    border-bottom-right-radius: 7px;
    border-top-right-radius: 7px;
 	}
 	.searchbtn:hover{
 		background-color: #999;
 	}
 	.fadeInUp {
	-webkit-animation-name: fadeInUp;
	animation-name: fadeInUp;
}


@-webkit-keyframes fadeInUp {
	0% {
		opacity: 0;
		-webkit-transform: translateY(40px);
		transform: translateY(40px);
	}
	100% {
		opacity: 1;
		-webkit-transform: translateY(0);
		transform: translateY(0);
	}
}

@keyframes fadeInUp {
	0% {
		opacity: 0;
		-webkit-transform: translateY(40px);
		-ms-transform: translateY(40px);
		transform: translateY(40px);
	}

	100% {
		opacity: 1;
		-webkit-transform: translateY(0);
		-ms-transform: translateY(0);
	}
}

.animate {
	-webkit-animation-duration: 3s;
	animation-duration: 3s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}
.searchbtn{
	height: 40px;
    margin-left: -4px;
    border: none;
    margin-top: 1px;
    background-image: url(img/searchicon.png);
    background-size: 80% 80%;
    background-repeat: no-repeat;
    background-position: center;
    vertical-align: bottom;
    cursor: pointer;
}

 	.paging-box{
 		width: 100%;display: table;
 		    padding-top: 80px;
 	}
 	.paging-box a,strong {
 		margin: 3px;
 		color: #555;
 		    font-size: 14px;
}
 	
 	.paging-box strong {

    color: red;
 	}
 </style>
  
</head>

<body>


 <jsp:include page="header.jsp"></jsp:include> 

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
          <div class="scene searchbg" >
          <h1 style="text-align: center;color:#fff">검색어를 입력해주세요</h1>
          <div style="margin-top: 60px; text-align: center;">
          <form action="PinServlet" method="post">
          	<input type="hidden" name="command" value="searchpin">
          	<input type="hidden" name="page" value="1">
			<input type="text" id="stext" name="stext" value="<%=stext %>" style="width: 550px;height: 40px;opacity: 0.8;border-top-left-radius: 7px;border-bottom-left-radius: 7px;
    border: 1px solid #aaa;">
			<input type="submit" class="searchbtn" value="">
			</form>
		  </div>
		</div>
		
  
<main id="main" style="padding-top:80px;">
   <div class="container">
      
		
		<h3 style="margin-left: 35px;font-weight: 700;">장소정보</h3>
			<div style="width:100%;text-align: center;  padding: 0 0 20px 0;display: table;">
	
			 <% 
			if(pinlist.size()!=0){
			for(int i = 0; i < pinlist.size();i++){
			%>
				<div class="diary">
					<a href="DiaryServlet?command=diaryDetail&pinname=<%=pinlist.get(i)[0]%>">
						<div class="Dimage" style="">
							<img style="width: 100%; height: 100%;" src="https://maps.googleapis.com/maps/api/staticmap?center=<%=dao.getPin(pinlist.get(i)[0]).getLat()%>,<%=dao.getPin(pinlist.get(i)[0]).getLng() %>&zoom=13&size=600x300&maptype=roadmap
								&markers=color:blue%7Clabel:S%7C<%=dao.getPin(pinlist.get(i)[0]).getLat() %>,<%=dao.getPin(pinlist.get(i)[0]).getLng() %>
								&key=AIzaSyBp3NXTPG792Eg4zSYGpEGr8wYdAe3g4MI">
						</div>
						<p class="diary-title"><%=pinlist.get(i)[0] %></p>
					</a>
					<div class="diary-textbox">
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date"><%=pinlist.get(i)[1] %></span>	
					
					
					</div>
					
				</div>
			<%
			}
			}else{
			%>
			<div style="padding: 100px;padding: 100px;    background-color: #f9f9f9; width: 94%;margin: 10px auto;">
			<img alt="노데이터" src="img/no-data.png" style="width: 100px;">
				<div style="font-size: 26px;margin-top: 20px;">
				검색결과가 없습니다.
				</div>
				</div>
			<%
			}
			
			%>
			
			
			
			<div class="paging-box">
			<div >
				<!-- paging -->
				<div>
				<%
				if(paging == 1 || pagecount == 0){
				}else{
					%>
					<a href="./PinServlet?command=pinSearchPaging&page=<%=paging-1%>&stext=<%=stext%>">&lt;</a>
					<%
				}
				%>
				
			<%
			
			for(int i = startPage; i < pagecount; i++){
				if(i+1 != paging){
				%>				
				<a href="./PinServlet?command=pinSearchPaging&page=<%=i+1%>&stext=<%=stext%>"><%=i+1 %></a>
				<%
				}else{
					%>
					<strong><%=paging %></strong>
					<%
				}
				if(i+1 == endPage){
					break;
				}
			}
			
			if(paging == pagecount || pagecount == 0){
			}else{
			%>
			<a href="./PinServlet?command=pinSearchPaging&page=<%=paging+1%>&stext=<%=stext%>">&gt;</a>
			<%
			}
			%>
				</div>
				 
				<!-- // paging -->
			</div>
			</div>
			
			<div style="display: table;clear: both;width: 100%;padding: 20px 0 20px 0;">
		<button style="float: right;" onclick="gocal()">글쓰기</button>
	</div>

   </div>
			
		</div>
	
	
</main>
<!-- --------------------------------------------------------------------------------- -->


  
<jsp:include page="footer.jsp"></jsp:include> 

   
   
   
  <!-- SCRIPTS -->
  <script type="text/javascript">
  $(function(){
	 $("#stext").val('<%=stext%>'); 
	 
	 var scmove = $('#main').offset().top;
	 $('html, body').animate( { scrollTop : scmove }, 400 );
  });
  
  function gocal() {
	location.href= "CalendarServlet?command=gocal";	
}
  
  </script>
  
  <script>

	
	  $(window).scroll(function() {
		  var $el = $('.diary');
		  
		  if($(this).scrollTop() >= 100) $el.addClass('fadeInUp').addClass('animate');
		  else $el.removeClass('fadeInUp');
		});
	  
  
  </script>


</body>
</html>