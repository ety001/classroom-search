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
————————————————————
高级查询更新（周日运行一次）
————————————————————
<br />
<a href="writeXML.asp?buildname=NB4&week=<%=week%>">北四第<%=week%>周(本周)更新</a><br />
<a href="writeXML.asp?buildname=NB5&week=<%=week%>">北五第<%=week%>周(本周)更新</a><br />
<a href="writeXML.asp?buildname=NB8&week=<%=week%>">北八第<%=week%>周(本周)更新</a><br />
<a href="writeXML.asp?buildname=NB9&week=<%=week%>">北九第<%=week%>周(本周)更新</a><br />
<a href="writeXML.asp?buildname=SB5&week=<%=week%>">南五第<%=week%>周(本周)更新</a><br />
<a href="writeXML.asp?buildname=WB4&week=<%=week%>">西四第<%=week%>周(本周)更新</a><br />
————————————
<br />
<a href="writeXML.asp?buildname=NB4&week=<%=week + 1%>">北四第<%=week + 1%>周(下周)更新</a><br />
<a href="writeXML.asp?buildname=NB5&week=<%=week + 1%>">北五第<%=week + 1%>周(下周)更新</a><br />
<a href="writeXML.asp?buildname=NB8&week=<%=week + 1%>">北八第<%=week + 1%>周(下周)更新</a><br />
<a href="writeXML.asp?buildname=NB9&week=<%=week + 1%>">北九第<%=week + 1%>周(下周)更新</a><br />
<a href="writeXML.asp?buildname=SB5&week=<%=week + 1%>">南五第<%=week + 1%>周(下周)更新</a><br />
<a href="writeXML.asp?buildname=WB4&week=<%=week + 1%>">西四第<%=week + 1%>周(下周)更新</a><br />

————————————————————
首页数据更新（每天运行一次）
————————————————————
<br />
<a href="writeXML2.asp?week=<%=week%>&n=0">首页<%=Day(Date())%>日（今天）数据更新</a><br />
————————————
<br />
<a href="writeXML2.asp?week=<%=week%>&n=1">首页<%=Day(Date()+1)%>日（明天）数据更新</a><br />
</body>
</html>
