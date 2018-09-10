<%@page import="dto.JournalDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.DiarycommentDto"%>
<%@page import="dto.memberDto"%>
<%@page import="dto.DiaryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
   request.setCharacterEncoding("utf-8");
   
   
   memberDto dto = (memberDto) session.getAttribute("user");
   
   String loginid = dto.getId();
   
	DiaryDto Ddto =(DiaryDto)request.getAttribute("diary");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>site</title>


<style type="text/css">
/* Necessary for full page carousel*/
html, body, header, .view {
   height: 100%;
}

.container {
   display: table;
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

.diary-t {
   display: table;
   margin-top: 40px;
}

.diary-t div {
   width: 50%;
   display: table;
}

.diary-t div img {
   width: 100%;
}

.diary-t .map {
   float: left;
}

.diary-t .calendar {
   float: right;
}

.diary-cont .diary-title {
   display: inline-block;
   font-size: 28px;
   margin-right: 5px;
}

.diary-b {
   margin-top: 40px;
}

.diary-b .diary-title {
   display: inline-block;
   font-size: 28px;
   margin-right: 5px;
}

@media ( min-width : 800px) and (max-width: 850px) {
   .navbar:not (.top-nav-collapse ) {
      background: #1C2331 !important;
   }
}
</style>
</head>

<body style="    background-color: #e9e9e9e9;" >

 <jsp:include page="header.jsp"></jsp:include> 



   <!-- ----------------------------------------html----------------------------------------- -->
   <!--여기서 하시면 됩니다-->
   <main style="padding-top:80px;">
   <div class="container" style="    max-width: 900px;">

      <div class="diary-t">
         <!-- 지도영역 -->
         <div class="map">
            <p>지도</p>
            <!-- <img alt="" src="img/005.jpg"> -->
         </div>
         <!-- 달력영역 -->
         <div class="calendar">
            <p>달력</p>
            <!-- <img alt="" src="img/lt04014209.png"> -->
         </div>
      </div>
      
      
   <div style="   padding: 40px;
    background-color: #fff;
       -webkit-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
-moz-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);">
   
   
      <div class="diary-m">
         <div class="diary-cont">
            <p class="diary-title"><%=Ddto.getTitle() %></p>
            <span class="diary-date" style="color:#555"><%=Ddto.getTday().substring(0,11) %></span>
            <hr>
            

            <div class="diary-content" style="word-break: break-all;">
                <%=Ddto.getContent() %>
            </div>

         </div>
  
      </div>
	</div>





	</div>

 
   </main>


   

<script type="text/javascript">
   
 

   
</script>
   
   <!-- --------------------------------------------------------------------------------- -->


<jsp:include page="footer.jsp"></jsp:include> 




</body>
</html>