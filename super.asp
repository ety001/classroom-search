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
<title>�߼���ѯ��³����ѧ��ϰ�Ҳ�ѯƽ̨��Power By ³����ѧѧ����</title>
<meta name="keywords" content="³����ѧ��ϰ�Ҳ�ѯƽ̨,³����ѧ,³����ѧѧ����,³��ѧ����,³����ѧ���Ҳ�ѯ,³����ѧ�տβ�ѯ" />
<meta name="description" content="³����ѧ��ϰ�Ҳ�ѯƽ̨��һ��������Уѧ����ѯĳ������ĳ��ʱ����Ͽ�����ĳ���������ETY001 ά����³�����粿" />
<meta name="author" content="ETY001(http://hi.baidu.com/ety001)" />
<link href="style/style.css" type="text/css" rel="stylesheet" />
<link href="style/superstyle.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js.js"></script>
</head>
<body>
<div class="top"></div>
<div class="main">
  <div class="msg1">������<span> <%=Year(Date())%></span> ��<span> <%=Month(Date())%></span> ��<span> <%=Day(Date())%></span> ��&nbsp;³��У�� 2010-2011ѧ���һѧ�� �� <span><%=week%></span> ��</div>
	<div id="msg2">������Ϣ���ֻ�����ϰ��ƽ̨������~ֻҪ�ֻ����ʣ�http://ety001.7z7z.info/wap</div>
  <div class="info"><strong>³����ѧ��ϰ�Ҳ�ѯƽ̨</strong>��һ��������Уѧ����ѯĳ��ʱ��ĳ����ѧ¥�Ŀտν��ҵĳ���������Щ�γ̻��߻���ܻ���ʱռ�ý��ң������ǵ�������Դ��ѧ�ڳ��Ľ��񴦣������ʱ�޷�������ʱ�䶯����Ϣ�����ע���°汾�ķ�����(��ע����4����5��¥�Ķ�ý����Ҳ�������ϰ��)</div>
    
    <div class="title">
    	<h2>��ѡ����Ҫȥ�Ľ�ѧ¥</h2>
        <h4>Please Select Where You Want To</h4>
        <div class="otherlink"><a href="index.asp" target="_self">�ص���ҳ</a></div>
    </div>
    <div class="clear"></div>
    
    <div class="super_build_name"><a href="super.asp?buildname=SB5" target="_self">����5�Ž�ѧ¥</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB4" target="_self">����4�Ž�ѧ¥</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB5" target="_self">����5�Ž�ѧ¥</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB8" target="_self">����8�Ž�ѧ¥</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=NB9" target="_self">����9�Ž�ѧ¥</a></div>
    <div class="super_build_name"><a href="super.asp?buildname=WB4" target="_self">����4�Ž�ѧ¥</a></div>
    <div class="clear" style="height:2px;"></div>
    <div class="build_info">
    	<div class="build_name"><%=ChgName(buildname,1)%></div>
        <div class="otherinfo">�����Ǳ��ܸý�ѧ¥���Ұ������&nbsp;&nbsp;�пΣ�<img src="image/1.gif"/>&nbsp;�޿Σ�<img src="image/0.gif" />&nbsp;��ע��ÿ�찴������������&nbsp;</div>
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
  <div>������Դ��<a href="http://www.jwc.ldu.edu.cn" target="_blank">³�����</a>&nbsp;��Ȩ���У�<a href="http://www.tw.ldu.edu.cn/st/xsh/new" target="_blank">³��ѧ����</a></div>
	<div>������<a href="http://www.domyself.me" target="_blank">ETY001</a>&nbsp;ά����<a href="http://www.tw.ldu.edu.cn/st/xsh/new" target="_blank">³��ѧ����</a></div>
    <div>�汾��Ϣv1.0<script src="http://s16.cnzz.com/stat.php?id=2378709&web_id=2378709&show=pic" language="JavaScript"></script></div></div>
</body>
</html>
