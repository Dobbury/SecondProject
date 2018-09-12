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
   request.setCharacterEncoding("utf-8");

   memberDto dto = (memberDto) session.getAttribute("user");
   int p = (int) request.getAttribute("page");
   int pagecount = (int) request.getAttribute("pagecount");
   List<JournalDto> jlist = (List<JournalDto>) request.getAttribute("jlist");

   int startPage = 0;
   int endPage = 0;
   if (p > 5) {
      startPage = p - 5;
   }
   if (pagecount < p + 5) {
      startPage = pagecount - 10;
   }
   if (pagecount < 5) {
      startPage = 0;
   }
   if (p < 6) {
      endPage = 10;
   } else {
      endPage = p + 5;
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 제이쿼리 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- SCRIPTS -->
<!-- JQuery -->
<!-- <script> -->
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
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
   background-color: white;
   padding: 6px 12px;
   color: #000000;
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

body {
   background-image: url('img/mp-bg.jpg');
   background-size: 100% 100%;
   background-position: center center;
   transition: all 40s;
   display: block;
   position: relative;
   width: 100%;
   height: 216vh;
   background-repeat: no-repeat;
   background-attachment: fixed;
   background-size: cover;
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

   <jsp:include page="header.jsp"></jsp:include>
   <br>
   <br>
   <br>
   <br>

       <div style="height: 100%; position: relative;display: table;margin: 0 auto;">


      <div id="container" class="tab-content card"
         style="background-color: #FFFAFA; padding-bottom: 50px;">


         <ul class="nav nav-tabs md-tabs nav-justified">
            <li class="nav-item" data-tab="tab1"><a class="nav-link active"
               data-toggle="tab" href="#panel1" role="tab">내가 쓴 글 보기</a></li>
            <li class="nav-item" data-tab="tab1"><a class="nav-link"
               data-toggle="tab" href="#panel2" role="tab">회원정보수정</a></li>
            <li class="nav-item" data-tab="tab1"><a class="nav-link"
               href="CalendarWrite.jsp">캘린더 보기</a></li>

         </ul>

         <div class="tab-pane fade in show active" id="panel1" role="tabpanel">


            <main style="padding-top:40px;">
            <div class="container">
               <div
                  style="width: 100%; text-align: center; padding: 0 0 20px 0; display: table;">

                  <%
                     for (int i = 0; i < jlist.size(); i++) {
                  %>
                  <div class="diary">
                     <a
                        href="DiaryServlet?command=diaryDetail&seq=<%=jlist.get(i).getSeq()%>">
                        <div class="Dimage" style="">
                           <img alt="" onerror="this.src='img/img_is_not.png'"
                              src="<%=jlist.get(i).getFisrt_Img()%>"
                              style="width: 100%; height: 100%;">
                        </div>
                        <p class="diary-title"><%=jlist.get(i).getTitle()%></p>
                     </a>
                     <div class="diary-textbox">
                        <span class="diary-id"><%=jlist.get(i).getId()%> 님</span> <span
                           style="display: inline-block; margin: 0 5px; color: #ccc;">|</span>
                        <span class="diary-date"><%=jlist.get(i).getWdate().substring(0, 10)%></span>

                     </div>
                     <div class="diary-heartbox">
                        <span style="text-align: right; color: #888; font-size: 14px;">
                           <span class="diary-heart"></span> <%=jlist.get(i).getLike_cnt()%>
                        </span>
                     </div>
                  </div>
                  <%
                     }
                  %>


               </div>

               <div style="display: inline-block;">
                  <!-- paging -->
                  <div>
                     <%
                        if (p != 1 && pagecount != 0) {
                     %>
                     <a href="./DiaryServlet?command=MypagePaging&page=<%=p - 1%>">&lt;</a>
                     <%
                        }
                     %>

                     <%
                        for (int i = startPage; i < pagecount; i++) {
                           if (i + 1 != p) {
                     %>
                     <a href="./DiaryServlet?command=MypagePaging&page=<%=i + 1%>"><%=i + 1%></a>
                     <%
                        } else {
                     %>
                     <strong><%=p%></strong>
                     <%
                        }
                           if (i + 1 == endPage) {
                              break;
                           }
                        }

                        if (p != pagecount && pagecount != 0) {
                     %>
                     <a href="./DiaryServlet?command=MypagePaging&page=<%=p + 1%>">&gt;</a>
                     <%
                        }
                     %>
                  </div>

                  <!-- // paging -->
               </div>


            </div>
         </div>
         </main>

         <div class="tab-pane fade" id="panel2" role="tabpanel">

            <table align="center">
               <tr>
                  <td>ID</td>
                  <td>
                     <div class="md-form">
                        <input type="text" id="id" readonly="readonly"
                           value="<%=dto.getId()%>" name="id" class="form-control">
                     </div>
                  </td>

                  <!-- 
                  
                  <div class="md-form">
                      <input type="text" id="form1" class="form-control">
                   <label for="form1" >Example label</label>
                  </div>
                  
                   -->
               </tr>
               <tr>
                  <td>PW</td>
                  <td>
                     <div class="md-form">
                        <input type="text" id="pw" name="pw" class="form-control">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>이름</td>
                  <td>
                     <div class="md-form">
                        <input type="text" id="name" readonly="readonly"
                           value="<%=dto.getName()%>" name="name" class="form-control">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>닉네임</td>
                  <td>
                     <div class="md-form">
                        <input type="text" id="nickname" name="nickname"
                           class="form-control">
                     </div>
                  </td>
               </tr>

            </table>
            <input type="button" class="btn btn-outline-dark" id="edit"
               value="수정완료"> <input type="button"
               class="btn btn-outline-dark" id="back" value="취소">
         </div>
         <div class="tab-pane fade" id="panel3" role="tabpanel"></div>
      </div>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>



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
      $(function() {
         $("#edit").click(function() {
            $.ajax({
               url : "MemberServlet",
               type : "get",
               data : {
                  command : "update",
                  id : $("#id").val(),
                  pw : $("#pw").val(),
                  name : $("#name").val(),
                  nick : $("#nickname").val()
               },
               success : function(data) {
                  alert(data);
                  location.href = "DiaryServlet?command=goMyPage";
               },
               error : function() {
                  alert("에러남");
                  location.href = "DiaryServlet?command=goMyPage";
               }
            });

         });
      });

      $(function() {
         $("#back").click(function() {
            location.href = "DiaryServlet?command=goMyPage";
         });
      });
   </script>

</body>
</html>