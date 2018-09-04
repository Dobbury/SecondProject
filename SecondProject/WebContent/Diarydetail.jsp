<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

.container {
	display: table;
}

.navbar-menu {
	margin-bottom: 0;
}

.navbar-menu li {
	width: 100px;
	height: 30px;
	border: 1px solid blue;
	list-style: none;
	display: inline-block;
}

.diary-t {
	display: table;
	margin-top: 40px;
}

.diary-t div {
	width: 50%;
	display: table;
}

.diary-t div img {
	width: 100%;
}

.diary-t .map {
	float: left;
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
			<li><a href="Nespeed.jsp">뉴스피드</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
		</ul>

	</div>
	</nav>



	<!-- ----------------------------------------html----------------------------------------- -->
	<!--여기서 하시면 됩니다-->
	<main style="padding-top:80px;">
	<div class="container">

		<div class="diary-t">
			<!-- 지도영역 -->
			<div class="map">
				<p>지도</p>
				<!-- <img alt="" src="img/005.jpg"> -->
			</div>
			<!-- 달력영역 -->
			<div class="calendar">
				<p>달력</p>
				<!-- <img alt="" src="img/lt04014209.png"> -->
			</div>
		</div>

		<div class="diary-m">
			<div class="diary-cont">
				<p class="diary-title">즐거운 제주도여행ㅋ</p>
				<span class="diary-date">2018-11-08</span>

				<div class="diary-content">
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
					여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br> 여기에 작성된 글 데이터를 끌어오면 될것같습니다요<br>
				</div>

			</div>
		</div>

		<div class="diary-b">

			<p class="diary-title">댓글</p>


			<div class="diary-commant">
				<div class="diary-commant"style="padding: 30px; text-align: center; background: rgb(238, 241, 246) !important;">
				
				
				<div class="commant-view" style="margin-bottom: 20px;">
					<div class="commant-id"style="text-align: left; margin-left: 68px;font-weight: 700;margin-bottom: 8px;">호랑둥이</div>
					<div class="commant-content"style="width: 88%;text-align: left; margin-left: 68px; color:#555">댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분댓글내용부분</div>
					<hr style="width: 88%;">
					
				</div>
				
				
				
					<div class="commant-write">
						<div class="commant-id"style="text-align: left; margin-left: 68px;font-weight: 700; margin-bottom: 8px;">호랑둥이</div>
						<form action="PdsServlet">
							<textarea rows="2" cols="20" name="commant"
								style="width: 80%; height: 70px; vertical-align: text-bottom;"></textarea>
							<input type="submit" value="댓글달기"
								style="vertical-align: text-bottom; height: 70px;">

						</form>
					</div>

				</div>




			</div>

		</div>


	</div>
	</main>
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



	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="Design/js/popper.min.js"></script>
	<script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="Design/js/mdb.min.js"></script>
	<!-- Initializations -->
	<!-- 
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script> -->
</body>
</html>