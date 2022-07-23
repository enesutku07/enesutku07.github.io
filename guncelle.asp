<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
Set guncelle = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM sayfa WHERE id = " & Request.QueryString("id")
guncelle.open sor, sur, 1, 3
				
guncelle("sayfa") = Trim(Request.Form("sayfa"))
guncelle("baslik") = Trim(Request.Form("baslik"))
guncelle("tarih") = tarih
guncelle("hit") = Trim(Request.Form("hit"))
guncelle("menu_sira_no") = Trim(Request.Form("menu_sira_no"))
guncelle.Update
Response.redirect "default.asp?id="&Request.QueryString("ID")&""
End if%>