<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
build_temp = Request.QueryString("buildname")	'��ȡ��ѧ¥
tt = CInt(Request.QueryString("week"))	'��ȡ�ܣ����ҶԻ�ȡ���ݽ��й���
If Mid(build_temp,2,1) = "B" Then
	building = build_temp
Else
	response.Write("Wrong Building Name!")
	response.End
End If
If tt >0 and tt < 20 Then
	week = tt
Else
	response.Write("Wrong Week Number!")
	response.End
End If
'��������������������������������������������������֤����
Dim Classroom(99,1)	'��һάÿ����ѧ¥��������(100)���ڶ�ά�ǽ�����Ϣ(2)
Set rsClass = Server.CreateObject("ADODB.RecordSet")
sqlStr1 = "select * from " & building		'��ȡ��ǰ��ѧ¥�����н��Ҽ�������Ϣ
rsClass.open sqlStr1,conn,1,1
i = 0
Do While Not rsClass.eof
	Classroom(i,0) = rsClass("classroom")
	Classroom(i,1) = rsClass("info")
	rsClass.movenext
	i = i + 1	
Loop
rsClass.close
Set rsClass = nothing

Dim Course(99,6,4)	'��һά����ǰ��ѧ¥�Ľ��ң��ڶ�ά�����ܼ�������ά����ڼ���
For i = 0 to Ubound(Classroom,1)	'��ȡÿ����ѧ¥ÿ������ָ���ܵ��Ͽ����
	If Classroom(i,0) <> "" Then	'��Ϊÿ����ѧ¥�Ľ�����С��100�������ԣ������ڽ������ݴ洢ʱ���洢����������
		Set rsInfo = Server.CreateObject("ADODB.RecordSet")
		sql = "select * from " & Classroom(i,0) & " where id=" & week
		rsInfo.open sql,conn,1,1
		For s = asc("A") to asc("G")
			For ss = 0 to 4
				Course(i,s-65,ss) = rsInfo(chr(s) & ss+1)
			Next
		Next
		rsInfo.close
	End If
Next

Set rsInfo = nothing
conn.close
Set conn = nothing

XmlFileName = "build_" & building & "_week_" & week & ".xml"
XmlFilePath = Server.MapPath("data/superxml/" & XmlFileName)
Set FSO = CreateObject("Scripting.FileSystemObject") 
Set MyFile = FSO.CreateTextFile(XmlFilePath,True)

MyFile.WriteLine("<?xml version=""1.0"" encoding=""gb2312""?>") 
MyFile.WriteLine("<build>")
For i = 0 to Ubound(Classroom,1)
	If Classroom(i,0) <> "" Then
		MyFile.WriteLine("<room>")
		MyFile.WriteLine("<roomname>" & Mid(Classroom(i,0),5) & "</roomname>")
		MyFile.WriteLine("<roominfo>" & Classroom(i,1) & "</roominfo>")
		id = 1
		For s = asc("A") to asc("G")
			For ss = 0 to 4
				MyFile.WriteLine("<course name = '" & chr(s) & ss+1 & "'>")
				MyFile.WriteLine("<id>" & id & "</id>")
				id = id + 1
				MyFile.WriteLine("<value>" & Course(i,s-65,ss) & "</value>")
				MyFile.WriteLine("</course>")
			Next
		Next
		
		MyFile.WriteLine("</room>")
	End If
Next
MyFile.WriteLine("</build>")
MyFile.Close
Response.Write(XmlFileName)
%>