<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
'��ʼ��
Const SheetsName = "sheet1"
NumberI = 0
Set FSO=Server.CreateObject("Scripting.FileSystemObject")
Set ServerFolder=FSO.GetFolder(Server.MapPath("/abc"))		'�򿪴������ݵ��ļ���
Set ServerFolderList=ServerFolder.Files
For Each ServerFileEvery IN ServerFolderList
	If ServerFileEvery.Name <> "" Then
		PATH = Server.MapPath("/abc") & "\" & ServerFileEvery.Name		'��ǰҪ�����ļ���·��		
		Set objExcelSheet = ConnectXLS(PATH,SheetsName)
		Week = CInt(trim(left(mid(objExcelSheet.Cells(2,7),3),2)))	'�Ͽ�����
		Tmp = Split(objExcelSheet.Cells(1,1)," ")'��ȡ�������飬����Tmp(1)Ϊ��ѧ¥����Tmp(2)Ϊ��������
		Tmp1 = ChgName(mid(Tmp(1),4),0)		'�����ĵĽ�ѧ¥����ת��ΪӢ�Ĵ��ţ��������˵��
		
		'���ú������д�����Ĳ���
		Set rs =  CreateTable(Tmp1 & Tmp(2))		
		
		'��ʼ��������
		For i = 1 to Week	'��һ��ѭ����������
			rs.addnew
			For m = 6 to 38 step 8		'�ڶ���ѭ�����Ƶ�����Ͽνڴ�
				For n = 3 to 9		'������ѭ������ÿ�ܵ�����
					TimeString = CourseTimeString(m,n)		'�ѳ����m��nת����ֱ�۵������ͽ����Ĵ��ţ���A1��A2��������G5
					CourseNum = CourseTime(trim(objExcelSheet.Cells(m,n)))		'ȡ�����Ͽ��йص���Ϣ����������ֵ������μ�����˵��
					Select Case CourseNum
						Case 0
							rs(TimeString) = 0	'0����û�п�
						Case 1
							rs(TimeString) = 1	'1�����п�
						Case 2
							For t = 0 to UBound(CourseTimeSpecial)
								If CourseTimeSpecial(t) = i Then 
									rs(TimeString) = 1
									Exit For
								Else
									rs(TimeString) = 0
								End If
							Next
						Case -1
							If Len(objExcelSheet.Cells(m-2,n)) Then
								rs(TimeString) = 1
							Else
								rs(TimeString) = 0
							End If
						Case Else
							response.Write("CourseTimeWrong!")
					End Select					
				Next
			Next
			rs.update
		Next
		NumberI = NumberI + 1
		Response.Write(PATH & " Success��<b>" & NumberI & "</b><br />")
		rs.close
		Set rs = nothing
		objExcelSheet.application.ActiveWorkBook.close("false")
		Set objExcelSheet = nothing
	End If
Next

Response.Write("�ܹ�������" & NumberI & "���ļ���")
%>

