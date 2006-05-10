<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  

  <fullquery name="get_info_from_session_script">      
    <querytext>
   SELECT * from beehive_sesscript WHERE number = :session_id  
    </querytext>
  </fullquery>

  <fullquery name="get_info_from_pattern_script">      
    <querytext>
SELECT * from beehive_patscript WHERE techniqe = :technique_name AND tname = :technique_version   

    </querytext>
  </fullquery>

  <fullquery name="get_empty">      
    <querytext>

      SELECT * from beehive_emptypatscript


    </querytext>
  </fullquery>


  <fullquery name="get_session_info">      
    <querytext>
   SELECT * from beehive_ses WHERE number = :session_id 
    </querytext>
  </fullquery>

</queryset>
