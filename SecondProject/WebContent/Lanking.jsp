<%@page import="java.util.ArrayList"%>
<%@page import="dao.PinDao"%>
<%@page import="Impl.PinImpl"%>
<%@page import="dto.JournalDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
List<JournalDto> list = (List<JournalDto>)request.getAttribute("bjlist");
List<String[]> restolist = (List<String[]>)request.getAttribute("restolist");
List<String[]> hotellist = (List<String[]>)request.getAttribute("hotellist");
List<String[]> tourlist = (List<String[]>)request.getAttribute("tourlist");




%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="Design/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

.lankbox{
   width: 220px;
    height: 260px;
    display: inline-block;
    margin: 0 25px;
    background-color: #e8effc;
    -webkit-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
    -moz-box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
    box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
}
.lankbox_title{
   border-bottom: 1px solid;
    text-align: center;
    font-size: 18px;
    padding: 10px;
    margin-bottom: 10px;
    background-color: #334467;
    color: #fff;
    font-weight: 700;
}
.lankbox ul{
   padding: 0;
    width: 100%;
    height: 180px;
}
.lankbox li {
   margin: 5px 0;
    list-style: none;
    margin: 5px 0;
    width: 100%;
    height: 18%;
    padding-top: 7px;
        padding-left: 12px;
            text-align: left;
}

.lankbox li:hover {
   background-color:#c8d5ef;
}

.lankbox li a{
   color: #333;
    font-size: 14px;
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.lanknumber {
   width: 12px;
    display: inline-block;
    font-size: 14px;
    font-weight: 700;
    color: #999;
        margin-right: 7px;
}
.lanktext{
       font-weight: 700;
    width: 140px;
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: middle;
        font-size: 12px;
}
.lankavg{
           font-size: 12px;
    width: 30px;
    text-align: center;
    display: inline-block;
}
   main{
   background-image: url('img/bgSample12.jpg');
    background-size: 100% 100%;
    background-position: center center;
    display: block;
    position: relative;
    width: 100%;
    height: 235vh;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;

}  
.diary{
   float:none !important;
    display: inline-block !important;
    box-shadow: 10px 10px 5px -3px rgba(0,0,0,0.13);
    opacity: 0.95;
     background-color: #fff;
     border: none !important;
     margin: 60px 34px 0 33px !important;
}
.diary-heartbox {

    margin-top:11px !important;
    width: 302px !important;
    background-color: #fff;
    border: 1px solid #ccc !important;
    }



</style>


</head>
<body>
 <jsp:include page="header.jsp"></jsp:include> 
<main style="padding-top:80px;">
   <div class="container" style="      display: table;  max-width: 900px;padding-top: 30px;">
   <h2 style="font-weight: 700;
    text-align: center;
    font-size: 40px;color:#fff;">BEST Diary</h2>
     <div style="width:100%;text-align: center;  padding: 0 0 90px 0;display: table;">
         <%
         for(int i = 0; i < list.size();i++){
         %>
            <div class="diary"  >
               <a href="DiaryServlet?command=journalDetail&amp;seq=<%=list.get(i).getSeq()%>">
                  <div class="Dimage" style="">
                  	<img alt="" onerror="this.src='img/img_is_not.png'"  src="<%=list.get(i).getFisrt_Img() %>" style="width: 100%; height: 100%;">
                  </div>
                  <p class="diary-title"><%=list.get(i).getTitle()%></p>
               </a>
               <div class="diary-textbox">
               <span class="diary-id"><%=list.get(i).getId() %> 님</span>
               <span style="display: inline-block;margin: 0 5px;    color: #ccc;">|</span>
               <span class="diary-date"><%=list.get(i).getWdate() %></span>   
               
               </div>
               <div class="diary-heartbox">
               <span style="text-align: right;color: #888;font-size: 14px;">
               <span class="diary-heart"></span>
               <%=list.get(i).getLike_cnt() %>
               
               </span>
               </div>
            </div>
         <%
         }
         %>

   </div>
   
   
   </div>
   
   <div style="padding-bottom: 179px;
    width: 100%;
    /* background-image: url(img/b3.jpg); */
    margin-top: 110px;
    padding-top: 15px;
    position: absolute;
    bottom: -25px;
    background-color: rgb(0,0,0,0.3);
        padding-top: 60px;
    ">
    
    
       <h2 style="margin: 50px; color: #fff; font-weight: 700;font-size: 50px;text-align: center;">Ranking</h2>
    
    <div style="width: 820px;    text-align: center;
    margin: 0 auto;">


   <div class="lankbox">
      <div class="lankbox_title">관광지</div>
       <ul style="display: table;">
      <%
      for(int i = 0; i < tourlist.size();i++){
         if(i==5){
            break;
         }
      %>
          <li>
          <a href="PinServlet?command=pinDetail&pinname=<%=tourlist.get(i)[0]%>">
          
          <span class="lanknumber"><%=i+1%></span>
          <span class="lanktext"><%=tourlist.get(i)[0]%></span>
          <span class="lankavg"><%=tourlist.get(i)[2]%></span>
          
          </a>
          </li>
      <%
      }
      %>
       </ul>
   </div>
<div class="lankbox">
      <div class="lankbox_title">맛집</div>
       <ul style="display: table;">
      <%
      for(int i = 0; i < restolist.size();i++){
         if(i==5){
            break;
         }
      %>
          <li>
          <a href="PinServlet?command=pinDetail&pinname=<%=restolist.get(i)[0]%>">
          <span class="lanknumber"><%=i+1%></span>
          <span class="lanktext"><%=restolist.get(i)[0]%></span>
          <span class="lankavg"><%=restolist.get(i)[2]%></span>
          
          </a>
          </li>
      <%
      }
      %>
       </ul>
   </div>
   <div class="lankbox">
      <div class="lankbox_title">숙소</div>
       <ul style="display: table;">
       <%
      for(int i = 0; i < hotellist.size();i++){
         if(i==5){
            break;
         }
      %>
          <li>
          <a href="PinServlet?command=pinDetail&pinname=<%=hotellist.get(i)[0]%>">
          <span class="lanknumber"><%=i+1%></span>
          <span class="lanktext"><%=hotellist.get(i)[0]%></span>
          <span class="lankavg"><%=hotellist.get(i)[2] %></span>
          </a>
          </li>
      <%
      }
      %>
       </ul>
   </div>
   </div>
</div>
   
   </main>
<jsp:include page="footer.jsp"></jsp:include> 

</body>
</html>