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

List<DiaryDto> diarylist = diaryDao.getDiaryList();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>site</title>

  
  
</head>

<body>


 <jsp:include page="header.jsp"></jsp:include> 

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
          <div style="width:100%;height: 100%;padding-top: 280px; background-color:green">
          <h1 style="text-align: center;">어서오세요 방갑습니다</h1>
          <div style="margin-top: 60px; text-align: center;">
			<input type="text" style="width:500px;height:30px;">
			<input type="button" value="검색">
		  </div>
		</div>
		
  
<main style="padding-top:80px;">
   <div class="container">
      
		
		
			<div style="width:100%;background-color: yellow;text-align: center;  padding: 20px 0 20px 0;">
			<% 
			if(diarylist.size()<10){
			for(int i = 0; i < diarylist.size();i++){
			%>
				<div class="diary">
					<a href="DiaryServlet?command=diaryDetail&seq=<%=diarylist.get(i).getSeq()%>">
						<div class="Dimage">
						</div>
						<%=diarylist.get(i).getTitle() %><br>
					</a>
					<span style="text-align: right;">조회수</span>
					<span style="text-align: left"><%=diarylist.get(i).getTday().substring(0,10) %></span>	
				</div>
			<%
			}
		}
		%>			
		</div>
	
	<div style="display: table;clear: both;width: 100%;padding: 20px 0 20px 0;">
		<button style="float: right;" onclick="gocal()">글쓰기</button>
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