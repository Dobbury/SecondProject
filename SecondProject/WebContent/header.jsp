<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="Design/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="Design/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="Design/css/style.min.css" rel="stylesheet">

  
  
   <!-- JQuery -->
   <script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="Design/js/popper.min.js"></script>
   <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="Design/js/mdb.min.js"></script>
   
   <style type="text/css">
   
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
    list-style: none;
    display: inline-block;
    margin-top: 10px;
    text-align: center;
    font-weight: 700;
    color: #fff;
    border: none;
    font-size: 14px;
       
    }
    .navbar-menu li:hover > a {
     color: orange;
       
    }
    .navbar-menu li a{
        
    	color: #fff;
       
    }
    .navbar.scrolling-navbar.top-nav-collapse{
    	    padding-top: 10px;
    padding-bottom: 10px;
    opacity: 0.9;
    }

    .navbar-brand {
    	background-image: url('img/logo.png');
    	background-size: 100% 100%;
    	width: 130px;
    	height: 30px;
    	    margin-bottom: 5px;
    }

    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
          background: #1C2331!important;
      }
  }

   .diary{
 	width: 300px;height: 300px;text-align: center;
	vertical-align: top;float: left;margin: 60px 34px 0 33px; border: 1px solid #ccc;display: table;
 	}
 	.Dimage{
    	width: 300px;
    	height: 220px;
    	background-color: gray;
    	border:none;
    }.diary-title{
    margin-top: 10px;margin-bottom: 5px;color: #111;font-weight: 700;text-align: left;
    margin-left: 10px;white-space: nowrap;
    overflow: hidden;text-overflow: ellipsis;
    width: 280px;
    }
 	.diary-textbox{
 	text-align: left;margin-left: 10px;padding-right: 10px;    word-break: break-all;
 	}
 	.diary-id{
 	text-align: left;color: #888;font-size: 14px;
 	}
 	.diary-date{
 	text-align: left;color: #888;font-size: 14px;
 	}
 	.diary-heartbox{
 	text-align: right; margin-left: -1px; padding-right: 10px; margin-top: 15px;
   	    border-top: 1px solid #ccc;width: 300px;height: 30px;padding-top: 5px;
 	}
 	.diary-heart{
 		background-image: url('img/heart.png');width: 15px;height: 15px;display: inline-block;
   		background-size: 100% 100%;vertical-align: text-top; margin-right: 2px;
 	}
   </style>

</head>
<body>
<!-- 일단 Nespeed, Diarydetail 에만 적용 -->


  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- logo -->
      <a class="navbar-brand" href="Newspeed.jsp?page=1">
       
      </a>

      

        <!-- Right -->
        <ul class="navbar-menu">
          <li><a href="Newspeed.jsp?page=1">뉴스피드</a></li>
          <li><a href="Pinspeed.jsp?page=1">장소정보</a></li>
          <li><a href="#">이달의 명소</a></li>
          <li><a href="Mypage.jsp">마이페이지</a></li>
        </ul>

    </div>
  </nav>


</body>
</html>