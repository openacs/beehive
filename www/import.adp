<master>
<property name="title">Repository</property>            
#beehive.Activity_Design#

<br><br>
<u1>
<table cellspacing="2" cellpadding="2" border="1">
<tr class="form-element">
<td> <b>Pattern information </b></td> <td></td><td><b>Uses</b></td></tr>
<multiple name="pattern"> 
<tr>
<td><a href="@url@more-pattern?technique_num=@pattern.num@ "> @pattern.techniqe@  <if @pattern.name@ not eq "default">
-@pattern.name@  
</if></a> 
</td>


<td>  <a href="@url@create-edit-session?technique_num=@pattern.num@&group=@group@"> Create session </a> </td>
<td>
 @pattern.uses@
</td>
</tr>
</multiple>

</u1>
</table>
<a href="@url@new_technique?group=@group@&newtechnique_flage=0"><br> <br><b> Create a new custom activity session  </b></a> 


<br>
<!--

<h2> import a new  technique (xml) </h2>
-->
</master>

