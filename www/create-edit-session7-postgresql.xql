<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="insert_pattern_values">      
    <querytext>

       insert into beehive_patscript (techniqe,tname,ins1,tr1,tl1,tool1,ins2,tr2,tl2,tool2,ins3,tr3,tl3,tool3,ins4,tr4,tl4,tool4,ins5,tr5,tl5,tool5,ins6,tr6,tl6,tool6,ins7,tr7,tl7,tool7,ins8,tr8,tl8,tool8,ins9,tr9,tl9,tool9,ins10,tr10,tl10,tool10,ins11,tr11,tl11,tool11,ins12,tr12,tl12,tool12,ins13,tr13,tl13,tool13,ins14,tr14,tl14,tool14,ins15,tr15,tl15,tool15,ins16,tr16,tl16,tool16,ins17,tr17,tl17,tool17,ins18,tr18,tl18,tool18,ins19,tr19,tl19,tool19,ins20,tr20,tl20,tool20 ) values (:technique_name,:technique_version,:ins1,:tr1,:tl1,:tool1,:ins2,:tr2,:tl2,:tool2,:ins3,:tr3,:tl3,:tool3,:ins4,:tr4,:tl4,:tool4,:ins5,:tr5,:tl5,:tool5,:ins6,:tr6,:tl6,:tool6,:ins7,:tr7,:tl7,:tool7,:ins8,:tr8,:tl8,:tool8,:ins9,:tr9,:tl9,:tool9,:ins10,:tr10,:tl10,:tool10,:ins11,:tr11,:tl11,:tool11,:ins12,:tr12,:tl12,:tool12,:ins13,:tr13,:tl13,:tool13,:ins14,:tr14,:tl14,:tool14,:ins15,:tr15,:tl15,:tool15,:ins16,:tr16,:tl16,:tool16,:ins17,:tr17,:tl17,:tool17,:ins18,:tr18,:tl18,:tool18,:ins19,:tr19,:tl19,:tool19,:ins20,:tr20,:tl20,:tool20)
    </querytext>
  </fullquery>
 
  
  <fullquery name="insert_session_script">      
    <querytext>
   insert into beehive_sesscript (number,ins1,tr1,tl1,tool1,ins2,tr2,tl2,tool2,ins3,tr3,tl3,tool3,ins4,tr4,tl4,tool4,ins5,tr5,tl5,tool5,ins6,tr6,tl6,tool6,ins7,tr7,tl7,tool7,ins8,tr8,tl8,tool8,ins9,tr9,tl9,tool9,ins10,tr10,tl10,tool10,ins11,tr11,tl11,tool11,ins12,tr12,tl12,tool12,ins13,tr13,tl13,tool13,ins14,tr14,tl14,tool14,ins15,tr15,tl15,tool15,ins16,tr16,tl16,tool16,ins17,tr17,tl17,tool17,ins18,tr18,tl18,tool18,ins19,tr19,tl19,tool19,ins20,tr20,tl20,tool20 ) values (:number1,:ins1,:tr1,:tl1,:tool1,:ins2,:tr2,:tl2,:tool2,:ins3,:tr3,:tl3,:tool3,:ins4,:tr4,:tl4,:tool4,:ins5,:tr5,:tl5,:tool5,:ins6,:tr6,:tl6,:tool6,:ins7,:tr7,:tl7,:tool7,:ins8,:tr8,:tl8,:tool8,:ins9,:tr9,:tl9,:tool9,:ins10,:tr10,:tl10,:tool10,:ins11,:tr11,:tl11,:tool11,:ins12,:tr12,:tl12,:tool12,:ins13,:tr13,:tl13,:tool13,:ins14,:tr14,:tl14,:tool14,:ins15,:tr15,:tl15,:tool15,:ins16,:tr16,:tl16,:tool16,:ins17,:tr17,:tl17,:tool17,:ins18,:tr18,:tl18,:tool18,:ins19,:tr19,:tl19,:tool19,:ins20,:tr20,:tl20,:tool20)  
    </querytext>
  </fullquery>

  <fullquery name="update_session_script">      
    <querytext>
   UPDATE beehive_sesscript SET ins1 = :ins1 ,tr1 = :tr1,tl1 = :tl1,tool1 = :tool1, ins2 = :ins2 ,tr2 = :tr2,tl2 = :tl2,tool2 = :tool2,ins3 = :ins3 ,tr3 = :tr3,tl3 = :tl3,tool3 = :tool3,ins4 = :ins4 ,tr4 = :tr4,tl4 = :tl4,tool4 = :tool4,ins5 = :ins5 ,tr5 = :tr5,tl5 = :tl5,tool5 = :tool5,ins6 = :ins6 ,tr6 = :tr6,tl6 = :tl6,tool6 = :tool6,ins7 = :ins7 ,tr7 = :tr7,tl7 = :tl7,tool7 = :tool7,ins8 = :ins8 ,tr8 = :tr8,tl8 = :tl8,tool8 = :tool8,ins9 = :ins9 ,tr9 = :tr9,tl9 = :tl9,tool9 = :tool9,ins10 = :ins10 ,tr10 = :tr10,tl10 = :tl10,tool10 = :tool10,ins11 = :ins11 ,tr11 = :tr11,tl11 = :tl11,tool11 = :tool11, ins12 = :ins12 ,tr12 = :tr12,tl12 = :tl12,tool12 = :tool12,ins13 = :ins13 ,tr13 = :tr13,tl13 = :tl13,tool13 = :tool13,ins14 = :ins14 ,tr14 = :tr14,tl14 = :tl14,tool14 = :tool14,ins15 = :ins15 ,tr15 = :tr15,tl15 = :tl15,tool15 = :tool15,ins16 = :ins16 ,tr16 = :tr16,tl16 = :tl16,tool16 = :tool16,ins17 = :ins17 ,tr17 = :tr17,tl17 = :tl17,tool17 = :tool17,ins18 = :ins18 ,tr18 = :tr18,tl18 = :tl18,tool18 = :tool18,ins19 = :ins19 ,tr19 = :tr19,tl19 = :tl19,tool19 = :tool19,ins20 = :ins20 ,tr20 = :tr20,tl20 = :tl20,tool20 = :tool20  WHERE number =:number1  
    </querytext>
  </fullquery>

  <fullquery name="get_session_info">      
    <querytext>
   SELECT * from beehive_ses WHERE number = :number1 
    </querytext>
  </fullquery>
 
<fullquery name="update_graduate_attributes">      
    <querytext>

       UPDATE beehive_ses SET timemanagement = :timemanagement , writtencommunicatoin = :writtencommunicatoin, criticalthinking = :criticalthinking , creativethinking = :creativethinking, analyticalskills = :analyticalskills , decisionmaking = :decisionmaking, leadership = :leadership , oralcommunication = :oralcommunication,  searchingskills = :searchingskills ,  knowledgesharing = :knowledgesharing , reflecting = :reflecting    WHERE number = :session_id0
    </querytext>
  </fullquery>

<fullquery name="pattern_graduate_attributes">      
    <querytext>

       UPDATE beehive_pattern SET timemanagement = :timemanagement , writtencommunicatoin = :writtencommunicatoin, criticalthinking = :criticalthinking , creativethinking = :creativethinking, analyticalskills = :analyticalskills , decisionmaking = :decisionmaking, leadership = :leadership , oralcommunication = :oralcommunication,  searchingskills = :searchingskills ,  knowledgesharing = :knowledgesharing , reflecting = :reflecting    WHERE num = :technique_num
    </querytext>
  </fullquery>


</queryset>
