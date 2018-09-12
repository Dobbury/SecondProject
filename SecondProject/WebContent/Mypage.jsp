<%@page import="dto.JournalDto"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="dao.DiaryDao"%>
<%@page import="dto.DiarycommentDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.DiaryDto"%>
<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	memberDto dto = (memberDto) session.getAttribute("user");
	int p = (int) request.getAttribute("page");
	int pagecount = (int) request.getAttribute("pagecount");
	List<JournalDto> jlist = (List<JournalDto>) request.getAttribute("jlist");

	int startPage = 0;
	int endPage = 0;
	if (p > 5) {
		startPage = p - 5;
	}
	if (pagecount < p + 5) {
		startPage = pagecount - 10;
	}
	if (pagecount < 5) {
		startPage = 0;
	}
	if (p < 6) {
		endPage = 10;
	} else {
		endPage = p + 5;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 제이쿼리 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- SCRIPTS -->
<!-- JQuery -->
<!-- <script> -->
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>site</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="Design/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="Design/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="Design/css/style.min.css" rel="stylesheet">


<style type="text/css">
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
	border: 1px solid black;
	list-style: none;
	display: inline-block;
}

.diary {
	width: 300px;
	height: 300px;
	border: 1px solid blue;
	display: inline-block;
	margin: 10px;
	text-align: center;
	vertical-align: top;
}

#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: white;
	padding: 6px 12px;
	color: #000000;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}

.diary {
	width: 300px;
	height: 300px;
	border: 1px solid blue;
	display: inline-block;
	margin: 10px;
	text-align: center;
	vertical-align: top;
}

.btn1 {
	background: #003458;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.btn1:hover {
	background: #fff;
	color: #003458;
}

.btn1:before, btn1:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #003458;
	transition: 400ms ease all;
}

.btn1:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btn1:hover:before, btn1:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

body {
	background-image: url("img/mp-bg.jpg");
	background-size: cover;
	background-color: rgba( 50, 50, 50, 0.4 ); 
	background-repeat: no-repeat;
	background-attachment: fixed;



}

@media ( min-width : 800px) and (max-width: 850px) {
	.navbar:not (.top-nav-collapse ) {
		background: #1C2331 !important;
	}
}
</style>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<div id="container" class="tab-content card"
		style="background-color: #FFFAFA">

		<ul class="nav nav-tabs md-tabs nav-justified">
			<li class="nav-item" data-tab="tab1"><a class="nav-link active"
				data-toggle="tab" href="#panel1" role="tab">내가 쓴 글 보기</a></li>
			<li class="nav-item" data-tab="tab1"><a class="nav-link"
				data-toggle="tab" href="#panel2" role="tab">회원정보수정</a></li>
			<li class="nav-item" data-tab="tab1"><a class="nav-link"
				href="CalendarWrite.jsp">캘린더 보기</a></li>

		</ul>

		<div class="tab-pane fade in show active" id="panel1" role="tabpanel">


			<main style="padding-top:80px;">
			<div class="container">



				<div
					style="width: 100%; text-align: center; padding: 0 0 20px 0; display: table;">

					<%
						for (int i = 0; i < jlist.size(); i++) {
					%>
					<div class="diary">
						<a
							href="DiaryServlet?command=diaryDetail&seq=<%=jlist.get(i).getSeq()%>">
							<div class="Dimage" style=""></div>
							<p class="diary-title"><%=jlist.get(i).getTitle()%></p>
						</a>
						<div class="diary-textbox">
							<span class="diary-id"><%=jlist.get(i).getId()%> 님</span> <span
								style="display: inline-block; margin: 0 5px; color: #ccc;">|</span>
							<span class="diary-date"><%=jlist.get(i).getWdate().substring(0, 10)%></span>

						</div>
						<div class="diary-heartbox">
							<span style="text-align: right; color: #888; font-size: 14px;">
								<span class="diary-heart"></span> <%=jlist.get(i).getLike_cnt()%>
							</span>
						</div>
					</div>
					<%
						}
					%>


				</div>

				<div style="display: inline-block;">
					<!-- paging -->
					<div>
						<%
							if (p != 1 && pagecount != 0) {
						%>
						<a href="./DiaryServlet?command=MypagePaging&page=<%=p - 1%>">&lt;</a>
						<%
							}
						%>

						<%
							for (int i = startPage; i < pagecount; i++) {
								if (i + 1 != p) {
						%>
						<a href="./DiaryServlet?command=MypagePaging&page=<%=i + 1%>"><%=i + 1%></a>
						<%
							} else {
						%>
						<strong><%=p%></strong>
						<%
							}
								if (i + 1 == endPage) {
									break;
								}
							}

							if (p != pagecount && pagecount != 0) {
						%>
						<a href="./DiaryServlet?command=MypagePaging&page=<%=p + 1%>">&gt;</a>
						<%
							}
						%>
					</div>

					<!-- // paging -->
				</div>


			</div>
		</div>
		</main>

		<div class="tab-pane fade" id="panel2" role="tabpanel">

			<table align="center">
				<tr>
					<td>ID</td>
					<td>
						<div class="md-form">
							<input type="text" id="id" readonly="readonly"
								value="<%=dto.getId()%>" name="id" class="form-control">
						</div>
					</td>

					<!-- 
						
						<div class="md-form">
  						  <input type="text" id="form1" class="form-control">
 					   <label for="form1" >Example label</label>
						</div>
						
						 -->
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<div class="md-form">
							<input type="text" id="pw" name="pw" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<div class="md-form">
							<input type="text" id="name" readonly="readonly"
								value="<%=dto.getName()%>" name="name" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<div class="md-form">
							<input type="text" id="nickname" name="nickname"
								class="form-control">
						</div>
					</td>
				</tr>

			</table>
			<input type="button" class="btn1" style="WIDTH: 30pt; HEIGHT: 20pt"
				id="edit" value="수정완료"> <input type="button" class="btn1"
				style="WIDTH: 30pt; HEIGHT: 20pt" id="back" value="취소">
		</div>
		<div class="tab-pane fade" id="panel3" role="tabpanel"></div>

	</div>



	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$("#edit").click(function() {
				$.ajax({
					url : "MemberServlet",
					type : "get",
					data : {
						command : "update",
						id : $("#id").val(),
						pw : $("#pw").val(),
						name : $("#name").val(),
						nick : $("#nickname").val()
					},
					success : function(data) {
						alert(data);
						location.href = "Mypage.jsp?page=1";
					},
					error : function() {
						alert("에러남");
						location.href = "Mypage.jsp?page=1";
					}
				});

			});
		});

		$(function() {
			$("#back").click(function() {
				location.href = "Mypage.jsp?page=1";
			});
		});
	</script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>