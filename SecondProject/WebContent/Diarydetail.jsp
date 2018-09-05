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
	
	
	
	memberDto dto = (memberDto) session.getAttribute("user");
	
	String loginid = dto.getId();
	JournalDto journalDto = (JournalDto) request.getAttribute("JournalDto");
   List<DiaryDto> diarylist = (List<DiaryDto>)request.getAttribute("DiaryList");
   List<DiarycommentDto> commentview = (List<DiarycommentDto>)request.getAttribute("DiarycommentDto");
   
 
  for(int i=0;i<diarylist.size();i++){
	  diarylist.get(i).toString();
  }
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

<body>

 <jsp:include page="header.jsp"></jsp:include> 



   <!-- ----------------------------------------html----------------------------------------- -->
   <!--여기서 하시면 됩니다-->
   <main style="padding-top:80px;">
   <div class="container">

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

	
      <div class="diary-m">
      <%
               for(int i=0; i<diarylist.size(); i++ ){
            %>
         <div class="diary-cont">
            <p class="diary-title"><%=diarylist.get(i).getTitle() %></p>
            <span class="diary-date"><%=diarylist.get(i).getTday() %></span>

            <div class="diary-content">
	             <%=diarylist.get(i).getContent() %>
            </div>

         </div>
         <%
               }
      %>
      </div>
      

      <div class="diary-b">

         <p class="diary-title">댓글</p>


         <div class="diary-commant">
            <div class="diary-commant"style="padding: 30px; text-align: center; background: rgb(238, 241, 246) !important;">
            
            <%
               for(int i=0; i<commentview.size(); i++ ){
            %>
            <div class="commant-view" style="margin-bottom: 20px;">
               <div class="commant-id"style="text-align: left;padding-left: 68px;padding-right: 68px;font-weight: 700;margin-bottom: 8px;display: table;width: 100%;">
               <p style="float: left;">
               <%=commentview.get(i).getId() %>
               </p>
               <p style="float: left;margin-left: 10px;font-weight: 300;font-size: 12px;margin-top: 5px;">
               <%=commentview.get(i).getDday().substring(0,16) %>
               </p>
               <form action="DiaryServlet">
               <input type="hidden" name="command" value="deletecomment">
                <input type="hidden" name="seq" value="<%=journalDto.getSeq() %>">
               <input type="hidden" name="commentseq" value="<%=commentview.get(i).getSeq() %>">
               <input type="submit" style="float: right; cursor: pointer;" value="x">
               </form>
               <%-- <span style="float: right; cursor: pointer;"  onclick="deletefuc(' <%=commentview.get(i).getSeq() %>')">x</span> --%>
               </div>
               <div class="commant-content"style="width: 88%;word-break: break-all;text-align: left; margin-left: 68px; color:#555"><%=commentview.get(i).getDcomment() %></div>
               <hr style="width: 88%;">
               
            </div>
            
            <%
               }
            %>
            
            
               <div class="commant-write">
                  <div class="commant-id"style="text-align: left; margin-left: 68px;font-weight: 700; margin-bottom: 8px;"><%=loginid %></div>
                  <form action="DiaryServlet">
                     <input type="hidden" name="command" value="commentwrite">
                     <input type="hidden" name="seq" value="<%=journalDto.getSeq() %>">
                     <input type="hidden" name="loginid" value="<%=loginid %>">
                     <textarea rows="2" cols="20" name="dcomment" style="width: 80%; height: 70px; vertical-align: text-bottom;"></textarea>
                     <input type="submit" value="댓글달기"style="vertical-align: text-bottom; height: 70px;">

                  </form>
               </div>

            </div>




         </div>

      </div>


   </div>
   </main>

   
<!-- Modal -->
<div class="modal fade" id="commantdelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
      <form action="DiaryServlet?command=commentdelet" method="post">
      <div class="modal-body" style="text-align: center;">
		<p>댓글을 삭제하시겠습니까?</p>
		<input type="button" class="btn btn-primary" value="예" onclick="deletefucsend()">
        <input type="button" class="btn btn-red" data-dismiss="modal" aria-label="Close" value="아니요" style="float: none">
      </div>
     
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
   
   /* 댓글삭제 */
   function deletefuc(seq) {
	   
	   alert('삭제되었습니다.');
	   location.href='DiaryServlet?command=deletecomment&seq='+seq
			   
		//$("#commantdelete").modal();
	   
	}
   
   function deletefucsend() {
	   location.href='DiaryServlet?command=deletecomment&seq='+seq
			  
}
   
   </script>
   
   <!-- --------------------------------------------------------------------------------- -->


<jsp:include page="footer.jsp"></jsp:include> 




</body>
</html>