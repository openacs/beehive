<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="get_task_info">      
    <querytext>

       SELECT * from beehive_tasks where num = :num
    </querytext>
  </fullquery>
 
  
  
 
</queryset>
