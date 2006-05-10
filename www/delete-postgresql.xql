<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="delete_session">      
    <querytext>

       DELETE FROM  beehive_ses WHERE number = :numberw
    </querytext>
  </fullquery>
 
  
  <fullquery name="delete_script">      
    <querytext>
   DELETE FROM  beehive_sesscript WHERE number = :numberw
    </querytext>
  </fullquery>

  <fullquery name="delete_session_creator">      
    <querytext>
   DELETE FROM  beehive_sesf WHERE snumber = :numberw
    </querytext>
  </fullquery>

 
</queryset>
