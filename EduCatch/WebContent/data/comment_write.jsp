<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Calendar" %>
<%
	request.setCharacterEncoding("UTF-8");
	String user_name = request.getParameter("user_name");
	String comment = request.getParameter("comment");
	
	user_name = new String(user_name.getBytes("ISO-8859-1"), "UTF-8");
	comment = new String(comment.getBytes("ISO-8859-1"), "UTF-8");
	
	String datetime = "2019-11-30 13:00:30";
	int num = 4;
	boolean result = true;
	String message = "덧글이 등록되었습니다.";
%>
<?xml version='1.0' encoding='UTF-8'?>
<comment>
	<result><%=user_name%></result>
	<message><%=message%></message>
	<item>
		<num><%=num%></num>
		<writer><![CDATA[<%=user_name%>]]></writer>
		<content><![CDATA[<%=comment%>]]></content>
		<datetime><![CDATA[<%=datetime%>]]></datetime>
	</item>
</comment>