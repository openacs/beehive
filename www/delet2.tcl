ad_page_contract {

	basic description

    @author aiman turani (aimant@example.com)

} {


{ numberw: 0 }
{ titlew: 0 }

}



db_dml delet_value { DELETE FROM  ses WHERE number = :numberw}
db_dml delet_value2 { DELETE FROM  sesscript WHERE number = :numberw}
db_dml delet_value3 { DELETE FROM  sesf WHERE snumber = :numberw}
ad_return_template