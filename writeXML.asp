<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
build_temp = Request.QueryString("buildname")	'获取教学楼
tt = CInt(Request.QueryString("week"))	'获取周，并且对获取数据进行过滤
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
'————————————————————————验证结束
Dim Classroom(99,1)	'第一维每个教学楼教室数量(100)，第二维是教室信息(2)
Set rsClass = Server.CreateObject("ADODB.RecordSet")
sqlStr1 = "select * from " & building		'获取当前教学楼的所有教室及教室信息
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

Dim Course(99,6,4)	'第一维代表当前教学楼的教室，第二维代表周几，第三维代表第几节
For i = 0 to Ubound(Classroom,1)	'获取每个教学楼每个教室指定周的上课情况
	If Classroom(i,0) <> "" Then	'因为每个教学楼的教室数小于100个，所以，上面在进行数据存储时，存储了许多空数据
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