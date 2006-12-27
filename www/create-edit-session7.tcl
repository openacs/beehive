 
ad_page_contract {

    The logic for the beehive.

    @author aiman  turani 
    @creation-date 2005-04-10
    @cvs-id $Id$
    In this page, the session script will be stored in the database and an 
    XML LD would be published according to the session info
    
    first it will store data entered from the  previous page:
    1- checking if this is a new technque to store it in the repository for reusability
    2- save the collaboration script in sescript table
    then it will get information form the table
    and store the data in arrays then use these arrays to 
    publish XML LD according to the following steps:
    1- get the session info and save them in arrays
    2- filling the tools array from  only the supporting tools according to selected tasks
    3- filling (instructions/turns/timelimits/staged toolsl) according to the collaboration script
    4- filling the tools array with the staged tools but first we should  fix the repeating tools situation in the script
    5- setting names and values from the session info
    6- publishing  xml

}  {
{ edit_flage: 11 }
{ session_id0: 11 }
{ technique_num: " " }
{ technique_name "" }
{ technique_version ""}
{ number: 11 }
{ insa:array }
{ tra:array }
{ tla:array }
{ toola:array }
{ compa: "time-limit" }
{ newtechnique_flage: 55 }

} -properties { 
    ins:onelist
    tr:onelist
    tl:onelist
    rolesl:onelist
    participants:onelist  
    collaborationActivity:onelist 
    collToolServiceId:onelist 
    comp:onelist
    environment:onelist
    info:multirow
    envt:onelist 
    tools:onelist
    toolsl:onelist
    toolsll:onelist
    toolsc:onelist
    toolsc1:onelist
    temptools:onelist
    roleText:onelist
    alltools:onelist
    staticinfo:onelist 
    chat:onelist 
    vote:onelist 
    timing:onelist
    monitoring:onelist
    floorcontrol:onelist  
    grouplist:onelist
    guiding:onelist
    helping:onelist
    tracking:onelist
    dynamiclink:onelist
    smallgroupsharedtext:onelist
    largegroupsharedtext:onelist
    smallgrouptext:onelist
    largegrouptext:onelist
    SessionInfo:onelist
    SilentThinking:onelist
    GroupInfo:onelist
    RoleInfo:onelist
    noteTaking:onelist
    Survey:onelist
    
     
}




#  initialization of the script's variables

for {set i 1} {$i <= 25} {incr i} {  
		 set [subst {ins$i}] " " 
		 set [subst {tr$i}] " " 
		 set [subst {tl$i}] " " 
		 set [subst {tool$i}] " " 
}

#  assigning   the script's array values to script's variables $ins1,$ins2,etc
foreach name [array names tla] {

eval set [subst {ins$name}] $[subst {insa($name)}] 
eval set [subst {tr$name}] $[subst {tra($name)}] 





eval set [subst {tl$name}] $[subst {tla($name)}] 
eval set [subst {tool$name}] $[subst {toola($name)}] 

# to fix the timelimit format remove : symbol 
eval set dates $[subst {tla($name)}]

set dates  [subst {[string range $dates 0 1][string range $dates 3 4][string range $dates 6 7]}]
eval set [subst {tl$name}] $dates



}



####################
# if this is a new technique then the script will be stored as 
# a pattern script for that technique
if {$newtechnique_flage == 0 } {
	db_dml insert_pattern_values {}
}

# to ovoid variable naming conflict 
set number1 $number

# if this is a new session then save the collaboration script
# in the session script table otherwise update the table
if {$edit_flage  != 0 } {
	db_dml insert_session_script {}
}   else {

	db_dml update_session_script {}        
}

#######################




# get the session info and save them in arrays
db_multirow info get_session_info {}
template::multirow foreach info {

}


# filling the role array from the role box 
# 
set rolesl [split $roles "/"]

set participants $rolesl


# start filling the tools array from  only the supporting tools
# reseting tools arrays
set toolc 0
set tools " "
set staticinfo  " "
set guiding " "
set helping " "
set tracking " "
set timing " "
set noteTaking " "
      set tools [linsert $tools end "timing"]
      if {$t5 == "checked" } {
      set timing [linsert $timing end "teacher"]
      
       }
      incr toolc 


if {$t9 == "checked" } {
      set tools [linsert $tools end "guiding"]
      set guiding [linsert $guiding end "teacher"]
      incr toolc 
      }

if {$t8 == "checked" } {
      set tools [linsert $tools end "helping"]
      set helping [linsert $helping end "teacher"]
      incr toolc 
      }

if {$t7 == "checked" } {
      set tools [linsert $tools end "tracking"]
      set tracking [linsert $tracking end "teacher"]
      incr toolc 
      }
if {$t31 == "checked" } {
      set tools [linsert $tools end "noteTaking"]
      set noteTaking [linsert $noteTaking end "all"]
      incr toolc 
      }

# start filling the tools array from the static infoboxs (title, description,etc)

      set tools [linsert $tools end "staticinfo"]
      set staticinfo [linsert $staticinfo end "Title"]
      set staticinfo [linsert $staticinfo end $titlew]
      set staticinfo [linsert $staticinfo end "all"]
      set staticinfo [linsert $staticinfo end "1"]
      incr toolc 











# reading the script and filling (instructions/turns/timelimits/ staged toolsl) 
set ins "no"
set tr "none"
set tl "000000"
set toolsl " "

for {set i 1} {$i < 21} {incr i} { 
	eval set inss $[subst {ins$i}]
	if {[llength $inss] != 0 } {
      		set ins [linsert $ins end $inss]
    	}
        eval set trr $[subst {tr$i}]
	if {[llength $trr] != 0 } {
      		set tr [linsert $tr end $trr]
    	}
	eval set tll $[subst {tl$i}]
	if {[llength $tll] != 0 } {
     		 set tl [linsert $tl end $tll]
   	 }
 	eval set tooll $[subst {tool$i}]
	if {[llength $tooll] != 0 } {
      		set toolsl [linsert $toolsl end $tooll]
	}
}



# start filling the tools array with the staged tools 
# but first we need to fix the repeating tools situation in the script

set temptools $toolsl 
set toolsll " "
set toolsc " "
set toolsc1 " "

set collaborationActivity "setup" 

set jj 0
# replace the repeated tools with the repeat word 
# # example:  toolsl   [ chat chat   vote chat   vote   summary ]  where the
#             toolsll  [ chat repeat vote repeat repeat summary ] 
#             toolsc   [        0          0      2             ] so in the end
#             toolsc1  [  0           2                   5     ]

#  the tool counter is [  0     0     2    0      2       5     ]  


for {set i 0} {$i < [llength $toolsl]} {incr i} { 
	set ffg "false"
	for {set ii 0} {$ii < $i} {incr ii} { 
		if {[lindex  $toolsl $i] == [lindex  $temptools $ii] } {
 			set toolsll [linsert $toolsll end "repeat"]
			# to hold the counter of the step for the repeated tools 
			set toolsc [linsert $toolsc end  $ii]
			set ffg "true" 
			break
		}

	}
	if {$ffg == "false" } {
		set toolsll [linsert $toolsll end [lindex  $toolsl $i]]
		# to hold the counter of the step for the not repeated tools 
		set toolsc1 [linsert $toolsc1 end  $i]
	}
}

# now we start filling the tools array with fixed tools 
set toolsl $toolsll
#  envt hold the number of tools inside each enviroment
set envt " "
set envt [linsert $envt end $toolc]





# fill the tools form the dynamic tools
set chat " "
set vote  " "
set monitoring " "
set floorcontrol  " " 
set smallgroupsharedtext " "
set largegroupsharedtext " "
set smallgrouptext " "
set largegrouptext " "
set dynamiclink " "
set internetsearch " "
set outsidetask " "
set SessionInfo " "
set SilentThinking " "
set GroupInfo " "
set RoleInfo " "
set Conferencing " "
set Survey " "


for {set i 0} {$i < [llength $toolsl]} {incr i} { 
	set envt [linsert $envt end "1"]
	if {[lindex  $toolsl $i] == "IdeasPosting-SmallGroup" } {
      		set tools [linsert $tools end "chat"]
      		set chat  [linsert $chat end "text"]
      		set chat  [linsert $chat end "free"]         
      		if {$btype1 == "checked" } {
      			set chat  [linsert $chat end "group"]
      
      		}  elseif {$btype2 == "checked" } {
         		 set chat  [linsert $chat end "all"] 
      		}
      		set chat  [linsert $chat end "The brainstorming Chart"]
      		set chat  [linsert $chat end "numbering"]
      		if {$anon4 == "checked" } {
      			set chat  [linsert $chat end "name"]
      		}  else  {
          		set chat  [linsert $chat end "no"] 
      		}
	}
	if {[lindex  $toolsl $i] == "Disscussion-SmallGroup" } {
      		set tools [linsert $tools end "chat"]
     		 if {$addv1 == "checked" } {
      			set chat  [linsert $chat end "text-and-audio-and-video"]
      		}  elseif {$adda1 == "checked" } {
          		set chat  [linsert $chat end "text-and-audio"] 
      		}  else  {
          		set chat  [linsert $chat end "text"] 
      		}
      		if {$ctype1 == "checked" } {
      			set chat  [linsert $chat end "turn"]
      		}  elseif {$ctype2 == "checked" } {
        		  set chat  [linsert $chat end "round"] 
     	 	} else {
        		  set chat  [linsert $chat end "turn"] 
     		}      
		set chat  [linsert $chat end "group"] 
		set chat  [linsert $chat end "Discussion board"]
		set chat  [linsert $chat end "no"]
      		if {$anon1 == "checked" } {
      			set chat  [linsert $chat end "name"]
      		}  else  {
        		set chat  [linsert $chat end "no"] 
      		}
      
	}

	if {[lindex  $toolsl $i] == "Disscussion-EntireSession" } {
      		set tools [linsert $tools end "chat"]
      		if {$addv2 == "checked" } {
      			set chat  [linsert $chat end "text-and-audio-and-video"] 
      		}  elseif {$adda2 == "checked" } {
          		set chat  [linsert $chat end "text-and-audio"] 
      		}  else  {
          		set chat  [linsert $chat end "text"] 
      		}
      		if {$controlld1 == "checked" } {
      			set chat  [linsert $chat end "facilitator"]
      
      		}  else  {
        		  set chat  [linsert $chat end "system"] 
      		} 
     
    		set chat  [linsert $chat end "all"]
      		set chat  [linsert $chat end "Discussion board"]
      		set chat  [linsert $chat end "no"]
      		if {$anon2 == "checked" } {
      			set chat  [linsert $chat end "name"]
      
      		}  else  {
          		set chat  [linsert $chat end "no"] 
      		}
	}
	if {[lindex  $toolsl $i] == "Disscussion-Roles" } {
      		set tools [linsert $tools end "chat"]
      		if {$addv3 == "checked" } {
      			set chat  [linsert $chat end "text-and-audio-and-video"]
      
     		 }  elseif {$adda3 == "checked" } {
          	set chat  [linsert $chat end "text-and-audio"] 
      		}  else  {
          		set chat  [linsert $chat end "text"] 
      		}
      		set chat  [linsert $chat end "turn"]     
      		set chat  [linsert $chat end "role"]
      		set chat  [linsert $chat end "Same Role board"]
      		set chat  [linsert $chat end "no"]
      		if {$anon3 == "checked" } {
      			set chat  [linsert $chat end "name"]
      
     		 }  else  {
          		set chat  [linsert $chat end "no"] 
      		}      
	}


	if {[lindex  $toolsl $i] == "IndividualTextWriting-None" } {
     		 set tools [linsert $tools end "individualwriting"]
           
	}

	if {[lindex  $toolsl $i] == "Summarizing-EntireSession" } {
     		set tools [linsert $tools end "chat"]
      		set chat  [linsert $chat end "text"]
      		set chat  [linsert $chat end "turn"]   
      		set chat  [linsert $chat end "all"] 
      		set chat  [linsert $chat end "Summarization"]
      		set chat  [linsert $chat end "group"] 
      		set chat  [linsert $chat end "no"]      
	}
		if {[lindex  $toolsl $i] == "IceBreaking-SmallGroup" } {
      		set tools [linsert $tools end "icebreaking"]
      		  
	}
	if {[lindex  $toolsl $i] == "Evaluation-EntireSession" } {
      		set tools [linsert $tools end "chat"]
      		set chat  [linsert $chat end "text"]
      		set chat  [linsert $chat end "turn"]   
      		set chat  [linsert $chat end "all"] 
      		set chat  [linsert $chat end "Evaluation"]
      		set chat  [linsert $chat end "no"]
                set chat  [linsert $chat end "no"]      
	}
	if {[lindex  $toolsl $i] == "Debriefing-EntireSession" } {
      		set tools [linsert $tools end "chat"]
      		set chat  [linsert $chat end "text-and-audio"]
      		set chat  [linsert $chat end "turn"]   
      		set chat  [linsert $chat end "all"] 
      		set chat  [linsert $chat end "Debriefing"]
      		set chat  [linsert $chat end "no"]  
      		set chat  [linsert $chat end "no"]     
	}
        
	if {[lindex  $toolsl $i] == "IdeasVoting-SmallGroup" } {
      		set tools [linsert $tools end "vote"]
      		set vote  [linsert $vote end "idea"]
      		set vote  [linsert $vote end "idea Voting"] 
          		set vote  [linsert $vote end "learners"] 
          		set vote  [linsert $vote end   "none"]
         	 	set vote  [linsert $vote end "none"]
	}

	if {[lindex  $toolsl $i] == "InternetSearch-None" } {
      		set tools [linsert $tools end "internetsearch"]
     
	}
        if {[lindex  $toolsl $i] == "OutsideTask-None" } {
      		set tools [linsert $tools end "outsidetask"]
     
	}
        if {[lindex  $toolsl $i] == "Conferencing-EntireSession" } {
      		set tools [linsert $tools end "Conferencing"]
     
	}

	if {[lindex  $toolsl $i] == "OwnResolution-EntireSession" } {
      		set tools [linsert $tools end "ownresolution"]
	}

	if {[lindex  $toolsl $i] == "QA-EntireSession" } {
      		set tools [linsert $tools end "qa"]
	}
	if {[lindex  $toolsl $i] == "SharedText-SmallGroup" } {
      		set tools [linsert $tools end "smallgroupsharedtext"]
                set smallgroupsharedtext  [linsert $smallgroupsharedtext end $smallsharedtext]    
	}
        if {[lindex  $toolsl $i] == "SharedText-EntireSession" } {
      		set tools [linsert $tools end "largegroupsharedtext"]
                set largegroupsharedtext  [linsert $largegroupsharedtext end $largesharedtext]    
	}
	if {[lindex  $toolsl $i] == "textInfo-EntireSession" } {
      		set tools [linsert $tools end "SessionInfo"]
                set SessionInfo  [linsert $SessionInfo end $sessioninfo]    
	}
        if {[lindex  $toolsl $i] == "textInfo-SmallGroup" } {
      		set tools [linsert $tools end "GroupInfo"]
                set GroupInfo  [linsert $GroupInfo end $groupinfo]    
	}
        if {[lindex  $toolsl $i] == "textInfo-Role" } {
      		set tools [linsert $tools end "RoleInfo"]
                set RoleInfo  [linsert $RoleInfo end $roleinfo]    
	}
        if {[lindex  $toolsl $i] == "Survey-EntireSession" } {
      		set tools [linsert $tools end "Survey"]
                set Survey  [linsert $Survey end $ideasnumber] 
                set Survey  [linsert $Survey end $ideastext]    
	}

	if {[lindex  $toolsl $i] == "IdeasDiscussion-SmallGroup" } {
      		set tools [linsert $tools end "ideasdiscussion"]   
	}
	if {[lindex  $toolsl $i] == "DownloadFile-EntireSession" } {
      		set tools [linsert $tools end "dynamiclink"]
      		set dynamiclink  [linsert $dynamiclink end $el]    
	}
 	
        
        if {[lindex  $toolsl $i] == "ImageDrawingAnnotating-SmallGroup" } {
      		set tools [linsert $tools end "smallgroupwhiteboard"]    
	}
        if {[lindex  $toolsl $i] == "ImageDrawingAnnotating-EntireSession" } {
      		set tools [linsert $tools end "largegroupwhiteboard"]    
	}

        if {[lindex  $toolsl $i] == "textDiscussingAnnotating-SmallGroup" } {
      		set tools [linsert $tools end "smallgrouptext"]  
                 set smallgrouptext  [linsert $smallgrouptext end $smallannotatedtext]   
	}
        if {[lindex  $toolsl $i] == "textDiscussingAnnotating-EntireSession" } {
      		set tools [linsert $tools end "largegrouptext"]
                set largegrouptext  [linsert $largegrouptext end $largeannotatedtext]    
	}
        if {[lindex  $toolsl $i] == "IndividualImageDrawing-None" } {
      		set tools [linsert $tools end "individualwhiteboard"]    
	}
	if {[lindex  $toolsl $i] == "audioOverview-EntireSession" } {
      		set tools [linsert $tools end "overview"]
	}
        if {[lindex  $toolsl $i] == "Slides-EntireSession" } {
      		set tools [linsert $tools end "slides"]
	}
	if {[lindex  $toolsl $i] == "YesNo-EntireSession" } {
      		set tools [linsert $tools end "vote"]
      		set vote  [linsert $vote end "yesno"]
      		set vote  [linsert $vote end "Answer the above question by clicking on the yes/no buttons below"] 
                set vote  [linsert $vote end "none"] 
          	set vote  [linsert $vote end   "none"]
         	set vote  [linsert $vote end "none"]

	}   

	if {[lindex  $toolsl $i] == "repeat" } {
      		set tools [linsert $tools end "repeat"]  
	}

}







# setting names and values from the session info

# learning design name is same to the session title
set learningDesignName $titlew   		 
set playIdentifierName [subst {PLAY-  $stype}]  
set groupIdentifierName $stype                 
set groupMaxSize  $mx           	       
set groupMinSize  $mn                    	
set groupDefaultSize  $df                    	
set activityStrucureName  [subst {S- $stype}]    
set asr $activityStrucureName

# fill the collaboration activity section with the number of 
# steps/tools found in the collaboration script 
for {set i 1} {$i <= [llength $toolsl]} {incr i} { 
	set collaborationActivity [linsert $collaborationActivity end [subst {step $i}]]
}

# fill the collaboration service identifier
# each step number will point to a collaboration service identifier (which hold the tool)  
# for an example: you have a script from 6 steps as follow
#                    step [ 0     1      2      3    4      5     ]
# and the tools inside
#  each step are          [ chat chat  vote   chat  vote  summary ] 
#    tool counter         [  0    0      2      0    2      5     ] 
# coll service identifier [  0    0      1      0    1      2     ] 

set collToolServiceId "setup"
set cc 1
set mm 0
for {set i 0} {$i < [llength $toolsll]} {incr i} { 
	if {[lindex  $toolsll $i] == "repeat"} {

	# test the repeated tool in toolsc against the 
        # original toolsc1 if found give it its step number
		for {set ii $mm} {$ii < [llength $toolsc]} {incr ii} { 
			for {set iii 0} {$iii < [llength $toolsc1]} {incr iii} {
				if {[lindex  $toolsc $ii] == [lindex  $toolsc1  $iii] } {

					set collToolServiceId [linsert $collToolServiceId end [subst {number [expr $iii + 1 ]}]] 
					incr mm

					# to break from both loops
					set ii [llength $toolsc]
					break

				}
			}
		}
	} else {
		set collToolServiceId [linsert $collToolServiceId end [subst {number $cc}]]
		incr cc
	}
}







# to define the type of the activity completion 
set comp { "no" "timer-or-instructor" "timer-or-instructor" "timer-or-instructor" } ;

# to define the number of environment that holds the collaboration service
set jj 1
set environment "E-setup"

for {set i 0} {$i < [expr [llength $collaborationActivity] - 1]} {incr i} { 
	if {[lindex  $toolsll $i] != "repeat"} {
		set environment [linsert $environment end [subst {E-$jj }]]
		incr jj
	} else {
	set environment [linsert $environment end [subst {E-}]]
	}
}

# to define all tools that can be used in this system
set alltools { "staticinfo"  "timing" "chat"  "vote" "individualwriting" "floorcontrol" "guiding" "monitoring" "internetsearch" "ownresolution" "qa"  "silentthinking" "overview" "helping" "dynamiclink" "smallgroupsharedtext" "ideasdiscussion" "slides" "tracking" "smallgroupwhiteboard" "SessionInfo" "noteTaking" "Conferencing" "Survey" "largegroupsharedtext" "largegroupwhiteboard" "GroupInfo" "RoleInfo" "icebreaking" "individualwhiteboard" "smallgrouptext" "largegrouptext" "outsidetask"}


# to publish the xml schema according to this simple structure
#learning-design
#    components
#        roles
#        groups
#            participant *
#            size 
#        collaboration-activity*
#                coll-tool-service-ref 
#                turn 
#                instruction
#                time-limit
#        activity-structure 
#                collaboration-activity-ref*
                
#        environments
#            environment*
#                service
#                    coll-tool-service*
#                      tool1    
#                      tool2    
#     method
#       play 
#          act*
#             group-structure-ref 
#             activity-structure-ref 



set XML "
<imsld:learning-design identifier= [subst {'$stype:$learningDesignName'}]/>    "

set doc  [dom parse $XML]
set root [$doc documentElement]


# to add component to xml
 $root appendXML "<imsld:components/>"
set node [$root lastChild]  ;#  <components/>

# to add roles to xml
$node appendXML "<imsld:roles/>"
set node [$node lastChild] ;# <role/>
for {set i 0} {$i < [llength $rolesl]} {incr i} {         
	$node appendXML "<imsld:learner identifier= [subst {'[lindex  $rolesl $i]'}]/>"
}
set node [$node parentNode]
 
# to add groups  to xml
$node appendXML "<imsld:groups identifier= [subst {'$groupIdentifierName'}] />"

set node [$node lastChild] 
for {set i 0} {$i < [llength $participants]} {incr i} {         
	$node appendXML "<imsld:participant roleref = [subst {'[lindex  $participants $i]'}]/>"
}
$node appendXML "<imsld:size maxnumber = [subst {'$groupMaxSize'}] minnumber =[subst {'$groupMinSize'}] defaultnumber =[subst {'$groupDefaultSize'}] />"
set node [$node parentNode]

# to add collaboration activity  to xml
$node appendXML "<imsld:activities completeactivity= [subst {'$compa'}] />"
set node [$node lastChild] ;# activities/>

for {set i 0} {$i < [llength $collaborationActivity]} {incr i} {           

	set node [$root firstChild]  ;#  <components/>
	set node [$node firstChild] ;# <role/>
	set node [$node nextSibling] ;# <group/> 
	set node [$node nextSibling] ;# <activity/>
	$node appendXML "<imsld:collaboration-activity identifier =[subst {'[lindex  $collaborationActivity $i]'}]/>"
	set node [$node lastChild] ;# <collaboration-activity/>
	# for the previous example it will have 6 steps and collToolServiceId holds [  0  0   1   0    1  2 ]
        # which indicate that steps  1 and 3  will use  step 0 tools and step 4 will use step 2 tools 
        $node appendXML "<imsld:coll-tool-service-ref ref =[subst {'[lindex  $collToolServiceId $i]'}]/>"
	$node appendXML "<imsld:turn roleref =[subst {'[lindex  $tr $i]'}]/> "
	$node appendXML "<imsld:instruction>[lindex  $ins $i]</imsld:instruction>"
	$node appendXML "<imsld:time-limit>[lindex  $tl $i]</imsld:time-limit>"
}
# add group structure 
set node [$root firstChild]  ;#  <components/>
set node [$node firstChild] ;# <role/>
set node [$node nextSibling] ;# <group/> 
set node [$node nextSibling] ;# <activity/>       

$node appendXML "<imsld:activity-structure identifier=[subst {'$activityStrucureName'}] structure-type='sequence'/>"
set node [$node lastChild] 
for {set i 0} {$i < [llength $collaborationActivity]} {incr i} {         
	$node appendXML "<imsld:collaboration-activity-ref ref=[subst {'[lindex  $collaborationActivity $i]'}]/>"
}


# to add tools inside collaboration service 
set kkk  0

for {set i 1} {$i < 35} {incr i} {         
eval set [subst {k$i}] 0	
}


# when publishing the environment section it will look at the toolsl array
# and skip the repeated tools so for the pervious example
# it pass the toolsll[0]  which is the chat,  toolsll[2] which is the vote and toolsll[5] which is the summary
# and the matched steps are collToolServiceId[0] which is 0   collToolServiceId[2] which is 1 and collToolServiceId[5] which is 2  
# check the previous example for more detail on toolsll and  collToolServiceId 

for {set i 0} {$i < [llength $environment]} {incr i} {
	set node [$root firstChild]  ;#  <components/>
	if {[lindex  $toolsll [expr $i - 1]] != "repeat"} {
		$node appendXML "<imsld:environments />"
		set node [$node lastChild] 
		$node appendXML "<imsld:environment identifier =[subst {'[lindex  $environment $i]'}] />"
		set node [$node lastChild]         
		$node appendXML "<imsld:service/>" 
		set node [$node lastChild]
		$node appendXML "<imsld:coll-tool-service identifier=[subst {'[lindex  $collToolServiceId $i]'}]/>" 
		set node [$node lastChild]

		# add all tools inside each environment 
                # number of tools were stored at envt[toolc] array 
		for {set iii 0} {$iii < [lindex  $envt $i]} {incr iii} { 
                
		# check for static info tool    
   		if {[lindex  $alltools 0] == [lindex  $tools $kkk] } {
     			$node appendXML "<imsld:staticinfo />"
     			set node [$node lastChild]
     			$node appendXML "<imsld:heading>[lindex  $staticinfo $k1]</imsld:heading>"
     			incr k1
     			$node appendXML "<imsld:text>[lindex  $staticinfo $k1]</imsld:text>"
     			incr k1
     			$node appendXML "<imsld:target>[lindex  $staticinfo $k1]</imsld:target>"
     			incr k1
     			$node appendXML "<imsld:position>[lindex  $staticinfo $k1]</imsld:position>"
     			incr k1
    		}
    
    		# check for timing tool      
		if {[lindex  $alltools 1] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:timing />"
       			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $timing $k2]</imsld:owner>"
      	 		incr k2

    		}
   
                # check for chat tool 
 		if {[lindex  $alltools 2] == [lindex  $tools $kkk] } {
       			$node appendXML "<imsld:chat />"
       			set node [$node lastChild]
       			$node appendXML "<imsld:chatting-type>[lindex  $chat $k3]</imsld:chatting-type>"
       			incr k3
       			$node appendXML "<imsld:control-type>[lindex  $chat $k3]</imsld:control-type>"
       			incr k3
       			$node appendXML "<imsld:target>[lindex  $chat $k3]</imsld:target>"
       			incr k3
       			$node appendXML "<imsld:heading>[lindex  $chat $k3]</imsld:heading>"
       			incr k3
       			$node appendXML "<imsld:add>[lindex  $chat $k3]</imsld:add> "
       			incr k3
       			$node appendXML "<imsld:delete>[lindex  $chat $k3]</imsld:delete> "
       			incr k3

     		}
                # check for vote tool  
		if {[lindex  $alltools 3] == [lindex  $tools $kkk] } {
    			$node appendXML "<imsld:vote />"
       			set node [$node lastChild]
       			$node appendXML "<imsld:voting-type>[lindex  $vote $k4]</imsld:voting-type>"
       			incr k4
       			$node appendXML "<imsld:heading>[lindex  $vote $k4]</imsld:heading>"
       			incr k4
       			$node appendXML "<imsld:source>[lindex  $vote $k4]</imsld:source>"
       			incr k4
       			$node appendXML "<imsld:ideas-number>[lindex  $vote $k4]</imsld:ideas-number>"
       			incr k4
       			$node appendXML "<imsld:ideas-text>[lindex  $vote $k4]</imsld:ideas-text>"
       			incr k4
    		}
      		# check for individual writing tool 
		if {[lindex  $alltools 4] == [lindex  $tools $kkk] } {
    			$node appendXML "<imsld:individualwriting />"
      			incr k6 
    		}

		if {[lindex  $alltools 5] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:floorcontrol />"
      			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $floorcontrol $k7]</imsld:owner>"
       			incr k7
    		}

		if {[lindex  $alltools 6] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:guiding />"
      			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $guiding $k8]</imsld:owner>"
       			incr k8
    		}

		if {[lindex  $alltools 7] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:monitoring />"
      			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $monitoring $k9]</imsld:owner>"
       			incr k9
    		}

		if {[lindex  $alltools 8] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:internetsearch />"
      			incr k10
    		}

		if {[lindex  $alltools 9] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:ownresolution />"
     
      			incr k11
    		}
		if {[lindex  $alltools 10] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:qa />"
     
      			incr k12
    		}

		if {[lindex  $alltools 11] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:silentthinking />"
      			set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $SilentThinking $k13]</imsld:text>"
			
			incr k13
    		}


		if {[lindex  $alltools 12] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:overview />"
     
      			incr k14
    		}
		if {[lindex  $alltools 13] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:helping />"
      			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $helping $k15]</imsld:owner>"
       			incr k15

    		}
		if {[lindex  $alltools 14] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:dynamiclink />"
      			set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $dynamiclink $k16]</imsld:text>"
      			incr k16
    		}
		if {[lindex  $alltools 15] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:smallgroupsharedtext />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $smallgroupsharedtext $k17]</imsld:text>"
      			incr k17
    		}
		if {[lindex  $alltools 16] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:ideasdiscussion />"
     
      			incr k18
    		}
                
                

		if {[lindex  $alltools 17] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:slides />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:slidesnumber>[lindex  $sln $k19]</imsld:slidesnumber>"
      			incr k19
    		}
		if {[lindex  $alltools 18] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:tracking />"
      			set node [$node lastChild]
       			$node appendXML "<imsld:owner>[lindex  $tracking $k20]</imsld:owner>"
       			incr k20
		}
                if {[lindex  $alltools 19] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:smallgroupwhiteboard />"
                        set node [$node lastChild]
			$node appendXML "<imsld:slidesnumber>[lindex  $slnw $k21]</imsld:slidesnumber>"
      			incr k21
    		}

                if {[lindex  $alltools 20] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:sessioninfo />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $SessionInfo $k22]</imsld:text>"
      			incr k22
    		}
                if {[lindex  $alltools 21] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:notetaking />"
      			
       			incr k23
    		}
                if {[lindex  $alltools 22] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:conferencing />"
      			incr k24
    		}
                if {[lindex  $alltools 23] == [lindex  $tools $kkk] } {
    			$node appendXML "<imsld:survey />"
       			set node [$node lastChild]
       			$node appendXML "<imsld:questions-number>[lindex  $Survey $k25]</imsld:questions-number>"
       			incr k25
       			$node appendXML "<imsld:questions-text>[lindex  $Survey $k25]</imsld:questions-text>"
       			incr k25
    		}
                if {[lindex  $alltools 24] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:largegroupsharedtext />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $largegroupsharedtext $k26]</imsld:text>"
      			incr k26
    		}
                if {[lindex  $alltools 25] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:largegroupwhiteboard />"
      			set node [$node lastChild]
			$node appendXML "<imsld:slidesnumber>[lindex  $slnw $k27]</imsld:slidesnumber>"
			incr k27
    		}
                if {[lindex  $alltools 26] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:groupinfo />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $GroupInfo $k28]</imsld:text>"
      			incr k28
    		}
                if {[lindex  $alltools 27] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:roleinfo />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $RoleInfo $k29]</imsld:text>"
      			incr k29
    		}
                # check for individual writing tool 
		if {[lindex  $alltools 28] == [lindex  $tools $kkk] } {
    			$node appendXML "<imsld:icebreaking />"
      			incr k30 
    		}
                if {[lindex  $alltools 29] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:individualwhiteboard />"
      			set node [$node lastChild]
			$node appendXML "<imsld:slidesnumber>[lindex  $slnw $k31]</imsld:slidesnumber>"
			incr k31
    		}
                if {[lindex  $alltools 30] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:smallgrouptext />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $smallgrouptext $k32]</imsld:text>"
      			incr k32
    		}
                if {[lindex  $alltools 31] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:largegrouptext />"
                        set node [$node lastChild]
      			$node appendXML "<imsld:text>[lindex  $largegrouptext $k33]</imsld:text>"
      			incr k33
    		}
                if {[lindex  $alltools 32] == [lindex  $tools $kkk] } {
      			$node appendXML "<imsld:outsidetask />"
      			incr k34
    		}


    		incr kkk  
   		set node [$node parentNode]
 	}
 	} else {
		incr kkk 
	}
}

# filling the method part
$root appendXML "<imsld:method/>"
set node [$root lastChild]  ;#  <methodss/>
$node appendXML "<imsld:play identifier=[subst {'$playIdentifierName'}]/>"          
set node [$node lastChild]
$node appendXML "<imsld:act/>" 
set node [$node lastChild]
$node appendXML "<imsld:group-structure-ref ref=[subst {'$groupIdentifierName'}]/>" 
$node appendXML "<imsld:activity-structure-ref ref=[subst {'$asr'}]/>" 


set XML [$root asXML]
# create some data
        set data  $XML
        # the path for the xml file needs to start form the acs root directory 
        # the number is equal to the session number 
        set pth [acs_root_dir]  
        set filename [subst {$pth/packages/beehive/www/sessions/sess$number.xml}]     
        # open the filename for writing
        set fileId [open $filename "w"]
        # send the data to the file -
        puts -nonewline $fileId $data
        # close the file, ensuring the data is written out before you continue
        #  with processing.
        close $fileId 


# to generate the collaboration attribute

# initialize attributes
set timemanagement "checked" 
set writtencommunicatoin "checked"
set criticalthinking " "
set creativethinking " "
set analyticalskills " "
set decisionmaking " "
set leadership " "
set oralcommunication " "
set searchingskills " "
set reflecting " " 
set knowledgesharing " "

if {$t22 == "checked" ||$t22 == "checked"  } {
      # if small/large group discussion 
      set criticalthinking "checked"
      }
if {$t26 == "checked"  } {
      # if IdeasPosting 
      set creativethinking "checked"
      }
if {$t13 == "checked"  || $t12 == "checked"  || $t33 == "checked" || $t17 == "checked" } {
      # if IdeasPosting 
      set analyticalskills "checked"
      }
if {$t35 == "checked" || $t36 == "checked" } {
      # if IdeasVoting / YesNo 
      set decisionmaking "checked"
      }
if {$t30 == "checked"  } {
      # if Summarizing 
      set leadership "checked"
      }
if {$adda1 == "checked" || $adda2 == "checked" || $adda3 == "checked" } {
      # if audio option is selected 
      set oralcommunication "checked"
      }
if {$t6 == "checked"  } {
      # if internet searching 
      set searchingskills "checked"
      }

if {$t28 == "checked" || $t29 == "checked" } {
      # if individual writing / Submitting own resolution 
      set reflecting "checked"
      }
if {$t22 == "checked" || $t23 == "checked" || $t24 == "checked" || $t26 == "checked" || $t28 == "checked" || $t29 == "checked" } {
      # whiteboared / discussion/ ideasposting  
      set knowledgesharing "checked"
      }

db_dml update_graduate_attributes {}

# if this is a new technique then the graduate attributes will be stored as 
# a pattern attributes of that technique
if {$newtechnique_flage == 0 } {
	db_dml pattern_graduate_attributes {}
}


ad_return_template
