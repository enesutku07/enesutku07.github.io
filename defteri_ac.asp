<% Response.Buffer = True %>
<!--#include file="sayfa.asp"-->
<% call esasUst()
   if Session("UserLoggedIn")<>"true" then
%>

<center>Giri� yapman�z gerekmektedir.</center>


<% else %>
<%
set conn = Server.CreateObject("ADODB.Connection")
conn.open Sur
 conn.Execute("UPDATE idare  set defter=yes where id=1")
	
conn.Close
set conn = nothing

response.write "<p><br><center>Ziyaret�i defteri Kullan�ma <b>A��lm��t�r</b>.</p></center>"
%>
<%End if%>

<% call esasAlt() %>