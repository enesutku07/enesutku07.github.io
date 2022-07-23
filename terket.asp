<!--#include file="sayfa.asp"-->
<% Response.Buffer=true 
Session("UserLoggedIn")="" 
Response.Cookies("Uyelik")("k_a")=""
Response.Cookies("Uyelik")("sifre")=""
Session("usersNo")=""
call esasUst() 
Response.write "<p><br></p><p><br></p><center><p><br></p><p><br></p>Başarılı bir şekilde çıkış yaptınız</center>"
call esasAlt()
 %>