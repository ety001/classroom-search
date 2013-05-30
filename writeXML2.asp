<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="const.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
n = request.QueryString("n")	'0代表今天，1代表明天
WhatDay = ChgName((Datediff("d",FirstDay,Now())+1+n) mod 7,0)   '计算获得今天是周几并转换为相应的字母
build_temp = "SB5|NB4|NB5|NB8|NB9|WB4"		'该处的顺序应该要符合首页上教学楼的排列顺序    ******注意！！！！！！！******
building = Split(build_temp,"|")	'获取教学楼
tt = CInt(Request.QueryString("week"))	'获取周，并且对获取数据进行过滤
If tt >0 and tt < 20 Then
	week = tt   '获取周结束
Else
	response.Write("Wrong Week Number!")
	response.End
End If
'————————————————————————验证结束
Dim Classroom(19,99,1)	'第一维代表教学楼数量上限，第二维每个教学楼教室数量(100)，第三维是教室信息(2)
Dim TempClassSum(19)
For i = 0 to Ubound(building)
	Set rsClass = Server.CreateObject("ADODB.RecordSet")
	sqlStr1 = "select * from " & building(i)		'获取当前教学楼的所有教室及教室信息
	rsClass.open sqlStr1,conn,1,1
	j = 0
	Do While Not rsClass.eof
		Classroom(i,j,0) = rsClass("classroom")
		Classroom(i,j,1) = rsClass("info")
		rsClass.movenext
		j = j + 1	
	Loop
	rsClass.close
	TempClassSum(i) = j - 1
Next

Set rsClass = nothing

Dim EmptyClass(19,4,99)	'第一维代表教学楼的上限，第二维代表第几大节,第三维代表某节课的空课教室数上限
For buildNum = 0 to Ubound(building)
	For i = 0 to TempClassSum(buildNum)
		For j = 0 to 4
			Set rsClass = Server.CreateObject("ADODB.RecordSet")
			sqlStr2 = "select * from " & Classroom(buildNum,i,0) & " where id = " & week		'获取当前教学楼的当前教室当前周的信息
			rsClass.open sqlStr2,conn,1,1
			If rsClass(WhatDay & j + 1) = "0" Then
				EmptyClass(buildNum,j,i) = Classroom(buildNum,i,0)
			Else
				EmptyClass(buildNum,j,i) = "1"	'保证当j取值不同时，队列的长度相同
			End If
			rsClass.close
		Next
	Next
Next
Set rsClass = nothing
conn.close
Set conn = nothing

XmlFileName = "week_" & week & "_day_" & WhatDay & ".xml"
XmlFilePath = Server.MapPath("data/indexxml/" & XmlFileName)
Set FSO = CreateObject("Scripting.FileSystemObject") 
Set MyFile = FSO.CreateTextFile(XmlFilePath,True)

MyFile.WriteLine("<?xml version=""1.0"" encoding=""gb2312""?>")
MyFile.WriteLine("<builds>")
For buildNum = 0 to Ubound(building)
	MyFile.WriteLine("<build" & buildNum + 1 & " name = '" & building(buildNum) &"'>")
	For j = 0 to 4
		MyFile.WriteLine("<course" & j + 1 & " name='" & ChgName(j,1) & "'>")
		For i = 0 to TempClassSum(buildNum)
			If EmptyClass(buildNum,j,i) <> "1" Then
				MyFile.WriteLine("<classrooms>")
				MyFile.WriteLine("<classroom>" & Mid(EmptyClass(buildNum,j,i),5) & "</classroom>")
				MyFile.WriteLine("</classrooms>")
			End If
		Next
		MyFile.WriteLine("</course" & j + 1 & ">")
	Next
	MyFile.WriteLine("</build" & buildNum + 1 & ">")
Next
MyFile.WriteLine("</builds>")
MyFile.Close
Response.Write(XmlFileName)
%>
