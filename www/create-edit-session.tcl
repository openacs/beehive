 
ad_page_contract {

    The logic for the beehive.

    @author aiman (aimant@ee.usyd.edu.au)
    @creation-date 2005-01-10
    @cvs-id $Id$

    This is the first page for creating/editing a session which includes the defining of the:
    title, date, and the groups structures
    @parameter
} {

 number:optional 
{ edit_flage: 11 }
{ group: " " }
{ technique_num: 55 }
{ technique_name "" }
{ technique_version ""}
{ newtechnique_flage: 55 }
{redirect_url {[ns_set iget [ns_conn headers] referer]}}  



}  -properties {
         session:multirow
         context:onevalue
}



if {$edit_flage != 0 } {
# if it is a new session then get the session's default groups structure
# technique's number from the Beehive pattern table
	
        #initilize variables
        set titlew ""
        set datew ""
        # initilze value incase of new pattern
	set roles ""
	set mx ""
        set mn ""
    	set df ""
        set techniqe $technique_name
    	set name $technique_version
       
	# to get the default roles and group size for the selected technique from the  pattern table 
	db_multirow session get_info_from_pattern {}
        template::multirow foreach session {
                                         
						}
        set technique_name $techniqe
        set technique_version $name
	
	# Customize the page title to reflect the fact that this form is used to
	# create a new session.
	set page_title "New Session"
        
	# get the user name to store it as the creator of this session 
	set user_id [ad_conn user_id]
	set namet [acs_user::get_element -user_id $user_id -element name]

	

 
}   else {
	
# in case of updating an existing session, get the title, and date

        db_multirow session get_info_from_stored_session {}
	
        	template::multirow foreach session {
						}
        
	# Customize the page title to reflect the fact that this form is used to
	# edit session.
	set page_title "Edit Session"
        set technique_name $stype
        set technique_version $name
        
}

# Add the page title to the breadcrumb context bar.
set context [list $page_title]



ad_form -name activity_entery_form -cancel_url $redirect_url  -form {
	number:key(acs_object_id_seq)
	
	
	
	{titlew:text(text)  
		{label "#beehive.Session_Title# "} 
		{html {size 51}} 
		{value "$titlew"}
	} 

	{roles:text(text)  
		{label "#beehive.Session_Specific_Roles#"}  
		{html {size 50}}
		{help_text "[_ beehive.Session_Specific_Roles_text]" }
                {value "$roles"}
                	
	} 
        
	{datew:date(date),to_sql(linear_date),from_sql(sql_date)      
		{label "#beehive.Session_Date#"}     
		 {help} 
		{value "$datew"}
                {format "YYYY MONTH DD HH24 MI"} 
                 
        }
        
	{mx:text(text)  
		{label "#beehive.Session_Group_maximum_size#"}  
		{html {size 3}} 
                {value "$mx"}
		
	} 

	{mn:text(text) 
		{label "#beehive.Session_Group_minimum_size#"}  
		{html {size 3}}
                {value "$mn"}
	}  
        {df:text(text) 
		{label "#beehive.Session_Group_default_size#"}  
		{html {size 3}}
                {value "$df"}
	} 
	        {edit_flage:text(hidden) 
                 {value $edit_flage}
	} 
        
	
	{technique_name:text(hidden) 
                 {value $technique_name}
	}
        {technique_version:text(hidden) 
                 {value $technique_version}
	}
	{technique_num:text(hidden) 
                 {value $technique_num}
	}
	
	{group:text(hidden) 
                 {value $group}
	} 
        {newtechnique_flage:text(hidden) 
                 {value $newtechnique_flage}
	} 
        {redirect_url:text(hidden) 
                 {value $redirect_url}
	} 
        
 

} -select_query {
     SELECT * from beehive_ses where number = :number 

} -new_data {
         db_dml new_session_sql {}
         if {$newtechnique_flage == 0 } {
	db_dml update_pattern_value {}
	 }
            
} -edit_data {
        db_dml session_update {}  


} -after_submit {
        set session_id $number
	set url_import_var [export_vars  {edit_flage  technique_name technique_num  session_id  roles newtechnique_flage redirect_url}]
        ad_returnredirect "create-edit-session2?$url_import_var"  
  
       
        ad_script_abort
}


ad_return_template 


