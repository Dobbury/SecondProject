<%@page import="dto.JournalDto"%>
<%@page import="dto.DiaryDto"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="java.util.List"%>
<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
request.setCharacterEncoding("utf-8");


int paging = (int)request.getAttribute("page");
int pagecount = (int)request.getAttribute("pagecount");
List<JournalDto> journallist = (List<JournalDto>)request.getAttribute("journallist");

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
 .scene {display: block; position: relative; width: 100%; 
	height: 100vh; background-repeat: no-repeat; background-attachment: fixed; background-size: cover;}
 .searchbg {
width:100%;height: 100%;padding-top: 280px;background-image: url('img/b5.jpg');background-size: 100% 100%;
background-position: center center ;
transition: all 40s;
	
 }
/*  .searchbg:hover{
 	background-size: 150% 150%;
 } */
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
.diary:hover {
	border: 1px solid #222;
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
 	
 	/* .diary-title {
 		margin-left: 0 !important;
 		margin-right: 0 !important;
 	} */
 </style>
  
</head>

<body>


 <jsp:include page="header.jsp"></jsp:include> 

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
          <div class="scene searchbg" >
          <h1 style="text-align: center;color:#fff">검색어를 입력해주세요</h1>
          <div style="margin-top: 60px; text-align: center;">
          <form action="DiaryServlet" method="post">
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
      
		<div style="display: table;width: 96%;">
		<h3 style="margin-left: 35px;font-weight: 700;float: left;margin-bottom: 0;margin-top: 25px;">여행후기</h3>

			<button class="btn btn-outline-black" style="float: right;height: 40px;margin-top: 25px; padding-top:8px" onclick="gocal()">글쓰기</button>

		</div>
		<hr style="width: 1037px;
    border-top: 2px solid #eee;
    margin-top: 10px;">
			<div style="width:100%;text-align: center;  padding: 0 0 20px 0;display: table;">
	
			 <% 
			
			for(int i = 0; i < journallist.size();i++){
			%>
				<div class="diary">
					<a href="DiaryServlet?command=journalDetail&seq=<%=journallist.get(i).getSeq()%>">
						<div class="Dimage">
							<img alt="" onerror="this.src='img/img_is_not.png'"  src="<%=journallist.get(i).getFisrt_Img() %>" style="width: 100%; height: 100%;">
						</div>
						<p class="diary-title"><%=journallist.get(i).getTitle() %></p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id"><%=journallist.get(i).getId() %> 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date"><%=journallist.get(i).getWdate().substring(0,10) %></span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>

					<%=journallist.get(i).getLike_cnt() %>
					</span>
					</div>
				</div>
			<%
			}
			
			%>
			
			
			
			
			<div class="paging-box">
				<!-- paging -->
				<div>
				<%
				if(paging == 1 || pagecount == 0){
				}else{
					%>
					<a href="./DiaryServlet?command=Newspaging&page=<%=paging-1%>">&lt;</a>
					<%
				}
				%>
			<%
			for(int i = startPage; i < pagecount; i++){
				if(i+1 != paging){
				%>				
				<a href="./DiaryServlet?command=Newspaging&page=<%=i+1%>"><%=i+1 %></a>
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
			<a href="./DiaryServlet?command=Newspaging&page=<%=paging+1%>">&gt;</a>
			<%
			}
			%>
				</div>
				 
				<!-- // paging -->
			</div>
			
			
			<div style="display: table;clear: both;width: 100%;padding: 20px 0 20px 0;">

		

		<!-- SCRIPTS -->
  		<script type="text/javascript">
  			function gocal() {  		
  				location.href= "CalendarWrite.jsp";	
			}

 		 </script>
	</div>

   </div>
			
</div>
	
	
</main>
<!-- --------------------------------------------------------------------------------- -->


  
<jsp:include page="footer.jsp"></jsp:include> 
  
<script> 



   
   
   
  <!-- SCRIPTS -->
  <script type="text/javascript">
  function gocal() {
	location.href= "CalendarServlet?command=gocal";	
}
  
  </script>
<script type="text/javascript">
	
	  $(window).scroll(function() {
		  var $el = $('.diary');
		  
		  if($(this).scrollTop() >= 100) $el.addClass('fadeInUp').addClass('animate');
		  else $el.removeClass('fadeInUp');
		});
	  
  </script>
 
</body>
</html>