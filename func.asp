
<%
'							��������������������������������������������������������������������������������������������������������������������
'							*	�ļ�����func.asp										 *
'							*	�ļ����ܣ��洢�������õĸ����Զ��庯�����ӳ���			 *
'							*	���ߣ�ETY001	QQ��250789149		��Ȩ�����粿         *
'							*	��ʼ��дʱ�䣺2010-8-13		������дʱ�䣺2010-8-17	 	 *
'                           ��������������������������������������������������������������������������������������������������������������������

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
    			ChgName = "����4�Ž�ѧ¥"
  			Case "NB5"
    			ChgName = "����5�Ž�ѧ¥"
  			Case "NB8"
    			ChgName = "����8�Ž�ѧ¥"
  			Case "NB9"
    			ChgName = "����9�Ž�ѧ¥"
  			Case "SB5"
    			ChgName = "����5�Ž�ѧ¥"
  			Case "WB4"
    			ChgName = "����4�Ž�ѧ¥"
			Case "A"
				ChgName = "����һ"
			Case "B"
				ChgName = "���ڶ�"
			Case "C"
				ChgName = "������"
			Case "D"
				ChgName = "������"
			Case "E"
				ChgName = "������"
			Case "F"
				ChgName = "������"
			Case "G"
				ChgName = "������"
			Case "0"
				ChgName = "��һ���"
			Case "1"
				ChgName = "�ڶ����"
			Case "2"
				ChgName = "�������"
			Case "3"
				ChgName = "���Ĵ��"
			Case "4"
				ChgName = "������"
  			Case Else
				ChgName = ""
		End Select
	End If
End Function

%>