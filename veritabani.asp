<%
Set Conn=CreateObject("ADODB.Connection")
Conn.open "DRIVER= {Microsoft Access Driver (*.mdb)}; DBQ=" & server.mappath("data/mucahit.mdb")
%>