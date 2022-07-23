<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%
  if Session("UserLoggedIn")<>"true" then
%>

<FORM NAME=giris ACTION="giris_yap.asp" METHOD=post>
<table align=center>
<td>Kullanýcý Adý:</td><td><INPUT class="input" NAME=k_a SIZE=15></td>
</tr><tr>
<td>Þifre:</td><td><INPUT TYPE=password class="input" NAME=sifre SIZE=15></td>
</tr><tr>
<td align=center colspan=2><BUTTON class="input" TYPE=submit>Giriþ</BUTTON></td>
</tr></table></form>

<% else %>
<table cellpadding="1" width="530" cellspacing="1" style="border-collapse: collapse" class="tablo" border=1>
<tr>
<td colspan=2><center><b>Ýdari Alan</b></center></td>
</tr>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from idare"
rs.Open sor,Sur,1,3
%><form method="POST" onReset="return confirm('Formu temizlemek istediðinizden emin misiniz?');" action="idare_guncelle.asp">
<tr>
<td>Kullanýcý Adý :</td><td><input class="input" type="text" name="user" size="28" value="<%=rs("user")%>"></td>
</tr><tr>
<td>Þifre :</td><td><input class="input" type="password" name="pass" size="28" value="<%=rs("pass")%>"></td>
</tr><tr>
<td>Site Adý :</td><td><input class="input" type="text" name="site_adi" size="28" value="<%=rs("site_adi")%>"></td>
</tr>
<tr>
<td>Logo :</td><td><input class="input" type="text" name="logo" size="28" value="<%=rs("logo")%>"></td>
</tr>
<tr>
<td>Logo adresi :</td><td><input class="input" type="text" name="logourl" size="28" value="<%=rs("logourl")%>"></td>
</tr>
<tr>
<td>Banner Adý:</td><td><input class="input" type="text" name="banner_adi" size="28" value="<%=rs("banner_adi")%>"></td>
</tr>
<tr>
<td>Banner :</td><td><input class="input" type="text" name="banner" size="28" value="<%=rs("banner")%>"></td>
</tr>
<tr>
<td>Banner adresi :</td><td><input class="input" type="text" name="bannerurl" size="28" value="<%=rs("bannerurl")%>"></td>
</tr>

<tr>
<td>iletiþim :</td><td><input class="input" type="text" name="iletisim" size="28" value="<%=rs("iletisim")%>"></td>
</tr>
<%
rs.movenext
rs.close
set rs = Nothing
%><tr>
<td colspan="2" align="center">
<input type="submit" class="input" value="Gönder">
      <input type="reset" class="input" name="Reset" value="Temizle" name="B2">
</td>
</tr>
</table>

<% End If %>






<% call esasAlt() %>