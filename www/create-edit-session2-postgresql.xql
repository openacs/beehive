<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="get_info_from_pattern">      
    <querytext>

    SELECT * from beehive_pattern where num = :technique_num     
    </querytext>
  </fullquery>
 
<fullquery name="get_info_from_stored_session">      
    <querytext>
    SELECT * from beehive_ses where number = :session_id    
    </querytext>
  </fullquery>


<fullquery name="save_session_creator_info">      
    <querytext>

      insert into beehive_sesf (snumber,teacherid) values (:session_id,:user_id)


    </querytext>
  </fullquery>

</queryset>
