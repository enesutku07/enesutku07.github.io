<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<% if defter_onay=True then%>
<%
Set md = Server.CreateObject("ADODB.Recordset")
sor = "Select * from defter order by id desc"
md.Open sor,Sur,1,3
if md.eof then
response.write("<center><p><br><p><br>Sitemize g�r���n� belirten kimse olmam��t�r. �lk mesaj� siz <a href=yaz.asp>yazmak ister misiniz?</a></center>  ")
else
sayfa = Request.QueryString("sayfa")
If sayfa="" Then sayfa=1
md.pagesize = 10 
md.absolutepage = sayfa
sayfa_sayisi = md.pagecount
for i=1 to md.pagesize
%>
<%If md.eof Then exit for%>
<table align="center" cellpadding="1" width="530" cellspacing="1" style="border-collapse: collapse"  class=tablo border=1>
<tr>
<td>Yazan: <a href="mailto:<%=md("email")%>" OnMouseOver="javascript:window.status='Mail G�ndermek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true"><%=md("yazan")%></a></td>
<td align=right>Tarih: <%=md("tarih")%></td>
</tr><tr>
<td colspan=2><%=md("mesaj")%></td>
</tr><tr>
<td>�ehir: <%=md("sehir")%></td><td>Web: <a href="<%=md("web")%>" target="_blank"><%=md("web")%></a>
</td></tr>
<%
if Session("UserLoggedIn")="true" then
%>
<tr>
<td colspan=2>
<a href="defter_sil.asp?id=<%=md("id")%>" OnMouseOver="javascript:window.status='Bu Mesaj� Silmek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true"><img border="0" align="absmiddle"width="13" height="16" src="img/delete.gif"></a>

</td>
</tr>
<%End if%>
</table><br>
<%
md.movenext
next
md.close
set md = Nothing
%>

Sayfalar: <%
for j = 1 to sayfa_sayisi
response.Write "<a href=defter.asp?sayfa="&j&">"&j&" </a>"
next
End if%>
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