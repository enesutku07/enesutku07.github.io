<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<% if defter_onay=True then%>
<%
Set deftersil = Server.CreateObject("ADODB.RecordSet")
SQL = "DELETE FROM defter WHERE id="&Request.QueryString("id")
deftersil.open SQL,sur,1,3
Response.Write "<p><br></p><br><b><p><br></p><br><center>Mesaj Silinmi�tir.</center>"
%>
<%else
response.write "<center><b>Ziyaret�i Defteri Kullan�ma Kapal�d�r.</b></center>"
end if
%>




<% call esasAlt() %>