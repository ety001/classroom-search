
<%
'							——————————————————————————————————————————————————————————
'							*	文件名：func.asp										 *
'							*	文件功能：存储程序所用的各种自定义函数和子程序			 *
'							*	作者：ETY001	QQ：250789149		版权：网络部         *
'							*	开始编写时间：2010-8-13		结束编写时间：2010-8-17	 	 *
'                           ——————————————————————————————————————————————————————————

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
			Case 1
				ChgName = "A"
			Case 2
				ChgName = "B"
			Case 3
				ChgName = "C"
			Case 4
				ChgName = "D"
			Case 5
				ChgName = "E"
			Case 6
				ChgName = "F"
			Case 0
				ChgName = "G"
			Case Else
				ChgName = "Wrong!123"
		End Select
	Else
		Select Case Str
  			Case "NB4"
    			ChgName = "北区4号教学楼"
  			Case "NB5"
    			ChgName = "北区5号教学楼"
  			Case "NB8"
    			ChgName = "北区8号教学楼"
  			Case "NB9"
    			ChgName = "北区9号教学楼"
  			Case "SB5"
    			ChgName = "南区5号教学楼"
  			Case "WB4"
    			ChgName = "西区4号教学楼"
			Case "A"
				ChgName = "星期一"
			Case "B"
				ChgName = "星期二"
			Case "C"
				ChgName = "星期三"
			Case "D"
				ChgName = "星期四"
			Case "E"
				ChgName = "星期五"
			Case "F"
				ChgName = "星期六"
			Case "G"
				ChgName = "星期日"
			Case "0"
				ChgName = "第一大节"
			Case "1"
				ChgName = "第二大节"
			Case "2"
				ChgName = "第三大节"
			Case "3"
				ChgName = "第四大节"
			Case "4"
				ChgName = "第五大节"
  			Case Else
				ChgName = ""
		End Select
	End If
End Function

%>