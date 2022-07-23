<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%if Session("UserLoggedIn")="true" then
Set rs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa"
rs.Open sor,Sur,1,3
Dim sayfa, menu_sira_no, onay, tarih, baslik
sayfa = request.form("sayfa")
baslik = request.form("baslik")
menu_sira_no = request.form("menu_sira_no")
onay = request.form("onay")
tarih = tarih


sayfa = Replace(sayfa,Chr(13),"<br>")
rs.AddNew 


rs("sayfa") = sayfa 
rs("baslik") = baslik
rs("tarih") = tarih
rs("menu_sira_no") = menu_sira_no
if onay = false then
else
rs("onay") = onay
end if
rs.Update 


  rs.close
  set rs = Nothing
  set conn = Nothing


response.redirect "yeni.asp" 

%>
<%else
response.write "<center>Giriþ yapmanýz gerekmektedir.</center>"
End if
%>
<% call esasAlt() %>