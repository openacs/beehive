<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="get_pattern_info">      
    <querytext>

       SELECT * from beehive_pattern where num = :technique_num
    </querytext>
  </fullquery>
 
  
  
 
</queryset>
