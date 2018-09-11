<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


</style>


</head>
<body>
 <jsp:include page="header.jsp"></jsp:include> 
<main style="padding-top:80px;">
   <div class="container" style="      display: table;  max-width: 900px;padding-top: 30px;">
	<h2>BEST Diary</h2>
  	<div style="width:100%;text-align: center;  padding: 0 0 20px 0;display: table;">
	
			 
				<div class="diary"  style="margin: 60px 100px 0 33px">
					<a href="DiaryServlet?command=journalDetail&amp;seq=2">
						<div class="Dimage" style="">
						</div>
						<p class="diary-title">일정제목</p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id">a 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date">2018-09-06</span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>

					6
					</span>
					</div>
				</div>
			<div class="diary" style="margin: 60px 100px 0 33px">
					<a href="DiaryServlet?command=journalDetail&amp;seq=2">
						<div class="Dimage" style="">
						</div>
						<p class="diary-title">일정제목</p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id">a 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date">2018-09-06</span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>

					6
					</span>
					</div>
				</div>
			<div class="diary"  style="margin: 60px 100px 0 33px">
					<a href="DiaryServlet?command=journalDetail&amp;seq=2">
						<div class="Dimage" style="">
						</div>
						<p class="diary-title">일정제목</p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id">a 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date">2018-09-06</span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>

					6
					</span>
					</div>
				</div>
				<div class="diary"  style="margin: 60px 100px 0 33px">
					<a href="DiaryServlet?command=journalDetail&amp;seq=2">
						<div class="Dimage" style="">
						</div>
						<p class="diary-title">일정제목</p>
					</a>
					<div class="diary-textbox">
					<span class="diary-id">a 님</span>
					<span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
					<span class="diary-date">2018-09-06</span>	
					
					</div>
					<div class="diary-heartbox">
					<span style="text-align: right;color: #888;font-size: 14px;">
					<span class="diary-heart"></span>

					6
					</span>
					</div>
				</div>
		

   </div>
	
	
	<h2>Best</h2>


	<div class="lankbox">
		<div class="lankbox_title">장소</div>
		 <ul style="display: table;">
		 	<li><a href="Pindetail.jsp">장소 타이틀</a></li>
			<li><a href="Pindetail.jsp">장소 타이틀</a></li>
			<li><a href="Pindetail.jsp">장소 타이틀</a></li>
			<li><a href="Pindetail.jsp">장소 타이틀</a></li>
			<li><a href="Pindetail.jsp">장소 타이틀</a></li>
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