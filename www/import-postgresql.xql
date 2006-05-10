<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="get_patterns">      
    <querytext>

       SELECT * from beehive_pattern   WHERE techniqe <> ' '  order by techniqe
    </querytext>
  </fullquery>
 
  
  
 
</queryset>
