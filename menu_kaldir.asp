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
response.write "<p><br></p><br><b><p><br></p><br><center><font color=red><h3>DÝKKAT<br>SÝTEDEN ANA MENÜYÜ KALDIRAMAZSINIZ...</FONT></H3></center>"
else


set conn = Server.CreateObject("ADODB.Connection")
conn.open Sur
 conn.Execute("UPDATE menuler  set monay=no where sira_no=" & id)
	
	
conn.Close
set conn = nothing

Response.redirect "menu.asp"
%>
<% 
End If
End If 
%>

<% call esasAlt() %>