<master>


<h1> #beehive.Session_Transcript# </h1>

<form name="form1" action="viewIneractions.tcl" onSubmit="return isCode(this);" >
<table cellspacing="2" cellpadding="2" border="0">
	<tr class="form-element">
		<td class="form-label">
			<b>#beehive.Session_Title#:</b>  
		</td>  
		<td class="form-widget">  
			<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
				 @titlew@ 
			</font> 
		</td> 
                <td class="form-label">
			<b><b>#beehive.Session_Date#:</b></b>  
		</td>  
		

<%


# to fix the date format
set dates $datew
set datew  [subst {[string range $dates 0 3]/[string range $dates 5 6]/[string range $dates 8 9] - [string range $dates 11 12]:[string range $dates 14 15]}]

 
%>

		<td class="form-widget">  
			<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
				 @datew@
			</font> 
		</td>
	        
                <td class="form-label">
			<b><b><b>#beehive.Session_Specific_Roles#  :</b></b></b>  
		</td>  
		<td class="form-widget">  
			<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
				  @roles@
			</font> 
		</td>


</tr>  
</table>

<table cellspacing="2" cellpadding="2" border="0">

	<!-- in case of selecting the providing description task -->
	<if @t12@ eq "checked">

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Subject_info# </b>  
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					@st@  
				</font> 
			</td> 
		</tr>  

	</if>
        <br>
           
	
	<!-- in case selecting idea voting task and the ideas source is the teacher -->
	<if @t35@ eq "checked">
		<if @controlld2@ eq "checked">

			<tr class="form-element">
			<td class="form-label">
				<b>#beehive.List_of_ideas# </b> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					@idt@  
				</font> 
			</td> 
		</tr>  
	</if>
	</if>

	

	<!-- in case of selecting the providing subject  Info for different roles task -->
	
	<if @t13@ eq "checked"  >

		<tr class="form-element">
			<td class="form-label"><b>#beehive.Subject_info#:  </b> 
				
					@roles@, 
				
				
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					@srt@ 
				</font> 
			</td> 
		</tr>  

		
	</if>


	<!-- in case of selecting the providing rules and instruction  task -->
	<if @t14@ eq "checked">
		
		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Description_text#</b> 
			</td>  <td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					@it@ 
				</font> 
			</td> 
		</tr> 
	</if>

	<!-- in case of selecting the providing Yes/no question for side voting  task -->
	<if @t36@ eq "checked">

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.yesNo_question#</b> 
			</td>  
				<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					@ynt@
				</font> 
			</td> 
		</tr> 
	</if>


</table>



<BR><BR>
<table cellspacing="2" cellpadding="2" border="0"> 
<tr><td><b>#beehive.Collaboration_Attributes# </b></td></tr>
<tr><td class="form-label"> #beehive.Communication_Skills#  </td><td>
 <input type = "checkbox" name="or" value ="checked"    @oralcommunication@>#beehive.oral_communication# 
 <br><input type = "checkbox" name="wr" value ="checked" @writtencommunicatoin@>#beehive.written_communicatoin# 
</td><td class="form-label"> #beehive.Critical_Creative_Thinking#  </td><td>
 <input type = "checkbox" name="ct" value ="checked"    @criticalthinking@>#beehive.critical_thinking# 
 <br><input type = "checkbox" name="crt" value ="checked" @creativethinking@>#beehive.creative_thinking# 
 <br><input type = "checkbox" name="ana" value ="checked"    @analyticalskills@>#beehive.analytical_skills# 
 <br><input type = "checkbox" name="rf" value ="checked" @reflecting@>#beehive.reflecting# 
 <br><input type = "checkbox" name="sl" value ="checked" @searchingskills@>#beehive.searching_skills# 
</td><td class="form-label"> #beehive.Social_Interaction_skills#  </td><td>
 <input type = "checkbox" name="tm" value ="checked"    @timemanagement@>#beehive.time_management# 
 <br><input type = "checkbox" name="lsh" value ="checked" @leadership@>#beehive.leadership# 
 <br><input type = "checkbox" name="nls" value ="checked" @knowledgesharing@>#beehive.knowledgesharing#  
 <br><input type = "checkbox" name="dm" value ="checked"    @decisionmaking@>#beehive.decision_making# 
</td></tr> </table>  
<BR><BR>






<input type = "hidden" name = "se" value = @se@>

#beehive.Group_selection# <input type = "text" name ="gr" value= @gr@ size="3" >  
<input type = "submit" value ="#beehive.Continue#"> 




<br>



<if @flag2@ eq "true">
<multiple name="session">
<br>


<br>
<br>
<h1> #beehive.Session_Interactions#: </h1>
 
<%
set stnum 0
%>

<list   name=script>
	<%
	incr stnum
	%>
       
        <br>
 	<b>@script:item@ </b>
        <br>
	<multiple name="interactions">

		<if @stnum@  eq @interactions.instruction_number@ > 
			
                         <br>
			 <li> @interactions.student_response@  
		</if>                 

	</multiple>
<br>

</list>





<br>
<br>
<b>#beehive.Guiding_helping_info#:</b>
<br>
<multiple name="forall">



	<br>
	@forall.type_interaction@ : @forall.student_response@  
                
</multiple>


</multiple>
</td>
</tr>
</table>

</if>



<else>
<if @gr@ not eq 0>
#beehive.no_interactions#
</if>
</else>









</master>

