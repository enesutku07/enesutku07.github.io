<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
no=Request.QueryString("no")
Set guncelle = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM menuler WHERE sira_no = " & Request.QueryString("id")
guncelle.open sor, sur, 1, 3
				
guncelle("menu_no") = Request.QueryString("no")
guncelle.Update
Response.redirect "menu.asp"
End if%>