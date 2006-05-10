ad_page_contract {

	to get info from .lrn back to flash server

    @author aiman turani (aimant@ee.usyd.edu.au)

} {

{ command: "PutParamI" }
{ se: 1 }
{ user_id: 496 }
{ group: 0 }
{ textdate: "test" }{ Type_Interaction: "  " }     { student_response: " " }
{ instruction_number: 1 }


} -properties {
         tit:onelist
         des:onelist
         dur:onelist
         cla:onelist
         tut:onelist
         sty:onelist
         teacherid:onelist
         flashserver:onelist
         
}

# get the user name 
set name [acs_user::get_element -user_id $user_id -element name]

set package_id [ad_conn package_id]


# get the locale language name
#set locale [lang::user::locale]
#set filepath [lang::catalog::get_catalog_file_path -locale $locale -package_key $package_id]
#set filename_start [string first $locale $filepath ]
#set filename_end [string last l $filepath ]
#set file_label [string range $filepath $filename_start $filename_end]






# when the flash application is requiring session information from database 
if { $command == "getparameter" } {
  set teacherid [db_list get_t {SELECT teacherid FROM beehive_sesf where snumber = :se}]
    set cla [db_list get_classsname {SELECT classname FROM beehive_ses where number = :se}]
  
  ns_return 200 text/html "teacherid=[lindex  $teacherid 0]&classn=[lindex  $cla 0]&na=$name "


# when the flash application requires storing  interaction information in the database
    } elseif {$command == "PutParamI"} { 
       
        
        db_dml insert_interaction { insert into beehive_sessionIntraction (sname,textdate,Type_Interaction,student_response,se,gr,instruction_number) values (:name,:textdate,:Type_Interaction,:student_response,:se,:group,:instruction_number )  }

ns_return 200 text/html "title=inserted "
 } else  {
        ns_return 200 text/html "title=wrong command"
    }


