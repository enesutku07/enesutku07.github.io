<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-style: italic;
	font-weight: bold;
}
-->
</style>
<p align="center" class="style1 style1">YÖNETÝM PANELÝ OKUMA VE SÝLME BÖLÜMÜ </p>
<p align="center" class="style1 style1">hoþgeldin admin. </p>
<table width="400" border="1" align="center" bordercolor="#000000">
  <tr>
    <td width="93" align="center"><span style="font-size: 12px; font-weight: bold; color: #FF0000">AD</span></td>
    <td width="93" align="center"><span style="font-size: 12px; font-weight: bold; color: #FF0000">SOYAD</span></td>
    <td width="93" align="center"><span style="font-size: 12px; font-weight: bold; color: #FF0000">OKU</span></td>
    <td width="93" align="center"><span style="font-size: 12px; font-weight: bold; color: #FF0000">SÝL</span></td>
  </tr>
</table>
<%
set objcon = server.CreateObject("ADODB.Connection")
objCon.open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &Server.MapPath("data/mucahit.mdb") )


set objyazi=server.CreateObject("ADODB.recordset")
SQL= ("select*from mesaj")
objyazi.open sql,objcon,1,3
do while not objyazi.eof
%>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana;
	font-style: italic;
	font-weight: bold;
}
-->
</style>
<table width="400" border="1" align="center" bordercolor="#000000">
  <tr>
    <td width="93" align="center"><%response.Write(objyazi("ad"))%></td>
    <td width="93" align="center"><%response.Write(objyazi("soyad"))%></td>
    <td width="93" align="center"><a href="msjoku.asp?id=<%=Objyazi("id")%>">oku</a></td>
    <td width="93" align="center"><a href="sil.asp?id=<%=Objyazi("id")%>">sil</a></td>
  </tr>
</table>
<%
objyazi.Movenext
loop
%>