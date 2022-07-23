<!--#include file="sayfa.asp"-->
<% call esasUst() %>

<%
  if Session("UserLoggedIn")<>"true" then
%>

<center>Giriþ yapmanýz gerekmektedir.</center>


<% else %>
<center><h5>SAYFA AYAR SAYFASI</H5></center>
<table border="1" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
 <tr>
<td>Sayfa adý</td>
<td>Hit</td>
<td>Sirala</td>
<td>Sil</td>
<td>Menü</td><form>
</tr>
<% ' Menüleri görelim
Set menu = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=yes ORDER BY menu_no"
menu.Open sor,Sur,1,3
for i=1 to menu.recordcount
If menu.eof Then exit for
%>
<tr><td class="menutd" colspan=5>

<img align="absmiddle"width="13" height="16" src="img/menu.gif"> <%=menu("menu")%>
</td></form>
</tr>

<% ' sayfalarý görelim
kid=menu("sira_no")
Set sayfa = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa WHERE menu_sira_no=" & kid & " order by sira"
sayfa.Open sor,Sur,1,3
for t=1 to sayfa.recordcount
If sayfa.eof Then exit for
%>
<tr>
<td><% onay = sayfa("onay")
if onay = True then
response.write "<img align=""absmiddle"" width=""10"" height=""12"" src=""img/sayfa.gif"">"
else
response.write "<b>X</b>"
end if
%> <a href="default.asp?id=<%=sayfa("id")%>" target="_blank" OnMouseOver="javascript:window.status='Sayfayý incelemek Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><%=sayfa("baslik")%></a></td>

<td width="33"><%=sayfa("hit")%></td>
<td width="13"><script language="JavaScript">

//Function to choose how the members list is sorted
function MembersSort(SelectSort){

   	if (SelectSort != "") self.location.href = "sirala.asp?id=" + SelectSort.options[SelectSort.selectedIndex].value;
	return true;
}

</script><form>
<select class="input" name="SelectSort" onChange="MembersSort(this)">
<option value=""><%=sayfa("sira")%></option>
<%
Set l = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa WHERE menu_sira_no=" & kid & " order by onay"
l.Open sor,Sur,1,3
for p=1 to l.recordcount
If l.eof Then exit for
if sayfa("sira") = p then
else%>

<option value="<%=sayfa("id")%>&sira=<%=p%>"><%=p%></option>
        
<%
end if
l.MoveNext
next
l.close
Set l= Nothing
%> </select>
</td></form>
<td width="13">
<%
id = sayfa("id")
if id=1 then
response.write ""
else
%>
<a href="sayfa_sil.asp?id=<%=sayfa("id")%>" OnMouseOver="javascript:window.status='-<%=sayfa("baslik")%>- baþlýklý sayfayý sil...'; return true" OnMouseOut="javascript:window.status=''; return true"><img border="0" align="absmiddle"width="13" height="16" src="img/delete.gif"></a>
<%End if%></td>
<td width="13" align=center>
<% 
id = sayfa("id")
if id=1 then
response.write ""
else
onay = sayfa("onay")
if onay = True then
response.write "<a href=menuden_kaldir.asp?id="&sayfa("id")&" OnMouseOver=""javascript:window.status='Menüden Kaldýrmak Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/pasif.gif"" border=""0""></a>"
else
response.write "<a href=menuye_ekle.asp?id="&sayfa("id")&" OnMouseOver=""javascript:window.status='Menüde Göstermek Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/aktif.gif"" border=""0""></a>"
end if
end if
%>
</td></tr>

<%
sayfa.MoveNext
next
sayfa.close
Set sayfa= Nothing
%>
<tr><td colspan="5"><img src="img/blank.gif" height="20"></td></tr>
<%
menu.MoveNext
next
menu.close
Set menu= Nothing
%>
</table>
<center>Sayfalarýn Menü Kategorilerini Deðiþtirmek için Sayfa Güncelleme Alanýndan Yararlanýnýz.</center>


<img src="img/blank.gif" width="430" height="40">
<b><Center>Gösterilmeyen (Onaysýz) Menüler</b> </center>


<table border="1" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
 <tr>
<td>Sayfa adý</td>
<td>Hit</td>
<td>Sýrala</td>
<td>Sil</td>
<td>Menü</td>
</tr>
<% ' Menüleri görelim
Set menu = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=no ORDER BY sira_no"
menu.Open sor,Sur,1,3
for i=1 to menu.recordcount
If menu.eof Then exit for
%>
<tr><td class="menutd" colspan=5>
<img align="absmiddle" width="13" height="16" src="img/menu.gif"> <%=menu("menu")%>
</td>
</tr>
<% ' sayfalarý görelim
kid=menu("sira_no")
Set sayfa = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa WHERE menu_sira_no=" & kid & " order by sira"
sayfa.Open sor,Sur,1,3
for t=1 to sayfa.recordcount
If sayfa.eof Then exit for
'if sayfa("onay")=True then
%>
<tr>
<td><% onay = sayfa("onay")
if onay = True then
response.write "<img align=""absmiddle"" width=""10"" height=""12"" src=""img/sayfa.gif"">"
else
response.write "<b>X</b>"
end if
%> <a href="default.asp?id=<%=sayfa("id")%>" target="_blank" OnMouseOver="javascript:window.status='Sayfayý incelemek Ýçin Týklayýnýz...'; return true" OnMouseOut="javascript:window.status=''; return true"><%=sayfa("baslik")%></a></td>

<td width="33"><%=sayfa("hit")%></td>
<td width="13"><select class="input" name="SelectSort" onChange="MembersSort(this)">
<option value=""><%=sayfa("sira")%></option>
<%
Set l = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa WHERE menu_sira_no=" & kid & " order by onay"
l.Open sor,Sur,1,3
for p=1 to l.recordcount
If l.eof Then exit for
if sayfa("sira") = p then
else%>

<option value="<%=sayfa("id")%>&sira=<%=p%>"><%=p%></option>
        
<%
end if
l.MoveNext
next
l.close
Set l= Nothing
%> </select>
</td>
<td width="13">
<%
id = sayfa("id")
if id=1 then
response.write ""
else
%>
<a href="sayfa_sil.asp?id=<%=sayfa("id")%>" OnMouseOver="javascript:window.status='-<%=sayfa("baslik")%>- baþlýklý sayfayý sil...'; return true" OnMouseOut="javascript:window.status=''; return true"><img border="0" align="absmiddle"width="13" height="16" src="img/delete.gif"></a>
<%End if%></td>
<td width="13" align=center>
<% 
id = sayfa("id")
if id=1 then
response.write ""
else
onay = sayfa("onay")
if onay = True then
response.write "<a href=menuden_kaldir.asp?id="&sayfa("id")&" OnMouseOver=""javascript:window.status='Menüden Kaldýrmak Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/pasif.gif"" border=""0""></a>"
else
response.write "<a href=menuye_ekle.asp?id="&sayfa("id")&" OnMouseOver=""javascript:window.status='Menüde Göstermek Ýçin Týklayýnýz...'; return true"" OnMouseOut=""javascript:window.status=''; return true""><img src=""img/aktif.gif"" border=""0""></a>"
end if
end if
%>
</td></tr>

<%
sayfa.MoveNext
next
sayfa.close
Set sayfa= Nothing
%>
<tr><td colspan="5"><img src="img/blank.gif" height="10"></td></tr>

<%
menu.MoveNext
next
menu.close
Set menu= Nothing
%>
</table>
<% End If %>




<% call esasAlt() %>