<!--#include file="sayfa.asp"-->

<%if Session("UserLoggedIn")="true" then%>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sor= "SELECT TOP 1 * FROM idare WHERE id =1"
rs.open sor, sur, 1, 3
				
rs("user") = Trim(Request.Form("user"))
rs("pass") = Trim(Request.Form("pass"))
rs("site_adi") = Trim(Request.Form("site_adi"))
rs("iletisim") = Trim(Request.Form("iletisim"))
rs("banner") = Trim(Request.Form("banner"))
rs("bannerurl") = Trim(Request.Form("bannerurl"))
rs("banner_adi") = Trim(Request.Form("banner_adi"))
rs("logo") = Trim(Request.Form("logo"))
rs("logourl") = Trim(Request.Form("logourl"))

rs.Update
Response.redirect "idare.asp"

rs.Close
conn.Close 
Set conn = Nothing
Set rs = Nothing
%>
<%else
response.write "<center>Giriþ yapmanýz gerekmektedir.</center>"
End if
%>