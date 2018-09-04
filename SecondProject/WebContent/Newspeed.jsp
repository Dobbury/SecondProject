<%@page import="dto.DiaryDto"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="java.util.List"%>
<%@page import="dto.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>

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
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="Design/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="Design/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="Design/css/style.min.css" rel="stylesheet">
  

  <style type="text/css">
    /* Necessary for full page carousel*/
    html,
    body,
    header,
    .view {
      height: 100%;
    }

    .navbar-menu{
    margin-bottom: 0;
    }
    .navbar-menu li {
       width: 100px;
       height: 30px;
       border:1px solid blue;
       list-style: none;
       display: inline-block;
       
    }
    .diary{
    	width: 300px;
    	height: 300px;
    	border:1px solid blue;
    	display: inline-block;
    	margin: 10px;
    	text-align: center;
    	vertical-align: top;
    }
    .Dimage{
    	width: 280px;
    	height: 220px;
    	border:1px solid blue;
    	background-color: gray;
    	margin-top: 10px;
    	margin-left: 10px;
    	
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
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- logo -->
      <a class="navbar-brand" href="#" target="_blank">
        <strong>MDB</strong>
      </a>

      

        <!-- Right -->
        <ul class="navbar-menu">
          <li><a href="#">뉴스피드</a></li>
          <li><a href="#">마이페이지</a></li>
        </ul>

    </div>
  </nav>

  
  
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
		<button style="float: right;">글쓰기</button>
	</div>
   </div>
</main>
<!-- --------------------------------------------------------------------------------- -->


  <!--Footer-->
  <footer class="page-footer text-center font-small mt-4 wow fadeIn">

 
    <hr class="my-4">

    <div class="pb-4">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fa fa-facebook mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fa fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fa fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fa fa-google-plus mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fa fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fa fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fa fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fa fa-codepen mr-3"></i>
      </a>
    </div>

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2018 Copyright:
      <a href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"> MDBootstrap.com </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->



  <!-- SCRIPTS -->
  <!-- JQuery -->
   
  <script type="text/javascript" src="Design/js/popper.min.js"></script>
  <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="Design/js/mdb.min.js"></script> 
  <!-- Initializations --><!-- 
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script> -->



</body>
</html>