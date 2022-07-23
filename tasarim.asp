<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %>
<table cellpadding="1" align="center" width="530" cellspacing="1" border="1" style="border-collapse: collapse">
<tr>
<td colspan=2><center><b>Görünüm Güncelleme Alaný</b></center></td>
</tr>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from idare"
rs.Open sor,Sur,1,3
%>
<form method="POST" onReset="return confirm('Formu temizlemek istediðinizden emin misiniz?');" action="tasarim_guncelle.asp">
<tr>
<td width="180">Arka Plan Resmi :</td><td width="350"><input class="input" type="text" name="bodyimage" size="18" value="<%=rs("bodyimage")%>"></td>
</tr>
<tr>
<td width="180">Arka Plan Rengi :</td><td width="350"><input class="input" type="text" name="bgcolor" size="18" value="<%=rs("bgcolor")%>"></td>
</tr>
<tr>
<td>Font Tipi :</td><td><input class="input" type="text" name="fontface" size="18" value="<%=rs("fontface")%>"></td>
</tr>
<tr>
<td>Font Boyutu :</td><td><input class="input" type="text" name="fontsize" size="18" value="<%=rs("fontsize")%>"></td>
</tr>
<tr>
<td>Font Rengi :</td><td><input class="input" type="text" name="fontcolor" size="18" value="<%=rs("fontcolor")%>"></td>
</tr>
<tr>
<td>Link Rengi :</td><td><input class="input" type="text" name="link" size="18" value="<%=rs("link")%>"></td>
</tr>
<tr>
<td>Link (bold/normal) :</td><td><input class="input" type="text" name="lw" size="18" value="<%=rs("lw")%>"></td>
</tr>
<tr>
<td>Link Hover (bold/normal) :</td><td><input class="input" type="text" name="lhw" size="18" value="<%=rs("lhw")%>"></td>
</tr><tr>
<td>Link Hover Rengi :</td><td><input class="input" type="text" name="hover" size="18" value="<%=rs("hover")%>"></td>
</tr>
<tr>
<td>Menü Font Boyutu :</td><td><input class="input" type="text" name="msize" size="18" value="<%=rs("msize")%>"></td>
</tr><tr>
<td>Menü Artalan Rengi :</td><td><input class="input" type="text" name="mbgcolor" size="18" value="<%=rs("mbgcolor")%>"></td>
</tr>
<tr>
<td>Menü Font Tipi :</td><td><input class="input" type="text" name="mface" size="18" value="<%=rs("mface")%>"></td>
</tr>
<tr>
<td>Menü Font (bold/normal) :</td><td><input class="input" type="text" name="fontw" size="18" value="<%=rs("fontw")%>"></td>
</tr>
<tr>
<td>Menü Font Rengi :</td><td><input class="input" type="text" name="mcolor" size="18" value="<%=rs("mcolor")%>"></td>
</tr>
<tr>
<td>Tablo Border Rengi :</td><td><input class="input" type="text" name="tablo_border_color" size="18" value="<%=rs("tablo_border_color")%>"></td>
</tr>
<tr>
<td>Sayfa Artalan Rengi :</td><td><input class="input" type="text" name="tdbg" size="18" value="<%=rs("tdbg")%>"></td>
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