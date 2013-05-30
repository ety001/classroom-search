<%

Set conn=server.createobject("adodb.connection")
conn.open "driver={microsoft access driver (*.mdb)};dbq="&server.mappath("db1.mdb")

%>
