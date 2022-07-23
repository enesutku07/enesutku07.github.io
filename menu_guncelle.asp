<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM menuler WHERE sira_no =" & Request.QueryString("id")
rs.open sor, sur, 1, 3

rs("menu") = Trim(Request.Form("menu"))

rs.Update%>
<table align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse" class="tablo" border="0">
<tr>
<td align="center" height="200">
<center>Menü Yeniden Adlandırıldı. <br><a href=javascript:window.close()>Kapat</a></center>
</td></tr></table>
<%End if%>