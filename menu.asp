<!--#include file="sayfa.asp"-->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script><% call esasUst() %>
<%
  if Session("UserLoggedIn")<>"true" then
%>
<center>Giriþ yapmanýz gerekmektedir.</center>
<% else %>
<center><h5>MENÜ AYAR SAYFASI</H5></center>
<table border="1" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
 <tr>
<td align="center"><b>Sayfa adý</b></td>
<td width="13" align="center"><b>Düzenle</b></td>
<td width="13" align="center"><b>Sil</b></td>
<td width="13" align="center"><b>Menüde</b></td>
<form>
</tr>
<% ' Menüleri görelim
Set menu = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=yes ORDER BY menu_no"
menu.Open sor,Sur,1,3
for i=1 to menu.recordcount
If menu.eof Then exit for
%>
<tr><td class="menutd">
<script language="JavaScript">

//Function to choose how the members list is sorted
function MembersSort2(menu){

   	if (menu != "") self.location.href = "menu_sirala.asp?id=" + menu.options[menu.selectedIndex].value;
	return true;
}

</script>
<select class="input" name="menu" onChange="MembersSort2(this)">
<option value=""><%=menu("menu_no")%></option>
<%
Set ms = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler WHERE monay=yes order by menu_no"
ms.Open sor,Sur,1,3
for p=1 to ms.recordcount
If ms.eof Then exit for
if menu("menu_no") = p then
else%>

<option value="<%=menu("sira_no")%>&no=<%=p%>"><%=p%></option>
        
<%
end if
ms.MoveNext
next
ms.close
Set l= Nothing
%> </select>
<img align="absmiddle" width="13" height="16" src="img/menu.gif"> <%=menu("menu")%>
</td>
<td align="center" class="menutd"><a href="#" onClick="MM_openBrWindow('menu_duzenle.asp?id=<%=menu("sira_no")%>','duzenle','scrollbars=no,width=300,height=210')" style="text-decoration: none" OnMouseOver="javascript:window.status='Menüyü Yeniden Adlandýrmak Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><img src="img/duzenle.gif" border="0"></a></td>
<td align="center" class="menutd"><a href="menu_sil.asp?id=<%=menu("sira_no")%>" style="text-decoration: none" OnMouseOver="javascript:window.status='Menüyü Sayfalarýyla Beraber Silmek Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><img src="img/delete.gif" border="0"></a></td>

<td align="center" class="menutd" align="center">

<%if menu("sira_no") = 1 Then
response.write ""
else
onay = menu("monay")
if onay = True then
response.write "<a href=menu_kaldir.asp?id="&menu("sira_no")&" OnMouseOver=""javascript:window.status='Menüyü Kaldýrmak Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/pasif.gif"" border=""0""></a>"
end if
end if
%>
</td></tr>
</form>
<tr><td><img src="img/blank.gif" height="5"></td></tr>
<%
menu.MoveNext
next
menu.close
Set menu= Nothing
%>
</table>


<img src="img/blank.gif" width="430" height="40">
<b><Center>Gösterilmeyen (Onaysýz) Menüler</b> </center>


<table border="1" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
 <tr>
<td align="center"><b>Sayfa adý</b></td>
<td width="13" align="center"><b>Düzenle</b></td>
<td width="13" align="center"><b>Sil</b></td>
<td width="13" align="center"><b>Menüde</b></td>
</tr>
<% ' Menüleri görelim
Set menu = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=no ORDER BY sira_no"
menu.Open sor,Sur,1,3
for i=1 to menu.recordcount
If menu.eof Then exit for
%>
<tr><td class="menutd">
<img align="absmiddle"width="13" height="16" src="img/menu.gif"> <%=menu("menu")%>
</td>
<td align="center" class="menutd"><a href="#" onClick="MM_openBrWindow('menu_duzenle.asp?id=<%=menu("sira_no")%>','duzenle','scrollbars=no,width=300,height=210')" style="text-decoration: none" OnMouseOver="javascript:window.status='Menüyü Yeniden Adlandýrmak Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><img src="img/duzenle.gif" border="0"></a></td>
<td align="center" class="menutd"><a href="menu_sil.asp?id=<%=menu("sira_no")%>" style="text-decoration: none" OnMouseOver="javascript:window.status='Menüyü Sayfalarýyla Beraber Silmek Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><img src="img/delete.gif" border="0"></a></td>
<td align="center" class="menutd">
<%
onay = menu("monay")
if onay = True then
else
response.write "<a href=menu_ekle.asp?id="&menu("sira_no")&" OnMouseOver=""javascript:window.status='Menüyü Göstermek Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/aktif.gif"" border=""0""></a>"
end if
%>
</td></tr>

<tr><td colspan="5"><img src="img/blank.gif" height="5"></td></tr>

<%
menu.MoveNext
next
menu.close
Set menu= Nothing
%>
</table>
<% End If %><p><br><p>
<center>
<form name=eke method=POST action="yeni_menu_ekle.asp">
<b>Yeni Menü Ekle: </b><input class="input" type="text" name=menu size="25" value="" maxlength="20"> <input type="checkbox" name="monay" value="true" checked> Sayfada Görünsün
<input type="submit" class="input" value="Gönder">
</form></center>

<% call esasAlt() %>