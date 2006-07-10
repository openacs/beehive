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

       UPDATE beehive_ses SET sessioninfo = :sessioninfo , roleinfo = :roleinfo , ideasnumber = :ideasnumber ,ideastext = :ideastext,ih = :ih , largesharedtext = :largesharedtext, groupinfo = :groupinfo , smallsharedtext = :smallsharedtext , individualtext = :individualtext,smallannotatedtext = :smallannotatedtext , largeannotatedtext = :largeannotatedtext   WHERE number = :session_id
    </querytext>
  </fullquery>

</queryset>
