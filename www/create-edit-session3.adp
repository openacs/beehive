<master>


<SCRIPT LANGUAGE="JavaScript">
<!-- Begin


function check() {
  var editv = document.form1.edit_flage.value;
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
 


<form name="form1" action="create-edit-session4" enctype="multipart/form-data" method="post"  onSubmit="return check(this);">
<br>

<input type = "hidden" name = "edit_flage" value = @edit_flage@>
<input type = "hidden" name = "technique_name" value = "@technique_name@">
<input type = "hidden" name = "session_id" value = @session_id@>
<input type = "hidden" name = "technique_num" value = @technique_num@>
<input type = "hidden" name = "roles" value = "@roles@">
<input type = "hidden" name = "sln" value = @sln@>
<input type = "hidden" name = "ell" value = @el@>
<input type = "hidden" name = "igg" value = @ig@>
<input type = "hidden" name = "newtechnique_flage" value = "@newtechnique_flage@">

<table cellspacing="2" cellpadding="2" border="0">


	        
        <if @t18@ eq "checked" >
        <if @edit_flage@ not eq "0" >
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
        <if @edit_flage@ not eq "0" >
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
        <if @edit_flage@ not eq "0" >
	#beehive.Staged_file#  <br><br>
	</if>
        <else>
        #beehive.Staged_file_changed#  <br><br>

        </else>
	
		#beehive.File# <input type="file" name="ig"  size="40" ><br>
	
    <br><br>		
   </if>
      
	
	<!-- in case of selecting the providing  resources file links task -->
	
   <if @t32@ eq "checked" >
        <if @edit_flage@ not eq "0" >
	#beehive.Resource_file# <br><br>
	</if>
        <else>
        #beehive.Resource_file_change#  <br><br>

        </else>
	       
		#beehive.File# <input type="file" name="el"  size="40"   ><br>
	
   <br><br>		
   </if>







	       
	
</table>

<br>
<input type = "submit" value = "#beehive.Continue#">
<br>


</form>
</master>


