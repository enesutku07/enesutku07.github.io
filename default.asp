<% 
	id = "id"
	sayfa = Request.Querystring(id)
	If not isnumeric(sayfa) or not len(sayfa) > 0 Then 
		If item_id = 0 Then 
			Response.redirect "default.asp?id=1"
			Response.End 
		End If
	End If
%>

<!--#include file="sayfa.asp"-->
<%if Session("UserLoggedIn")="true" then 'Y�neti�i �ifresini Girmi�se%>

<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";
	
	//Check for journal Item
	if (document.frmJournal.sayfa.value==""){
		errorMsg += "\n\tSayfa \t\t- Sayfa metni alan� bo�.";
	}
	
	//Check for journal Item
	if (document.frmJournal.baslik.value==""){
		errorMsg += "\n\tBa�l�k \t\t- Sayfa ba�l���n� yaz�n�z.";
	}
	
		//Check for journal Item
	if (document.frmJournal.hit.value==""){
		errorMsg += "\n\tHit \t\t- Ziyaret say�s�n� numerik giriniz.";
	}
	
	//If there is a problem with the form then display an error
	if (errorMsg != ""){
		msg = "_____________________________________________________\n\n";
		msg += "Formda baz� bo� alanlar bulunmakta.\n";
		msg += "L�tfen bo� alanlar� doldurun.\n";
		msg += "____________________________________________________\n\n";
		msg += "Formdaki bo� alanlar : \n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}

//Have the propmt box turned on by default
var promptOn = true;


//Function to turn on or off the prompt box
function PromptMode(selectMode){
	
	if (selectMode.options[selectMode.selectedIndex].value == 0){
		promptOn = false;
	}
	else{
		promptOn = true;
	}
}


// Function to add the code for bold italic centre and underline, to the haber
function AddMessageCode(code, promptText, InsertText, eleNum) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt(promptText + "\n<" + code + ">xxx</" + code + ">", InsertText);
				if ((insertCode != null) && (insertCode != "")){
					document.frmJournal.elements[eleNum].value += "<" + code + ">" + insertCode + "</" + code + ">";
				}
		}
		else{
			document.frmJournal.elements[eleNum].value += "<" + code + "></" + code + ">";
		}
	}
				
	document.frmJournal.elements[eleNum].focus();
}


// Function to add the font colours to the haber, to the haber
function AddColourCode(code) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt( 'Renkli metni yaz�n.', '');
				if ((insertCode != null) && (insertCode != "")){
					document.frmJournal.sayfa.value += '<font color="' + code + '">' + insertCode + '</font>';
				}
		}
		else{
			document.frmJournal.sayfa.value += '<font color="' + code + '"></font>';
		}
	}
	document.frmJournal.selectColour.options[0].selected = true			
	document.frmJournal.sayfa.focus();
}




//Function to add the URL, indent, list, and resim code to the elements[eleNum]
function AddCode(code, eleNum) {

	//For the URL code
	if ((code != "") && (code == "URL")) {
		insertText = prompt("URL i�in, sayfa i�inde g�r�nmesini istedi�iniz metini yaz�n.", "");
			
			if ((insertText != null) && (insertText != "") && (code == "URL")){
				insertCode = prompt("URL adresi yaz�n.", "http://");
					
					if ((insertCode != null) && (insertCode != "") && (insertCode != "http://")){					
						document.frmJournal.elements[eleNum].value += '<a href="' + insertCode + '">' + insertText + '</a>';
					}
			}
	}
	
	
	//For the EMAIL code
	if ((code != "") && (code == "EMAIL")) {
		insertText = prompt("Mail i�in, sayfa i�inde g�r�nmesini istedi�iniz metini yaz�n.", "");
			
			if ((insertText != null) && (insertText != "")){
				insertCode = prompt("Mail adresi yaz�n.", "");
					
					if ((insertCode != null) && (insertCode != "")){					
					document.frmJournal.elements[eleNum].value += '<a href="mailto:' + insertCode + '">' + insertText + '</a>';
				}
			}
	}
	
	//For the image code
	if ((code != "") && (code == "IMAGE")) {	
		insertCode = prompt("Resim adresini yaz�n.", "http://");
					
			if ((insertCode != null) && (insertCode != "")){					
			document.frmJournal.elements[eleNum].value += '<img src="' + insertCode + '" border="0">';
		}			
	}
	
	//For the list code
	if ((code != "") && (code == "LIST")) {
		if (promptOn == true){
			listType = prompt("Liste �ekli se�imi \nSay� s�ralamas� i�in \'1\' e sonra tamam a, nokta s�ralama i�in direk tamam a bas�n.", "");
			
			while ((listType != null) && (listType != "") && (listType != "1")) {
				listType = prompt("HATA! L�tfen sadece \'1\' e yada direk enter a bas�n.","");               
			}
			
			if (listType != null) {			
				var listItem = "1";
				var insertCode = "";
				
				while ((listItem != "") && (listItem != null)) {
					listItem = prompt("S�rayla, liste metnini yaz�p tamam a bas�n. Bitince, bo�ken tamam a bas�n.",""); 
					if (listItem != "") {             
						insertCode += "<li>" + listItem + "</li>"; 
					}                   
				} 
				
				if (listType == "") {
					document.frmJournal.elements[eleNum].value += "<ul>" + insertCode + "</ul>";
				} else {
					document.frmJournal.elements[eleNum].value += "<ol>" + insertCode + "</ol>";
				} 
				
			}
		}
		else{
			document.frmJournal.elements[eleNum].value += "<ul><li> </li><li> </li><li> </li></ul>";
		}			
	}
	
				
	document.frmJournal.elements[eleNum].focus();
}

//Function to open preview post window
function OpenPreviewWindow(){

	strresim_yazi = escape(document.frmJournal.sayfa.value);
	strMessage = escape(document.frmJournal.sayfa.value);
	strMessage2 = escape(document.frmJournal.hit.value);
	document.cookie = "sayfa=" + strMessage
   	document.cookie = "hit=" + strMessage2
   	
   	
   	openWin('onizle.asp','onizle','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=590,height=400')
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
	
// -->
                  </script>
<%End if
 call esasUst() %>

<% ' sayfay� g�relim
id=request.querystring("id")
Set st = Server.CreateObject("ADODB.Recordset")
sor = "Select * from sayfa where id= "& id
st.Open sor,Sur,1,3
if st.eof then
response.write("<p align=center><br><b>Bu Sayfa kay�tta de�il...</b></p>")
else
currenthit = st("hit")
st("hit") = currenthit + 1
st.update
for t=1 to st.recordcount
If st.eof Then exit for
%>

<%=st("sayfa")%><p><br>
<b>Tarih :</b> <%=st("tarih")%><br>
<b>Hit :</b> <%=st("hit")%><br>

<%if Session("UserLoggedIn")="true" then 'Y�neti�i �ifresini Girmi�se%>
<%if not id=1 then%><a href="sayfa_sil.asp?id=<%=st("id")%>" OnMouseOver="javascript:window.status='-<%=st("baslik")%>- ba�l�kl� sayfay� sil...'; return true" OnMouseOut="javascript:window.status=''; return true"><img border="0" align="absmiddle"width="13" height="16" src="img/delete.gif"></a><%End if%>

<form method="POST" name="frmJournal" onSubmit="return CheckForm();" onReset="return confirm('Formu temizlemek istedi�inizden emin misiniz?');" action="guncelle.asp?id=<%=st("id")%>">
 <table border="0" align="center" style="border-collapse: collapse" class=tablo cellpadding="0" cellspacing="2" width="530">
    <tr>
      <td width="65">Ba�l�k:</td>
      <td width="460">
      <input type="text" class="input" name="baslik" size="28" value="<%=st("baslik")%>"></td>
    </tr><tr>
      <td width="65" valign=top>Sayfa:</td>
      <td width="460">
<a href="JavaScript:AddMessageCode('B','Kal�n yaz�lmas�n� istedi�iniz metni yaz�n.', '', 2)"><img border="0" align="absmiddle" src="img/bold.gif" alt="Kal�n"></a>
<a href="JavaScript:AddMessageCode('I','Yana yat�k yaz�lmas�n� istedi�iniz metni yaz�n.', '', 2)"><img border="0" align="absmiddle" src="img/italic.gif" alt="�talik"></a>
<a href="JavaScript:AddMessageCode('U','Alt� �izili yaz�lmas�n� istedi�iniz metni yaz�n.', '', 2)"><img border="0" align="absmiddle" src="img/under.gif" alt="Alt� �izili"></a>
<a href="JavaScript:AddCode('URL', 2)"><img border="0" align="absmiddle" src="img/link.gif" alt="Link (K�pr�)"></a>
<a href="JavaScript:AddCode('EMAIL', 2)"><img border="0" align="absmiddle" src="img/mail.gif" alt="Email"></a>
<a href="JavaScript:AddMessageCode('CENTER','Ortaya yaz�lmas�n� istedi�iniz metni yaz�n.', '', 2)"><img border="0" align="absmiddle" src="img/center.gif" alt="Ortala"></a>
<a href="JavaScript:AddCode('LIST', 2)"><img border="0" align="absmiddle" src="img/numlist.gif" alt="Listele"></a>
<a href="JavaScript:AddCode('IMAGE', 2)"><img border="0" align="absmiddle" src="img/image.gif" alt="Resim"></a> 
                          <select class="input" name="selectColour" onChange=AddColourCode(selectColour.options[selectColour.selectedIndex].value)>
                            <option value="0" selected> -Renkli yaz�-</option>
                            <option value="WHITE">Beyaz</option>
                            <option value="BLUE">Mavi</option>
                            <option value="RED">K�rm�z�</option>
                            <option value="GREEN">Ye�il</option>
                            <option value="YELLOW">Sar�</option>
                            <option value="ORANGE">Turuncu</option>
                            <option value="BROWN">Kahve</option>
                            <option value="MAGENTA">Pembe</option>
                            <option value="CYAN">A��k mavi</option>
                          </select><br><textarea rows="15" name="sayfa" class="input" cols="70"><%=st("sayfa")%></textarea></td>
    </tr>
       <tr>
      <td width="65">Hit:</td>
      <td width="460">
      <input type="text" class="input" name="hit" size="28" value="<%=st("hit")%>"></td>
    </tr>
<%if 1=Request.QueryString("id") then%>
<input type="hidden" name="menu_sira_no" value="<%=st("menu_sira_no")%>">

<%else%>
    <tr>
      <td width="65">Men� Kategorisi:</td>
      <td width="460">
    <%
Set kat = Server.CreateObject("ADODB.Recordset")
sor = "Select * from menuler where monay=yes ORDER BY sira_no"
kat.Open sor,Sur,1,3
for i=1 to kat.recordcount
If kat.eof Then exit for
%>

<%
if st("menu_sira_no") = kat("sira_no") then
%>
<input type="radio" name="menu_sira_no" value="<%=kat("sira_no")%>" checked><%=kat("menu")%>
<%else%>
   <input type="radio" name="menu_sira_no" value="<%=kat("sira_no")%>"><%=kat("menu")%>    
<%
end if
kat.MoveNext
next
kat.close
Set kat= Nothing
%>
</td></tr>
<%End if%>
    <tr>
<td width="460" colspan="2">
      <p align="center"><input class="input" type="button" name="Preview" value="�n izleme" onClick="OpenPreviewWindow()"> <input class="input" type="submit" value="G�nder">
      <input type="reset" class="input" name="Reset" value="Temizle" name="B2"></td>
    </tr>
  </table>
</form>
<%
st.MoveNext
st.close
Set st= Nothing
end if
next
end if

call esasAlt() %>