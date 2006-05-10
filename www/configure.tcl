ad_page_contract {

    The logic for the aiman.

    @author aiman
    @creation-date 2004-04-10
    @cvs-id $Id$
    This page allow user to change the system url and the flash comm server address

} 




set testflag [parameter::set_value  -parameter "firstTimeFlage" -value 1]
set flashs [parameter::get -parameter "FlashComServer"]
set surl [parameter::get  -parameter "systemURL"]

ad_return_template 


