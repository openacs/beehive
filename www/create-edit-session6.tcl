 
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
{ el: " " }
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
      	set tools [linsert $tools end "Slides-EntireSession"]
      }
      if {$t22 == "checked" } {
      	set tools [linsert $tools end "Disscussion-SmallGroup"]
      }
     if {$t23 == "checked" } {
      	set tools [linsert $tools end "Disscussion-EntireSession"]
      }
     if {$t24 == "checked" } {
      	set tools [linsert $tools end "Disscussion-Roles"]
      }
      
      
      if {$t26 == "checked" } {
      	set tools [linsert $tools end "IdeasPosting-SmallGroup"]
      } 
	if {$t38 == "checked" } {
      	set tools [linsert $tools end "IdeasDiscussion-SmallGroup"]
      }
      if {$t35 == "checked" } {
      	set tools [linsert $tools end "IdeasVoting-SmallGroup"]
      }
      if {$t27 == "checked" } {
      	set tools [linsert $tools end "IceBreaking-SmallGroup"]
      } 
      if {$t37 == "checked" } {
      	set tools [linsert $tools end "SharedText-SmallGroup"]
      }
      if {$t10 == "checked" } {
      	set tools [linsert $tools end "SharedText-EntireSession"]
      }
      
      if {$t20 == "checked" } {
      	set tools [linsert $tools end "ImageDrawingAnnotating-SmallGroup"]
      } 
      if {$t11 == "checked" } {
      	set tools [linsert $tools end "ImageDrawingAnnotating-EntireSession"]
      }
      if {$t2 == "checked" } {
      	set tools [linsert $tools end "textDiscussingAnnotating-SmallGroup"]
      } 
      if {$t3 == "checked" } {
      	set tools [linsert $tools end "textDiscussingAnnotating-EntireSession"]
      }
          
      if {$t32 == "checked" } {
      	set tools [linsert $tools end "Conferencing-EntireSession"]
      } 

      if {$t34 == "checked" } {
      	set tools [linsert $tools end "Debriefing-EntireSession"]
      }     
      
      if {$t19 == "checked" } {
      	set tools [linsert $tools end "Evaluation-EntireSession"]
      } 
     if {$t30 == "checked" } {
      	set tools [linsert $tools end "Summarizing-EntireSession"]
      }
      
      if {$t36 == "checked" } {
      	set tools [linsert $tools end "YesNo-EntireSession"]
      }  
        
      if {$t17 == "checked" } {
      	set tools [linsert $tools end "QA-EntireSession"]
      }  
	if {$t14 == "checked" } {
      	set tools [linsert $tools end "Survey-EntireSession"]
      } 
      if {$t12 == "checked" } {
      	set tools [linsert $tools end "textInfo-EntireSession"]
      } 
      if {$t4 == "checked" } {
      	set tools [linsert $tools end "textInfo-SmallGroup"]
      }
      if {$t13 == "checked" } {
      	set tools [linsert $tools end "textInfo-Role"]
      } 
      if {$t15 == "checked" } {
      	set tools [linsert $tools end "audioOverview-EntireSession"]
      }  
      if {$t33 == "checked" } {
      	set tools [linsert $tools end "DownloadFile-EntireSession"]
      }  
       
      if {$t29 == "checked" } {
      	set tools [linsert $tools end "OwnResolution-EntireSession"]
      } 
      if {$t28 == "checked" } {
      	set tools [linsert $tools end "IndividualTextWriting-None"]
      }
      if {$t30 == "checked" } {
      	set tools [linsert $tools end "IndividualImageDrawing-None"]
      } 
      if {$t6 == "checked" } {
      	set tools [linsert $tools end "InternetSearch-None"]
      }
      

}



# to fill the roles 
set rolesl [split $roles "/"]
 set rolesl [linsert $rolesl end "facilitator"]


ad_return_template

