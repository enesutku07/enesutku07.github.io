<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>Untitled Document</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' NUMARASINI DOĞRU GİRİNİZ.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' ALANINI BOŞ BIRAKMAYINIZ.\n'; }
  } if (errors) alert('DİKKAT:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
<style type="text/css">
<!--
body {
	background-color: #e8e8e8;
}
-->
</style></head>

<body>
<table width="100" border="0" align="center">
  <tr>
    <td height="20" align="center"><p class="baslik">&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td align="center"><p class="baslik">iletişim formu</p>
      <p class="yazi1">Lütfen işaretli alanları doldurunuz!..</p>
      <table width="37%" border="0">
        <tr>
          <td><form id="form1" name="form1" method="post" action="yolla.asp">
              <table width="213" cellpadding="00" cellspacing="0">
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Adınız</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <input name="ad" type="text" class="baslik" id="ad" onblur="MM_validateForm('ad','','R');return document.MM_returnValue" size="15" maxlength="15" />
                  </label></td>
                </tr>
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Soyadınız</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <input name="soyad" type="text" class="baslik" id="soyad" onblur="MM_validateForm('soyad','','R');return document.MM_returnValue" size="15" maxlength="15" />
                  </label></td>
                </tr>
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Telefon</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <input name="telefon" type="text" class="baslik" id="telefon" onblur="MM_validateForm('telefon','','NisNum');MM_validateForm('telefon','','RisNum');return document.MM_returnValue" size="15" maxlength="11" />
                  </label></td>
                </tr>
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Adres</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <input name="adres" type="text" class="baslik" id="adres" onblur="MM_validateForm('adres','','R');return document.MM_returnValue" size="15" maxlength="50" />
                  </label></td>
                </tr>
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Konu</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <input name="konu" type="text" class="baslik" id="konu" onblur="MM_validateForm('konu','','R');return document.MM_returnValue" value="" size="15" />
                  </label></td>
                </tr>
                <tr>
                  <td width="10" align="center" valign="top" class="yazi1"><span class="style1">*</span></td>
                  <td width="50" align="left" valign="top">Mesaj</td>
                  <td width="1" align="left" valign="top" class="yazi1">:</td>
                  <td width="125" valign="top" class="baslik"><label>
                    <textarea name="mesaj" cols="15" rows="3" class="baslik" id="mesaj" onblur="MM_validateForm('mesaj','','R');return document.MM_returnValue"></textarea>
                  </label></td>
                </tr>
                <tr>
                  <td colspan="4" align="center"><label>
                    <input name="Submit" type="submit" class="baslik" value="GÖNDER" />
                    <input name="Submit2" type="reset" class="baslik" value="TEMİZLE" />
                  </label></td>
                </tr>
              </table>
          </form></td>
        </tr>
      </table></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
