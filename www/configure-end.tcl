ad_page_contract {

    The logic for the aiman.

    @author aiman
    @creation-date 2004-04-10
    @cvs-id $Id$
   

} {

{ flashs: " " }
{ surl: " " }

}

set flashss [parameter::set_value  -parameter "FlashComServer" -value $flashs]
set surll [parameter::set_value  -parameter "systemURL" -value $surl]
ad_return_template 


