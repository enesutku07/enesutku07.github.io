<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%if Session("UserLoggedIn")="true" then
Set rs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler"
rs.Open sor,Sur,1,3
Dim menu
menu = request.form("menu")
monay = request.form("monay")
tarih = tarih
rs.AddNew 


rs("menu") = menu 
if monay = false then
else
rs("monay") = monay
end if
rs.Update 


  rs.close
  set rs = Nothing
  set conn = Nothing


response.redirect "menu.asp" 

%>
<%else
response.write "<center>Giriþ yapmanýz gerekmektedir.</center>"
End if
%>
<% call esasAlt() %>