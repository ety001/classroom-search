<%@LANGUAGE="VBSCRIPT"   CODEPAGE="936"%>
<%
'							��������������������������������������������������������������������������������������������������������������������
'							*	�ļ�����func.asp										 *
'							*	�ļ����ܣ��洢�������õĸ����Զ��庯�����ӳ���			 *
'							*	���ߣ�ETY001	QQ��250789149							 *
'							*	��ʼ��дʱ�䣺2010-8-13		������дʱ�䣺2010-8-17	 	 *
'                           ��������������������������������������������������������������������������������������������������������������������

'<-------------------�����࿪ʼ------------------>
'��������������������������������������������������������������������������������������������������������������������
'������ConnectXLS(PATH,SheetsName)
'������PATHΪELS�ļ���·����SheetsNameΪ��������
'���ã���XLS�ļ�
'��д���ʱ�䣺2010-8-13 16��30
Function ConnectXLS(PATH,SheetsName)
	Set objExcelApp = CreateObject("Excel.Application")
	objExcelApp.DisplayAlerts = false
	objExcelApp.Application.Visible = false
	objExcelApp.WorkBooks.Open PATH
	Set objExcelBook = objExcelApp.ActiveWorkBook
	Set objExcelSheets = objExcelBook.Worksheets
	Set ConnectXLS = objExcelBook.Sheets(SheetsName) '����SheetsNameΪ����
End Function
'<-------------------���������------------------>

'<-------------------�ַ��������࿪ʼ------------------>
'<--
'	�ַ����ദ���˵����Ϊ�˷����ʾ�����������µĴ��ţ�����ע����
'	������ѧ¥ ���� NB �� ������ѧ¥ ���� SB �� ������ѧ¥ ���� WB �� ������ѧ¥ ���� EB 
'	���ӣ������ʾ����4��¥����ΪNB4 ��
'	����Ľ��ұ�ʾ����Ϊ����ѧ¥_���Һ�       ���磺����4��¥101D��ʾΪNB4_101D
'-->
'��������������������������������������������������������������������������������
'������ChgName(Str,n)
'������StrΪҪת�����ַ�����nΪָ��ת������0Ϊ�����ֱ�Ϊ���ţ�1Ϊ�ɴ��ű�Ϊ���֣�
'���ã�����ַ�����ת��
' ********ע�⣡�����ú������ܸ���ԭ���ݵı仯���仯********
'���ʱ�䣺2010-8-14
Function ChgName(Str,n)
	If n = 0 Then
		Select Case Str
  			Case "����4��¥"
    			ChgName = "NB4_"
  			Case "����5��¥"
    			ChgName = "NB5_"
  			Case "8�Ž�ѧ¥"
    			ChgName = "NB8_"
  			Case "����9��¥"
    			ChgName = "NB9_"
  			Case "����5��¥"
    			ChgName = "SB5_"
  			Case "����4��¥"
    			ChgName = "WB4_"
			Case Else
				ChgName = "Wrong!123"
		End Select
	Else
		Select Case Str
  			Case "NB4_"
    			ChgName = "����4��¥"
  			Case "NB5_"
    			ChgName = "����5��¥"
  			Case "NB8_"
    			ChgName = "����8��¥"
  			Case "NB9_"
    			ChgName = "����9��¥"
  			Case "SB5_"
    			ChgName = "����5��¥"
  			Case "WB4_"
    			ChgName = "����4��¥"
  			Case Else
				ChgName = "Wrong!"
		End Select
	End If
End Function

'��������������������������������������������������������������������������������
'��������CourseTimeString(m,n)
'������m��n�ֱ�����˵ڼ����Ͽκ����ڼ��Ͽ�
'���ã��ѳ����m��nת����ֱ�۵������ͽ����Ĵ��ţ���A1��A2��������G5
'���ʱ�䣺2010-8-16 16��00
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

'��������������������������������������������������������������������������������
'��������CourseTime(str)
'������strΪ�ύ�Ĵ�����ĺ����Ͽ�ʱ����ַ���
'���ã�����ԭ�������ַ������ص��Ϊ����(����ʱ������-1)
'	  ����һ�ࣺ�ַ���Ϊ�գ�֤���ýڿν���Ϊ�գ�����ֵΪ0����
'	  ���ڶ��ࣺ�ַ������С����Ͽ�(2ѧʱ)��������˵��������ȫ�ܡ����ܻ���˫�ܣ��������ȫѧ�ڸýڶ��пΣ�����ֵΪ1����
'	  �������ࣺ�ַ������С�����(2ѧʱ)����������˵���ÿγ̵��Ͽ�ʱ��Ƚ����⣬ȥ��������(2ѧʱ)������󣬷���ֵΪ2�����Ұ�������Ͽ�ʱ�����ȫ������CourseTimeSpecial�С�
'���ʱ�䣺2010-8-17 11��00
Dim CourseTimeSpecial(20)
Function CourseTime(str)
	tmp1 = trim(right(str,7))
	Select Case  tmp1
		Case ""
			CourseTime = 0
		Case "�Ͽ�(2ѧʱ)"
			CourseTime = 1
		Case "����(2ѧʱ)"
			CourseTime = 2
			tmp2 = InStr(str,"����(2ѧʱ)")		'�ַ����г��֡�����(2ѧʱ)����λ��
			tmp3 = Left(str,tmp2-1)				'�ѡ�����(2ѧʱ)����ȥ
			CourseTempStr = Split(tmp3,",")		'�ö��Ű�ȥ��������(2ѧʱ)������ַ����ָ�������CourseTempStr
												'��������str="1-2,4,6-17����(2ѧʱ)"������
												'CourseTempStr(0) = "1-2"
												'CourseTempStr(1) = "4"
												'CourseTempStr(2) = "6-17"
			addNum = 0		'������
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
			For t = addNum to 19		'������û���õ��Ŀռ�ȫ����0
				CourseTimeSpecial(t) = 0
			Next
		Case Else
			CourseTime = -1
	End Select
	
End Function
'<-------------------�ַ������������------------------>


'��������������������������������������������������������������������������������
'�ӳ�������CreateBuildingTable(TableName)
'���ã������ݿ��д�����TableName�����Ľ�ѧ¥��
'��дʱ�䣺2010-8-15 23��20
Sub CreateBuildingTable(TableName)
	str = trim(left(TableName,3))		'�뺯��CreateTable�е�strһ�����޸ĸ�ֵʱӦ��ע��
	On Error Resume Next
	conn.execute("select * from "& str)	'�ж��Ƿ��Ѿ����ڽ�ѧ¥�ı�
	If Not Err.Number = 0 Then
		Err.Clear		'����ô���
		Dim temp,CreateBuildingTableSql
		temp = "(id autoincrement primary key, classroom varchar(10), info varchar(100))"
		CreateBuildingTableSql = "create table " & str & temp
		conn.execute(CreateBuildingTableSql)	'��������
	End If
End Sub



'��������������������������������������������������������������������������������
'��������CreateTable(TableName)
'���ã������ݿ��д�����TableName�����ı����Ҵ�����ѧ¥��
'��дʱ�䣺2010-8-15 23��20
Function CreateTable(TableName)
	'���ȼ���Ƿ���ڽ�ѧ¥������������
	Call CreateBuildingTable(TableName)
	
	str = trim(left(TableName,3))		'���ӳ���CreateBuildingTable�е�strһ�����޸ĸ�ֵʱӦ��ע��

	'�������ݱ�Ĺ���
	'����ԭ����һ�������� �� A����G ����ʾ����һ��� ���� ������ �� 1 ���� 5 ����ʾ	
	On Error Resume Next
	conn.execute("select * from "& TableName)	'�ж��Ƿ��Ѿ����ڽ�Ҫ��ӵĽ��ұ�
	If Not Err.Number = 0 Then
		Err.Clear		'����ô���
		Dim temp,CreateTableStrSql
		temp = "(id autoincrement primary key,	A1 int ,A2 int ,A3 int ,A4 int ,A5 int ,B1 int ,B2 int ,B3 int ,B4 int ,B5 int ,C1 int ,C2 int ,C3 int ,C4 int ,C5 int ,D1 int ,D2 int ,D3 int ,D4 int ,D5 int ,E1 int ,E2 int ,E3 int ,E4 int ,E5 int ,F1 int ,F2 int ,F3 int ,F4 int ,F5 int ,G1 int ,G2 int ,G3 int ,G4 int ,G5 int)" 
	
		CreateTableStrSql = "create table " & TableName & temp
		conn.execute(CreateTableStrSql)								'������
		Set rsTemp = server.CreateObject("ADODB.RecordSet")
		Set xlsTemp = ConnectXLS(PATH,SheetsName)
		rsTemp.open "select * from " & str,conn,1,3		'����Ӧ�Ľ�ѧ¥��׼����Ӹý�����Ϣ
		rsTemp.addnew
		rsTemp("classroom") = TableName
		rsTemp("info") = trim(mid(xlsTemp.Cells(2,1),18))		'������Ϣ
		rsTemp.update		'������Ϣ������ϣ���ʼ������ö���
		rsTemp.close
		Set rsTemp = nothing
		xlsTemp.application.ActiveWorkBook.close("false")	
		Set xlsTemp = nothing
		
		Set CreateTable = server.CreateObject("ADODB.RecordSet")
		CreateTable.open "select * from " & TableName,conn,1,3		'���´����Ľ��ұ�
	Else
		Set CreateTable = server.CreateObject("ADODB.RecordSet")	
		CreateTable.open "select * from " & TableName,conn,1,3		'���´����Ľ��ұ�
	End If
End Function
%>