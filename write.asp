<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="const.asp"-->
<%
week = Datediff("ww",FirstDay,Now(),2) + 1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>write</title>
</head>

<body>
����������������������������������������
�߼���ѯ���£���������һ�Σ�
����������������������������������������
<br />
<a href="writeXML.asp?buildname=NB4&week=<%=week%>">���ĵ�<%=week%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB5&week=<%=week%>">�����<%=week%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB8&week=<%=week%>">���˵�<%=week%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB9&week=<%=week%>">���ŵ�<%=week%>��(����)����</a><br />
<a href="writeXML.asp?buildname=SB5&week=<%=week%>">�����<%=week%>��(����)����</a><br />
<a href="writeXML.asp?buildname=WB4&week=<%=week%>">���ĵ�<%=week%>��(����)����</a><br />
������������������������
<br />
<a href="writeXML.asp?buildname=NB4&week=<%=week + 1%>">���ĵ�<%=week + 1%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB5&week=<%=week + 1%>">�����<%=week + 1%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB8&week=<%=week + 1%>">���˵�<%=week + 1%>��(����)����</a><br />
<a href="writeXML.asp?buildname=NB9&week=<%=week + 1%>">���ŵ�<%=week + 1%>��(����)����</a><br />
<a href="writeXML.asp?buildname=SB5&week=<%=week + 1%>">�����<%=week + 1%>��(����)����</a><br />
<a href="writeXML.asp?buildname=WB4&week=<%=week + 1%>">���ĵ�<%=week + 1%>��(����)����</a><br />

����������������������������������������
��ҳ���ݸ��£�ÿ������һ�Σ�
����������������������������������������
<br />
<a href="writeXML2.asp?week=<%=week%>&n=0">��ҳ<%=Day(Date())%>�գ����죩���ݸ���</a><br />
������������������������
<br />
<a href="writeXML2.asp?week=<%=week%>&n=1">��ҳ<%=Day(Date()+1)%>�գ����죩���ݸ���</a><br />
</body>
</html>
