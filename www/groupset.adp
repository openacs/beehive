<master>
<property name="title">Selecting group </property>
<form name="form1" action="groupset" onSubmit="return isCode(this);" >


<input type = "hidden" name = "user_id1" value = @user_id1@>
<input type = "hidden" name = "se1" value = @se1@> 
<input type = "hidden" name = "hurl" value = @hurl@>
<input type = "hidden" name = "flashservera" value = "@flashservera@">
<input type = "hidden" name = "roles" value = "@roles@">
<input type = "hidden" name = "mx" value = @mx@>
<input type = "hidden" name = "sdef" value = @sdef@>




<if @teacherf@  eq "false">


#beehive.Select_group_number#: <input type = "text" name ="gr" value= @gr@ size="3">  

<input type = "submit" value ="#beehive.select#"> 
<br>
<if @gr@ not  eq  0 >
<if @sflage@ eq "true">
<br>
  #beehive.group_members#  @gr@ :
<br>
<table cellspacing="2" cellpadding="2" border="1">
<tr class="form-element"><td class="header-text">#beehive.Learners# </td>  <td class="header-text">#beehive.Role# </td> 
</tr>  

<multiple name="session">

<tr class="form-element">
<td>@session.sname@ </td>  
<td>@session.role@ </td>  
</tr>  
</multiple>
</table>
</if>
<br>

<if @roleflage@ eq  "false" and @sflage3@ eq  "false" >
#beehive.Group_full# 
</if>
<else>
	
#beehive.Select_role#  @ss@
         
		<select name="ss">
		<option value=  "@ss@" >  </option>
		<list   name=roleslss>
		<option value=  "@roleslss:item@" > @roleslss:item@ </option>

		</list>

		</select>
		<input type = "submit" value ="#beehive.select#"> 

        <if @sflage2@ not eq "false" or @sflage3@ eq  "true" >
	     <br> <br>	 
	     <a href="@url@/beehive/flash/collaboration.html?user_id1=@user_id1@&hurl=@hurl@&se1=@se1@&flashservera=@flashservera@&grn1=@gr@&rolen1=@ss@" > <b>#beehive.Enter#</b></a>
	</if>
        
</else>
</if>
</if>
<else>
<br> 
<a href="@url@/beehive/flash/collaboration.html?user_id1=@user_id1@&hurl=@hurl@&se1=@se1@&flashservera=@flashservera@" > 

#beehive.Enter#</a>
</else>

</master>


