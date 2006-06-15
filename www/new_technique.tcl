 
ad_page_contract {

    The logic for the beehive.

    @author aiman (aimant@ee.usyd.edu.au)
    @creation-date 2005-01-10
    @cvs-id $Id$

    This is the first page for creating/editing a session which includes the defining of the:
    title, date, and the technique's tasks
    @parameter
} {

 num:optional 
{ group: " " }
{ newtechnique_flage: 55 }
{redirect_url {[ns_set iget [ns_conn headers] referer]}} 






}  -properties {
         session:multirow
         context:onevalue
}


	set page_title "New Session"
     
	# Add the page title to the breadcrumb context bar.
	set context [list $page_title]



ad_form -name activity_entery_form -cancel_url $redirect_url -form {
	num:key(acs_object_id_seq)
	
	
	
	{techniqe:text(text)  
		{label "#beehive.Session_Technique_name# "} 
		{html {size 101}} 	
	}


 	{name:text(text)  
		{label "#beehive.Session_Technique_Version_name#  "} 
		{html {size 101}} 	
	}    
        #{uses:text(text),optional  
	#	{label "#beehive.Session_Technique_uses# "} 
	#	{html {size 101}} 	
	#}  
	#{problem:text(text),optional  
	#	{label "#beehive.Session_Technique_Problem# "} 
	#	{html { cols 100  rows 2 }} 	
	#}    

	#{example:text(textarea),optional   
	#	{label "#beehive.Session_Technique_Example#  "} 
	#	{html {  cols 100  rows 2}} 	
	#} 

        #{context:text(textarea),optional   
	#	{label "#beehive.Session_Technique_Context#  "} 
	#	{html {  cols 100  rows 2}} 	
	#}

    	#{gstructure:text(textarea),optional   
	#	{label "#beehive.Session_Technique_Groups_structure#  "} 
	#	{html {  cols 100  rows 2}} 	
	#}
	{solution:text(textarea)  
		{label "#beehive.Session_Technique_Solution#  "}
                {help_text "[_ beehive.Session_agenda_text]" } 
		{html {  cols 90  rows 8}} 	
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
        

} -new_data {
         db_dml new_session_sql {insert into beehive_pattern (num,techniqe,name,solution) values (:num, :techniqe,:name,:solution)}
         
	 

} -after_submit {
        
        set technique_num $num
        set technique_name $techniqe
        set technique_version $name
	set url_import_var [export_vars  {technique_num   group technique_name technique_version newtechnique_flage redirect_url}]
        ad_returnredirect "create-edit-session?$url_import_var"   
 
       
        ad_script_abort
}








ad_return_template 


