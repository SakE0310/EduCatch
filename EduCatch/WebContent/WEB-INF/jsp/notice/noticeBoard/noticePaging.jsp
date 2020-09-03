<%@ page contentType="text/html; charset=EUC-KR" %>

<%	
	//전달해야 할 변수	
	String	url = null;
	
	
	url = request.getParameter("url");


%>
<%	
	//페이지 네비게이션 관련 변수	
	// 한페이지에 보여질 게시물의 수
	int pagesize = 0;	
	// 그룹의 크기
	int groupsize = 0;	
	// 전체 게시물의 개수
	int totalcount = 0;	
	//현재 페이지
	int curpage = 0;	
	// 전체 페이지의 개수
	int pagecount = 0;
	
	String startDate=request.getParameter("startDate");
	String endDate=request.getParameter("endDate");
	String searchFilter=request.getParameter("searchFilter");
	String keyword=request.getParameter("keyword");
	
	pagesize = Integer.parseInt(request.getParameter("pagesize"));
	groupsize = Integer.parseInt(request.getParameter("groupsize"));
	curpage = Integer.parseInt(request.getParameter("curpage"));
	totalcount = Integer.parseInt(request.getParameter("totalcount"));
	
	System.out.println("pagesize222 >>> : " + pagesize);
	System.out.println("groupsize222 >>> : " + groupsize);
	System.out.println("curpage222 >>> : " + curpage);
	System.out.println("totalcount2222 >>> : " + totalcount);
	
	if(request.getParameter("pagesize") != null)
	{
		pagesize = Integer.parseInt(request.getParameter("pagesize"));
	}
	
	if(request.getParameter("groupsize") != null)
	{
		groupsize = Integer.parseInt(request.getParameter("groupsize"));
	}
	
	if(request.getParameter("curpage") != null)
	{
		curpage = Integer.parseInt(request.getParameter("curpage"));
	}
	
	if(request.getParameter("totalcount") != null)
	{
		totalcount = Integer.parseInt(request.getParameter("totalcount"));
	}
	
	System.out.println("pagesize >>> : " + pagesize);
	System.out.println("groupsize >>> : " + groupsize);
	System.out.println("curpage >>> : " + curpage);
	System.out.println("totalcount >>> : " + totalcount);
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	pagecount = (int)Math.ceil(totalcount / (pagesize+0.0));
	
	// 현재그룹 설정
	int curGroup = (curpage-1) / groupsize;
	int linkPage = curGroup * groupsize;
%>
<p align="right">
<%
	// 첫번째 그룹인 아닌경우
	if(curGroup > 0) {
%>
	<a href="<%=url%>?&curPage=1&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/first_btn.gif" alt="◁◁"></a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?&curPage=<%=linkPage%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/prev_btn.gif" alt="◀"></a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
<img src="/EduCatch/assets/img/pagingBtn/first_btn.gif" alt="◁◁">&nbsp;&nbsp;&nbsp;<img src="/EduCatch/assets/img/pagingBtn/prev_btn.gif" alt="◀">&nbsp;&nbsp;&nbsp;
<%
	}
	
	// 다음 링크를 위해 증가시킴
	linkPage++;
	
	int loopCount = groupsize;
	// 그룹범위내에서 페이지 링크만듬.
	while((loopCount > 0) && (linkPage <= pagecount))
	{
		if(linkPage == curpage)
		{
%>
	<strong style="color : #140C40;"><%=linkPage%></strong>
<%
		}
		else
		{
%>
	<a href="<%=url%>?curpage=<%=linkPage%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><%=linkPage%></a>&nbsp;
<%
		}
		
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	if(linkPage <= pagecount)
	{
%>
	<a href="<%=url%>?curpage=<%=linkPage%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/next_btn.gif" alt="▶"></a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curpage=<%=pagecount%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/last_btn.gif" alt="▷▷"></a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	<img src="/EduCatch/assets/img/pagingBtn/next_btn.gif" alt="▶">&nbsp;&nbsp;&nbsp;<img src="/EduCatch/assets/img/pagingBtn/last_btn.gif" alt="▷▷">&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>
