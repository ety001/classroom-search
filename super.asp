<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="func.asp"-->
<!--#include file="const.asp"-->
<%
week = Datediff("ww",FirstDay,Now()) + 1
temp = Request.QueryString("buildname")
If Mid(temp,2,1) = "B" Then buildname = temp
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>高级查询—鲁东大学自习室查询平台—Power By 鲁东大学学生网</title>
<meta name="keywords" content="鲁东大学自习室查询平台,鲁东大学,鲁东大学学生网,鲁大学生网,鲁东大学教室查询,鲁东大学空课查询" />
<meta name="description" content="鲁东大学自习室查询平台是一个方便在校学生查询某个教室某个时间的上课情况的程序。制作：ETY001 维护：鲁大网络部" />
<meta name="author" content="ETY001(http://hi.baidu.com/ety001)" />
<link href="style/style.css" type="text/css" rel="stylesheet" />
<link href="style/superstyle.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js.js"></script>
</head>
<body>
<div class="top"></div>
<div class="main">
  <div class="msg1">今天是<span> <%=Year(Date())%></span> 年<span> <%=Month(Date())%></span> 月<span> <%=Day(Date())%></span> 日&nbsp;鲁大校历 2010-2011学年第一学期 第 <span><%=week%></span> 周</div>
	<div id="msg2">最新消息：手机版自习室平台上线啦~只要手机访问：http://ety001.7z7z.info/wap</div>
  <div class="info"><strong>鲁东大学自习室查询平台</strong>是一个方便在校学生查询某个时间某个教学楼的空课教室的程序。由于有些课程或者活动可能会临时占用教室，而我们的数据来源于学期初的教务处，因此暂时无法更新临时变动的信息，请关注最新版本的发布！(备注：北4、北5等楼的多媒体教室不允许自习。)</div>
    
    <div class="title">
    	<h2>请选择你要去的教学楼</h2>
        <h4>Please Select Where You Want To</h4>
        <div class="otherlink"><a href="index.asp" target="_self">回到首页</a></div>
    </div>
    <div class="clear"></div>
    
    <div class="super_build_name"><a href="super.asp?buildname=SB5" target="_self">南区5号教学楼</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB4" target="_self">北区4号教学楼</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB5" target="_self">北区5号教学楼</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB8" target="_self">北区8号教学楼</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB9" target="_self">北区9号教学楼</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=WB4" target="_self">西区4号教学楼</a></div>
    <div class="clear" style="height:2px;"></div>
    <div class="build_info">
    	<div class="build_name"><%=ChgName(buildname,1)%></div>
        <div class="otherinfo">以下是本周该教学楼教室安排情况&nbsp;&nbsp;有课：<img src="image/1.gif"/>&nbsp;无课：<img src="image/0.gif" />&nbsp;备注：每天按照五大节来划分&nbsp;</div>
    </div>
	<div style="text-align:center;">    
	<%
	'Load XML
	set xml = Server.CreateObject("Microsoft.XMLDOM")
	xml.async = false
	xml.load(Server.MapPath("data/superxml/build_" & buildname & "_week_" & week & ".xml"))

	'Load XSL
	set xsl = Server.CreateObject("Microsoft.XMLDOM")
	xsl.async = false
	xsl.load(Server.MapPath("data/xsl/super.xsl"))

	'Transform file
	Response.Write(xml.transformNode(xsl))
	%>
	</div>
</div>
<div class="clear">
<div style="height:2px;"></div>
<hr />
<div class="bottom">
  <div>数据来源：<a href="http://www.jwc.ldu.edu.cn" target="_blank">鲁大教务处</a>&nbsp;版权所有：<a href="http://www.tw.ldu.edu.cn/st/xsh/new" target="_blank">鲁大学生网</a></div>
	<div>制作：<a href="http://www.domyself.me" target="_blank">ETY001</a>&nbsp;维护：<a href="http://www.tw.ldu.edu.cn/st/xsh/new" target="_blank">鲁大学生网</a></div>
    <div>版本信息v1.0<script src="http://s16.cnzz.com/stat.php?id=2378709&web_id=2378709&show=pic" language="JavaScript"></script></div></div>
</body>
</html>
