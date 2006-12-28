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
<input type = "hidden" name = "slnw" value = @slnw@>
<input type = "hidden" name = "ell" value = @el@>
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
        <if @t20@ eq "checked" or @t11@ eq "checked" or @t30@ eq "checked">
        <if @edit_flage@ not eq "0" >
	#beehive.Whiteboard_image#  <br><br>
	</if>
        <else>
        #beehive.Whiteboard_image_change# <br><br>

        </else>
	       
		<%
		for {set i 1} {$i <= $slnw} {incr i} { 
	 		set wl [subst {wlide$i}]
		%>
		#beehive.Slide#@i@ <input type="file" name="@wl@"  size="40" ><br>
		<%
		}
		%>

	
		
	</if>
        <br><br>


        
	<!-- in case of selecting the providing Staged dynamic link task -->
	<if @t33@ eq "checked" >
        <if @edit_flage@ not eq "0" >
	#beehive.Staged_file#  <br><br>
	</if>
        <else>
        #beehive.Staged_file_changed#  <br><br>

        </else>
	        <%
		for {set i 1} {$i <= $fln} {incr i} { 
	 		set fl [subst {flide$i}]
		%>
		#beehive.File#@i@ <input type="file" name="@fl@"  size="40" ><br>
		<%
		}
		%>
		 
	
    <br><br>		
   </if>
      
	
	



	       
	
</table>

<br>
<input type = "submit" value = "#beehive.Continue#">
<br>


</form>
</master>


