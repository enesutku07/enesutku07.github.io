<!--#include file="sayfa.asp"-->
<% call esasUst() %>
<%
set objcon_ilet = server.CreateObject("ADODB.Connection")
objCon_ilet.open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &Server.MapPath("data/mucahit.mdb") )

id= Request("id")
Set objyazi = Server.CreateObject("ADODB.Recordset")
StrSql ="Select * from mesaj where id = " &id& ""
Objyazi.Open StrSql,Objcon_ilet,1,3
do while not objyazi.eof

%>
<style type="text/css">
<!--
.style5 {font-size: 12px; font-weight: bold; color: #FF0000; }
.style8 {font-size: 12px; color: #000000; }
.style10 {font-size: 12px; color: #000000; font-weight: bold; }
.style11 {color: #000000}
-->
</style>

<table width="400" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style5">ad</span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style5"><span class="style10"><%=Objyazi("ad")%></span></span></td>
  </tr>
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style8"><span class="style5">soyad</span></span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style10"><%=Objyazi("soyad")%>
      </textarea>
    </span></td>
  </tr>
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style5">telefon</span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style5"><span class="style11"><%=Objyazi("telefon")%></span></span></td>
  </tr>
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style8"></textarea>
        <span class="style5">adres</span></span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style10"><%=Objyazi("adres")%>
      </textarea>
    </span></td>
  </tr>
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style5">konu</span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style5"><span class="style11"><%=Objyazi("konu")%></span></span></td>
  </tr>
  <tr>
    <td width="100" height="30" align="left" valign="top"><span class="style8"><span class="style5">mesaj</span></span></td>
    <td width="300" height="30" align="left" valign="top"><span class="style10"><%=Objyazi("mesaj")%>
      </textarea>
    </span></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center"></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center"><form id="form1" name="form1" method="post" action="yonetim.asp">
      <label>
      <input type="submit" name="Submit" value="GERÝ" />
      </label>
        </form></td>
  </tr>
</table>

<%
objyazi.Movenext
loop
%>
