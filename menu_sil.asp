<!--#include file="sayfa.asp"-->

<%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giri� yapman�z gerekmektedir.</center>


<% else %>
<%
id = Request.QueryString("id")
if id=1 then
response.write "<p><br></p><br><b><p><br></p><br><center><font color=red><h3>D�KKAT<br>S�TEN�Z�N ANA MEN�/SAYFASINI S�LEMEZS�N�Z</FONT></H3></center>"
else
Set rs = Server.CreateObject("ADODB.Recordset")
SQL = "DELETE FROM sayfa WHERE menu_sira_no="&id&""
rs.open SQL,Sur,1,3
%>
<%
Set ds = Server.CreateObject("ADODB.Recordset")
SQL = "DELETE FROM menuler WHERE sira_no="&id&""
ds.open SQL,Sur,1,3

call esasUst() 
Response.Write "<p><br></p><br><b><p><br></p><br><center>Men�yle beraber T�m Sayfa Silinmi�tir.</center>"
%>

<% 
End If
End If %>

<% call esasAlt() %>