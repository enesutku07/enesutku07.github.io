<%
Set Sur = Server.CreateObject("ADODB.Connection")
Sur.Open "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" &Server.MapPath("db/db.mdb")
%>
<% '################ Takvim Ba�lang�� ###############
 gun = day(date)
 ay = month(date)
 yil = year(date)
 gun_y = WeekdayName(Weekday(date))

 if ay = "1" then
 ay = "Ocak"
 elseif ay = "2" then
 ay = "�ubat"
 elseif ay = "3" then
 ay = "Mart"
 elseif ay = "4" then
 ay = "Nisan"
 elseif ay = "5" then
 ay = "May�s"
 elseif ay = "6" then
 ay = "Haziran"
 elseif ay = "7" then
 ay = "Temmuz"
 elseif ay = "8" then
 ay = "A�ustos"
 elseif ay = "9" then
 ay = "Eyl�l"
 elseif ay = "10" then
 ay = "Ekim"
 elseif ay = "11" then
 ay = "Kas�m"
 elseif ay = "12" then
 ay = "Aral�k"
 end if

 if gun_y = "Monday" then
 gun_y = "Pazartesi"
 elseif gun_y = "Tuesday" then
 gun_y = "Sal�"
 elseif gun_y = "Wednesday" then
 gun_y = "�ar�amba"
 elseif gun_y = "Thursday" then
 gun_y = "Per�embe"
 elseif gun_y = "Friday" then
 gun_y = "Cuma"
 elseif gun_y = "Saturday" then
 gun_y = "Cumartesi"
 elseif gun_y = "Sunday" then
 gun_y = "Pazar"
 end if
tarih = ""&gun&" "& ay &" "& yil &" "& gun_y
%>
<%
Set idarirs = Server.CreateObject("ADODB.Recordset")
sor = "Select * from idare"
idarirs.Open sor,Sur,1,3
for i=1 to idarirs.recordcount
If idarirs.eof Then exit for

tablobordercolor = idarirs("tablo_border_color")
banner= idarirs("banner")
banner_adi= idarirs("banner_adi")
logo= idarirs("logo")
bannerurl= idarirs("bannerurl")
logourl= idarirs("logourl")
defter_onay = idarirs("defter")
%>

<html>
<head>
<meta http-equiv="Content-Language" content="tr">
<meta name="GENERATOR" content="Murat Aslan Levent">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
<META NAME="MSSmartTagsPreventParsing" content="true">
<META NAME="DESCRIPTION" CONTENT="web tasar�m�, matbaa, magnet, promosyon,bardak altl���,mause pad ucuz kaliteli kolay ��z�mler �retmek bizim i�imiz.istanbul grafik olarak sizlerle �al��maktan onur duyar�z.">
<META NAME="KEYWORDS" CONTENT="magnet,promosyon,etiket,matbaa,bardakaltl���,bardak altl���,mause pad,mausepad,mucahit,mucahitt,istanbul grafik,web tasar�m�,web ��z�mleri,web g�ncelleme,asp site,flash site,istanbulgrafik,istanbulgrafik.net,istanbul,matbaa i�leri,bak�rk�y,trakya,beylikd�z�,b�y�k�ekmece,had�mk�y,k�ra�,haramidere,avc�lar,hosting,domain,tescil">
<META NAME="Generator" CONTENT="mucahitt taraf�ndan d�zenlenmi�tir.">
<META NAME="PUBLISHER" CONTENT="www.istanbulgrafik.net">
<META NAME="LANGUAGE" CONTENT="Turkish">
<META NAME="COPYRIGHT" CONTENT="isg �2006 T�m haklar� sakl�d�r">
<META NAME="ROBOTS" CONTENT="index">
<META NAME="ROBOTS" CONTENT="follow">
<META NAME="REVISIT-AFTER" CONTENT="30 days">
<title><%=idarirs("site_adi")%></title>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<style type="text/css">
<!--
.style1 {
	font-size: 10px;
	font-family: Tahoma;
}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style><body background="imaj/backraund.jpg">
<style>
Body { 
cursor:url("img/imlec.cur");
background-image:url(<%=idarirs("bodyimage")%>);
font-family: <%=idarirs("fontface")%>;
font-size: <%=idarirs("fontsize")%>pt;
color:<%=idarirs("fontcolor")%>;
Background-color: <%=idarirs("bgcolor")%>;
scrollbar-3dlight-color : #000000;
scrollbar-highlight-color : <%=idarirs("mbgcolor")%>;
scrollbar-darkshadow-color : <%=idarirs("fontcolor")%>;
scrollbar-shadow-color : <%=idarirs("mbgcolor")%>;
scrollbar-face-color : <%=idarirs("mbgcolor")%>;
scrollbar-arrow-color : <%=idarirs("bgcolor")%>;
scrollbar-track-color : <%=idarirs("bgcolor")%>;
}
a:link    { cursor: none; font-weight: <%=idarirs("lw")%>; font-face: <%=idarirs("mface")%>;font-size: <%=idarirs("msize")-2%>pt; text-decoration: none; color: <%=idarirs("link")%>; }
a:visited { cursor: none; font-weight: <%=idarirs("lw")%>; font-face: <%=idarirs("mface")%>;font-size: <%=idarirs("msize")-2%>pt; text-decoration: none; color: <%=idarirs("link")%>; }
a:active  { cursor: none; font-weight: <%=idarirs("lhw")%>; font-face: <%=idarirs("mface")%>;font-size: <%=idarirs("msize")-2%>pt; text-decoration: none; color: <%=idarirs("hover")%>; }
a:hover  { cursor: none; font-weight: <%=idarirs("lhw")%>; font-face: <%=idarirs("mface")%>;font-size: <%=idarirs("msize")-2%>pt; text-decoration: none; color: <%=idarirs("hover")%>; }


td {
Background-Color: <%=idarirs("tdbg")%>; 
font-face: <%=idarirs("fontface")%>;
font-size: <%=idarirs("fontsize")%>pt;
color: <%=idarirs("fontcolor")%>; 

}
.menutd {
Background-Color: <%=idarirs("mbgcolor")%>; 
font-face: <%=idarirs("mface")%>;
font-size: <%=idarirs("msize")%>pt;
font-weight: <%=idarirs("fontw")%>;
color: <%=idarirs("mcolor")%>; 

}

.input { 
Background-Color: <%=idarirs("mbgcolor")%>; 
Color: <%=idarirs("mcolor")%>; Border: 1; 
Border-Style: solid; 
Border-Color: Dashed Silver; 
Font-Size: <%=idarirs("msize")+1%>PX; 
Font-Weight: <%=idarirs("fontw")%>; 
Font-Family: <%=idarirs("mface")%>; 
}
</style>

<script language="JavaScript">
<!--
// please keep these lines on when you copy the source
// made by: Nicolas - http://www.javascript-page.com

var current = 0
var x = 0
var speed = 100
var speed2 = 2000

function initArray(n) {
  this.length = n;
  for (var i =1; i <= n; i++) {
    this[i] = ' '
  }
}

var typ = new Array()

<!--
// DURUM �UBU�U ���N BURAYI ED�TL�YORUZ!!!
  
typ[0]="�stanbul Grafik ve Ekosistem";
typ[1]="Ekonomik ��z�mler �retir!..";
typ[2]="G�venilir, d�r�st.....";
typ[3]="�ok ucuz ve kaliteli ��z�mler...";

//-->

function typewrite() {
var m = typ[current]

window.status = m.substring(0, x++) + " ]["

if (x == m.length + 1) {
x = 0
current++

if (current > typ.length - 1) {
current = 0
}

setTimeout("typewrite()", speed2)
}

else {
setTimeout("typewrite()", speed)
}
}

typewrite()
//-->

</script>
</head>
<%
idarirs.MoveNext
next
idarirs.close
Set idarirs= Nothing
%>
<% Sub esasUst () %>
<center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="770" height="60">  
 <tr>
   <td valign="top" width="486">
   <a href="<%=bannerurl%>" target="_blank"><img src="<%=banner%>" alt="<%=banner_adi%>" border="0"></a>   </td></table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="770" height="219">
  <tr>
    <td width="169" height="1"  valign="top" background="imaj/ust.gif">
    Ho� Geldiniz! 
      <%if Session("UserLoggedIn")="true" then 'Y�neticiyi Kar��layal�m%><b><%=Session("k_a") %></b><% End If %></td>
    <td width="4" height="1" valign="top" background="imaj/ust.gif" bgcolor="#CCD5FF">    </td>
    <td width="300" height="1" valign="top" background="imaj/ust.gif" bgcolor="#CCD5FF">    </td>
    <td width="297" height="1" valign="top" background="imaj/ust.gif" bgcolor="#CCD5FF">
    <p align="right">Bug�n : <%=tarih%></td>
  </tr>
  <tr>
    <td  valign="top" width="169" height="509">

<% ' Men�leri g�relim
Set menu = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=yes ORDER BY menu_no"
menu.Open sor,Sur,1,3
for i=1 to menu.recordcount
If menu.eof Then exit for
%>
<table width="160" border="1" cellpadding="2" cellspacing="0" bordercolor="<%=tablobordercolor%>" id="menu" style="border-collapse: collapse">
      <tr>
        <td width="100%" height="20" background="imaj/sol_ust.gif" class="menutd">
        <img align="absmiddle" width="13" height="16" src="img/menu.gif"> <%=menu("menu")%>        </td>
      </tr>
      <tr background="imaj/ust.gif">
        <td width="100%" background="imaj/ust.gif"><% ' sayfalar� g�relim
kid=menu("sira_no")
Set sayfa = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa WHERE menu_sira_no=" & kid & " order by sira"
sayfa.Open sor,Sur,1,3
for t=1 to sayfa.recordcount
If sayfa.eof Then exit for
if sayfa("onay")=True then
%>
          <tr><td><img align="absmiddle" width="10" height="12" src="img/sayfa.gif"> <a href="default.asp?id=<%=sayfa("id")%>" OnMouseOver="javascript:window.status='Ziyaret etmek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true"><%=sayfa("baslik")%></a><br></td></tr>
          <%
End if

sayfa.MoveNext
next
sayfa.close
Set sayfa= Nothing
%>
 </table><br>
<%
menu.MoveNext
next
menu.close
Set menu= Nothing
%>

<table width="160" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="<%=tablobordercolor%>" id="menu" style="border-collapse: collapse">
      <tr>
        <td width="100%" height="20" background="imaj/sol_ust.gif" class="menutd">
        <img align="absmiddle" width="13" height="16" src="img/menu.gif"> Google Arama</td>
      </tr>
      <tr>
        <td width="100%">
<script>
function clearfield()
{
  frmgoogle.q.value = "";
}
</script>
<!-- Search Google -->
           
<FORM name="frmgoogle" method=GET action="http://www.google.com/search" target="_blank">
              <div align="center"><A HREF="http://www.google.com/" target="_blank"> 
                <IMG SRC="img/google.gif" ALT="Google&trade;" width="107" height="36" 
border="0" align="absmiddle"></A><br>
                <INPUT TYPE=text name=q size=15 maxlength=255 value="...Buraya Yaz�n�z..." onclick='clearfield()' align="middle" class="form">
                <br>
                <INPUT type="submit" value="Arama Yap" class="input">
              </div>
            </FORM>							  
</td>
    </tr>
 </table>
<br>

<!-- EXTRA BLOK BA�LAR !!! -->

<table width="160" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="<%=tablobordercolor%>" id="menu" style="border-collapse: collapse">
      <tr>
        <td width="100%" background="imaj/sol_ust.gif" class="menutd">
        <img align="absmiddle" width="13" height="16" src="img/menu.gif"> Saat</td>
      </tr>
      <tr>
        <td width="100%">
<div align="center"> 
<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','130','height','130','src','clock','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','bgcolor','#FFFFFF','wmode','transparent','movie','clock' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="130" height="130">
<param name="movie" value="clock.swf">
<param name="quality" value="high"><param name="BGCOLOR" value="#FFFFFF">
<param name="wmode" value="transparent">
<embed src="clock.swf" width="130" height="130" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" bgcolor="#FFFFFF" wmode="transparent"></embed></object>
</noscript>
            </div>						  
</td>
    </tr>
 </table>

<!-- EXTRA BLOK B�TER !!! -->

<br>

<% if defter_onay=True then 'Defter aktif ise g�ster%>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=tablobordercolor%>" width="160" id="AutoNumber2" height="58">
      <!--ziyaret�i sayfas�������������������
	   <tr>
         <td width="100%" height="20" background="imaj/sol_ust.gif" class="menutd">
        <img align="absmiddle" width="13" height="16" src="img/menu.gif"> Ziyaret�i 
          Defteri</td>
      </tr>
      <tr>
        <td width="100%" bgcolor="#CCCCCC">

<img align="absmiddle" width="10" height="12" src="img/sayfa.gif"> <a href="defter.asp" OnMouseOver="javascript:window.status='Ziyaret�i Defterini Okumak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Defteri Oku</a><br>
<img align="absmiddle" width="10" height="12" src="img/sayfa.gif"> <a href="yaz.asp" OnMouseOver="javascript:window.status='Ziyaret�i defterine Yazmak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Defteri Yaz</a><br>							  

</td>
      </tr> -->


 </table>
<br>
<%
End if
if Session("UserLoggedIn")="true" then 'Y�neti�i �ifresini Girmi�se
%>


<table border="1" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=tablobordercolor%>" width="160" id="AutoNumber2" height="58">
      <tr>
        <td width="100%" height="20" background="imaj/sol_ust.gif" class="menutd">
        <img align="absmiddle"width="13" height="16" src="img/menu.gif"> Y�netici Paneli        </td>
      </tr>
      <tr>
        <td width="100%">
<img align="absmiddle" width="10" height="12" src="img/sayfa.gif"> <a href="yeni.asp" OnMouseOver="javascript:window.status='Sisteme Yeni Sayfa Kaydetmek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Yeni Sayfa Ekle</a><br>
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <a href="menu.asp" OnMouseOver="javascript:window.status='Men� Ayarlar�n� Yapmak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Men� Ayarlar�</a><br>							  
<img align="absmiddle" width="10" height="12" src="img/sayfa.gif"> <a href="liste.asp" OnMouseOver="javascript:window.status='Sayfa Ayarlar�n� Yapmak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Sayfa Ayarlar�</a><br>							  
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <a href="defter.asp" OnMouseOver="javascript:window.status='Ziyaret�i Defter i�lemleri ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Ziyaret�i Defteri</a><br>							  
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <a href="tasarim.asp" OnMouseOver="javascript:window.status='G�r�n�m Ayarlar�n� G�ncellemek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">G�r�n�m Ayarlar�</a><br>
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <a href="idare.asp" OnMouseOver="javascript:window.status='�dare Ayarlar�n� G�ncellemek ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">�dari B�l�m</a><br>
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <a href="yonetim.asp" OnMouseOver="javascript:window.status='Mesaj okumak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">Mesaj oku </a><br>							  
<img align="absmiddle"width="10" height="12" src="img/sayfa.gif"> <A HREF="terket.asp" OnMouseOver="javascript:window.status='��kmak ��in T�klay�n�z...'; return true" OnMouseOut="javascript:window.status=''; return true">��k��</a></font>
</td>
      </tr>
 </table>
<%end if%>
    </td>
    <td width="4" valign="top" height="509">&nbsp;    </td>
    <td valign="top" height="509" colspan="2">
    <table border="1" cellpadding="0" cellspacing="2" style="border-collapse: collapse" bordercolor="<%=tablobordercolor%>" width="100%" height="100%" id="AutoNumber3">
      <tr>
        <td width="100%" height="100%" valign="top">

<% End Sub%><% Sub esasAlt() %></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="16" colspan="4"  valign="top" background="imaj/ust.gif">
    <p align="Right" class="style1">Copyright � <a href="mailto:info@istanbulgrafik.net">istanbul grafik</a>    </td>
  </tr>
</table>
</center>
<%
if not Session("UserLoggedIn")="true" then 'Y�neti�i �ifresini Girmemi�se
if 1=Request.QueryString("id") then
response.write "<center>*<a href=""idare.asp"">�dare Giri�i</a>*</center>"
end if
end if%>
</body>
</html>
<% End Sub%>
