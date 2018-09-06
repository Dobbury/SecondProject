<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	 List<String> list =  (List<String>)request.getAttribute("idck");

%>

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
  <!-- css -->
  <link href="style.css" rel="stylesheet">
  
  
   <!-- JQuery -->
   <script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="Design/js/popper.min.js"></script>
   <script type="text/javascript" src="Design/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="Design/js/mdb.min.js"></script>
   
  

  <style type="text/css">
    /* Necessary for full page carousel*/
    html,
    body,
    header,
    .view {
      height: 100%;
    }
	main{
		height: 100%;
		background-image: url("img/signup_back.png");
		padding-top: 10%;
    
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

    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
          background: #1C2331!important;
      }
  }
  
  .signup-box {
   width: 400px;
    background-color: #fff;
    border-radius: 1%;
    padding: 20px;
    text-align: center;
    float: right;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
  
  }
  .signup-box p {
  	margin: 15px 0 3px 0;
    text-align: left;
    margin-left: 16px;
    font-size: 13px;
    font-weight: 700;
    color: #555;
  }
  .signup-box b {
  	font-size: 10px;
    margin-top: 5px;
    display: block;
    text-align: left;
    margin-left: 16px;
  }
  .signup-box input[type=text],input[type=password] {
    width: 330px;
    height: 32px;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    border: 1px solid #cdcdcd;
  }
  .signtext-box{
      float: left;
    width: 400px;
    text-align: center;
    padding-top: 20px;
  }
  .signtext-box h1 {
  	font-weight: 700;
    color: white;
  }
  .signbtn{
  	color: white;
    width: 91%;
    background-color: orange;
    border: none;
    padding: 5px;
    border-radius: 5px;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
    cursor: pointer;
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

		
<!-- 
        Right
        <ul class="navbar-menu">
          <li><a href="#">뉴스피드</a></li>
          <li><a href="#">마이페이지</a></li>
        </ul> -->

    </div>
  </nav>

  
  
<!-- ----------------------------------------html----------------------------------------- -->
  <!--여기서 하시면 됩니다-->
<main style="padding-top:8%;">
	<div class="container">
		<div class="signtext-box">
		<h1 style="font-weight:  700;color: white;">Sign Up for Free</h1>
		</div>
		
		<div class="signup-box">
		
			<!-- <form action="MemberServlet?command=signPage" method="post">
			<div>
				<p>아이디</p>
				<input type="text" name="id" style="width: 245px;"id="id">
				<input type="submit" value="중복확인"></button>
				<div id="id-ck-box">
			</div>
			</form>   -->
			
			<form action="MemberServlet?command=signup" method="post" id="frm">
			 <div>
				<p>아이디</p>
				<input type="text" name="id"  id="id">
				<!-- <button type="button" id="idck">중복확인</button> -->
				<div id="id-ck-box">
			</div> 
			<div>
				<p>비밀번호</p>
				<input type="password" name="pw" id="pw" >
				<div id="pw-ck-box1">
			</div>
			<div>
				<p>비밀번호확인</p>
				<input type="password" name="pw-ck" id="pw-ck">
			</div>
			<div id="pw-ck-box2">
			</div>
			<div>
				<p>이름</p>
				<input type="text" name="name" id="name">
				<div id="name-ck-box">
			</div>
			<div>
				<p>닉네임</p>
				<input type="text" name="nick" id="nick">
				<div id="nick-ck-box">
			</div>			
			
			<div class="text-center" style="margin-top:20px;">
				<input type="button" onclick="memsubmit()" value="회원가입완료" class="signbtn"> 
				<p style="text-align: center;">이미 계정이 있으신가요? <a href="Main.jsp">로그인</a></p>
			</div>
			
		</form>
		
		</div>
		
    </div>

</main>


     

<!-- --------------------------------------------------------------------------------- -->

 <!-- 스크립트 -->
 <script type="text/javascript">
 
 var pwcheak = false;


 $(function(){

	 
	   $(document).ready(function() {

           $('#pw').keyup(function() {
               $('#pw-ck-box2').text(''); 
           });


           $('#pw-ck').keyup(function() {
               if ($('#pw').val() != $('#pw-ck').val()) {
                   $('#pw-ck-box2').text(''); 
                   $('#pw-ck-box2').html("<b style='color:red'>암호가 틀립니다.</b>"); 
                   pwcheak = false;
               }	
               else {
                   $('#pw-ck-box2').text(''); 
                   $('#pw-ck-box2').html("<b style='color:blue'>암호가 맞습니다.</b>");
                   pwcheak = true;

               }

           });
           $("#id").keyup(function () {
        	   $('#id-ck-box').text(''); 
		});
           $("#pw").keyup(function () {
        	   $('#pw-ck-box1').text(''); 
		});
           $("#name").keyup(function () {
        	   $('#name-ck-box').text(''); 
		});
           $("#nick").keyup(function () {
        	   $('#nick-ck-box').text(''); 
		});
		});



	});
 
 
 function memsubmit() { 
	 	

	 
	 	var id = document.getElementById('id').value;
	 	var pw = document.getElementById('pw').value;
	 	var name = document.getElementById('name').value;
	 	var nick = document.getElementById('nick').value;
	 	var errortext = "<b style='color:red'>필수 정보입니다.</b>";
	 	
	 	
	 	 if(id != "" && pw != "" && name != "" && nick != ""){
	 		
	 		
	 		  if(pwcheak == true){
	  			document.getElementById('frm').submit();
	  			
	  			}else if(pwcheak == false){
	  				document.getElementById("pw-ck-box2").innerHTML = "<b style='color:red'>암호가 틀립니다.</b>";

	  			}  
	  			
	 		
	 		
	 	}else{
		 	if(id == "" && pw == "" && name == "" && nick == ""){
		 		document.getElementById("id-ck-box").innerHTML = errortext;
		 		document.getElementById("pw-ck-box1").innerHTML = errortext;
		 		document.getElementById("name-ck-box").innerHTML = errortext;
		 		document.getElementById("nick-ck-box").innerHTML = errortext;

		 	}else if(id == ""){
		 		document.getElementById("id-ck-box").innerHTML = errortext;
		 	}else if(pw == ""){
		 		document.getElementById("pw-ck-box1").innerHTML = errortext;
		 	}
		 	else if(name == ""){
		 		document.getElementById("name-ck-box").innerHTML = errortext;
		 	}else if(nick == ""){
		 		document.getElementById("nick-ck-box").innerHTML = errortext;
		 	}
		 	
	 	}
		 
	 	
		
		
	 };
 
	 
	 /* 아이디 중복체크 */
	 $("#id").focusout(function(){
		 var id = document.getElementById('id').value;
		 var b = false;
		 
		<%
		for(int i = 0;i<list.size();i++){
			String s = list.get(i);
			%>
			var ids = '<%=s%>';
			if(id==ids){
				document.getElementById("id-ck-box").innerHTML = '<b style="color:red">중복된 아이디.</b>';
				b=true;
			}
		<%
		}
		%>
		if(id == ""){
			document.getElementById("id-ck-box").innerHTML = '<b style="color:red">아이디를 입력해주세요 </b>';
		}
		else if(b==false){
			document.getElementById("id-ck-box").innerHTML = '<b style="color:blue">가입가능 </b>';
			
		} 
	 });
		 
	

 
 </script>

<!-- 

<footer class="page-footer text-center font-small mt-4 wow fadeIn" >

 
    <hr class="my-4" style="margin: 0;">

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

    Copyright
    <div class="footer-copyright py-3">
      © 2018 Copyright:
      <a href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"> MDBootstrap.com </a>
    </div>
    /.Copyright

  </footer>
   -->
  
 




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