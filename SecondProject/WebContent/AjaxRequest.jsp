<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	System.out.println(request.getParameter("getUrl"));
	
	URL url = new URL(request.getParameter("getUrl").replace(" ","%20"));
	
	URLConnection connection = url.openConnection();
	connection.setRequestProperty("CONTENT-TYPE","text/html"); 
    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
    String inputLine;
    String buffer = "";
    while ((inputLine = in.readLine()) != null){
        buffer += inputLine.trim();
    }
    in.close();
    System.out.println(buffer);
	
  	out.println(buffer);  
%>