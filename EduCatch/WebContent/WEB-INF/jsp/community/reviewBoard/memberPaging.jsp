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
	
	
	String updatedate=request.getParameter("updatedate");

	
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
	<a href="<%=url%>?&curPage=1&updatedate=<%= updatedate%>">����</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?&curPage=<%=linkPage%>&updatedate=<%= updatedate%>">��</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
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
	<%=linkPage%>
<%
		}
		else
		{
%>
	[<a href="<%=url%>?curpage=<%=linkPage%>&updatedate=<%= updatedate%>"><%=linkPage%></a>]&nbsp;
<%
		}
		
		linkPage++;
		loopCount--;
	}
	
	// �����׷��� �ִ� ���
	if(linkPage <= pagecount)
	{
%>
	<a href="<%=url%>?curpage=<%=linkPage%>&updatedate=<%= updatedate%>">��</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curpage=<%=pagecount%>&updatedate=<%= updatedate%>">����</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>