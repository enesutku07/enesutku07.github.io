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
 conn.Execute("UPDATE menuler  set monay=yes where sira_no=" & id)
	
	
conn.Close
set conn = nothing

Response.redirect "menu.asp"
%>
<%End if%>

<% call esasAlt() %>