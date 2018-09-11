<%@page import="dao.DiaryDao"%>
<%@page import="Impl.DiaryImpl"%>
<%@page import="dto.DiaryDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.memberDto"%>
<%@page import="Impl.CalendarImpl"%>
<%@page import="dao.CalendarDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
%>

<html>
<head>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>site</title>
  
  <link rel="stylesheet" type="text/css" media="all" href="daterangepicker/daterangepicker.css" />
 
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>

  <script type="text/javascript" src="daterangepicker/daterangepicker.js"></script>
  

  <style type="text/css">
    /* Necessary for full page carousel*/
    html,
    body,
    header,
    .view {
      height: 100%;
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
      .days{
     border: 1px solid #ddd; 
  }
  .modalcal{
     color: #000;
  }
    
    
    button{
  background:#003458;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#003458;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #003458;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

body {
	background-image: url("img/sss3.png");
}


    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
          background: #1C2331!important;
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
		<div class="table-response">
			

		<%!
		 
		//빈문자열 여부
		public boolean nvl(String msg){
		    return msg == null || msg.trim().equals("")?true:false;
		}
		 
		//숫자 한자리를 1 > 01로 바꾸기
		public String two(String msg){
		    return msg.trim().length()<2?"0"+msg:msg.trim();
		}
		 
		//날짜 클릭하면 이동 
		public String calllist(int year, int month, int day,boolean h){
			
		    String s = "";
		    

		    String tday = year + "" + two((month+1)+"") +"" +  two((day)+"") + "";
		    System.out.println(tday);
		    if(h == false){
		    		
		    	s += "<div class='day' style='width:100px; height:100px;'>";
				s += String.format("<input type='hidden' value='CalendarServlet?command=writeDiary&tday=%s'>",tday );
			 
			  return s;	
		    }else{
		    	return tday;
		    }
		 }
		 
		//날짜 클릭하면 이동 
		public String modal_calllist(int year, int month, int day,boolean h){
					
			String s = "";
				    
			String tday = year + "" + two((month+1)+"") +"" +  two((day)+"") + "";
			
			if(h == false){
				s += "<div style='width:30px; height:30px;'>";
					  
				return s;	
			}else{
				return tday;
			}
		}
		
		// 다이어리 타이틀 뿌리기
		public String dTitle(int year, int month, int day, List<DiaryDto> list){
			DiaryImpl dao = DiaryDao.getInstance();
			
			String s = "";
			 
			String tday= calllist(year,month, day , true);
			

			for(int i=0;i<list.size();i++){			
				// list 안에는 (로그인한 사용자 , 다이어리쓴날짜)
				String today = list.get(i).getTday().replace("-", "");
				today = today.substring(0,8);
				if(today.equals(tday)){
					
					if(list.get(i).getJour_check()==0){
						s += "<div class='diary' style='width:100px; height:100px; background-color:gray;'>";
						s += "<input type='hidden' value='DiaryServlet?command=update&seq="+list.get(i).getSeq()+"'>";	//차후 수정바람
						s += String.format("%2d", day); //day를 2칸으로 다시 정정
						s += "<br>"+list.get(i).getTitle();
						s += "</div>";
					}else{
						s += "<div class='diary' style='width:100px; height:100px; background-color:black;'>";
						s += "<input type='hidden' value='DiaryServlet?command=journalUpdate&seq="+dao.getJournalSeq(list.get(i).getTday())+"'>";	//차후 수정바람
						s += String.format("%2d", day); //day를 2칸으로 다시 정정
						s += "<br>"+list.get(i).getTitle();
						s += "</div>";
					}
					
				}
		    }
			if(s == "")
				s += String.format("%2d", day); //day를 2칸으로 다시 정정
			s += "</div>";

			return s;
		}	
		
		// 다이어리 타이틀 뿌리기
		public String modal_dTitle(int year, int month, int day, List<DiaryDto> list){
					
			String s = "";
						 
			String tday= calllist(year,month, day , true);
						
			for(int i=0;i<list.size();i++){			
				// list 안에는 (로그인한 사용자 , 다이어리쓴날짜)
				String today = list.get(i).getTday().replace("-", "");
				today = today.substring(0,8);
				if(today.equals(tday)){
					
					
					if(list.get(i).getJour_check()==0){
						s += "<div style='width:30px; height:30px; background-color:gray;'>";
						s += String.format("%2d", day); //day를 2칸으로 다시 정정
						s += "</div>";
					}else{
						s += "<div style='width:30px; height:30px; background-color:black;'>";
						s += String.format("%2d", day); //day를 2칸으로 다시 정정
						s += "</div>";
					}
				}
			}
			if(s == "")
				s += String.format("%2d", day); //day를 2칸으로 다시 정정
			s += "</div>";
			return s;
		}	
		%>
		 
		<%
		 
		Calendar cal = Calendar.getInstance();
		 
		//연도 받아오기 
		//달 받아오기  0부터 시작함 
		int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
		int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
		 
		cal.set(year, month, 1); //연 월 일 세팅!
		
		 
		//다음/이전월 계산
		    int prevYear = year;
		    int nextYear = year;
		    
		    int prevMonth = (month + 1) - 1;
		      int nextMonth = (month  + 1) + 1;
		 
		    if (prevMonth < 1) {
		        prevYear--;
		        prevMonth = 12;
		    }
		 
		    // 12월인 경우 다음년 1월로 지정
		    if (nextMonth > 12) {
		        nextYear++;
		        nextMonth = 1;
		    }   
		 
		     // <<
		    String pp = String.format("<a href='%s?year=%d&month=%d'> </a>",
		                                "CalendarWrite.jsp", year-1, month);
		    // <
		    String p = String.format("<a href='%s?year=%d&month=%d'> </a>",
		                                "CalendarWrite.jsp", year, month-1);
		    
		    // >
		    String n = String.format("<a href='%s?year=%d&month=%d'> </a>",
		                            "CalendarWrite.jsp", year, month+1);
		    // >>
		    String nn = String.format("<a href='%s?year=%d&month=%d'> </a>",
		                            "CalendarWrite.jsp", year+1, month);
		    
		 
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //요일 구하기 (1~7)
		System.out.println("확인용 날짜 : " + year+"년 "+ month+" 월");
		 
		
		//로그인한 사람의 id
		memberDto dto = (memberDto)request.getSession().getAttribute("user");   //뉴스피드 --서블릿 -- 캘린더write
		System.out.println("로그인한 사람의 id 확인" +dto.getId()); 
		 
		 
		//caledar list
		CalendarImpl cdao = CalendarDao.getInstance();
	
		boolean b = true;
		String tday = calllist(year	,month,1,b);		
		System.out.println("tday는 : " + tday);
				
		List<DiaryDto> list = cdao.getCalList(dto.getId());
		System.out.println("List<CalendarDto> list 는 : " + list);  
		%>
		 
		
		
		 
		<div align="center">
		 
		<table class="table" style="font-size: 15pt;">
		<!-- 너비 -->
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		<col width="100">
		 
		      <tr height="70" align="center">
               <td>
                  <a href="CalendarWrite.jsp?y=<%=prevYear%>&m=<%=prevMonth%>"><img src='img/cal_left.png'></a> 
               </td>
              <td align="center" colspan="5">
                <h1>  
                <% 
                       String MONTH="";
                      
                      if( month+1 == 1){
                          MONTH = "JANUARY";
                      }else if( month+1 == 2){
                         
                         MONTH = "FEBRUARY";
                      }else if( month+1 == 3){
                         MONTH = "MARCH";
                      }else if( month+1 == 4){
                         MONTH = "APRIL";
                      }else if( month+1 == 5){
                         MONTH = "MAY";
                      }else if( month+1 == 6){
                         MONTH = "JUNE";
                      }else if( month+1 == 7){
                         MONTH = "JULY";
                      }else if( month+1 == 8){
                         MONTH = "AUGUST";
                      }else if( month+1 == 9){
                         MONTH = "SEPTEMBER";
                      }else if( month+1 == 10){
                         MONTH = "OCTOBER";
                      }else if( month+1 == 11){
                         MONTH = "NOVEMBER";
                      }else if( month+1 == 12){
                         MONTH = "DECEMBER";
                      }

                   %>
                   <%=MONTH %>
                      
                </h1><br> 
            <H3><%=year%></H3><br> 
              </td>
             <td>
                  <a href="CalendarWrite.jsp?y=<%=nextYear%>&m=<%=nextMonth%>"><img src='img/cal_right.png'></a>
               </td>
          </tr>
           
         

		 
          <tr height="50" style="background-color: #acb5c4; border-bottom: 2px solid #003458" >
              <td align="center">SUN</td>
              <td align="center">MON</td>
              <td align="center">TUE</td>
              <td align="center">WEN</td>
              <td align="center">THU</td>
              <td align="center">FRI</td>
              <td align="center">SAT</td>
          </tr>
          

		    
		    <tr height="100" align="left" valign="top">
		        <%
		            //빈칸 구하는 공식 (월 빈칸)     >> 시작 요일까지 이동
		            for(int i=1; i<dayOfWeek; i++){
		                %>
		                    <td>&nbsp;</td>
		                <%
		            }
		        
		        
		            //그 달의 최대 일자
		            int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		            System.out.println("최대 일자 : " + lastDay);
		            
		            //해당 날짜의 모든 일정을 보이게
		            for(int i=1; i<lastDay+1; i++){
		                
		                %>
		                    <td><!-- 날짜 뿌리기 -->
		                        <%=calllist(year, month, i ,false) %>		                    

		                   
		                   		<!-- 다이어리 타이틀 뿌리기-->		                   				                   		
		                   		<%=dTitle(year, month, i, list) %>
		                   				                   

		                    </td>
		                    
		                <%
		                
		                if((i+dayOfWeek-1)%7==0){
		                    %>
		                        </tr>
		                        <tr height="100" align="left" valign="top">
		                    <%
		                }
		            }
		            
		            for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){
		                %>
		                    <td>&nbsp;</td>
		                <%
		            }
		        %>
		    </tr>
		 
		</table>
  
  	
	    
		<!-- Buttons -->
		<button type="button" data-toggle="modal" data-target="#jourAdd">일정 추가</button>
			<!-- Modal -->
			<div class="modal fade" id="jourAdd" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">일정 추가</h4>
						</div>
						<div class="modal-body">
							
							<div class="container">
							<%							 
							    if (prevMonth < 1) {
							        prevYear--;
							        prevMonth = 12;
							    }
							 
							    // 12월인 경우 다음년 1월로 지정
							    if (nextMonth > 12) {
							        nextYear++;
							        nextMonth = 1;
							    }   					
							%>
				
							<div align="center">			 
							<table>
							<!-- 너비 -->
							<col width="30">
							<col width="30">
							<col width="30">
							<col width="30">
							<col width="30">
							<col width="30">
							<col width="30">
							 
							   
                         <tr align="center">
                             <td align="center" colspan="7" class="modalcal">
                                 
                                 
                                 <% 
                                   String MONTH2="";
                                  
                                  if( month+1 == 1){
                                      MONTH2 = "JANUARY";
                                  }else if( month+1 == 2){
                                     
                                     MONTH2 = "FEBRUARY";
                                  }else if( month+1 == 3){
                                     MONTH2 = "MARCH";
                                  }else if( month+1 == 4){
                                     MONTH2 = "APRIL";
                                  }else if( month+1 == 5){
                                     MONTH2 = "MAY";
                                  }else if( month+1 == 6){
                                     MONTH2 = "JUNE";
                                  }else if( month+1 == 7){
                                     MONTH2 = "JULY";
                                  }else if( month+1 == 8){
                                     MONTH2 = "AUGUST";
                                  }else if( month+1 == 9){
                                     MONTH2 = "SEPTEMBER";
                                  }else if( month+1 == 10){
                                     MONTH2 = "OCTOBER";
                                  }else if( month+1 == 11){
                                     MONTH2 = "NOVEMBER";
                                  }else if( month+1 == 12){
                                     MONTH2 = "DECEMBER";
                                  }

                                  %>
                                  <%=MONTH2 %>
                                  &nbsp;
                                <%=year%> 
                             </td>
                         </tr>

							    <tr height="15">
                             <td align="center">S</td>
                             <td align="center">M</td>
                             <td align="center">T</td>
                             <td align="center">W</td>
                             <td align="center">T</td>
                             <td align="center">F</td>
                             <td align="center">S</td>
                         </tr>

							    
							    <tr height="30" align="left" valign="top">
							        <%
							            //빈칸 구하는 공식 (월 빈칸)     >> 시작 요일까지 이동
							            for(int i=1; i<dayOfWeek; i++){
							                %>
							                    <td>&nbsp;</td>
							                <%
							            }
							        
							            //해당 날짜의 모든 일정을 보이게
							            for(int i=1; i<lastDay+1; i++){   
							                %>
							                    <td><!-- 날짜 뿌리기 -->
							                        <%=modal_calllist(year, month, i ,false) %>		                    
							                   
							                   		<!-- 다이어리 타이틀 뿌리기-->		                   				                   		
							                   		<%=modal_dTitle(year, month, i, list) %>        
							                    </td>
							                <%
							                if((i+dayOfWeek-1)%7==0){
							                    %>
							                        </tr>
							                        <tr height="10" align="left" valign="top">
							                    <%
							                }
							            }
							            
							            for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){
							                %>
							                    <td>&nbsp;</td>
							                <%
							            }
							        %>
							    </tr>
							 
							</table>
							
							
							<br>
							<p align="left">일정 선택</p>
							<div>
								<input type="text" name="daterange"
									value="<%=month+1 %>/01/<%=year %> - <%=month+1 %>/01/<%=year %>" style="width: 100%"
									align="middle" />
							</div>
							<br>
							<p align="left">제목</p>
							<div>
								<input type="text" id="title" style="width: 100%" />
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="jourAddBtn">Add</button>
						</div>
					</div>

				</div>
			</div>
			</div>


			<button type="button" onclick="myfunc()" > 취소 </button>
		 <script type="text/javascript">
	    function myfunc() {
	    	location.href = "Newspeed.jsp";
	    }  
		</script> 


	
 <script type="text/javascript">
		
		$(function() {
		   $('input[name="daterange"]').daterangepicker({
		     opens: 'right'
		   }, function(start, end, label) {
		     console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		   });
		   
		   
		});
		
		$("#jourAddBtn").click(function () {
			var date=$('input[name="daterange"]').val();
			var dates =date.split(" - ");
			var s_date = dates[0].split("/");
			var e_date = dates[1].split("/");
			var start_date = s_date[2]+s_date[0]+s_date[1];
			var end_date = e_date[2]+e_date[0]+e_date[1];
			
			
			$.ajax({
				url:"DiaryServlet",
				data:{
					command: "jourInsert",
					startdate: start_date,
					enddate: end_date,
					title: $("#title").val()
				},
				type:"GET",
				datatype:"json",
				success:function(data){
					if(data=="cntfalse"){
						alert("일정을 잘못선택했거나 중간에 일지를 작성하지 않은 날짜가 있습니다. 확인하고 다시 시도해 주세요.");
					}else if(data=="checkfalse"){
						alert("이미 등록된 일정이 포함되어 있습니다. 확인하고 다시 시도해 주세요.");
					}else{
						alert("일정 추가 성공!");
						location.href="Newspeed.jsp?page=1";
					}
				},
				error:function(){
					
				}
			});
		});
		
		$(function () {
			$(".day").click(function () {
				//diary 클래스를 가지고 잇는 요소가 있는지 없는지 판단.
				if($(this).children('.diary').length){
					alert($(this).children('.diary').children('input').val());
					location.href = $(this).children('.diary').children('input').val();
				}else{
					//alert($(this).children('input').val());
					location.href = $(this).children('input').val();
					
				}
			});
		});
	</script>
  
    </div>
</main>

<jsp:include page="footer.jsp"></jsp:include> 


  <!-- SCRIPTS -->
  
 
  
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