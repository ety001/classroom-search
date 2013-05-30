<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
'初始化
Const SheetsName = "sheet1"
NumberI = 0
Set FSO=Server.CreateObject("Scripting.FileSystemObject")
Set ServerFolder=FSO.GetFolder(Server.MapPath("/abc"))		'打开存有数据的文件夹
Set ServerFolderList=ServerFolder.Files
For Each ServerFileEvery IN ServerFolderList
	If ServerFileEvery.Name <> "" Then
		PATH = Server.MapPath("/abc") & "\" & ServerFileEvery.Name		'当前要处理文件的路径		
		Set objExcelSheet = ConnectXLS(PATH,SheetsName)
		Week = CInt(trim(left(mid(objExcelSheet.Cells(2,7),3),2)))	'上课周数
		Tmp = Split(objExcelSheet.Cells(1,1)," ")'获取标题数组，其中Tmp(1)为教学楼名，Tmp(2)为教室名称
		Tmp1 = ChgName(mid(Tmp(1),4),0)		'把中文的教学楼名称转换为英文代号，详见函数说明
		
		'调用函数进行创建表的操作
		Set rs =  CreateTable(Tmp1 & Tmp(2))		
		
		'开始导入数据
		For i = 1 to Week	'第一层循环控制周数
			rs.addnew
			For m = 6 to 38 step 8		'第二层循环控制当天的上课节次
				For n = 3 to 9		'第三层循环控制每周的天数
					TimeString = CourseTimeString(m,n)		'把抽象的m，n转换成直观的天数和节数的代号，即A1，A2，……，G5
					CourseNum = CourseTime(trim(objExcelSheet.Cells(m,n)))		'取得与上课有关的信息，并返回数值，详情参见函数说明
					Select Case CourseNum
						Case 0
							rs(TimeString) = 0	'0代表没有课
						Case 1
							rs(TimeString) = 1	'1代表有课
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
		Response.Write(PATH & " Success！<b>" & NumberI & "</b><br />")
		rs.close
		Set rs = nothing
		objExcelSheet.application.ActiveWorkBook.close("false")
		Set objExcelSheet = nothing
	End If
Next

Response.Write("总共处理了" & NumberI & "个文件！")
%>

