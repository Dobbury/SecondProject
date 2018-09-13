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
      width: 98%;
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
   .navbar-brand {
    	    background-image: url(img/logo.png);
    background-size: 100% 100%;
    width: 150px;
    height: 37px;
    margin-bottom: 5px;
    float: left;
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
	/* .scene {display: block; position: relative; width: 100%; 
	height: 100vh; background-repeat: no-repeat; background-attachment: fixed; background-size: cover;}  */

   </style>
<style type="text/css">

body {
    background: #3d516b;
}

form {
    width: 320px;
    padding: 60px 25px 45px;
    margin: 0 auto;
    background: #f8d348;
    display: flex;
    flex-direction: column;
}

svg {
    width: 70%;
    border-radius: 50%;
    background: #fff;
    margin-bottom: 40px;
    align-self: center;
    transform-style: preserve-3d;
}

input {
    font-size: 16px;
    border: 0;
    border-radius: 5px;
    outline: 0;
    padding: 10px 15px;
    margin-top: 15px;
}

@keyframes lookaway-up {
    from {
        transform: rotate3d(.2, 0, -.01, 20deg);
    }

    to {
        transform: rotate3d(.2, -.05, -.01, 20deg);
    }
}

@keyframes lookaway-down {
    0% {
        transform: rotate3d(-.2, 0, -.01, 20deg);
    }

    100% {
        transform: rotate3d(-.2, -.05, .01, 20deg);
    }
}

.ears {
    transform-origin: 50% 50% 5px;
}

.eyes {
    transform-origin: 50% 50% -40px;
}

.muzzle {
    transform-origin: 50% 50% -44px;
}

.ears, .eyes, .muzzle {
    transition: transform .5s;
}

.focused {
    transition: transform .1s;
}

.look-away .ears,
.look-away .eyes,
.look-away .muzzle {
    transition-duration: .3s;
    animation: 3s infinite alternate;
}

.look-away.up .ears,
.look-away.up .eyes,
.look-away.up .muzzle {
    transform: rotate3d(.2, 0, 0, 20deg) !important;
}

.look-away.down .ears,
.look-away.down .eyes,
.look-away.down .muzzle {
    transform: rotate3d(-.2, 0, 0, 20deg) !important;    
}

.look-away.playing.up .ears,
.look-away.playing.up .eyes,
.look-away.playing.up .muzzle {
    animation-name: lookaway-up;
}

.look-away.playing.down .ears,
.look-away.playing.down .eyes,
.look-away.playing.down .muzzle {
    animation-name: lookaway-down;
}

.btn-primary {
  color: #fff;
  background-color: #423630;
  border-color: #423630;
}

.btn-primary:hover {
  color: #fff;
  background-color: #e0a243;
  border-color: #e0a243;
}

.btn-primary:focus, .btn-primary.focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}

.btn-primary.disabled, .btn-primary:disabled {
  color: #fff;
  background-color: #424500;
  border-color: #424500;
}

.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
.show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #423630;
  border-color: #423630;
}

.btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
.show > .btn-primary.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}
</style>


</head>


<body>

<div class="header">

      <ul>
        <li class="left"><a href="#" class="navbar-brand"></a></li>
        <li class="rigth">
   <button type="button" class="btn mainbtn2" data-toggle="modal" data-target="#basicExampleModal" style="">
  로그인
</button>
         </li>
      </ul>
   </div>


<div id="fullpage">

  <div class="scene section" id="section0">
      
      <h1> About Time</h1>
      <h2> 잠들기 전 오늘 다녀온 여행지를 정리해보세요</h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   
   <div class="scene section" id="section1">
      <h1> PICK! PICK! PICK! </h1>
      <h2> FOOD PICK! VIEW PICK! HOTEL PICK!<br>세 곳 을 골라 지도에 표시해보세요 </h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   

   <div class="scene section moveDown" id="section2">
      <h1> 여행자들의 이야기 </h1>
      <h2> 다녀온 여행 명소를 여행자들과 공유해보세요 <br>이달의 명소를 통해 BEST여행후기를 볼 수 있습니다</h2>
      <button type="button" class="btn mainbtn" data-toggle="modal" data-target="#basicExampleModal">시작하기</button>
   </div>
   
</div>


<!-- Modal -->
<!-- <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="max-width: 330px;    top: 15%;">
    <div class="modal-content">
      <div class="modal-header" style="border-bottom: none">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="MemberServlet" method="post">
      <input type="hidden" name="command" value="login">
      <input type="hidden" name="page" value="1">
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
</div>	 -->

<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="max-width: 330px;    top: 10%;">
    <div class="modal-content" style="    background: #f8d348;">
   	<form action="MemberServlet" method="post">
   	<input type="hidden" name="command" value="login">
      <input type="hidden" name="page" value="1">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <input type="text" name="id"  placeholder="아이디">
        <input type="password" name="pw" placeholder="비밀번호">
         <input type="submit" class="btn btn-primary" value="로그인" style="width: 270px;display: block;margin: 0 auto;margin-top: 20px;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="signup"style=";width: 270px;display: block;margin: 0 auto;margin-top:5px">회원가입</button>
    </form>
    <script src="script.js"></script>
    </div>
  </div>
</div>	

<!-- 풀페이지 관련 스크립트 -->

   <script type="text/javascript" src="fullPage/jquery.fullPage.js"></script>
   <script type="text/javascript" src="fullPage/examples/examples.js"></script>

    <script type="text/javascript">
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
      
      /*  */
      
      (function(){

const ryan = document.querySelector('#ryan');
const face = document.querySelectorAll('.ears, .eyes, .muzzle');
const email = document.querySelector('input[type="text"]');
const password = document.querySelector('input[type="password"]');
const fauxInput = document.createElement('div');
const span = document.createElement('span');
let timer = null;

function rotate3d(x, y, z, rad) {
    const value = `rotate3d(${x}, ${y}, ${z}, ${rad}rad)`;
    for (let i=0; i < face.length; i++) {
        face[i].style.transform = value;
    }
}

function focus(event) {
    event.target.classList.add('focused');
    copyStyles(event.target);
    event.target.type === 'password' ? lookAway(event) : look(event);
}

function reset(event) {
    event.target.classList.remove('focused');
    ryan.classList.remove('playing');

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.remove('look-away', 'down', 'up');
        rotate3d(0,0,0,0);
    }, 1 );
}

function copyStyles(el) {
    const props = window.getComputedStyle(el, null);

    if ( fauxInput.parentNode === document.body ) {
        document.body.removeChild(fauxInput);
    }

    fauxInput.style.visibility = 'hidden';
    fauxInput.style.position = 'absolute';
    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';

    for(let i=0; i < props.length; i++) {
        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
            continue;
        }
        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
    }

    document.body.appendChild(fauxInput);
}

function look(event) {
    const el = event.target;
    const text = el.value.substr(0, el.selectionStart);

    span.innerText = text || '.';

    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const caretRect = span.getBoundingClientRect();
    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
    const distCaret = ryanRect.left + ryanRect.width/2 - inputRect.left - caretPos;
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;
    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
    const angle = Math.max(Math.abs(x), Math.abs(y));

    rotate3d(x/angle, y/angle, y/angle/2, angle);
}

function lookAway(event) {
    const el = event.target;
    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;

    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.add( 'playing' );
    }, 300);
}

fauxInput.appendChild(span);

email.addEventListener( 'focus', focus, false );
email.addEventListener( 'keyup', look, false );
email.addEventListener( 'click', look, false );
email.addEventListener( 'blur', reset, false );

password.addEventListener( 'focus', lookAway, false );
password.addEventListener( 'blur', reset, false );

})();
      
      
      
   </script> 

</body>
</html>