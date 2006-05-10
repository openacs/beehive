 

ad_page_contract {

    The logic for the aiman.

    @author aiman  turani 
    @creation-date 2005-04-10
    @cvs-id $Id$

    This page is responsible of filling/updating  all related field needed by chosen tasks
    and it check if the user didn't change the default dynamic task to present the default
    script for these tasks 

}  {


{ edit0: "  " }
{ session_id0: " " }
{ techniqes: " " }
{ names: " " }
{ name0: " " }
{ stypew: " " }
{ number: 1 }
{ numberp: 1 }
{ comm_namew: " " }
{ roles: " " }
{ mx: " " }
{ mn: " " }
{ df: " " }
{ hour: " " }
{ day: " " }
{ month: " " }
{ year: " " }
{ sln: 0 }
{ titlew: " " }
{ task:array }
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
{ problem: " " } 
{ example: " " }
{ context: " " }
{ gstructure: " " }
{ solution: " " }


} -properties { 
    rolesl:onelist
    session:multirow
    info:multirow
    
}

#  initialization tasks variables

for {set i 2} {$i <= 38} {incr i} {  
		 set [subst {t$i}] " " 
}
# mandatory task
set t5 "checked"

#  assigning tasks variables to the task array t 
foreach name [array names task] {

eval set [subst {t$name}] $[subst {task($name)}] 

}



# set a flag if no related info for selected tasks is required
set relatedflag  " "
if { $t12 != "checked"  &&  $t33 != "checked" && $t35 != "checked" && $t32 != "checked" && $t13 != "checked" && $t14 != "checked" && $t36 != "checked"  && $t18 != "checked"  && $t20 != "checked" } {
	set relatedflag  "false"
}




# get the user name to make it the creator of this session 
set user_id [ad_conn user_id]
set namet [acs_user::get_element -user_id $user_id -element name]

# set the date
set datew [subst {$hour:00-$day/$month/$year}] 
      
        
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


 
# to split roles according to / char
set rolesl [split $roles "/"]


 
# it is a new pattern save it in the repository
if {$numberp == 0 } {
	db_dml insert_pattern_value {}
	set stypew $techniqes 
}

# it is a new session save the session values and 
if {$edit0 != 0 } {
	db_dml insert_session_values {}
        
        
	# get the info for this session and  save the user id in the info table
	db_multirow session get_session_info {}
	template::multirow foreach session {
	}
	set instructionText $solution
	db_dml save_session_creator_info {}


# else it is not a new session so update the session   
}   else {

	db_dml update_values_of_session {}        
	# get all its information in the session variable to match 
        # the above case to avoid naming conflict
        db_multirow session get_info {}
	template::multirow foreach session {
	}
	
	set name  $names
        set instructionText $it
}

ad_return_template 