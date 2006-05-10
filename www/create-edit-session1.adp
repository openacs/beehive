<master>


<SCRIPT LANGUAGE="JavaScript">
<!-- Begin


function check() {
  var editv = document.form1.edit.value;
  var ext = document.form1.slide1.value;
  ext = ext.substring(ext.length-3,ext.length);
  ext = ext.toLowerCase();
  if(ext != 'jpg' && editv != "0") {
    alert('You selected a .'+ext+
          ' file; please select a .jpg file instead!');
    return false; }
  else
    return true; }
// End -->
</script>
 
<u1>
<multiple name="session">


</multiple>
</u1>


<form name="form1" action="create-edit-session2" enctype="multipart/form-data" method="post"  onSubmit="return check(this);">
<br>
<input type = "hidden" name = "numberf" value = @numberp@>
<input type = "hidden" name = "techniqe" value = "@techniqes@">
<input type = "hidden" name = "tname0" value = "@names@">

<input type = "hidden" name = "number" value = @session.number@>
<input type = "hidden" name = "stype" value = "@session.stype@">
<input type = "hidden" name = "name" value = "@name0@">
<input type = "hidden" name = "roles" value = "@session.roles@">

<input type = "hidden" name = "edit" value = @edit0@>
<input type = "hidden" name = "session_id" value = @session_id0@>
<input type = "hidden" name = "sln" value = @sln@>
<input type = "hidden" name = "ell" value = @session.el@>
<input type = "hidden" name = "igg" value = @session.ig@>
<table cellspacing="2" cellpadding="2" border="0">


	<!-- in case of requiring a related info for  selected tasks -->
	<if @relatedflag@   eq "false">
		<b>#beehive.No_Info_needed#</b>
	</if>
	<!-- in case of selecting the providing info task -->
	<if @t12@ eq "checked">

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Session_Info#  </b> <span class="form-required-mark">*</span> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<textarea name="st" cols="60" wrap="soft" rows="6">@session.st@</textarea>  
				</font> 
			</td> 
		</tr>  
        <br><br>
	</if>
        
        <if @t18@ eq "checked" >
        <if @edit0@ not eq "0" >
	#beehive.slides_specification# <br>
	</if>
        <else>
        #beehive.slides_change#<br><br>

        </else>
	<%
		for {set i 1} {$i <= $sln} {incr i} { 
	 		set sl [subst {slide$i}]
	%>
		#beehive.Slide#@i@ <input type="file" name="@sl@"  size="40" ><br>
	<%
		}
	%>

		
	</if>
        <br><br>
        <if @t20@ eq "checked" >
        <if @edit0@ not eq "0" >
	#beehive.Whiteboard_image#  <br><br>
	</if>
        <else>
        #beehive.Whiteboard_image_change# <br><br>

        </else>
	
		#beehive.Slide# <input type="file" name="sld"  size="40" ><br>
	
	<br><br>	
	</if>

        
	<!-- in case of selecting the providing Staged dynamic link task -->
	<if @t33@ eq "checked" >
        <if @edit0@ not eq "0" >
	#beehive.Staged_file#  <br><br>
	</if>
        <else>
        #beehive.Staged_file_changed#  <br><br>

        </else>
	
		#beehive.File# <input type="file" name="ig"  size="40" ><br>
	
    <br><br>		
   </if>
      
	<!-- in case selecting idea voting task and the ideas source is the teacher -->
	<if @t35@ eq "checked">
		<if @controlld@ eq "2">

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Ideas_number# </b> <span class="form-required-mark">*</span> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<input type = "text" name = "idn" value ="@session.idn@"  size="5">
 

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.List_of_ideas# </b> <br>#beehive.Ideas_example# <span class="form-required-mark">*</span> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<textarea name="idt" cols="60" wrap="soft" rows="6">@session.idt@</textarea>  
				</font> 
			</td> 
		</tr>  
	<br><br>
        </if>
	</if>
        
	<!-- in case of selecting the providing  resources file links task -->
	
   <if @t32@ eq "checked" >
        <if @edit0@ not eq "0" >
	#beehive.Resource_file# <br><br>
	</if>
        <else>
        #beehive.Resource_file_change#  <br><br>

        </else>
	       
		#beehive.File# <input type="file" name="el"  size="40"   ><br>
	
   <br><br>		
   </if>







	<!-- in case of selecting the providing subject  Info for different roles task -->
	<list   name=rolesl>
	</list>
	<if @t13@ eq "checked" and  @rolesl:rownum@ gt 1 >

		<tr class="form-element">
			<td class="form-label"><b>#beehive.Subject_info#  </b> 
				<list   name=rolesl>
					@rolesl:item@, 
				</list>
				<span class="form-required-mark">*</span> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<textarea name="srt" cols="60" wrap="soft" rows="8">@session.srt@</textarea>  
				</font> 
			</td> 
		</tr>  

		<tr>
			<td> </td> 
			<td>
				#beehive.Roles_note# <b>/ </b> 
			</td>
		</tr>
         <br><br>
	</if>

       
	<!-- in case of selecting the providing rules and instruction  task -->
	<if @t14@ eq "checked">
		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Description_heading# </b><span class="form-required-mark">*</span> 
			</td>  
			<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<input type = "text" name = "ih"  size="60" value = "#beehive.Description_heading_default#">   
				</font> 
			</td> 
		</tr>  

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.Description_text#</b> <span class="form-required-mark">*</span> 
			</td>  <td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<textarea name="it" cols="60" wrap="soft" rows="6">@session.it@</textarea>  
				</font> 
			</td> 
		</tr> 
	 <br><br>
         </if>
        
	<!-- in case of selecting the providing Yes/no question for side voting  task -->
	<if @t36@ eq "checked">

		<tr class="form-element">
			<td class="form-label">
				<b>#beehive.yesNo_question#</b> <span class="form-required-mark">*</span> 
			</td>  
				<td class="form-widget">  
				<font face="tahoma,verdana,arial,helvetica,sans-serif" size="-1"> 
					<textarea name="ynt" cols="60" wrap="soft" rows="6">@session.ynt@</textarea>  
				</font> 
			</td> 
		</tr> 
	</if>


</table>

<br>
<input type = "submit" value = "#beehive.Continue#">
<br>


</form>
</master>


