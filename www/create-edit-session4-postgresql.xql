<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

   
  

  <fullquery name="get_pattern_info">      
    <querytext>
    SELECT * from beehive_pattern where num = :technique_num    
    </querytext>
  </fullquery>

  
<fullquery name="edit_values">      
    <querytext>

       UPDATE beehive_ses SET ig = :ig , el = :el    WHERE number = :session_id
    </querytext>
  </fullquery>
  

  
  <fullquery name="get_info_from_session_script">      
    <querytext>
    SELECT * from beehive_ses where number = :session_id
    </querytext>
  </fullquery>

 <fullquery name="edit_value2">      
    <querytext>
       UPDATE beehive_ses SET el = :ell   WHERE number = :session_id
    </querytext>
  </fullquery>
  <fullquery name="edit_value3">      
    <querytext>

       UPDATE beehive_ses SET ig = :igg   WHERE number = :session_id 
    </querytext>
  </fullquery>

</queryset>