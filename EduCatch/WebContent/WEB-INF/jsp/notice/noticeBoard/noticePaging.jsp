<%@ page contentType="text/html; charset=EUC-KR" %>

<%	
	//�����ؾ� �� ����	
	String	url = null;
	
	
	url = request.getParameter("url");


%>
<%	
	//������ �׺���̼� ���� ����	
	// ���������� ������ �Խù��� ��
	int pagesize = 0;	
	// �׷��� ũ��
	int groupsize = 0;	
	// ��ü �Խù��� ����
	int totalcount = 0;	
	//���� ������
	int curpage = 0;	
	// ��ü �������� ����
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
	
	// ��ü�Խù����� ������ũ�⸦ ������ ��ü ������ ������ �����.
	// �Ҽ����� ���� ������ ������ ������ �Ѱ���.
	pagecount = (int)Math.ceil(totalcount / (pagesize+0.0));
	
	// ����׷� ����
	int curGroup = (curpage-1) / groupsize;
	int linkPage = curGroup * groupsize;
%>
<p align="right">
<%
	// ù��° �׷��� �ƴѰ��
	if(curGroup > 0) {
%>
	<a href="<%=url%>?&curPage=1&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/first_btn.gif" alt="����"></a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?&curPage=<%=linkPage%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/prev_btn.gif" alt="��"></a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
<img src="/EduCatch/assets/img/pagingBtn/first_btn.gif" alt="����">&nbsp;&nbsp;&nbsp;<img src="/EduCatch/assets/img/pagingBtn/prev_btn.gif" alt="��">&nbsp;&nbsp;&nbsp;
<%
	}
	
	// ���� ��ũ�� ���� ������Ŵ
	linkPage++;
	
	int loopCount = groupsize;
	// �׷���������� ������ ��ũ����.
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
	
	// �����׷��� �ִ� ���
	if(linkPage <= pagecount)
	{
%>
	<a href="<%=url%>?curpage=<%=linkPage%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/next_btn.gif" alt="��"></a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curpage=<%=pagecount%>&searchFilter=<%=searchFilter %>&keyword=<%=keyword %>&startDate=<%= startDate%>&endDate=<%=endDate%>"><img src="/EduCatch/assets/img/pagingBtn/last_btn.gif" alt="����"></a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	<img src="/EduCatch/assets/img/pagingBtn/next_btn.gif" alt="��">&nbsp;&nbsp;&nbsp;<img src="/EduCatch/assets/img/pagingBtn/last_btn.gif" alt="����">&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>
