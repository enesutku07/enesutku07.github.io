<%
Set ObjCon_ilet = Server.Createobject("ADODB.Connection")
ObjCon_ilet.Open "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" &Server.MapPath("data/mucahit.mdb")

ad = Request.Form ("ad")
soyad = Request.Form ("soyad")
telefon = Request.Form ("telefon")
adres = Request.Form ("adres")
konu = Request.Form ("konu")
mesaj = Request.Form ("mesaj")


Set ObjRs = Server.CreateObject ("ADODB.RecordSet")
StrSql = "Select * from mesaj"
ObjRs.Open StrSql, ObjCon_ilet, 1, 3

'doldurulmamis form kutucuklarini doldurulmasini istiyoruz

if ad ="" or soyad="" or telefon="" or adres="" or konu="" or mesaj="" then
Response.Write " * Ýþaretli Alanlarýn Doldurulmasý Zorunludur! yönlendiriliyorsunuz......"
else
ObjRs.AddNew
ObjRs("ad")=ad
ObjRs("soyad")=soyad
ObjRs("telefon")=telefon
ObjRs("adres")=adres
ObjRs("konu")=konu
ObjRs("mesaj")=mesaj



ObjRs.Update
Response.Write("<b>Mesajýnýz baþarýlý bir þekilde eklendi ! ! ! yönlendiriliyorsunuz......")
end if
ObjRs.close
Set ObjRs = Nothing
%>
<meta http-equiv="refresh" content="0;URL=formmail.asp">