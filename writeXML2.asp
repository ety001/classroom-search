<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="const.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
n = request.QueryString("n")	'0������죬1��������
WhatDay = ChgName((Datediff("d",FirstDay,Now())+1+n) mod 7,0)   '�����ý������ܼ���ת��Ϊ��Ӧ����ĸ
build_temp = "SB5|NB4|NB5|NB8|NB9|WB4"		'�ô���˳��Ӧ��Ҫ������ҳ�Ͻ�ѧ¥������˳��    ******ע�⣡������������******
building = Split(build_temp,"|")	'��ȡ��ѧ¥
tt = CInt(Request.QueryString("week"))	'��ȡ�ܣ����ҶԻ�ȡ���ݽ��й���
If tt >0 and tt < 20 Then
	week = tt   '��ȡ�ܽ���
Else
	response.Write("Wrong Week Number!")
	response.End
End If
'��������������������������������������������������֤����
Dim Classroom(19,99,1)	'��һά�����ѧ¥�������ޣ��ڶ�άÿ����ѧ¥��������(100)������ά�ǽ�����Ϣ(2)
Dim TempClassSum(19)
For i = 0 to Ubound(building)
	Set rsClass = Server.CreateObject("ADODB.RecordSet")
	sqlStr1 = "select * from " & building(i)		'��ȡ��ǰ��ѧ¥�����н��Ҽ�������Ϣ
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

Dim EmptyClass(19,4,99)	'��һά�����ѧ¥�����ޣ��ڶ�ά����ڼ����,����ά����ĳ�ڿεĿտν���������
For buildNum = 0 to Ubound(building)
	For i = 0 to TempClassSum(buildNum)
		For j = 0 to 4
			Set rsClass = Server.CreateObject("ADODB.RecordSet")
			sqlStr2 = "select * from " & Classroom(buildNum,i,0) & " where id = " & week		'��ȡ��ǰ��ѧ¥�ĵ�ǰ���ҵ�ǰ�ܵ���Ϣ
			rsClass.open sqlStr2,conn,1,1
			If rsClass(WhatDay & j + 1) = "0" Then
				EmptyClass(buildNum,j,i) = Classroom(buildNum,i,0)
			Else
				EmptyClass(buildNum,j,i) = "1"	'��֤��jȡֵ��ͬʱ�����еĳ�����ͬ
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
