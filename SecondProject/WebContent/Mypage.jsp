<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	memberDto dto = (memberDto)request.getAttribute("memberDto");
	
	
	/* //테스트 코드
	dto = new memberDto("aa","aa","aa","aa");
	//boolean isS=(boolean)request.getAttribute("isS"); */
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script> 
$(document).ready(function() { 
	$('a[data-toggle="tab"]').on('hidden.bs.tab', 
			function(e){// alert("이벤트 실행됨"); 
			}); 
	}); 
	</script>
<script> 
$(document).ready(function() { 
   $('a[data-toggle="tab"]').on('hidden.bs.tab', 
         function(e){// alert("이벤트 실행됨"); 
         }); 
   }); 
   </script>



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
			<li><a href="#">뉴스피드</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>

	</div>
	</nav>

	<main style="padding-top:80px;">
	<div class="container">

		<h2>mypage sample</h2>
		<ul id="myTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a data-target="#home"
				id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
				aria-expanded="true">내가 쓴 글</a></li>
			<li role="presentation" class=""><a data-target="#profile"
				role="tab" id="profile-tab" data-toggle="tab"
				aria-controls="profile" aria-expanded="false">
				&nbsp;&nbsp;&nbsp;회원 정보 수정</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="home"
				aria-labelledby="home-tab">
				<p>내가 쓴글~~</p>
				<table>
					<tr></tr>
				</table>
				
			</div>
			<div role="tabpanel" class="tab-pane fade" id="profile"
				aria-labelledby="profile-tab">
				<p>회원정보 수정하는 칸</p>
				<table>
					<tr>
						<td>ID</td>
						<td>
							<input type="text" id="id" readonly="readonly" value="<%=dto.getId()%>" name="id">
						</td>
					</tr>
					<tr>
						<td>PW</td>
						<td>
							<input type="text" id="pwd" name="pwd">
						</td>				
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" id="name" readonly="readonly" value="<%=dto.getName()%>" name="name">
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>
							<input type="text" id="nickname" name="nickname">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="edit" value="수정완료">
						</td>
						<td>
							<input type="button" name="back" value="취소"  data-target="#home" data-toggle="tab">
						</td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
	</main>
	
	<script type="text/javascript">
	$(function () {
		$("#edit").click(function () {
			$.ajax({
				url: "MemberServlet",
				type: "get",
				data: {
					command: "update",
					id : $("#id").val(),
					pwd : $("#pwd").val(),
					name : $("#name").val(),
					nick : $("#nickname").val()
				},
				success:function(data){
					alert(data);
				},
				error: function(){
					
				}
			});
			
		});
	});
	</script>
<%-- 	<script type="text/javascript">
	function memEdit(){
        $("#memberedit").attr("action", '<%=request.getContextPath()%>/updateMemberServlet');
              $("#memberedit").submit();
     }
	

	

	</script> --%>

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
=======
   <!-- SCRIPTS -->
   <!-- JQuery -->
   <script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="Design/js/popper.min.js"></script>
   <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="Design/js/mdb.min.js"></script>
   <!-- Initializations -->
   <!-- 
>>>>>>> bb863d88e0ad2d5c17e299549346adf149c8bb1c
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script> -->
</body>
</html>