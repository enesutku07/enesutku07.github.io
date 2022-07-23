<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
sira=Request.QueryString("sira")
Set guncelle = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM sayfa WHERE id = " & Request.QueryString("id")
guncelle.open sor, sur, 1, 3
				
guncelle("sira") = Request.QueryString("sira")
guncelle.Update
'response.write ""&Request.QueryString("sira")&""
Response.redirect "liste.asp"
End if%>