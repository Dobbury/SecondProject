<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>tab example</title>
<style>
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

.Dimage {
	width: 280px;
	height: 220px;
	border: 1px solid blue;
	background-color: gray;
	margin-top: 10px;
	margin-left: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<div id="container">
		<h2>mypage sample</h2>

		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">내가 쓴 글 보기</a></li>
			<li data-tab="tab2"><a href="#">회원정보수정</a></li>
		</ul>

		<div id="tab1" class="tabcontent current">
			<h3>내가 쓴 글 보기</h3>
			<main style="padding-top:80px;">
			<div
				style="width: 100%; /* background-color: yellow */; text-align: center; padding: 20px 0 20px 0;">
				<div class="diary">
					<div class="Dimage"></div>
					<a href="">제목</a><br> <span style="text-align: right;">조회수</span>
					<span style="text-align: left">날짜</span>
				</div>
				<div class="diary"></div>
				<div class="diary"></div>
				<div class="diary"></div>
				<div class="diary"></div>
				<div class="diary"></div>
				<div class="diary"></div>
				<div class="diary"></div>

			</div>
			

			<div
				style="display: table; clear: both; width: 100%; padding: 20px 0 20px 0;">
				<button style="float: right;"></button>
			</div>
			</main>
		</div>

		<div id="tab2" class="tabcontent">
			<h3>회원정보 수정</h3>
			<p>회원정보 수정하는 칸</p>
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="id" readonly="readonly"
						value="<%-- <%=dto.getId()%> --%>" name="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="text" id="pwd" name="pwd"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" readonly="readonly"
						value="<%-- <%=dto.getName()%> --%>" name="name"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="nickname" name="nickname">
					</td>
				</tr>
				<tr>
					<td><input type="button" id="edit" value="수정완료"></td>
					<td><input type="button" name="back" value="취소"
						onclick="Mypage.jsp"></td>
				</tr>
			</table>
		</div>
	</div>


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
					location.href="Mypage.jsp";
				},
				error: function(){
					alert("에러남");
					location.href="Mypage.jsp";
				}
			});
			
		});
	});
	</script>

</body>
</html>