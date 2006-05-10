ad_page_contract {

	basic description

    @author aiman turani (aimant@example.com)
    to duplicate a created sessions
} {

happen_id:optional
{ numberw: 0 }
{ titlew: 0 }

}


ad_form -name activity_entery_form  -form {
	happen_id:key
	
	{datew:date(date),to_sql(linear_date),from_sql(sql_date)      
		{label "#beehive.Session_Date#"}     
		 {help}
                {format "YYYY MONTH DD HH24 MI"}
		{help_text "[_ beehive.Session_duplicated_note]" } 	
                 
        }
        
        {numberw:text(hidden) 
                 {value $numberw}
	}
        {titlew:text(hidden) 
                 {value $titlew}
	}
 
  

} -after_submit {
        
	set url_import_var [export_vars  {datew  numberw titlew}]
        ad_returnredirect "duplicate2?$url_import_var"   
        ad_script_abort
}





ad_return_template