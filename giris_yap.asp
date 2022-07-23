<!--#include file="sayfa.asp"--><%
Response.Buffer=True
Response.Expires = -100
tarih=date
%>

<%
Set Sur = Server.CreateObject("ADODB.Connection")
Sur.Open "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" &Server.MapPath("db/db.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")

Function ayiklayo(temiz) 
temiz=Replace(temiz,"`","",1,-1,1)
temiz=Replace(temiz,"=","",1,-1,1)
temiz=Replace(temiz,"&","",1,-1,1)
temiz=Replace(temiz,"%","",1,-1,1)
temiz=Replace(temiz,"!","",1,-1,1)
temiz=Replace(temiz,"#","",1,-1,1)
temiz=Replace(temiz,"<","",1,-1,1)
temiz=Replace(temiz,">","",1,-1,1)
temiz=Replace(temiz,"*","",1,-1,1)
temiz=Replace(temiz,"/","",1,-1,1)
temiz=Replace(temiz,"\","",1,-1,1)
temiz=Replace(temiz,"And","",1,-1,1)
temiz=Replace(temiz,"'","",1,-1,1)
temiz=Replace(temiz,"Chr(34)","",1,-1,1)
temiz=Replace(temiz,"Chr(39)","",1,-1,1) 
ayiklayo = temiz 
End Function 

Sor="select * from idare where user = '" & ayiklayo(request.form("k_a")) & "' and pass = '" & ayiklayo(request.form("sifre")) & "'"
Rs.Open Sor, Sur, 1, 3
If RS.BOF And RS.EOF Then
Response.write "Hata : Yanlýþ Kullanýcý Adý Ve/Veya Þifre Girdiniz! Lütfen Doðru Þekilde Giriþ Yapýn"
Else
Session("UserLoggedIn") = "true"
Rs.Update
Session("usersNo")=Rs("id")
Session("k_a")=Rs("user")
Response.Cookies("Uyelik")("k_a")=Request.Form("k_a")
Response.Cookies("Uyelik")("sifre")=Request.Form("sifre")
Response.Cookies("Uyelik").Expires=Now()+1
Response.redirect "idare.asp"
End If
%>