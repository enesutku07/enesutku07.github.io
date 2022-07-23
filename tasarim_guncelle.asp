<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM idare WHERE id =1"
rs.open sor, sur, 1, 3
				
	rs("bodyimage") = Trim(Request.Form("bodyimage"))
	rs("fontface") = Trim(Request.Form("fontface"))
	rs("fontsize") = Trim(Request.Form("fontsize"))
	rs("fontcolor") = Trim(Request.Form("fontcolor"))
	rs("bgcolor") = Trim(Request.Form("bgcolor"))
	rs("link") = Trim(Request.Form("link"))
	rs("hover") = Trim(Request.Form("hover"))
	rs("tablo_border_color") = Trim(Request.Form("tablo_border_color"))
	rs("tdbg") = Trim(Request.Form("tdbg"))
	rs("fontw") = Trim(Request.Form("fontw"))
	rs("lw") = Trim(Request.Form("lw"))
	rs("lhw") = Trim(Request.Form("lhw"))
	rs("mface") = Trim(Request.Form("mface"))
	rs("msize") = Trim(Request.Form("msize"))
	rs("mcolor") = Trim(Request.Form("mcolor"))
	rs("mbgcolor") = Trim(Request.Form("mbgcolor"))
rs.Update
Response.redirect "tasarim.asp"

rs.Close
conn.Close 
Set conn = Nothing
Set rs = Nothing	
%>
<%else
response.write "<center>Giriþ yapmanýz gerekmektedir.</center>"
End if
%>