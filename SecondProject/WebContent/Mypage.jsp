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

	int p = Integer.parseInt(request.getParameter("page"));
	DiaryImpl dDao = DiaryDao.getInstance();

	int jcount = dDao.countMyJournal(dto.getId());
	List<JournalDto> jlist = dDao.myJournalList(dto.getId(), p);

	int pagecount = jcount / 6;
	if(jcount != 0){
		if (pagecount % jcount > 0) {
			pagecount++;
		}
	}
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- SCRIPTS -->
<!-- JQuery -->
<!-- <script> -->
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="Design/js/popper.min.js"></script>
<script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Design/js/mdb.min.js"></script>
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

.Dimage {
	width: 280px;
	height: 220px;
	border: 1px solid blue;
	background-color: gray;
	margin-top: 10px;
	margin-left: 10px;
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
	background-color: rgb(0, 154, 200);
	padding: 6px 12px;
	color: #fff;
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

@media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
          background: #1C2331!important;
      }
}
</style>
</head>

<body>

	<!-- Navbar -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
	<div class="container">

		<!-- logo -->
		<a class="navbar-brand" href="#" target="_blank"> <strong>MDB</strong>
		</a>



		<!-- Right -->
		<ul class="navbar-menu">
			<li><a href="Newspeed.jsp?page=1">뉴스피드</a></li>
			<li><a href="Mypage.jsp?page=1">마이페이지</a></li>

		</ul>

	</div>
	</nav>

	<div id="container">
		<h1>MYPAGE!!!!!!!!</h1>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">내가 쓴 글 보기</a></li>
			<li data-tab="tab2"><a href="#">회원정보수정</a></li>
			<li data-tab="tab3"><a href="CalendarWrite.jsp">캘린더 보기</a></li>
		</ul>

		<div id="tab1" class="tabcontent current">
			<h3>내가 쓴 글 보기</h3>
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
							if (p != 1 || pagecount == 0) {
						%>
						<a href="./Mypage.jsp?page=<%=p - 1%>">&lt;</a>
						<%
							}
						%>

						<%
							for (int i = startPage; i < pagecount; i++) {
								if (i + 1 != p) {
						%>
						<a href="./Mypage.jsp?page=<%=i + 1%>"><%=i + 1%></a>
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

							if (p != pagecount || pagecount == 0) {
						%>
						<a href="./Mypage.jsp?page=<%=p + 1%>">&gt;</a>
						<%
							}
						%>
					</div>

					<!-- // paging -->
				</div>


			</div>
		</div>
		</main>

		<div id="tab2" class="tabcontent">
			<h3>회원정보 수정</h3>
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="id" readonly="readonly"
						value="<%=dto.getId()%>" name="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="text" id="pw" name="pw"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" readonly="readonly"
						value="<%=dto.getName()%>" name="name"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="nickname" name="nickname">
					</td>
				</tr>
				<tr>
					<td><input type="button" id="edit" value="수정완료"></td>
					<td><input type="button" name="back" value="취소"></td>
				</tr>
			</table>
		</div>
		<div id="tab3" class="tabcontent"></div>

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
						location.href = "Mypage.jsp";
					},
					error : function() {
						alert("에러남");
						location.href = "Mypage.jsp";
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

	<!-- --------------------------------------------------------------------------------- -->


	<!--Footer-->
	<footer class="page-footer text-center font-small mt-4 wow fadeIn">


	<hr class="my-4">

	<div class="pb-4">
		<a href="https://www.facebook.com/mdbootstrap" target="_blank"> <i
			class="fa fa-facebook mr-3"></i>
		</a> <a href="https://twitter.com/MDBootstrap" target="_blank"> <i
			class="fa fa-twitter mr-3"></i>
		</a> <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
			<i class="fa fa-youtube mr-3"></i>
		</a> <a href="https://plus.google.com/u/0/b/107863090883699620484"
			target="_blank"> <i class="fa fa-google-plus mr-3"></i>
		</a> <a href="https://dribbble.com/mdbootstrap" target="_blank"> <i
			class="fa fa-dribbble mr-3"></i>
		</a> <a href="https://pinterest.com/mdbootstrap" target="_blank"> <i
			class="fa fa-pinterest mr-3"></i>
		</a> <a href="https://github.com/mdbootstrap/bootstrap-material-design"
			target="_blank"> <i class="fa fa-github mr-3"></i>
		</a> <a href="http://codepen.io/mdbootstrap/" target="_blank"> <i
			class="fa fa-codepen mr-3"></i>
		</a>
	</div>

	<!--Copyright-->
	<div class="footer-copyright py-3">
		© 2018 Copyright: <a
			href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank">
			MDBootstrap.com </a>
	</div>
	<!--/.Copyright--> </footer>
	<!--/.Footer-->




	<!-- Initializations -->
	<!-- 
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script> -->
</body>
</html>