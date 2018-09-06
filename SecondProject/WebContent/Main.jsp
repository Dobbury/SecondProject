<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>메인</title>

   <!-- 제이쿼리 -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   
   <!-- 풀페이지 -->
   <link rel="stylesheet" type="text/css" href="fullPage/pure javascript (Alpha)/javascript.fullPage.css" />
   <link rel="stylesheet" type="text/css" href="fullPage/examples/examples.css" />
   
   <!-- 부트스트랩 -->
   <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
   <script src="bootstrap/js/bootstrap.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>

   

</head>
<body>

   <style>

   body{
      color: #333;
      font-family: "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
   }


   /* Style for our header texts
   * --------------------------------------- */
   h1{
      font-size: 4em;
      font-family: arial,helvetica;
      margin:0;
      padding:0;
      color: #fff;
   }
   h1:after {display: block; width: 200px; margin: 20px auto;border-bottom: 1px solid #fff;}
   
   h2{
      font-size: 20px;
          margin: 40px 0 50px 0;
      color: #ffffff;
   	   opacity: 0.5;
      font-family: arial,helvetica;
   }

   /* Common styles
   * --------------------------------------- */
   .section{
      text-align:center;
      overflow:hidden;
        padding-top: 255px;
   }

   /* header */
   .header{
    position: fixed;
    top: 0;
    width: 100%;
    height: 90px;
    z-index: 10;
    background: linear-gradient(to top, transparent, rgba(0,0,0,0.6) 100%);
   }
   .header ul{
      width: 80%;
       height: 100%;
      padding: 28px 40px;
       margin: 0 auto;
       box-sizing: border-box;
   }
   .header ul .left{
      float: left;
   }
   .header ul .rigth{
      float: right;
   }
   
#fp-nav ul li, .fp-slidesNav ul li{
	    height: 36px;
	    width: 30px;
	    
}
#fp-nav ul li a span, .fp-slidesNav ul li a span{
	width: 15px;
	height: 15px;
	 background: #fff;
	 opacity: 0.7;
}
#fp-nav ul li a.active span, .fp-slidesNav ul li a.active span, #fp-nav ul li:hover a.active span, .fp-slidesNav ul li:hover a.active span{
	    height: 27px;
    width: 15px;
    margin: -9px 0px 0 -2px;
    border-radius: 27%;
}
#fp-nav ul li a.active span {
	opacity: 1;
}
   
   /* Overwriting fullPage.js tooltip color
   * --------------------------------------- */
   .fp-tooltip{
      color: #AAA;
   }
   #fp-nav span, .fp-slidesNav span{
      border-color: #fff;
   }
   #fp-nav li .active span, .fp-slidesNav .active span{
      background: #fff;
   }
	
	
	#section0{
		background-image: url('img/main_bg02.png');
		background-size: 100% 100%;
	}#section1{
		background-image: url('img/main_bg03.png');
		background-size: 100% 100%;
	}#section2{
		background-image: url('img/main_bg01.png');
		background-size: 100% 100%;
	}
	.mainbtn{
	background: darkmagenta;
    border-radius: 40px;
    margin-bottom: 17px;
    width: 180px;
    height: 50px;
    text-align: center;
    color: #ffffff;
    font-size: 16px;
    font-weight: 700;
	}
	.mainbtn2{
	font-size: 12px;
    width: 90px;
    height: 32px;
    border-radius: 20px;
    background: darkmagenta;
    color: #fff;
    
	}
	.scene {display: block; position: relative; width: 100%; 
	height: 100vh; background-repeat: no-repeat; background-attachment: fixed; background-size: cover;} */
   
	
   </style>


</head>


<body>

<div class="header">

      <ul>
        <li class="left"><a href="#">로고</a></li>
        <li class="rigth">
   <button type="button" class="btn mainbtn2" data-toggle="modal" data-target="#basicExampleModal">
  로그인
</button>
         </li>
      </ul>
   </div>




<div id="fullpage">

   <div class="scene section" id="section0">
      <h1>타이틀들어가고 </h1>
      <h2>간략한 설명이 들어가겠죠</h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   
   <div class="scene section" id="section1">
      <h1>타이틀들어가고 </h1>
      <h2>간략한 설명이 들어가겠죠</h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   

   <div class="scene section moveDown" id="section2">
      <h1>타이틀들어가고 </h1>
      <h2>간략한 설명이 들어가겠죠</h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   
</div>


<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="max-width: 330px;    top: 15%;">
    <div class="modal-content">
      <div class="modal-header" style="border-bottom: none">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="MemberServlet?command=login" method="post">
      <div class="modal-body" style="text-align: center;padding-bottom: 20px;">
	<div>
		<p style="font-size: 14px;font-weight: 700;margin-bottom: 0;margin-left: 28px;text-align: left;">아이디</p>
      <input type="text" name="id"  style="width: 240px;height: 30px;">
    </div>
    <div>
    	<p style="font-size: 14px;font-weight: 700;margin-bottom: 0;margin-left: 28px;margin-top: 10px;text-align: left;">비밀번호</p>
        <input type="password" name="pw" style="width: 240px;height: 30px;"> 
    </div>
      <div style="margin: 10px 0 10px 0">
      <input type="submit" class="btn btn-primary" value="로그인" style="width: 240px;display: block;margin: 0 auto;margin-top: 20px;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="signup"style=";width: 240px;display: block;margin: 0 auto;margin-top:5px">회원가입</button>
        </div>
        </div>
      </form>
      
    </div>
  </div>
</div>


<!-- 풀페이지 관련 스크립트 -->

   <script type="text/javascript" src="fullPage/jquery.fullPage.js"></script>
   <script type="text/javascript" src="fullPage/examples/examples.js"></script>

   <!--  <script type="text/javascript">
      $(document).ready(function() {
         $('#fullpage').fullpage({
            'verticalCentered': false,
            'css3': true,
            'sectionsColor': ['#F0F2F4', '#fff', '#fff', '#fff'],
            'navigation': true,
            'navigationPosition': 'right',
            'navigationTooltips': [],

            'afterLoad': function(anchorLink, index){
               if(index == 2){
                  $('#iphone3, #iphone2, #iphone4').addClass('active');
               }
            },

            'onLeave': function(index, nextIndex, direction){
               if (index == 3 && direction == 'down'){
                  $('.section').eq(index -1).removeClass('moveDown').addClass('moveUp');
               }
               else if(index == 3 && direction == 'up'){
                  $('.section').eq(index -1).removeClass('moveUp').addClass('moveDown');
               }

               $('#staticImg').toggleClass('active', (index == 2 && direction == 'down' ) || (index == 4 && direction == 'up'));
               $('#staticImg').toggleClass('moveDown', nextIndex == 4);
               $('#staticImg').toggleClass('moveUp', index == 4 && direction == 'up');
            }
         });
         $('#signup').click(function(){
            location.href="MemberServlet?command=signPage";
         });
      });
   </script> -->

</body>
</html>