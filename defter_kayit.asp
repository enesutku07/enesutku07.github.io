<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<% if defter_onay=True then%>
<% if request.Form("guvenlik")=request.Form("guvenlik2") then
Set rs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from defter"
rs.Open sor,Sur,1,3


Dim yazan, tarih, email, web, sehir, mesaj, site

yazan = request.form("yazan")
email = request.form("email")
tarih = tarih
web = request.form("web")
sehir = request.form("sehir")
mesaj = request.form("mesaj")

else response.write ("<center><b>Hata</b> Güvenlik kodunu yanlýþ girdiniz, tekrar deneyiniz... <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end
end if

If mesaj = "" then  
response.write ("<center><b>Hata</b> Lütfen Mesaj Yazýnýz...  <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end  
elseif yazan = "" then 
response.write ("<center><b>Hata</b> Lütfen Ýsminizi Boþ Býrakmayýnýz... <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end 
end if 
 mesaj = Replace(mesaj, Chr(10) , "") 'satýr baþý
 mesaj = Replace(mesaj, Chr(34) , "") 'çift týarnak
 mesaj = Replace(mesaj, "'" , "")   'tek týrnak
 mesaj = Replace(mesaj, Chr(13) , " ") 'yeni satýr
 mesaj = Replace(mesaj, "<" , " ")   'küçüktür
 mesaj = Replace(mesaj, ">" , " ")   'büyüktür

 yazan = Replace(yazan, Chr(10) , "") 'satýr baþý
 yazan = Replace(yazan, Chr(34) , "") 'çift týarnak
 yazan = Replace(yazan, "'" , "")   'tek týrnak
 yazan = Replace(yazan, Chr(13) , " ") 'yeni satýr
 yazan = Replace(yazan, "<" , " ")   'küçüktür
 yazan = Replace(yazan, ">" , " ")   'büyüktür

 email = Replace(email, Chr(10) , "") 'satýr baþý
 email = Replace(email, Chr(34) , "") 'çift týarnak
 email = Replace(email, "'" , "")   'tek týrnak
 email = Replace(email, Chr(13) , " ") 'yeni satýr
 email = Replace(email, "<" , " ")   'küçüktür
 email = Replace(email, ">" , " ")   'büyüktür

 sehir = Replace(sehir, Chr(10) , "") 'satýr baþý
 sehir = Replace(sehir, Chr(34) , "") 'çift týarnak
 sehir = Replace(sehir, "'" , "")   'tek týrnak
 sehir = Replace(sehir, Chr(13) , " ") 'yeni satýr
 sehir = Replace(sehir, "<" , " ")   'küçüktür
 sehir = Replace(sehir, ">" , " ")   'büyüktür

 web = Replace(web, Chr(10) , "") 'satýr baþý
 web = Replace(web, Chr(34) , "") 'çift týarnak
 web = Replace(web, "'" , "")   'tek týrnak
 web = Replace(web, Chr(13) , " ") 'yeni satýr
 web = Replace(web, "<" , " ")   'küçüktür
 web = Replace(web, ">" , " ")   'büyüktür
rs.AddNew 



rs("yazan") = yazan 
rs("email") = email
rs("tarih") = tarih
rs("web") = web
rs("sehir") = sehir
rs("mesaj") = mesaj
rs.Update 




  rs.close
  set rs = Nothing
  set conn = Nothing


response.redirect "defter.asp" 

%>
<%else
response.write "<center><b>Ziyaretçi Defteri Kullanýma Kapalýdýr.</b></center>"
end if
%>

<% call esasAlt() %>