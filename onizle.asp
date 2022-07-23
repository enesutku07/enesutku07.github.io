<% Response.Buffer = True %>
<!--#include file="sayfa.asp"-->
<table border="1" cellpadding="0" cellspacing="2" style="border-collapse: collapse" bordercolor="<%=tablobordercolor%>" width="100%" id="AutoNumber2">
<tr>                      <td valign=top>


<%

'Read in the message to be previewed from the cookie set
strInputsayfa = Request.Cookies("sayfa")
strJournalItemhit = Request.Cookies("hit")
strJournalItemtarih = Request.Cookies("tarih")



strInputsayfa = Replace(strInputsayfa, Chr(10), "", 1, -1, 1)




'If there is nothing to preview then say so
If strInputsayfa = "" OR IsNull(strInputsayfa) Then
	strInputsayfa = "<br><br><div align=""center"">- <font color=red><b>Site metni boþ</b></font> -</div><br><br>"
End If
If strJournalItemhit = "" OR IsNull(strJournalItemhit) Then
	strJournalItemhit = "- <font color=red><b>Numerik bir ziyaret sayýsý yazmalýsýnýz</b></font> -</div><br><br>"
End If

%>

</head>
<% = strInputsayfa %><p><br>

Güncelleme :  
  <% = tarih %><br>
Hit : <% = strJournalItemhit %>
  
</td>
                    </tr>
                  </table>

<br><center><a href="JavaScript:onClick=window.close()">Pencereyi kapat</font></a></font>

