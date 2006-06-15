 
ad_page_contract {

    The logic for the aiman.

    @author aiman  turani 
    @creation-date 2005-04-10
    @cvs-id $Id$
    This page is responsible of uploading/updating  files needed by chosen tasks 

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
         
}


set tools " "



# to update/save uploaded files names 
db_dml edit_values {}


# get the session's tasks       
db_multirow session get_info_from_session_script {}
template::multirow foreach session {
					}



# to upload files if slides option was selected
	if {$t18 == "checked" } {
		for {set i 1} {$i <= $sln} {incr i} { 
			set localfile [ns_queryget [subst {slide$i}]]

			if {$localfile != "" } {
				set ifp [open [ns_queryget [subst {slide$i}].tmpfile] r]
   
				# open the filename for writing

				set pth [acs_root_dir]  
				set filename [subst {$pth/packages/beehive/www/slides/[subst {sess$session_id}]Slide$i.jpg}] 

				set ofp [open $filename w+]

				fconfigure $ifp -translation binary
				fconfigure $ofp -translation binary

				ns_cpfp $ifp $ofp

				close $ifp
				close $ofp
			}
		}
	}     


# to upload file for withe board drawing  
	if {$t20 == "checked" || $t11 == "checked"   } {
		         
			set localfilewb [ns_queryget sld]

			if {$localfilewb != "" } {
				set ifpwb [open [ns_queryget [subst {sld}].tmpfile] r]
   
				# open the filename for writing

				set pthwb [acs_root_dir]  
				set filenamewb [subst {$pthwb/packages/beehive/www/slides/[subst {sess$session_id}]Slide.jpg}] 

				set ofpwb [open $filenamewb w+]

				fconfigure $ifpwb -translation binary
				fconfigure $ofpwb -translation binary

				ns_cpfp $ifpwb $ofpwb

				close $ifpwb
				close $ofpwb
			}
		
	}     
# to upload staged file 
	if {$t33 == "checked" } {
		         
			set localfiledf [ns_queryget el]

			if {$localfiledf != "" } {
				set ifpdf [open [ns_queryget [subst {el}].tmpfile] r]
   
				# open the filename for writing

				set pthdf [acs_root_dir]  
				set filenamedf [subst {$pthdf/packages/beehive/www/slides/[subst {sess$session_id}]$el}] 

				set ofpdf [open $filenamedf w+]

				fconfigure $ifpdf -translation binary
				fconfigure $ofpdf -translation binary

				ns_cpfp $ifpdf $ofpdf

				close $ifpdf
				close $ofpdf
			}  else {
                                # to update staged file name
				db_dml edit_value2 {}
			} 
		
	}     

set url_import_var [export_vars  {edit_flage  technique_name technique_num  session_id  roles sln newtechnique_flage}] 
ad_returnredirect "create-edit-session5?$url_import_var" 


