<%@page import="dto.JournalDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	DiaryImpl dao = DiaryDao.getInstance();
	
	List<JournalDto> list = dao.getBestJournal();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.lankbox{
	width: 220px;
    height: 260px;
    border: 1px solid;
    display: inline-block;
    margin: 0 25px;
}
.lankbox_title{
	border-bottom: 1px solid;
    text-align: center;
    font-size: 18px;
    padding: 10px;
    margin-bottom: 15px;
}
.lankbox li {
	margin: 5px 0;
	list-style: decimal;
}

</style>


</head>
<body>
 <jsp:include page="header.jsp"></jsp:include> 
<main style="padding-top:80px;">
   <div class="container" style="      display: table;  max-width: 900px;padding-top: 30px;">
	<h2>BEST Diary</h2>
  	<div style="width:100%;text-align: center;  padding: 0 0 20px 0;display: table;">
			<%
			for(int i = 0; i < list.size();i++){
			%>
				<div class="diary"  style="margin: 60px 100px 0 33px">
					<a href="DiaryServlet?command=journalDetail&amp;seq=<%=list.get(i).getSeq()%>">
						<div class="Dimage" style="">
						</div>
						<p class="diary-title"><%=list.get(i).getTitle()%></p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id"><%=list.get(i).getId() %> 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date"><%=list.get(i).getWdate() %></span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>
					<%=list.get(i).getLike_cnt() %>
					
					</span>
					</div>
				</div>
			<%
			}
			%>

   </div>
	
	
	<h2>Best</h2>


	<div class="lankbox">
		<div class="lankbox_title">장소</div>
		 <ul style="display: table;">

		 	<li><a href="Pindetail.jsp">d</a></li>

		 </ul>
	</div>
<div class="lankbox">
		<div class="lankbox_title">맛집</div>
		 <ul style="display: table;">
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 </ul>
	</div>
	<div class="lankbox">
		<div class="lankbox_title">숙소</div>
		 <ul style="display: table;">
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 	<li>장소 타이틀</li>
		 </ul>
	</div>

   </div>
   </main>
<jsp:include page="footer.jsp"></jsp:include> 

</body>
</html>