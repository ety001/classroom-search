<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<%

build = request.QueryString("build")
room = request.QueryString("room")
txt = ""

If build <> "" And room = "" Then
	sqlStr = "select * from " & build
	t = 0
Else
	sqlStr = "select * from " & build & "_" & room
	t = 1
End If

Set rs = server.CreateObject("ADODB.RecordSet")
rs.open sqlStr,conn,1,1

If t = 0 Then
	Do While Not rs.Eof
		txt = mid(rs("classroom"),5) & "," & txt
		rs.movenext
	Loop
	response.Write(trim(txt))
End If

If t = 1 Then
	response.Write("<table width='200' border='1'><tr><th scope='col'>&nbsp;</th>")
	ttxxtt = ""
	For tt = asc("A") to asc("G")
		For ii = 1 to 5
		 ttxxtt = ttxxtt & "<th scope='col'>" & chr(tt) & ii & "</th>"
		Next
	Next
	response.Write(ttxxtt & "</tr>")
	iii = 1
	Do While Not rs.Eof
		response.Write("<tr><th scope='col'>Week_" & iii & "</td>")
		For tt = asc("A") to asc("G")
			ttt = chr(tt)
			For ii = 1 to 5
				ssttrr = ttt & ii
				response.Write("<td>" & rs(ssttrr) & "</td>")
			Next
		Next
		response.Write("</tr>")
		rs.movenext
		iii = iii + 1
	Loop
	response.Write("</table>")
	response.Write("<div class='center1'>Attention Please : Monday to Sunday Used BY A to G and The First Class to The Fifth Class Used By 1 to 5</div>")
End If	
rs.close
conn.close
Set rs = nothing
Set conn = nothing
%>