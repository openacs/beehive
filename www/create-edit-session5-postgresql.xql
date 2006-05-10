<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>
   
  <fullquery name="get_session_info">      
    <querytext>
    SELECT * from beehive_ses WHERE number = :session_id    
    </querytext>
  </fullquery>

  
  <fullquery name="do_update">      
    <querytext>

       UPDATE beehive_ses SET st = :st , srt = :srt , idn = :idn ,idt = :idt,ih = :ih , it = :it , ynt = :ynt   WHERE number = :session_id
    </querytext>
  </fullquery>

</queryset>
