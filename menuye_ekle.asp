<% Response.Buffer = True %>
<!--#include file="sayfa.asp"-->
<% call esasUst() %><%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %><%

id = Request("id")

set conn = Server.CreateObject("ADODB.Connection")
conn.open Sur
 conn.Execute("UPDATE sayfa  set onay=yes where id=" & id)
	
	
conn.Close
set conn = nothing

Response.redirect "liste.asp"
%>
<%End if%>

<% call esasAlt() %>