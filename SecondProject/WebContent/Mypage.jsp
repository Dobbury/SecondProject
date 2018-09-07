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
   memberDto dto  = (memberDto)session.getAttribute("user");
   
   DiaryImpl dDao = DiaryDao.getInstance();

   List<JournalDto> jlist = dDao.myJournalList(dto.getId());
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




@media ( min-width : 800px) and (max-width: 850px) {
   .navbar
   :not
    
   (
   .top-nav-collapse
    
   )
   {
   background
   :
    
   #1C2331
    
   !
   important
   ;
   
   
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
         <li><a href="Newspeed.jsp">뉴스피드</a></li>
         <li><a href="#">마이페이지</a></li>
      </ul>

   </div>
   </nav>

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
            style="display: table; clear: both; width: 100%; padding: 20px 0 20px 0;">
            <button style="top: left;" onclick="gocal()">캘린더 보기</button>
         </div>
         <div
            style="width: 100%; text-align: center; padding: 0 0 20px 0; display: table;">
        <%
        for(int i=0;i<jlist.size();i++){
        	%>
        	<div class="diary" style="width: 300px; height: 300px; text-align: center;
        	vertical-align: top; float: left; margin: 30px 34px 0 33px; border: none">
        	<a href="DiaryServlet?command=diaryDetail&seq=<%=jlist.get(i).getSeq()%>">
        	<div class="Diamage" style="border: none"></div>
        	<p style="margin-top: 10px; margin-bottom: 5px; color: #111; font-weight: 700;"><%=jlist.get(i).getTitle()%></p>
        	</a>
        	<span style="text-align: right; color: #888; font-size: 14px;">ㅈㅎㅅ</span>
        	<span style="text-align: left; color: #888;font-size: 14px;"><%=jlist.get(i).getWdate().substring(0, 10)%></span>
        	</div>
        	<%
        }
        %>
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
   </div>

	<script type="text/javascript">
	function gocal() {
		location.href="CalendarWrite.jsp";
	}
	</script>

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
               pw : $("#pw").val(),
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
   
   $(function () {
	$("#back").click(function () {
		location.href="Mypage.jsp";
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