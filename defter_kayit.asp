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

else response.write ("<center><b>Hata</b> G�venlik kodunu yanl�� girdiniz, tekrar deneyiniz... <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end
end if

If mesaj = "" then  
response.write ("<center><b>Hata</b> L�tfen Mesaj Yaz�n�z...  <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end  
elseif yazan = "" then 
response.write ("<center><b>Hata</b> L�tfen �sminizi Bo� B�rakmay�n�z... <a href=""javascript:history.back()"">[ Tekrar ]</a><br><br> ")
response.end 
end if 
 mesaj = Replace(mesaj, Chr(10) , "") 'sat�r ba��
 mesaj = Replace(mesaj, Chr(34) , "") '�ift t�arnak
 mesaj = Replace(mesaj, "'" , "")   'tek t�rnak
 mesaj = Replace(mesaj, Chr(13) , " ") 'yeni sat�r
 mesaj = Replace(mesaj, "<" , " ")   'k���kt�r
 mesaj = Replace(mesaj, ">" , " ")   'b�y�kt�r

 yazan = Replace(yazan, Chr(10) , "") 'sat�r ba��
 yazan = Replace(yazan, Chr(34) , "") '�ift t�arnak
 yazan = Replace(yazan, "'" , "")   'tek t�rnak
 yazan = Replace(yazan, Chr(13) , " ") 'yeni sat�r
 yazan = Replace(yazan, "<" , " ")   'k���kt�r
 yazan = Replace(yazan, ">" , " ")   'b�y�kt�r

 email = Replace(email, Chr(10) , "") 'sat�r ba��
 email = Replace(email, Chr(34) , "") '�ift t�arnak
 email = Replace(email, "'" , "")   'tek t�rnak
 email = Replace(email, Chr(13) , " ") 'yeni sat�r
 email = Replace(email, "<" , " ")   'k���kt�r
 email = Replace(email, ">" , " ")   'b�y�kt�r

 sehir = Replace(sehir, Chr(10) , "") 'sat�r ba��
 sehir = Replace(sehir, Chr(34) , "") '�ift t�arnak
 sehir = Replace(sehir, "'" , "")   'tek t�rnak
 sehir = Replace(sehir, Chr(13) , " ") 'yeni sat�r
 sehir = Replace(sehir, "<" , " ")   'k���kt�r
 sehir = Replace(sehir, ">" , " ")   'b�y�kt�r

 web = Replace(web, Chr(10) , "") 'sat�r ba��
 web = Replace(web, Chr(34) , "") '�ift t�arnak
 web = Replace(web, "'" , "")   'tek t�rnak
 web = Replace(web, Chr(13) , " ") 'yeni sat�r
 web = Replace(web, "<" , " ")   'k���kt�r
 web = Replace(web, ">" , " ")   'b�y�kt�r
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
response.write "<center><b>Ziyaret�i Defteri Kullan�ma Kapal�d�r.</b></center>"
end if
%>

<% call esasAlt() %>