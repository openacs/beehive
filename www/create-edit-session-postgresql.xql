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
    SELECT * from beehive_ses where number = :number    
    </querytext>
   </fullquery>
   <fullquery name="new_session_sql">
     <querytext>
       insert into beehive_ses (number,tutor, roles,mx,mn,df,datew,titlew,classname,stype,name) values (:number,:namet,:roles,:mx,:mn,:df,:datew,:titlew,:group,:technique_name,:technique_version)
     </querytext>
   </fullquery>
    <fullquery name="update_pattern_value">
     <querytext>
        UPDATE beehive_pattern SET roles= :roles,mx= :mx,mn= :mn,df= :df WHERE num = :technique_num
     </querytext>
   </fullquery>
<fullquery name="session_update">
     <querytext>
       UPDATE beehive_ses SET roles = :roles,mx = :mx ,mn = :mn,df= :df,datew= :datew,titlew= :titlew,stype =:technique_name WHERE number =:number
     </querytext>
   </fullquery>


</queryset>
