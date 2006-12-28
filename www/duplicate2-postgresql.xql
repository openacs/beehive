<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

 <fullquery name="get_info_from_original_session">      
    <querytext>

    SELECT * from beehive_ses WHERE number = :numberw     
    </querytext>
  </fullquery>

<fullquery name="insert_value1">      
    <querytext>

      insert into beehive_ses (number,tutor,roles,mx,mn,df,datew,titlew,classname,stype,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t17,t18,t19,t20,t22,t23,t24,t26,t27,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,ctype1,ctype2,ctype3,controlld1,controlld2,adda1,addv1,adda2,addv2,adda3,addv3,anon1,anon2,anon3,anon4,btype1,btype2,dtype1,sln,fln,slnw,sessioninfo, roleinfo,groupinfo,ideasnumber,ideastext,el,ih, largesharedtext,smallsharedtext,individualtext,smallannotatedtext , largeannotatedtext,timemanagement, writtencommunicatoin , criticalthinking, creativethinking , analyticalskills , decisionmaking , leadership , oralcommunication ,  searchingskills  ,  knowledgesharing , reflecting,solution  ) values (acs_object_id_seq.nextval,:tutor,:roles,:mx,:mn,:df,:dated,:titlew,:classname,:stype,:t2, :t3,:t4,:t5,:t6,:t7,:t8,:t9,:t10,:t11,:t12,:t13,:t14,:t15,:t17,:t18,:t19,:t20,:t22,:t23,:t24,:t26,:t27,:t28,:t29,:t30,:t31,:t32,:t33,:t34,:t35,:t36,:t37,:t38,:ctype1,:ctype2,:ctype3,:controlld1,:controlld2,:adda1,:addv1,:adda2,:addv2,:adda3,:addv3,:anon1,:anon2,:anon3,:anon4,:btype1,:btype2,:dtype1,:sln,:fln,:slnw,:sessioninfo,:roleinfo,:groupinfo ,:ideasnumber ,:ideastext,:el, :ih ,:largesharedtext, :smallsharedtext, :individualtext, :smallannotatedtext , :largeannotatedtext,:timemanagement, :writtencommunicatoin , :criticalthinking, :creativethinking , :analyticalskills , :decisionmaking , :leadership , :oralcommunication ,  :searchingskills  ,  :knowledgesharing , :reflecting, :solution  ) 


    </querytext>
  </fullquery>

<fullquery name="get_info_from_duplicated_session">      
    <querytext>
    SELECT * from beehive_ses WHERE tutor = :tutor AND stype= :stype AND datew= :dated AND titlew= :titlew     
    </querytext>
  </fullquery>


<fullquery name="insert_value2">      
    <querytext>

      insert into beehive_sesf (snumber,teacherid) values (:number,:user_id) 


    </querytext>
  </fullquery>

<fullquery name="get_script_from_origina_session">      
    <querytext>
    SELECT * from beehive_sesscript WHERE number = :numberw    
    </querytext>
  </fullquery>

<fullquery name="insert_value3">      
    <querytext>

      insert into beehive_sesscript (number,ins1,tr1,tl1,tool1,ins2,tr2,tl2,tool2,ins3,tr3,tl3,tool3,ins4,tr4,tl4,tool4,ins5,tr5,tl5,tool5,ins6,tr6,tl6,tool6,ins7,tr7,tl7,tool7,ins8,tr8,tl8,tool8,ins9,tr9,tl9,tool9,ins10,tr10,tl10,tool10,ins11,tr11,tl11,tool11,ins12,tr12,tl12,tool12,ins13,tr13,tl13,tool13,ins14,tr14,tl14,tool14,ins15,tr15,tl15,tool15,ins16,tr16,tl16,tool16,ins17,tr17,tl17,tool17,ins18,tr18,tl18,tool18,ins19,tr19,tl19,tool19,ins20,tr20,tl20,tool20,ins21,tr21,tl21,tool21,ins22,tr22,tl22,tool22,ins23,tr23,tl23,tool23,ins24,tr24,tl24,tool24,ins25,tr25,tl25,tool25 ) values (:number1,:ins1,:tr1,:tl1,:tool1,:ins2,:tr2,:tl2,:tool2,:ins3,:tr3,:tl3,:tool3,:ins4,:tr4,:tl4,:tool4,:ins5,:tr5,:tl5,:tool5,:ins6,:tr6,:tl6,:tool6,:ins7,:tr7,:tl7,:tool7,:ins8,:tr8,:tl8,:tool8,:ins9,:tr9,:tl9,:tool9,:ins10,:tr10,:tl10,:tool10,:ins11,:tr11,:tl11,:tool11,:ins12,:tr12,:tl12,:tool12,:ins13,:tr13,:tl13,:tool13,:ins14,:tr14,:tl14,:tool14,:ins15,:tr15,:tl15,:tool15,:ins16,:tr16,:tl16,:tool16,:ins17,:tr17,:tl17,:tool17,:ins18,:tr18,:tl18,:tool18,:ins19,:tr19,:tl19,:tool19,:ins20,:tr20,:tl20,:tool20,:ins21,:tr21,:tl21,:tool21,:ins22,:tr22,:tl22,:tool22,:ins23,:tr23,:tl23,:tool23,:ins24,:tr24,:tl24,:tool24,:ins25,:tr25,:tl25,:tool25)  


    </querytext>
  </fullquery>

</queryset>
