<master>



<SCRIPT LANGUAGE="JavaScript">
<!-- Begincreate-edit-session

function isCode(){ // check if  durations has 6 digit format




for (ii=1;ii <= 19 ;ii++){
tli = ii*4 + 10;

eval("entry" + "=document.form1.elements[tli].value" ) ; 

if (entry !="") {

strlen=entry.length; 

if (strlen!=6) {
alert("fill the duration time in step " + ii+ " with 6 digits");
return false;
}

// Check for legal characters in string - note index starts at zero
for (i=0;i < 6 ;i++){
if ('0123456789'.indexOf(entry.charAt(i))<0) {
alert("only digits from 0-9  are acceptable in the duration time in step  " + ii);
return false;
}
}
}
}
return true; 
}


function dele() {
var theMessage1 = "Please complete the following: \n-----------------------------------\n";
var noErrors1 = theMessage1
var j1 = 0

// make sure field is not blank and within limit 1-20
if (document.form1.dstep.value < 1 ||  document.form1.dstep.value >20) {
theMessage1 = theMessage1 + "\n  Enter the step number between 1 and 20";
 
}

// If no errors, submit the form
if (theMessage1 == noErrors1) {

// to shift all rows up
var xx = parseInt(document.form1.dstep.value);
for (i = xx;  i <= 19; i++){
ii = i + 1; 
// steps elements
insi = i*4 + 8;
tri = i*4 + 9;
tli = i*4 + 10;
tooli = i*4 + 11;
// next steps elements
insf = ii*4 + 8;
trf = ii*4 + 9;
tlf = ii*4 + 10;
toolf = ii*4 + 11;


var mm2 = eval("document.form1.elements[trf].selectedIndex")
var mm4 = eval("document.form1.elements[toolf].selectedIndex")
eval("document.form1.elements[insi].value" + "=document.form1.elements[insf].value" ) ; 
eval("document.form1.elements[tli].value" + "=document.form1.elements[tlf].value" ) ;
eval("document.form1.elements[tri].options[0].value" + "=document.form1.elements[trf].options[mm2].value" );
eval("document.form1.elements[tri].options[0].text" + "=document.form1.elements[trf].options[mm2].text" );
eval("document.form1.elements[tri].selectedIndex" + "=0" );
eval("document.form1.elements[tooli].options[0].value" + "=document.form1.elements[toolf].options[mm4].value" );
eval("document.form1.elements[tooli].options[0].text" + "=document.form1.elements[toolf].options[mm4].text" ); 
eval("document.form1.elements[tooli].selectedIndex" + "=0" );
}



// to make empty the last row

eval("document.form1.elements[88].value" + "= '' " ) ; //ins20
eval("document.form1.elements[90].value" + "= '' " ) ; //tl20

var newOpt2 = document.createElement("OPTION");
eval("newOpt2.text" + "= document.form1.elements[89].options[0].text" ) //tr20
eval("newOpt2.value" + "= document.form1.elements[89].options[0].value" )
eval("document.form1.elements[89].add(newOpt2)");
eval("document.form1.elements[89].options[0].value" + "= '' " ) 
eval("document.form1.elements[89].options[0].text" + "= '' " ) 
var newOpt3 = document.createElement("OPTION");
eval("newOpt3.text" + "= document.form1.elements[91].options[0].text" ) //tool20
eval("newOpt3.value" + "= document.form1.elements[91].options[0].value" )
eval("document.form1.elements[91].add(newOpt3)");
eval("document.form1.elements[91].options[0].value" + "= '' " ) 
eval("document.form1.elements[91].options[0].text" + "= '' " ) 

return true;


} else {


// If errors were found, show alert message
alert(theMessage1);
return false;
}

}

function insert() {


var theMessage = "Please complete the following: \n-----------------------------------\n";
var noErrors = theMessage
var j = 0

// make sure field is not blank
if (document.form1.istep.value < 1 ||  document.form1.istep.value >19) {
theMessage = theMessage + "\n  Enter the step number between 1 and 19";
 
}





// If no errors, submit the form
if (theMessage == noErrors) {
var las =  parseInt(document.form1.istep.value) 

// shift down  all rows below the inserted 
for (i=19;i >= las ;i--){

theMessage = theMessage + i; 

ii =i +1; 
// steps elements
insi = i*4 + 8;
tri = i*4 + 9;
tli = i*4 + 10;
tooli = i*4 + 11;
// next steps elements
insf = ii*4 + 8;
trf = ii*4 + 9;
tlf = ii*4 + 10;
toolf = ii*4 + 11;


var mm22 = eval("document.form1.elements[tri].selectedIndex")
var mm44 = eval("document.form1.elements[tooli].selectedIndex")

eval("document.form1.elements[insf].value" + "=document.form1.elements[insi].value" ) ; 
eval("document.form1.elements[tlf].value" + "=document.form1.elements[tli].value" ) ;
eval("document.form1.elements[trf].options[0].value" + "=document.form1.elements[tri].options[mm22].value" );
eval("document.form1.elements[trf].options[0].text" + "=document.form1.elements[tri].options[mm22].text" );
eval("document.form1.elements[trf].selectedIndex" + "=0" );
eval("document.form1.elements[toolf].options[0].value" + "=document.form1.elements[tooli].options[mm44].value" );
eval("document.form1.elements[toolf].options[0].text" + "=document.form1.elements[tooli].options[mm44].text" ); 
eval("document.form1.elements[toolf].selectedIndex" + "=0" );


}

// make the insert row empty 
eval("document.form1.elements[4* document.form1.istep.value +8].value" + "= '' " ) ; 
eval("document.form1.elements[4* document.form1.istep.value +10].value" + "= '' " ) ; 

var newOpt2 = document.createElement("OPTION");
eval("newOpt2.text" + "= document.form1.elements[4* document.form1.istep.value +9].options[0].text" )
eval("newOpt2.value" + "= document.form1.elements[4* document.form1.istep.value +9].options[0].value" )
eval("document.form1.elements[4* document.form1.istep.value +9].add(newOpt2)");
eval("document.form1.elements[4* document.form1.istep.value +9].options[0].value" + "= '' " ) 
eval("document.form1.elements[4* document.form1.istep.value +9].options[0].text" + "= '' " ) 
var newOpt3 = document.createElement("OPTION");
eval("newOpt3.text" + "= document.form1.elements[4* document.form1.istep.value +11].options[0].text" )
eval("newOpt3.value" + "= document.form1.elements[4* document.form1.istep.value +11].options[0].value" )
eval("document.form1.elements[4* document.form1.istep.value +11].add(newOpt3)");
eval("document.form1.elements[4* document.form1.istep.value +11].options[0].value" + "= '' " ) 
eval("document.form1.elements[4* document.form1.istep.value +11].options[0].text" + "= '' " ) 

return true;


} else {


// If errors were found, show alert message
alert(theMessage);
return false;
}
}


// End -->
</script>

<form name="form1" action="create-edit-session7" onSubmit="return isCode(this);" >
<input type = "hidden" name = "edit_flage" value = @edit_flage@>
<input type = "hidden" name = "session_id0" value = @session_id@> 
<input type = "hidden" name = "technique_num" value = @technique_num@>
<input type = "hidden" name = "technique_name" value = "@technique_name@">
<input type = "hidden" name = "technique_version" value = "@technique_version@">
<input type = "hidden" name = "number" value = @session_id@>
<input type = "hidden" name = "newtechnique_flage" value = "@newtechnique_flage@">



<h2> #beehive.collaboration_script#  </h2> 

<table cellspacing="2" cellpadding="20" border="0">
<tr ><td ><input type = "submit" value ="#beehive.Continue#">   <td >   <input type = "button" value ="#beehive.Delete# " onclick="return dele(this);">   #beehive.Step# <input type = "text" name = "dstep" size="4">  </td>  <td >   <input type = "button" value ="#beehive.Insert# " onclick="return insert(this);">  at Step <input type = "text" name = "istep" size="4"> 
 </td>


</tr> 
</table>



 <div style="overflow: auto; width: 750px; height: 320px; border-left: 3px gray solid; border-bottom: 3px gray solid; ; border-right: 3px gray solid; border-top: 3px gray solid;padding:3px; margin: 0px">

<table cellspacing="5" cellpadding="1" border="0">
<tr> <td  BGCOLOR="#F2f1cb" >
#beehive.script_instruction#
<br><br>
</td>
</tr>
<tr> <td BGCOLOR="#F2f1cb" >
#beehive.script_instruction_note#

</td>
</tr> 
</table>
<table cellspacing="2" cellpadding="2" border="0">
<tr class="form-element"><td class="header-text">#beehive.Step# </td>  <td class="header-text">#beehive.Instruction#  </td> <td class="header-text">#beehive.Turn#   </td> <td class="header-text">#beehive.duration#  </td><td class="header-text"><font color="#306754">#beehive.Tool# </font></td>
</tr>  




	<%
		for {set i 1} {$i <= 20} {incr i} { 
	        set ins [subst {insa.$i}]        
		eval set inss $[subst {ins$i}]
                set tr [subst {tra.$i}] 
                eval set trr $[subst {tr$i}]
                set tl [subst {tla.$i}] 
                eval set tll $[subst {tl$i}]
                set tool [subst {toola.$i}] 
               eval set tooll $[subst {tool$i}]

	%>
	<tr class="form-element"><td>@i@ </td>  
<td class="form-widget">  <font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> <input type = "text" name="@ins@" size="40" MAXLENGTH=140 value = "@inss@"    >    </font>     </td> 
<td class="form-widget">  <font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 

<select name="@tr@">
<option value= "@trr@">@trr@</option>
<if @trr@ not eq "all">
<option value= "all">all</option>
</if>
<list   name=rolesl>
<if @trr@ not eq @rolesl:item@>
<option value=  "@rolesl:item@" >@rolesl:item@</option>
</if>
</list>

</select>
  </font>     </td> 
<td class="form-widget">  <font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> <input type = "text" name = "@tl@"  size="10" value = "@tll@">  </font>     </td> 
<td class="form-widget">  <font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
<select name="@tool@">

<option value= "@tooll@"> @tooll@</option>
<list   name=tools>
<if @tooll@ not eq @tools:item@>
<option value= "@tools:item@">@tools:item@</option>
</if>
</list>	

	<%
		}
	%>


</select>
</tr> 



</table>

</div>
<br>
<!--
Steps are completed by:

<input type="radio" name="compa" value="time-limit" checked = "true" > Time limit
<input type="radio" name="compa" value="user-choice"  > Time limit or User choice 
<br>
<br>
-->
 

 

</form>
</master>



