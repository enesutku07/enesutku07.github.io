<!--#include file="sayfa.asp"-->
<% Response.Buffer=true 
Session("UserLoggedIn")="" 
Response.Cookies("Uyelik")("k_a")=""
Response.Cookies("Uyelik")("sifre")=""
Session("usersNo")=""
call esasUst() 
Response.write "<p><br></p><p><br></p><center><p><br></p><p><br></p>Ba�ar�l� bir �ekilde ��k�� yapt�n�z</center>"
call esasAlt()
 %>