<%@LANGUAGE="VBSCRIPT"   CODEPAGE="936"%>
<%
'							——————————————————————————————————————————————————————————
'							*	文件名：func.asp										 *
'							*	文件功能：存储程序所用的各种自定义函数和子程序			 *
'							*	作者：ETY001	QQ：250789149							 *
'							*	开始编写时间：2010-8-13		结束编写时间：2010-8-17	 	 *
'                           ——————————————————————————————————————————————————————————

'<-------------------连接类开始------------------>
'——————————————————————————————————————————————————————————
'函数：ConnectXLS(PATH,SheetsName)
'参数：PATH为ELS文件的路径，SheetsName为工作表名
'作用：打开XLS文件
'编写完成时间：2010-8-13 16：30
Function ConnectXLS(PATH,SheetsName)
	Set objExcelApp = CreateObject("Excel.Application")
	objExcelApp.DisplayAlerts = false
	objExcelApp.Application.Visible = false
	objExcelApp.WorkBooks.Open PATH
	Set objExcelBook = objExcelApp.ActiveWorkBook
	Set objExcelSheets = objExcelBook.Worksheets
	Set ConnectXLS = objExcelBook.Sheets(SheetsName) '这里SheetsName为表名
End Function
'<-------------------连接类结束------------------>

'<-------------------字符串处理类开始------------------>
'<--
'	字符串类处理的说明，为了方便表示，采用了以下的代号，现在注明：
'	北区教学楼 —— NB ； 南区教学楼 —— SB ； 西区教学楼 —— WB ； 东区教学楼 —— EB 
'	例子：如果表示北区4号楼，则为NB4 。
'	具体的教室表示方法为：教学楼_教室号       例如：北区4号楼101D表示为NB4_101D
'-->
'————————————————————————————————————————
'函数：ChgName(Str,n)
'参数：Str为要转换的字符串，n为指定转换方向（0为由文字变为代号，1为由代号变为文字）
'作用：完成字符串的转换
' ********注意！！！该函数可能根据原数据的变化而变化********
'完成时间：2010-8-14
Function ChgName(Str,n)
	If n = 0 Then
		Select Case Str
  			Case "北区4号楼"
    			ChgName = "NB4_"
  			Case "北区5号楼"
    			ChgName = "NB5_"
  			Case "8号教学楼"
    			ChgName = "NB8_"
  			Case "北区9号楼"
    			ChgName = "NB9_"
  			Case "南区5号楼"
    			ChgName = "SB5_"
  			Case "西区4号楼"
    			ChgName = "WB4_"
			Case Else
				ChgName = "Wrong!123"
		End Select
	Else
		Select Case Str
  			Case "NB4_"
    			ChgName = "北区4号楼"
  			Case "NB5_"
    			ChgName = "北区5号楼"
  			Case "NB8_"
    			ChgName = "北区8号楼"
  			Case "NB9_"
    			ChgName = "北区9号楼"
  			Case "SB5_"
    			ChgName = "南区5号楼"
  			Case "WB4_"
    			ChgName = "西区4号楼"
  			Case Else
				ChgName = "Wrong!"
		End Select
	End If
End Function

'————————————————————————————————————————
'函数名：CourseTimeString(m,n)
'参数：m，n分别代表了第几节上课和星期几上课
'作用：把抽象的m，n转换成直观的天数和节数的代号，即A1，A2，……，G5
'完成时间：2010-8-16 16：00
Function CourseTimeString(m,n)
	Dim CourseTime_strTemp1,CourseTime_strTemp2
	Select Case m
		Case 6
			CourseTime_strTemp1 = "1"
		Case 14
			CourseTime_strTemp1 = "2"
		Case 22
			CourseTime_strTemp1 = "3"
		Case 30
			CourseTime_strTemp1 = "4"
		Case 38
			CourseTime_strTemp1 = "5"
		Case Else
			CourseTime_strTemp1 = ""
	End Select
	
	Select Case n
		Case 3
			CourseTime_strTemp2 = "A"
		Case 4
			CourseTime_strTemp2 = "B"
		Case 5
			CourseTime_strTemp2 = "C"
		Case 6
			CourseTime_strTemp2 = "D"
		Case 7
			CourseTime_strTemp2 = "E"
		Case 8
			CourseTime_strTemp2 = "F"
		Case 9
			CourseTime_strTemp2 = "G"
		Case Else
			CourseTime_strTemp2 = ""
	End Select
	CourseTimeString = CourseTime_strTemp2 & CourseTime_strTemp1
End Function

'————————————————————————————————————————
'函数名：CourseTime(str)
'参数：str为提交的待处理的含有上课时间的字符串
'作用：根据原数据中字符串的特点分为三类(错误时，返回-1)
'	  【第一类：字符串为空，证明该节课教室为空，返回值为0；】
'	  【第二类：字符串含有“周上课(2学时)”字样，说明无论其全周、单周还是双周，这个教室全学期该节都有课，返回值为1；】
'	  【第三类：字符串含有“周上(2学时)”字样，则说明该课程的上课时间比较特殊，去掉“周上(2学时)”处理后，返回值为2，并且把特殊的上课时间存入全局数组CourseTimeSpecial中】
'完成时间：2010-8-17 11：00
Dim CourseTimeSpecial(20)
Function CourseTime(str)
	tmp1 = trim(right(str,7))
	Select Case  tmp1
		Case ""
			CourseTime = 0
		Case "上课(2学时)"
			CourseTime = 1
		Case "周上(2学时)"
			CourseTime = 2
			tmp2 = InStr(str,"周上(2学时)")		'字符串中出现“周上(2学时)”的位置
			tmp3 = Left(str,tmp2-1)				'把“周上(2学时)”截去
			CourseTempStr = Split(tmp3,",")		'用逗号把去掉“周上(2学时)”后的字符串分隔进数组CourseTempStr
												'例如现在str="1-2,4,6-17周上(2学时)"，所以
												'CourseTempStr(0) = "1-2"
												'CourseTempStr(1) = "4"
												'CourseTempStr(2) = "6-17"
			addNum = 0		'计数器
			For t = 0 to Ubound(CourseTempStr)
				If InStr(CourseTempStr(t),"-") Then
					tmp4 = split(CourseTempStr(t),"-")
					For s = CInt(tmp4(0)) to CInt(tmp4(Ubound(tmp4)))
						CourseTimeSpecial(addNum) = s
						addNum = addNum + 1
					Next
				Else
					CourseTimeSpecial(addNum) = CInt(CourseTempStr(t))
					addNum = addNum + 1
				End If
			Next
			For t = addNum to 19		'其他，没有用到的空间全部置0
				CourseTimeSpecial(t) = 0
			Next
		Case Else
			CourseTime = -1
	End Select
	
End Function
'<-------------------字符串处理类结束------------------>


'————————————————————————————————————————
'子程序名：CreateBuildingTable(TableName)
'作用：在数据库中创建以TableName命名的教学楼表
'编写时间：2010-8-15 23：20
Sub CreateBuildingTable(TableName)
	str = trim(left(TableName,3))		'与函数CreateTable中的str一样，修改该值时应该注意
	On Error Resume Next
	conn.execute("select * from "& str)	'判断是否已经存在教学楼的表
	If Not Err.Number = 0 Then
		Err.Clear		'清除该错误
		Dim temp,CreateBuildingTableSql
		temp = "(id autoincrement primary key, classroom varchar(10), info varchar(100))"
		CreateBuildingTableSql = "create table " & str & temp
		conn.execute(CreateBuildingTableSql)	'创建结束
	End If
End Sub



'————————————————————————————————————————
'函数名：CreateTable(TableName)
'作用：在数据库中创建以TableName命名的表，并且创建教学楼表
'编写时间：2010-8-15 23：20
Function CreateTable(TableName)
	'首先检查是否存在教学楼表，不存在则建立
	Call CreateBuildingTable(TableName)
	
	str = trim(left(TableName,3))		'与子程序CreateBuildingTable中的str一样，修改该值时应该注意

	'基本数据表的构建
	'构建原则：周一——周日 用 A——G 来表示；第一大节 —— 第五大节 用 1 —— 5 来表示	
	On Error Resume Next
	conn.execute("select * from "& TableName)	'判断是否已经存在将要添加的教室表
	If Not Err.Number = 0 Then
		Err.Clear		'清除该错误
		Dim temp,CreateTableStrSql
		temp = "(id autoincrement primary key,	A1 int ,A2 int ,A3 int ,A4 int ,A5 int ,B1 int ,B2 int ,B3 int ,B4 int ,B5 int ,C1 int ,C2 int ,C3 int ,C4 int ,C5 int ,D1 int ,D2 int ,D3 int ,D4 int ,D5 int ,E1 int ,E2 int ,E3 int ,E4 int ,E5 int ,F1 int ,F2 int ,F3 int ,F4 int ,F5 int ,G1 int ,G2 int ,G3 int ,G4 int ,G5 int)" 
	
		CreateTableStrSql = "create table " & TableName & temp
		conn.execute(CreateTableStrSql)								'创建表
		Set rsTemp = server.CreateObject("ADODB.RecordSet")
		Set xlsTemp = ConnectXLS(PATH,SheetsName)
		rsTemp.open "select * from " & str,conn,1,3		'打开相应的教学楼表准备添加该教室信息
		rsTemp.addnew
		rsTemp("classroom") = TableName
		rsTemp("info") = trim(mid(xlsTemp.Cells(2,1),18))		'教室信息
		rsTemp.update		'教室信息更新完毕，开始清空无用对象
		rsTemp.close
		Set rsTemp = nothing
		xlsTemp.application.ActiveWorkBook.close("false")	
		Set xlsTemp = nothing
		
		Set CreateTable = server.CreateObject("ADODB.RecordSet")
		CreateTable.open "select * from " & TableName,conn,1,3		'打开新创建的教室表
	Else
		Set CreateTable = server.CreateObject("ADODB.RecordSet")	
		CreateTable.open "select * from " & TableName,conn,1,3		'打开新创建的教室表
	End If
End Function
%>