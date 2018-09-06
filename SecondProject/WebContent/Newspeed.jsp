<%@page import="dto.JournalDto"%>
<%@page import="dto.DiaryDto"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="java.util.List"%>
<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
//	pds 리스트 받아오기
DiaryImpl diaryDao = DiaryDao.getInstance();

List<JournalDto> journallist = diaryDao.getJournalList();


/* int page = Integer.parseInt(request.getParameter("page")); */
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
 </style>
  
</head>

<body>


 <jsp:include page="header.jsp"></jsp:include> 

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
          <div class="scene searchbg" >
          <h1 style="text-align: center;color:#fff">검색어를 입력해주세요</h1>
          <div style="margin-top: 60px; text-align: center;">
			<input type="text" style="width: 550px;height: 40px;opacity: 0.8;border-top-left-radius: 7px;border-bottom-left-radius: 7px;
    border: 1px solid #aaa;">
			<a class="searchbtn" style="height: 40px;margin-left: -4px;"><i class="fa fa-search fa-2x"></i></a>
		  </div>
		</div>
		
  
<main style="padding-top:80px;">
   <div class="container">
      
		
		
			<div style="width:100%;background-color: yellow;text-align: center;  padding: 20px 0 20px 0;">
	
			 <% 
			
			for(int i = 0; i < journallist.size();i++){
			%>
				<div class="diary">
					<a href="DiaryServlet?command=diaryDetail&seq=<%=journallist.get(i).getSeq()%>">
						<div class="Dimage">
						</div>
						<%=journallist.get(i).getTitle() %><br>
					</a>
					<span style="text-align: right;">조회수</span>
					<span style="text-align: left"><%=journallist.get(i).getWdate().substring(0,10) %></span>	
				</div>
			<%
			}
			
			%>
			
			
			
			<%-- 
			<div class="inner">
				<!-- paging -->
				<div class="paging">
				<%
				if(page != 1){
					%>
					<a href="#none" class="page prv">&lt;</a>
					<%
				}
				%>
				
					<strong><%=page %></strong> 
			<%
			
			for(int i = 1; i < diarylist.size()/9+1; i++){
				%>
				<a href="#none" class="page"><%=page+i %></a>
				<%
				}
			%>
			<a href="#none" class="page next">&gt;</a>
				</div>
				 --%>
				<!-- // paging -->
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
  function gocal() {
	location.href= "CalendarServlet?command=gocal";	
}
  
  </script>
  



</body>
</html>