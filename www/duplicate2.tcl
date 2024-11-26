ad_page_contract {

	basic description

    @author aiman turani (aimant@example.com)
    this page will duplicate all values form the original session (except date) and also uploaded files if any
} {


{ numberw: 0 }
{ titlew: " " }
{ datew: " " }


} -properties { 

filess:onelist

}

set user_id [ad_conn user_id]
set dated $datew  

db_multirow sesd get_info_from_original_session {}

template::multirow foreach sesd {
	
	}

# insert the values of the new session taken form the original session (only date is coming form the previous page)
db_dml insert_value1 {}

 
# get the new session number
db_multirow sesdd get_info_from_duplicated_session {}
template::multirow foreach sesdd {
	
	}

set number1 $number

# insert creator info in the beehive_ssesf table
db_dml insert_value2 {}

# get the collaboration script of the original script
db_multirow sesddd get_script_from_origina_session {}
template::multirow foreach sesddd {
	
	}

# insert the script of the new session taken form the original session 
db_dml insert_value3 {}


# to duplicate the xml file for the new session

set pth [acs_root_dir]  
set filename1 [subst {$pth/packages/beehive/www/sessions/sess$number.xml}]     
set filename2 [subst {$pth/packages/beehive/www/sessions/sess$number1.xml}] 
set ifp [open $filename1 r+]
set ofp [open $filename2 w+]


fcopy $ifp $ofp

close $ifp
close $ofp


# to upload files if slides option was selected
	if {$t18 == "checked" } {
		for {set i 1} {$i <= $sln} {incr i} { 
			set filename1 [subst {$pth/packages/beehive/www/slides/[subst {sess$number}]Slide$i.jpg}]     
			set filename2 [subst {$pth/packages/beehive/www/slides/[subst {sess$number1}]Slide$i.jpg}] 
			set ifp [open $filename1 r+]
			set ofp [open $filename2 w+]

                        fconfigure $ifp -translation binary
			fconfigure $ofp -translation binary

			fcopy $ifp $ofp

			close $ifp
			close $ofp


				
			}
		}
	     


# to upload file for withe board drawing  
	if {$t20 == "checked" || $t11 == "checked"  || $t30 == "checked" } {
		    for {set i 1} {$i <= $slnw} {incr i} {     


			set filename1 [subst {$pth/packages/beehive/www/slides/[subst {sess$number}]Wlide$i.jpg}]     
			set filename2 [subst {$pth/packages/beehive/www/slides/[subst {sess$number1}]Wlide$i.jpg}]  
			set ifp [open $filename1 r]
			set ofp [open $filename2 w]
                        fconfigure $ifp -translation binary
			fconfigure $ofp -translation binary


			fcopy $ifp $ofp

			close $ifp
			close $ofp
              }

			
	}     


# to upload staged file 
	if {$t33 == "checked" } {

set filess [split $el "/"]
		        for {set i 0} {$i < [expr [llength $filess] - 1]} {incr i} {         
			
			set filename1 [subst {$pth/packages/beehive/www/slides/[subst {file$number}][lindex  $filess $i]}]     
			set filename2 [subst {$pth/packages/beehive/www/slides/[subst {file$number1}][lindex  $filess $i]}]  
			set ifp [open $filename1 r+]
			set ofp [open $filename2 w+]
                        fconfigure $ifp -translation binary
			fconfigure $ofp -translation binary


			fcopy $ifp $ofp

			close $ifp
			close $ofp
                      }


	}     








ad_return_template