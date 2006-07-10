 
ad_page_contract {

    The logic for the beehive.

    @author aiman (aimant@ee.usyd.edu.au)
    @creation-date 2005-01-10
    @cvs-id $Id$

    This  page for creating/editing a session which includes the defining of the technique's tasks

} {

{ edit_flage: 11 }
{ session_id: 11 }
{ group: " " }
{ technique_num: -1 }
{ technique_name "" }
{ roles "" }
{ newtechnique_flage: 55 }







}  -properties {
         session:multirow
         context:onevalue
         
        
}


if {$edit_flage != 0 } {
# if it is a new session then get the session's default tasks according to the selected
# technique's number from the Beehive pattern table
	

        #  initialization tasks variables

	for {set i 2} {$i <= 38} {incr i} {  
		 set [subst {t$i}] " " 
	}
         
	set flag1 "false"
	# to get the default tasks for the selected technique from the  pattern table 
	db_multirow session get_info_from_pattern {}
 	template::multirow foreach session {
                                            set flag1 "true" 
						}

	if {$flag1 == "false" } {
        # initialize other input fields of the new created technique
       set ctype1 " " ;set ctype2 " " ;set ctype3 " " ;set btype1 " " ;set btype2 " " ;set btype3 " " ;set dtype1 " " ;set controlld1 " ";set controlld2 " " ;set adda1 " " ;set addv1 " " ;set adda2 " " ;set addv2 " " ;set adda3 " ";set addv3 " "  ;set anon1 " " ;set anon2 " " ;set anon3 " " ;set anon4 " " 

	}
	set sln 1
	# Customize the page title to reflect the fact that this form is used to
	# create a new session.
	set page_title "New Session"
        
	# get the user name to make it the creator of this session 
	set user_id [ad_conn user_id]
	# save the creator name
	 db_dml save_session_creator_info {}
	

# in case of updating an existing session, get the  tasks 
}   else {
	#  get the default tasks for the selected technique from the stored sessions table 
        db_multirow session get_info_from_stored_session {}
	
        #  get the title, date, type, and session id  form the stored technique and set them to new 
       
	template::multirow foreach session {
						}


	# Customize the page title to reflect the fact that this form is used to
	# edit session.
	set page_title "Edit Session"

}



# Add the page title to the breadcrumb context bar.
set context [list $page_title]


ad_return_template 


