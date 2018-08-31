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
		font-size: 5em;
		font-family: arial,helvetica;
		margin:0;
		padding:0;
	}
	h2{
		font-size: 2em;
		margin: 0 0 18px 0;
		font-family: arial,helvetica;
	}




	/* Common styles
	* --------------------------------------- */
	.section{
		text-align:center;
		overflow:hidden;
	}

	/* header */
	.header{
		position: fixed;
		top: 0;
		width: 100%;
		height: 60px;
		background-color: #333;
		z-index: 10;
	}
	.header ul{
		width: 80%;
    	height: 100%;
    	padding: 18px 40px;
    	margin: 0 auto;
    	background-color: #fff;
    	box-sizing: border-box;
	}
	.header ul .left{
		float: left;
	}
	.header ul .rigth{
		float: right;
	}
	

	/* Section 0
	* --------------------------------------- */
	#section0{
		padding: 60px 0;
	}
	
	/* Section 1
	* --------------------------------------- */
	#section1{
		padding: 60px 0;
	}
	/* Section 2
	* --------------------------------------- */
	#section2{
		padding: 60px 0;
	}



	/* Overwriting fullPage.js tooltip color
	* --------------------------------------- */
	.fp-tooltip{
		color: #AAA;
	}
	#fp-nav span, .fp-slidesNav span{
		border-color: #AAA;
	}
	#fp-nav li .active span, .fp-slidesNav .active span{
		background: #AAA;
	}

	</style>


	

</head>
<body>

<div class="header">
		<ul>
		  <li class="left"><a href="#">로고</a></li>
		  <li class="rigth">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal">
  Launch demo modal
</button>

			</li>
		</ul>
	</div>



<div id="fullpage">

	<div class="section " id="section0">
		<h1>섹션1</h1>
		
	</div>
	
	<div class="section" id="section1">
	<h1>섹션2</h1>
		
	</div>
	

	<div class="section moveDown" id="section2">
	<h1>섹션3</h1>
		
	</div>
	
</div>


<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<!-- 풀페이지 관련 스크립트 -->

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> -->
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
				'navigationTooltips': ['fullPage.js', 'Powerful', 'Amazing', 'Simple'],

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
		});
	</script>

</body>
</html>