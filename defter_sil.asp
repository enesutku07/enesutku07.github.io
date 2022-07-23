<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<% if defter_onay=True then%>
<%
Set deftersil = Server.CreateObject("ADODB.RecordSet")
SQL = "DELETE FROM defter WHERE id="&Request.QueryString("id")
deftersil.open SQL,sur,1,3
Response.Write "<p><br></p><br><b><p><br></p><br><center>Mesaj Silinmiþtir.</center>"
%>
<%else
response.write "<center><b>Ziyaretçi Defteri Kullanýma Kapalýdýr.</b></center>"
end if
%>




<% call esasAlt() %>