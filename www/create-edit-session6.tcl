 
ad_page_contract {

    The logic for the aiman.

    @author aiman  turani 
    @creation-date 2005-04-10
    @cvs-id $Id$
    This page is to fill up the collaboration script 

}  {

{ session_id: 1 }
{ edit_flage: 11 }
{ technique_num: 11 }
{ technique_name: " " }
{ roles: " " }
{ ig: " " }
{ el: " " }
{ igg: " " }
{ ell: " " }

{ sln: 0 }
{ newtechnique_flage: 55 }


}  -properties {
         session:multirow
         info:multirow
         rolesl:onelist
         tools:onelist
}


set tools " "
#get the session version name 
db_multirow sessions get_session_info {}
	
template::multirow foreach sessions {
						}
set technique_version $name

if {$edit_flage == 0  } {
        # it is a stored techniques so retrieve data for updating
	db_multirow session get_info_from_session_script {}


}   else {

	if { $newtechnique_flage != 0} {
                

                # it is a new technique so get the stored pattern script for that technique to be as a default script
		db_multirow session get_info_from_pattern_script {}
                
		
      }  else  {
                # itis a new created pattern so start by filling an empty script
      		db_multirow session get_empty {}

     }
     
}
template::multirow foreach session {
					}


# fill the tool box with tools according to the tasks selected
db_multirow info get_session_info {}

template::multirow foreach info {
      
      if {$t18 == "checked" } {
      	set tools [linsert $tools end "Slides"]
      }
      if {$t22 == "checked" } {
      	set tools [linsert $tools end "SmallGroupDisscussion"]
      }
     if {$t23 == "checked" } {
      	set tools [linsert $tools end "LargeGroupDisscussion"]
      }
     if {$t24 == "checked" } {
      	set tools [linsert $tools end "RolesDisscussion"]
      }
      if {$t6 == "checked" } {
      	set tools [linsert $tools end "InternetSearch"]
      }
      
      if {$t26 == "checked" } {
      	set tools [linsert $tools end "IdeasPosting"]
      } 
      if {$t27 == "checked" } {
      	set tools [linsert $tools end "IceBreaking"]
      } 
      if {$t34 == "checked" } {
      	set tools [linsert $tools end "Debriefing"]
      }     
      if {$t28 == "checked" } {
      	set tools [linsert $tools end "IndividualWriting"]
      }
      if {$t19 == "checked" } {
      	set tools [linsert $tools end "Evaluation"]
      } 
     if {$t30 == "checked" } {
      	set tools [linsert $tools end "Summarizing"]
      }
      if {$t35 == "checked" } {
      	set tools [linsert $tools end "IdeasVoting"]
      }
      if {$t36 == "checked" } {
      	set tools [linsert $tools end "YesNo"]
      }  
      if {$t29 == "checked" } {
      	set tools [linsert $tools end "OwnResolution"]
      }  
      if {$t17 == "checked" } {
      	set tools [linsert $tools end "QA"]
      }  
      if {$t31 == "checked" } {
      	set tools [linsert $tools end "SilentThinking"]
      }  
      if {$t15 == "checked" } {
      	set tools [linsert $tools end "Overview"]
      }  
      if {$t33 == "checked" } {
      	set tools [linsert $tools end "DynamicLink"]
      }  
      if {$t37 == "checked" } {
      	set tools [linsert $tools end "SharedText"]
      }
      if {$t38 == "checked" } {
      	set tools [linsert $tools end "IdeasDiscussion"]
      }
      if {$t20 == "checked" } {
      	set tools [linsert $tools end "Whiteboard"]
      }    
         

}



# to fill the roles 
set rolesl [split $roles "/"]
set rolesl [linsert $rolesl end "teacher"]


ad_return_template
