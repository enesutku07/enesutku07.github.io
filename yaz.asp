<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<% if defter_onay=True then%>
<p><br>

<form method="POST" onReset="return confirm('Formu temizlemek istedi�inizden emin misiniz?');" action="defter_kayit.asp">
 <table border="0" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
    <tr>
      <td colspan="2" align="center">Z�YARET�� DEFTER� FORMU</td>
      </tr>
    <tr>
      <td width="180">Ad�n�z Soyad�n�z:</td>
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
      <td width="180">Ya�ad��n�z �ehir:</td>
      <td width="350">
      <input type="text" class="input" name="sehir" size="28" value=""></td>
    </tr>
    <tr>
      <td valign=top width="180">Mesaj�n�z:</td>
      <td width="350">
      <textarea rows="13" name="mesaj" class="input" cols="58"></textarea></td>   
</tr>
       <tr>
      <td>
<% randomize 
Session("guvkodu")=Int((rnd*999999)+100000) %>
G�venlik:
          <input name="guvenlik" type="text" class="input" id="guvenlik" value="<% =Session("guvkodu") %>" size="13" readonly="true" /></td>
         <td> G�venlik Kodu:
          <input name="guvenlik2" type="text" class="input" id="guvenlik2" /> </td>
</tr>
   <tr>    
<td colspan=2 align=center>
<input class="input" type="submit" value="G�nder">
<input type="reset" class="input" name="Reset" value="Temizle" name="B2"></td>
    </tr>
</table>
</form>
<%
 mesaj = Replace(mesaj, Chr(10) , "") 'sat�r ba��
 mesaj = Replace(mesaj, Chr(34) , "") '�ift t�arnak
 mesaj = Replace(mesaj, "'" , "")   'tek t�rnak
 mesaj = Replace(mesaj, Chr(13) , " ") 'yeni sat�r
 mesaj = Replace(mesaj, "<" , " ")   'k���kt�r
 mesaj = Replace(mesaj, ">" , " ")   'b�y�kt�r
%>

<%else
response.write "<center><b>Ziyaret�i Defteri Kullan�ma Kapal�d�r.</b></center>"
end if
if Session("UserLoggedIn")="true" then
%>
<p>
<% if defter_onay=True then
response.write "<center><a href=""defteri_kapat.asp"" OnMouseOver=""javascript:window.status='Defteri Kullan�ma Kapatmak ��in T�klay�n�z....'; return true"" OnMouseOut=""javascript:window.status=''; return true"">Defteri Kullan�ma <b>Kapatmak</b> ��in T�klay�n�z.</a></center>"
else
response.write "<center><a href=""defteri_ac.asp"" OnMouseOver=""javascript:window.status='Defteri Kullan�ma A�mak ��in T�klay�n�z....'; return true"" OnMouseOut=""javascript:window.status=''; return true"">Defteri Kullan�ma <b>A�mak</b> ��in T�klay�n�z.</a></center>"
end if
end if%>



<% call esasAlt() %>