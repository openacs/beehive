
<master>
<property name="title">@page_title@</property>
<property name="context">@context;noquote@</property>


<SCRIPT LANGUAGE="JavaScript">
<!-- Begin





function deny() {
alert(" This is a mandatory task. It can't be unchecked" );
eval("document.form1.t2.value" + "= 'checked' " ) ; 
document.form1.t2.checked =  true;
document.form1.tc2.checked =  true;
document.form1.tc22.checked =  true;
document.form1.tc222.checked =  true;
document.form1.tc20.checked =  true;
document.form1.t11.checked =  true;
document.form1.t5.checked =  true;
return false;
}


function deny2() {

alert("to use this component properly you must have more than one role" );
}


// End -->
</script>


<form name="form1" action="create-edit-session3" onSubmit="return validate(this);">

<input type = "hidden" name = "edit_flage" value = @edit_flage@>
<input type = "hidden" name = "technique_name" value = "@technique_name@">
<input type = "hidden" name = "technique_num" value = @technique_num@>
<input type = "hidden" name = "session_id" value = @session_id@>
<input type = "hidden" name = "roles" value = "@roles@">
<input type = "hidden" name = "newtechnique_flage" value = "@newtechnique_flage@">

<input type = "hidden" name = "btype" value = "1">





<h1>
#beehive.Stored_Session_Title# 
 "@technique_name@"
)



<input type = "submit" value ="#beehive.Continue# ">
</h1>

<hr>

<table cellspacing="2" cellpadding="2" border="0">


<tr >
<td  BGCOLOR="#F2f1cb">

<if @newtechnique_flage@ not eq 0>

#beehive.Tasks_Description_custom#
</if> <else>
#beehive.Tasks_Description_new#
</else>
</td>
<td>
#beehive.Tasks_Color_Description#


</td>
</tr></table>


<if @newtechnique_flage@  eq 0>
<table cellspacing="2" cellpadding="2" border="1">
<tr ><td  BGCOLOR="#F2f1cb">
<b>
#beehive.agenda_Description#

@solution@</b>
</td>
</tr></table>
</if>

<table cellspacing="2" cellpadding="2" border="0">


<tr class="form-element"><td class="form-widget">


<u> #beehive.Managements_Tasks#  </u>
<br>

<input type = "checkbox" name="tc22" value ="checked" checked = "true"   onclick="return deny(this);"> <font color="#FF0000">#beehive.Session_Group_formation# (<input type="radio" name="dtype1" value =" " checked = "true" >#beehive.Session_Randomly_by_system# 
<input type="radio" name="dtype1" value="checked" @dtype1@>#beehive.Session_by_learners# )  </font> 
<br>
<!--
<input type = "checkbox" name="tc2" value ="checked" checked = "true" onclick="return deny(this);"> <font color="#FF0000">#beehive.Session_Controlling#</font> 
<br>

<input type = "checkbox" name="t2" value ="checked" checked = "true" onclick="return deny(this);"> <font color="#FF0000"> #beehive.Session_Providing_script#  </font>
<br>

<input type = "checkbox" name="tc222" value ="checked" checked = "true" onclick="return deny(this);"> <font color="#FF0000"> #beehive.Session_Providing_date#  </font>
<br>
-->

<input type = "checkbox" name="t5" value ="checked" checked = "true" onclick="return deny(this);"> <font color="#FF0000">  #beehive.Session_Controlling_timer#| <a href= "/beehive/more-task?num=5"> #beehive.Tasks_more# </a> </font>
<br>

<input type = "checkbox" name="taskn.9" value ="checked"   @t9@> <font color="#333399"> #beehive.Monitoring# | <a href= "/beehive/more-task?num=9"> #beehive.Tasks_more#</a></font>
<br>


<input type = "checkbox" name="taskn.7" value ="checked" @t7@ > <font color="#333399"> #beehive.Tracking# | <a href= "/beehive/more-task?num=7"> #beehive.Tasks_more#</a></font>
<br>
<input type = "checkbox" name="taskn.8" value ="checked"   @t8@><font color="#333399">  #beehive.Facilitator_Asking# | <a href= "/beehive/more-task?num=8"> #beehive.Tasks_more#</a></font>
<br>
<input type = "checkbox" name="taskn.31" value ="checked"    @t31@><font color="#333399"> #beehive.Note_taking# | <a href= "/beehive/more-task?num=31"> #beehive.Tasks_more#</a> </font>
<br>
<input type = "checkbox" name="taskn.15" value ="checked"   @t15@> <font color="#306754"> #beehive.Overview#| <a href= "/beehive/more-task?num=15"> #beehive.Tasks_more#</a></font> 


<br>


<br>
<u> #beehive.Resources_Provision_Tasks#</u>
<br>

<input type = "checkbox" name="t11" value ="checked" checked = "true" onclick="return deny(this);"><font color="#FF0000"> #beehive._Providing_Title# | <a href= "/beehive/more-task?num=11"> #beehive.Tasks_more#</a></font>
<br>

<input type = "checkbox" name="taskn.12" value ="checked"   @t12@><font color="#306754"> #beehive.Providing_Info#| <a href= "/beehive/more-task?num=12"> #beehive.Tasks_more#</a></font>
<br>


<input type = "checkbox" name="taskn.4" value ="checked"   @t4@><font color="#306754"> #beehive.Providing_group_Info#| <a href= "/beehive/more-task?num=4"> #beehive.Tasks_more#</a></font>
<br>
<input type = "checkbox" name="taskn.13" value ="checked"   @t13@ onclick="return deny2(this);"><font color="#306754"> #beehive.Providing_info_Role#| <a href= "/beehive/more-task?num=13"> #beehive.Tasks_more#</a></font>


<br>

<!--
<u> #beehive.Staged_provision_Tasks#</u> <br>
-->
<input type = "checkbox" name="taskn.33" value ="checked"    @t33@><font color="#306754"> #beehive.Providing_staged_resource# <input type = "text" name = "fln" value ="@fln@" size="2">#beehive.Files_number# | <a href= "/beehive/more-task?num=33"> #beehive.Tasks_more#</a></font> 





<br>

<u>#beehive.Feedback_Tasks#</u>
<br>

<input type = "checkbox" name="taskn.17" value ="checked"   @t17@> <font color="#306754"> #beehive.Presenting_question# | <a href= "/beehive/more-task?num=17"> #beehive.Tasks_more#</a></font> 
<br>
<input type = "checkbox" name="taskn.36" value ="checked"    @t36@><font color="#306754"> #beehive.yes_no_voting#| <a href= "/beehive/more-task?num=36"> #beehive.Tasks_more#</a></font>    
<br>
<input type = "checkbox" name="taskn.14" value ="checked"   @t14@ ><font color="#306754"> #beehive.Providing_Survey#</font> 
<br>
<input type = "checkbox" name="taskn.29" value ="checked"    @t29@><font color="#306754"> #beehive.Submitting_own_resolution# | <a href= "/beehive/more-task?num=29"> #beehive.Tasks_more#</a></font>   
<br>
<input type = "checkbox" name="taskn.34" value ="checked"   @t34@><font color="#306754"> #beehive.Debriefing# | <a href= "/beehive/more-task?num=34"> #beehive.Tasks_more#</a></font> 
<br>






<!--
<u>#beehive.Assessments#</u>
<br>

<input type = "checkbox" name="taskn.19" value ="checked"   @t19@> <font color="#306754">#beehive.Results_Evaluation#| <a href= "/beehive/more-task?num=19"> #beehive.Tasks_more#</a></font>
<br>
 
<input type = "checkbox" name="t20" value ="checked" @t20@><font color="#FF0000"> Viewing session details (Transcript)</font> 
<br>


<input type = "checkbox"  name="tc20" value ="checked" checked = "true" onclick="return deny(this);"><font color="#FF0000"> #beehive.Viewing_session_details#</font> 
<br>
-->



</td>  

<td class="form-widget">  

<u>#beehive.Group_level_Tasks#</u>
<br>

<input type = "checkbox" name="taskn.22" value ="checked"    @t22@> <font color="#306754">#beehive.Small_group_discussions# 
<!--
<input type="radio" name="ctype" value="1" @ctype1@>free
<input type="radio" name="ctype" value="2"@ctype2@>round 
<input type="radio" name="ctype" value="3" @ctype3@>turn)
-->
<input type = "checkbox" name="anon1" value ="checked"  @anon1@>#beehive.Task_Anonymous#
<input type = "checkbox" name="adda1" value ="checked"  @adda1@>#beehive.Task_Audio#
 | <a href= "/beehive/more-task?num=22"> #beehive.Tasks_more#</a></font>
<br>
<input type = "checkbox" name="taskn.23" value ="checked"    @t23@><font color="#306754">#beehive.Entire_session_discussions# 
<!--
(Controlled by  
<input type="radio" name="controlld" value="1" @controlld1@ > Facilitator
<input type="radio" name="controlld" value="2" @controlld2@> System) 
-->
<input type = "checkbox" name="anon2" value ="checked"  @anon2@>#beehive.Task_Anonymous#
<input type = "checkbox" name="adda2" value ="checked"  @adda2@>#beehive.Task_Audio#
</font>

<br>
<input type = "checkbox" name="taskn.24" value ="checked"    @t24@> <font color="#306754">#beehive.Similar_roles_discussions# 
<input type = "checkbox" name="anon3" value ="checked"  @anon3@>#beehive.Task_Anonymous#
<input type = "checkbox" name="adda3" value ="checked"  @adda3@>#beehive.Task_Audio#
</font>


<br>
<input type = "checkbox" name="taskn.26" value ="checked"    @t26@> <font color="#306754">#beehive.Ideas_listing#  
<input type = "checkbox" name="anon4" value ="checked"  @anon4@>#beehive.Task_Anonymous# |

 <a href= "/beehive/more-task?num=26"> #beehive.Tasks_more#</a> #beehive.followed_by#
<input type = "checkbox" name="taskn.38" value ="checked"    @t38@><font color="#306754"> #beehive.Discussing_ideas# |

 <a href= "/beehive/more-task?num=38"> #beehive.Tasks_more#</a> 

<input type = "checkbox" name="taskn.35" value ="checked"    @t35@><font color="#306754">#beehive.voting_by# |

 <a href= "/beehive/more-task?num=35"> #beehive.Tasks_more#</a></font> 
<br>


<input type = "checkbox" name="taskn.37" value ="checked"    @t37@>  <font color="#306754">#beehive.smallgroup#  </font> <input type = "checkbox" name="taskn.10" value ="checked"    @t10@> #beehive.largegroup# #beehive.collaborative_writing# |<a href= "/beehive/more-task?num=37"> #beehive.Tasks_more#</a></font>

<br>
<input type = "checkbox" name="taskn.2" value ="checked"    @t2@><font color="#306754"> #beehive.smallgroup# <input type = "checkbox" name="taskn.3" value ="checked"    @t3@> #beehive.largegroup#  #beehive.text_Annotation#  </font>



<br>
<input type = "checkbox" name="taskn.20" value ="checked"    @t20@><font color="#306754"> #beehive.smallgroup#  <input type = "checkbox" name="taskn.11" value ="checked"    @t11@> #beehive.largegroup#  #beehive.Whiteboard_drawing# <input type = "text" name = "slnw" value ="@slnw@" size="2">#beehive.Slides_number#| <a href= "/beehive/more-task?num=20"> #beehive.Tasks_more#</a>  </font>



<br>
<input type = "checkbox" name="taskn.32" value ="checked"    @t32@><font color="#306754"> #beehive.Video_conferencing#  </font>

<br>
<input type = "checkbox" name="taskn.18" value ="checked"   @t18@> <font color="#306754">#beehive.Providing_slides#   <input type = "text" name = "sln" value ="@sln@" size="2">#beehive.Slides_number# | <a href= "/beehive/more-task?num=18"> #beehive.Tasks_more#</a> </font> 
<br>

<input type = "checkbox" name="taskn.27" value ="checked"    @t27@><font color="#306754"> #beehive.Icebreakering# | <a href= "/beehive/more-task?num=27"> #beehive.Tasks_more#</a> </font></font> 


<br>
<u>#beehive.Individual_Tasks#</u>
<br>
<input type = "checkbox" name="taskn.28" value ="checked"    @t28@><font color="#306754"> #beehive.Silent_thinking#| <a href= "/beehive/more-task?num=28"> #beehive.Tasks_more#</a></font> 

<br>
<input type = "checkbox" name="taskn.30" value ="checked"    @t30@><font color="#306754"> #beehive.self_annotating#| </font>

<br>
<input type = "checkbox" name="taskn.6" value ="checked"   @t6@> <font color="#306754"> #beehive.Internet_searching#  | <a href= "/beehive/more-task?num=6"> #beehive.Tasks_more#</a></font> 
<br>

<input type = "checkbox" name="taskn.19" value ="checked"   @t19@> <font color="#306754">#beehive.outside_tasks#|</font>
<br>






</td> </tr>  


</table>



</form>
</master>

