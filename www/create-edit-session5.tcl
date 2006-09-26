 

ad_page_contract {

    The logic for the beehive.

    @author aiman (aimant@ee.usyd.edu.au)
    @creation-date 2005-01-10
    @cvs-id $Id$

    To store/update information related to selected tasks
    @parameter
} {

 number:optional 
{ edit_flage: 11 }
{ technique_num: 55 }
{ technique_name "" }
{ newtechnique_flage: 55 }
{ session_id: 55 }
{ sln: 0 }
{ roles: " " }


} -properties { 
    session:multirow
    
}

set number $session_id


set el ""

# to get the stored tasks
db_multirow session get_session_info {}
	template::multirow foreach session {
	}	


# set a flag if no related info for selected tasks is required
set relatedflag  " "
if { $t12 != "checked"    && $t13 != "checked" && $t14 != "checked"  && $t4 != "checked" && $t37 != "checked" && $t10 != "checked"  && $t28 != "checked" && $t2 != "checked" && $t3 != "checked"} {
	# no related info is needed
set url_import_var [export_vars  {edit_flage  technique_name technique_num  session_id  roles sln newtechnique_flage}] 
ad_returnredirect "create-edit-session6?$url_import_var"
ad_script_abort
}


ad_form -name activity_entery_form1    -form {
	number:key(acs_object_id_seq)
	

	{edit_flage:text(hidden) 
                 {value $edit_flage}
	} 
	{technique_name:text(hidden) 
                 {value $technique_name}
	}
        {session_id:text(hidden) 
                 {value $session_id}
	}
	{technique_num:text(hidden) 
                 {value $technique_num}
	}
	
        
	{roles:text(hidden) 
                 {value $roles}
	}
	
	{sln:text(hidden) 
                 {before_html "[_ beehive.character_note]"} 
                 {value $sln}
	}
        
	
	{newtechnique_flage:text(hidden) 
                 {value $newtechnique_flage}
        
	}
	
        
 }       



if { $t4 == "checked" } {  
	ad_form -extend -name activity_entery_form1 -form {
	
        {groupinfo:text(textarea) 
            
	    {html {  cols 60  rows 8}} 
	    {label "#beehive.Group_info#"}
            {help_text "[_ beehive.group_note]" }
	    	   
	}
	}
}


if { $t12 == "checked" } {
    ad_form -extend -name activity_entery_form1 -form {
	{sessioninfo:text(textarea)
            
	    {html {  cols 60  rows 10}}
	    {label "#beehive.Session_Info#"}
            {help_text "[_ beehive.session_note]" }
	      
	}
    }
}

if { $t28 == "checked" } {
    ad_form -extend -name activity_entery_form1 -form {
	{individualtext:text(textarea),optional
            
	    {html {  cols 60  rows 10}}
	    {label "#beehive.individual_Info#"}
           {help_text "[_ beehive.individual_script_info]" }
	      
	}
    }
}


if { $t14 == "checked" } {
	 
	ad_form -extend -name activity_entery_form1 -action "create-edit-session2.tcl" -form {
	{ideasnumber:text(text) 
	    {html {size 5}} 
	    {label "#beehive.Ideas_number#"}
	    	   
	}
        {ideastext:text(textarea) 
	    {html {  cols 60  rows 6}} 
	    {label "#beehive.List_of_ideas#"}
	    	   
	}
	}

}


if { $t13 == "checked" } {  
	ad_form -extend -name activity_entery_form1 -form {
	
        {roleinfo:text(textarea) 
	    {html {  cols 60  rows 8}} 
	    {label "#beehive.Role_info# $roles"}
            {help_text "[_ beehive.Roles_note]" }
	    	   
	}
	}
}




if { $t37 == "checked"   } {
	   
	ad_form -extend -name activity_entery_form1 -form {
	
        {smallsharedtext:text(textarea),optional 
	    {html {  cols 60  rows 12}} 
            {help_text "[_ beehive.Collaboration_script_info]" }
	    {label "#beehive.Collaboration_scrip#"}
	    	   
	}
	}
  

}

if {  $t10 == "checked"  } {
	   
	ad_form -extend -name activity_entery_form1 -form {
	
        {largesharedtext:text(textarea),optional 
	    {html {  cols 60  rows 12}} 
            {help_text "[_ beehive.Collaboration_script_info]" }
	    {label "#beehive.Lage_Collaboration_scrip#"}
	    	   
	}
	}
  

}

if {  $t2 == "checked"  } {
	   
	ad_form -extend -name activity_entery_form1 -form {
	
        {smallannotatedtext:text(textarea) 
	    {html {  cols 60  rows 12}} 
            {help_text "[_ beehive.session_note]" }
	    {label "#beehive.small_text_scrip#"}
	    	   
	}
	}
  

}

if {  $t3 == "checked"  } {
	   
	ad_form -extend -name activity_entery_form1 -form {
	
        {largeannotatedtext:text(textarea) 
	    {html {  cols 60  rows 12}} 
             {help_text "[_ beehive.session_note]" }
	    {label "#beehive.large_text_scrip#"}
	    	   
	}
	}
  

}


if { $relatedflag == "false" } {
	   
	ad_form -extend -name activity_entery_form1 -form {
	
        {com:text(inform)  
	    {label "#beehive.No_Info_needed#"}	   
	}
	}
  

} 


ad_form -extend -name activity_entery_form1 -form {
	{com0:text(inform)  
	    {label " "}	   
	}   






} -select_query {
      
       SELECT * from beehive_ses WHERE number = :session_id
            
} -edit_data { 
             db_dml do_update {} 

} -after_submit {

	set url_import_var [export_vars  {edit_flage  technique_name technique_num  session_id  roles sln newtechnique_flage}] 
	ad_returnredirect "create-edit-session6?$url_import_var"
        ad_script_abort
}





ad_return_template 

