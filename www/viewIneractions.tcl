ad_page_contract {

    

    @author Aiman turani
    @creation-date 2004-04-10
    @cvs-id $Id$
    This page will show  group interaction
} {

{ titlew: " "}
{ gr: 0}
{ se: " "}



} -properties {
	 session:multirow
         sessionc:multirow
	 interactions:multirow
        forall:multirow
        script:onelist
	ins:onelist
    	tr:onelist
    	tl:onelist
         
}

# to get the title and related info  of this session
db_multirow session get_session_info {}

template::multirow foreach session {
	
	
	}



# to check if there are interaction for the group selected in this session 


set flag2 "false"
if {$gr != 0} {


db_multirow interactions get_info {}
set flag2 "false"
template::multirow foreach interactions {
	set flag2 "true"
	
	}


if {$flag2 == "true"} {
# to get the public information for this session like guiding helping etc
db_multirow forall get_infoall {}





set script ""
set ins ""
set tr ""
set tl ""

# to get the steps of this session
db_multirow sessionc get_steps {}


template::multirow foreach sessionc {
	
	
	}

for {set i 1} {$i < 21} {incr i} { 
	eval set inss $[subst {ins$i}]
	
        eval set trr $[subst {tr$i}]
	
	eval set tll $[subst {tl$i}]
	if {[llength $tll] != 0 } {
     		 set tl [linsert $tl end $tll]
   	set  script [linsert $script end [subst {Step $i  $inss for- $trr duration $tll}]  ] 
        }
 
}



}


}



ad_return_template 
