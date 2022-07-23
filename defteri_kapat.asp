<% Response.Buffer = True %>
<!--#include file="sayfa.asp"-->
<% call esasUst()
   if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %>
<%
set conn = Server.CreateObject("ADODB.Connection")
conn.open Sur
 conn.Execute("UPDATE idare  set defter=no where id=1")
	
conn.Close
set conn = nothing
response.write "<p><br><center>Ziyaretçi defteri Kullanýma <b>Kapatýlmýþtýr</b>.</p></center>"
%>
<%End if%>

<% call esasAlt() %>