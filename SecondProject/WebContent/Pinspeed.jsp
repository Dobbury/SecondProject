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

int paging = (int)request.getAttribute("page");
int pagecount = (int)request.getAttribute("pagecount");
List<String[]> pinlist = (List<String[]>)request.getAttribute("pinlist");
// 수정
//List<PinDto> pinlist = dao.getAllPinList(paging);


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
  <script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
  <title>site</title>

 <style type="text/css">

  
 .starR1{
/*     background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0; */
    background: url('img/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    /* background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0; */
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
 	.searchbtn:hover{
 		background-color: #999;
 	}
 	.starRev span{
 	cursor: auto;
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
          <form action="Pinsearch.jsp" method="post">
          	<input type="hidden" name="command" value="search">
          	<input type="hidden" name="page" value="1">
			<input type="text" name="stext" style="width: 550px;height: 40px;opacity: 0.8;border-top-left-radius: 7px;border-bottom-left-radius: 7px;
    border: 1px solid #aaa;">
			<input type="submit" class="searchbtn" value="">
			</form>
		  </div>
		</div>
		
  
<main style="padding-top:80px;">
   <div class="container">
      
		
		<h3 style="margin-left: 35px;font-weight: 700;margin-bottom: 0s">장소정보</h3>
		<hr style="width: 1037px;
    border-top: 2px solid #eee;
    margin-top: 20px;">
			<div style="width:100%;text-align: center;  padding: 0 0 80px 0;display: table;">
	
			 <% 
			
			for(int i = 0; i < pinlist.size();i++){
			%>
				<div class="diary">
					<a href="PinServlet?command=pinDetail&pinname=<%=pinlist.get(i)[0]%>">
						<div class="Dimage" style="">
							<img style="width: 100%; height: 100%;" src="https://maps.googleapis.com/maps/api/staticmap?center=<%=dao.getPin(pinlist.get(i)[0]).getLat()%>,<%=dao.getPin(pinlist.get(i)[0]).getLng() %>&zoom=13&size=600x300&maptype=roadmap
								&markers=color:blue%7Clabel:S%7C<%=dao.getPin(pinlist.get(i)[0]).getLat() %>,<%=dao.getPin(pinlist.get(i)[0]).getLng() %>
								&key=AIzaSyBp3NXTPG792Eg4zSYGpEGr8wYdAe3g4MI">
						</div>
						<p class="diary-title"><%=pinlist.get(i)[0] %></p>
					</a>
					<div class="diary-textbox">
						<span class="diary-date" style="margin:0px"><%=pinlist.get(i)[1] %>
						</span>
					</div>
					<div class="diary-textbox" style="line-height: 30px; margin-bottom: 5px; display: table; width: 100%;">
						<div class="starRev">
						<%
						for(int j = 1 ; j<=10 ; j++){ 
							if(j%2==1){
								if(j <= (int)Double.parseDouble(pinlist.get(i)[2])){
						%>
				  					<span class="starR1 on"></span>
				  			<%
								}else{
				  			%>
				  					<span class="starR1"></span>
				  			<%
				  				}
							}else if(j%2==0){
								if(j <= (int)Double.parseDouble(pinlist.get(i)[2])){
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
							<div style="float: right; margin-right: 10px;" >
							
							<span class="diary-date" style="margin-top: 5px;">평점 : <%=pinlist.get(i)[2] %></span>	
							</div>
						</div>
					</div>	
				</div>
			<%
			}
			
			%>
			
			
			
			
			<div style="display: inline-block;">
				<!-- paging -->
				<div>
				<%
				if(paging == 1 || pagecount == 0){
				}else{
					%>
					<a href="./PinServlet?command=pinPaging&page=<%=paging-1%>">&lt;</a>
					<%
				}
				%>
			<%
			for(int i = startPage; i < pagecount; i++){
				if(i+1 != paging){
				%>				
				<a href="./PinServlet?command=pinPaging&page=<%=i+1%>"><%=i+1 %></a>
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
			<a href="./PinServlet?command=pinPaging&page=<%=paging+1%>">&gt;</a>
			<%
			}
			%>
				</div>
				 
				<!-- // paging -->
			</div>
	</div>

   </div>
			
		</div>
	
	<jsp:include page="footer.jsp"></jsp:include> 
</main>
<!-- --------------------------------------------------------------------------------- -->


  

  
  <script>

	
	  $(window).scroll(function() {
		  var $el = $('.diary');
		  
		  if($(this).scrollTop() >= 100) $el.addClass('fadeInUp').addClass('animate');
		  else $el.removeClass('fadeInUp');
		});
	  
  </script>


</body>
</html>