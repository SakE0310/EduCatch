<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//전달해야 할 변수	
	String	url = null;
	
	url = request.getParameter("url");
	
%>
<%	
	//페이지 네비게이션 관련 변수	
	// 한페이지에 보여질 게시물의 수
	int pageSize = 0;	
	// 그룹의 크기
	int groupSize = 0;	
	// 전체 게시물의 개수
	int totalCount = 0;	
	//현재 페이지
	int curPage = 0;	
	// 전체 페이지의 개수
	int pageCount = 0;
	
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String keyword = request.getParameter("keyword");
	String searchFilter = request.getParameter("searchFilter");
	
	if(request.getParameter("pageSize") != null)
	{
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	
	if(request.getParameter("groupSize") != null)
	{
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
	}
	
	if(request.getParameter("curPage") != null)
	{
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
	
	if(request.getParameter("totalCount") != null)
	{
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
	}
	
	System.out.println("pageSize >>> : " + pageSize);
	System.out.println("groupSize >>> : " + groupSize);
	System.out.println("curPage >>> : " + curPage);
	System.out.println("totalCount >>> : " + totalCount);

	System.out.println("startDate >>> : " + startDate);
	System.out.println("endDate >>> : " + endDate);
	System.out.println("keyword >>> : " + keyword);
	System.out.println("searchFilter >>> : " + searchFilter);
	
	
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	pageCount = (int)Math.ceil(totalCount /(pageSize+0.0));
	
	// 현재그룹 설정
	int curGroup = (curPage-1) / groupSize;
	int linkPage = curGroup * groupSize;
%>
<p align="right">
<%
	// 첫번째 그룹인 아닌경우
	if(curGroup > 0) {
%>
	<a href="<%=url%>?curPage=1&pno=P001&startDate=<%=startDate%>&endDate=<%=endDate%>&searchFilter=<%=searchFilter%>&keyword=<%=keyword%>">◁◁</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curPage=<%=linkPage%>&pno=P001&startDate=<%=startDate%>&endDate=<%=endDate%>&searchFilter=<%=searchFilter%>&keyword=<%=keyword%>">◀</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
◁◁&nbsp;&nbsp;&nbsp;◀&nbsp;&nbsp;&nbsp;
<%
	}
	
	// 다음 링크를 위해 증가시킴
	linkPage++;
	
	int loopCount = groupSize;
	// 그룹범위내에서 페이지 링크만듬.
	while((loopCount > 0) && (linkPage <= pageCount))
	{
		if(linkPage == curPage)
		{
%>
	<%=linkPage%>
<%
		}
		else
		{
%>
<!-- 2번 페이지를 누를 경우 이 경로로 넘어간다 /testServlet/lmc?ISUD_TYPE=SALL&curPage=2 
2번페이지를 누른다고 가정하면 쿼리스트링 curPage는 2와 SALL을 가지고 controller에 SALL로 이동-->
	[<a href="<%=url%>?curPage=<%=linkPage%>&pno=P001&startDate=<%=startDate%>&endDate=<%=endDate%>&searchFilter=<%=searchFilter%>&keyword=<%=keyword%>" style="color:black;"><%=linkPage%></a>]&nbsp;
<%
		}
		
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	if(linkPage <= pageCount)
	{
%>
<!-- 여기서 curPage의 값은 controller에서 getParameter로 받는다. -->
	<a href="<%=url%>?curPage=<%=linkPage%>&pno=P001&startDate=<%=startDate%>&endDate=<%=endDate%>&searchFilter=<%=searchFilter%>&keyword=<%=keyword%>">▶</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curPage=<%=pageCount%>&pno=P001&startDate=<%=startDate%>&endDate=<%=endDate%>&searchFilter=<%=searchFilter%>&keyword=<%=keyword%>">▷▷</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	▶&nbsp;&nbsp;&nbsp;▷▷&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>
