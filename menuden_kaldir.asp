<% Response.Buffer = True %>
<!--#include file="sayfa.asp"-->
<% call esasUst() %><%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %>
<%
id = Request.QueryString("id")
if id=1 then
response.write "<p><br></p><br><b><p><br></p><br><center><font color=red><h3>DÝKKAT<br>SÝTENÝZÝN ANA SAYFASINI MENÜDEN KALDIRAMAZSINIZ...</FONT></H3></center>"
else


set conn = Server.CreateObject("ADODB.Connection")
conn.open Sur
 conn.Execute("UPDATE sayfa  set onay=no where id=" & id)
	
	
conn.Close
set conn = nothing

Response.redirect "liste.asp"
%>
<% 
End If
End If 
%>

<% call esasAlt() %>