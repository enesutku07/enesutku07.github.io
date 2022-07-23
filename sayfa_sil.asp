<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %>
<%
id = Request.QueryString("id")
if id=1 then
response.write "<p><br></p><br><b><p><br></p><br><center><font color=red><h3>DÝKKAT<br>SÝTENÝZÝN ANA SAYFASINI SÝLEMEZSÝNÝZ</FONT></H3></center>"
else
Set rs = Server.CreateObject("ADODB.Recordset")
SQL = "DELETE FROM sayfa WHERE id="&id&""
rs.open SQL,Sur,1,3
Response.Write "<p><br></p><br><b><p><br></p><br><center>Sayfa Silinmiþtir.</center>"
%>

<% 
End If
End If %>

<% call esasAlt() %>