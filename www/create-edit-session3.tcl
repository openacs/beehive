 

ad_page_contract {

    The logic for the aiman.

    @author aiman  turani 
    @creation-date 2005-04-10
    @cvs-id $Id$

    This page is responsible of saving selected tasks for the created session
    
}  {


{ edit_flage: "  " }
{ session_id: 11 }
{ technique_name: " " }
{ technique_num: 11 }
{ taskn:array }
{ ctype: "1" }
{ btype: " " }
{ dtype1: " " }
{ controlld: " " }
{ adda1: " " }
{ addv1: " " }    
{ adda2: " " }
{ addv2: " " } 
{ adda3: " " }
{ addv3: " " } 
{ anon1: " " }
{ anon2: " " }
{ anon3: " " }
{ anon4: " " }
{ sln: 0 }
{ roles: " " }
{ newtechnique_flage: 55 }

} -properties { 
 
    session:multirow
        
}



#  initialization tasks variables

for {set i 2} {$i <= 38} {incr i} {  
		 set [subst {t$i}] " " 
}
# mandatory task
set t5 "checked"

#  assigning tasks variables to the task array t 
foreach name [array names taskn] {

eval set [subst {t$name}] $[subst {taskn($name)}] 

}

  
        
# btype contains the level parameter (group/all)  for the idea listing task's combo-box , 
# and needs to be processed before storing in the database
set btype1  " "
set btype2  " " 
      if {$btype == "1" } {
      set btype1  "checked"
      
      }  elseif {$btype == "2" } {
          set btype2  "checked" 
      } 


# controlld contains the ideas source  parameter (teacher/learners)  for the idea voting task's combo-box , 
# and needs to be processed before storing in the database
set controlld1  " "
set controlld2  " " 
      if {$controlld == "1" } {
      set controlld1  "checked"
      
      }  elseif {$controlld == "2" } {
          set controlld2  "checked" 
      } 


# other types of parameters for combo-boxes currently not used but they exist in the database
set ctype1  " "
set ctype2  " " 
set ctype3  " " 

if {$newtechnique_flage == 0 } {
# it is a new pattern. Save tasks in the pattern's repository	
db_dml update_pattern_value {}
	
}

#  save the session's tasks
db_dml update_values_of_session {}

#get session complete info to be used in adp page 
	db_multirow session get_info {}
	template::multirow foreach session {
	}
 
  	
# set a flag if no related info for selected tasks is required
set relatedflag  " "
if {   $t33 != "checked"  && $t32 != "checked" && $t18 != "checked"  && $t20 != "checked" } {
# no uploading files 
set url_import_var [export_vars  {edit_flage  technique_name technique_num  session_id  roles sln newtechnique_flage}] 
 ad_returnredirect "create-edit-session5?$url_import_var" 

	
}
  

ad_return_template 