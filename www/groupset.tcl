ad_page_contract {

    

    @author Aiman turani
    @creation-date 2004-04-10
    @cvs-id $Id$
    This page will allow students to choose groups and roles
} {

{ user_id1: 0}
{ se1: 0}
{ url: " " }
{ hurl: " " }
{ flashservera: " " }
{ roles: " " }
{ mx: 5}
{ gr: 0}
{ ss: " "}
{ sdef: " "}



} -properties {
	rolesl:onelist 
        rolesls:onelist 
	rolesls:onelist 
	session:multirow
        teacherid:onelist
         
}

# check if this user is not the teacher
set teacherf "false"
set teacherid [db_list get_t {SELECT teacherid FROM beehive_sesf where snumber = :se1}]




if {$user_id1 != [lindex  $teacherid 0]}  {

	set sflage "false"
	set sflage2 "false"
	set sflage3 "false"
	set roleflage "false"
	set roleslss " "

# if a role is selected from the listbox ss
	if {$ss != " "} {
		set sflage2 "true"
		# get the student name and check if he previously  selected a role in a group 
		set sname [acs_user::get_element -user_id $user_id1 -element name]

		db_multirow ses2 bses "SELECT * from beehive_sesstudents where sesnumber = :se1 AND gr= :gr AND sname= :sname "
		set flag2 "false"

		template::multirow foreach ses2 {
			
			set flag2 "true"
	
		}


		if {$flag2 == "false"} {
			# this is the first time  the student select role 
			db_dml insert_value2 { insert into  beehive_sesstudents (sesnumber,stid,role,gr,sname) values (:se1,:user_id1,:ss,:gr,:sname)
}
		set sflage3 "true"


		# to update role
		}  else {

			db_dml edit_value1 { UPDATE beehive_sesstudents SET role = :ss   WHERE  sesnumber = :se1 AND gr = :gr AND sname = :sname  }
set sflage3 "true"
		}

	}

# fill the role from the table and the last role will be the default role for the remaining group member
	set rolesls [split $roles "/"]

 	set ffg "false"
	for {set i [llength $rolesls]} {$i <  $mx  } {incr i} {  
     		set rolesls [linsert $rolesls end [lindex  $rolesls [expr $i - 1 ]]]
     		set ffg "true"
	}

	# save the repeted role if found
	set reprole "sss"
	if { $ffg ==  "true"  } {
		set reprole  [lindex  $rolesls [expr $i - 1 ]]
	}


	db_multirow session beehive_sesstudents "SELECT * from beehive_sesstudents where sesnumber = :se1 AND gr= :gr"

# compare the taken roles stored at database with the the available roles
	set rolesl " "

	template::multirow foreach session {
		set sflage "true"
		set rolesl [linsert $rolesl end $role]
	
	}




	set m 0
	set mn 0

for {set i 0} {$i < [llength $rolesls]} {incr i} {  
  set flage "true"
  if {$reprole != [lindex  $rolesls $i] } {
 	# it is a unique role so search from the beginning	
	 set m 0 
  } else {
        # start comparing from the last default role reached   
set m $mn
 }
  for {set j $m} {$j < [llength $rolesl]} {incr j} {         
    if {[lindex  $rolesls $i] ==[lindex  $rolesl $j] } {
      set flage "false"
      if {$reprole == [lindex  $rolesls $i] } {
	 if { $mn > $j } {
		incr mn  
	} else {
             set mn [expr $j + 1 ]
        }



	
      }
	break
    }

  }

if {$flage !="false" } {
     set roleslss [linsert $roleslss end [lindex  $rolesls $i]]
     set flage "true"
     set roleflage "true"
	
  }
}

} else {
set teacherf "true"
}



ad_return_template 
