<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<% if defter_onay=True then%>
<p><br>

<form method="POST" onReset="return confirm('Formu temizlemek istediðinizden emin misiniz?');" action="defter_kayit.asp">
 <table border="0" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
    <tr>
      <td colspan="2" align="center">ZÝYARETÇÝ DEFTERÝ FORMU</td>
      </tr>
    <tr>
      <td width="180">Adýnýz Soyadýnýz:</td>
      <td width="350">
      <input type="text" class="input" name="yazan" size="28" value=""></td>
    </tr>
    <tr>
      <td width="180">Email adresiniz:</td>
      <td width="350">
      <input type="text" class="input" name="email" size="28" value=""></td>
    </tr>
    <tr>
      <td width="180">Varsa Web Adresiniz:</td>
      <td width="350">
      <input type="text" class="input" name="web" size="28" value="http://"></td>
    </tr>
    <tr>
      <td width="180">Yaþadðýnýz Þehir:</td>
      <td width="350">
      <input type="text" class="input" name="sehir" size="28" value=""></td>
    </tr>
    <tr>
      <td valign=top width="180">Mesajýnýz:</td>
      <td width="350">
      <textarea rows="13" name="mesaj" class="input" cols="58"></textarea></td>   
</tr>
       <tr>
      <td>
<% randomize 
Session("guvkodu")=Int((rnd*999999)+100000) %>
Güvenlik:
          <input name="guvenlik" type="text" class="input" id="guvenlik" value="<% =Session("guvkodu") %>" size="13" readonly="true" /></td>
         <td> Güvenlik Kodu:
          <input name="guvenlik2" type="text" class="input" id="guvenlik2" /> </td>
</tr>
   <tr>    
<td colspan=2 align=center>
<input class="input" type="submit" value="Gönder">
<input type="reset" class="input" name="Reset" value="Temizle" name="B2"></td>
    </tr>
</table>
</form>
<%
 mesaj = Replace(mesaj, Chr(10) , "") 'satýr baþý
 mesaj = Replace(mesaj, Chr(34) , "") 'çift týarnak
 mesaj = Replace(mesaj, "'" , "")   'tek týrnak
 mesaj = Replace(mesaj, Chr(13) , " ") 'yeni satýr
 mesaj = Replace(mesaj, "<" , " ")   'küçüktür
 mesaj = Replace(mesaj, ">" , " ")   'büyüktür
%>

<%else
response.write "<center><b>Ziyaretçi Defteri Kullanýma Kapalýdýr.</b></center>"
end if
if Session("UserLoggedIn")="true" then
%>
<p>
<% if defter_onay=True then
response.write "<center><a href=""defteri_kapat.asp"" OnMouseOver=""javascript:window.status='Defteri Kullanýma Kapatmak Ýçin Týklayýnýz....'; return true"" OnMouseOut=""javascript:window.status=''; return true"">Defteri Kullanýma <b>Kapatmak</b> Ýçin Týklayýnýz.</a></center>"
else
response.write "<center><a href=""defteri_ac.asp"" OnMouseOver=""javascript:window.status='Defteri Kullanýma Açmak Ýçin Týklayýnýz....'; return true"" OnMouseOut=""javascript:window.status=''; return true"">Defteri Kullanýma <b>Açmak</b> Ýçin Týklayýnýz.</a></center>"
end if
end if%>



<% call esasAlt() %>