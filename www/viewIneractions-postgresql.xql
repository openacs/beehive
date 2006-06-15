<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="get_info">      
    <querytext>

   SELECT * from beehive_sessionIntraction where se = :se and gr = :gr order by sei      
    </querytext>
  </fullquery>
 
<fullquery name="get_infoall">      
    <querytext>
    SELECT * from beehive_sessionIntraction where se = :se and gr = 0  order by Type_Interaction     
    </querytext>
  </fullquery>

<fullquery name="get_session_info">      
    <querytext>
    SELECT * from  beehive_ses where number = :se     
    </querytext>
  </fullquery>

<fullquery name="get_steps">      
    <querytext>
    SELECT * from beehive_sesscript WHERE number = :se         
    </querytext>
  </fullquery>

</queryset>
