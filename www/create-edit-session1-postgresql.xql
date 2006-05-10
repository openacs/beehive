<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="insert_pattern_value">      
    <querytext>

      insert into beehive_pattern (techniqe,name,roles,mx,mn,df,t2,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t17,t18,t19,t20,t22,t23,t24,t26,t27,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,ctype1,ctype2,ctype3,controlld1,controlld2,problem,example,context,gstructure,solution,adda1,addv1,adda2,addv2,adda3,addv3,btype1,btype2,dtype1,anon1,anon2,anon3,anon4) values (:techniqes,:names,:roles,:mx,:mn,:df,:t2,:t4,:t5,:t6,:t7,:t8,:t9,:t10,:t11,:t12,:t13,:t14,:t15,:t17,:t18,:t19,:t20,:t22,:t23,:t24,:t26,:t27,:t28,:t29,:t30,:t31,:t32,:t33,:t34,:t35,:t36,:t37,:t38,:ctype1,:ctype2,:ctype3,:controlld1,:controlld2,:problem,:example,:context,:gstructure,:solution,:adda1,:addv1,:adda2,:addv2,:adda3,:addv3,:btype1,:btype2,:dtype1,:anon1,:anon2,:anon3,:anon4)


    </querytext>
  </fullquery>
 
  <fullquery name="insert_session_values">      
    <querytext>

      insert into beehive_ses (tutor,roles,mx,mn,df,datew,titlew,classname,stype,t2,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t17,t18,t19,t20,t22,t23,t24,t26,t27,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,ctype1,ctype2,ctype3,controlld1,controlld2,adda1,addv1,adda2,addv2,adda3,addv3,anon1,anon2,anon3,anon4,btype1,btype2,dtype1,sln) values (:namet,:roles,:mx,:mn,:df,:datew,:titlew,:comm_namew,:stypew,:t2,:t4,:t5,:t6,:t7,:t8,:t9,:t10,:t11,:t12,:t13,:t14,:t15,:t17,:t18,:t19,:t20,:t22,:t23,:t24,:t26,:t27,:t28,:t29,:t30,:t31,:t32,:t33,:t34,:t35,:t36,:t37,:t38,:ctype1,:ctype2,:ctype3,:controlld1,:controlld2,:adda1,:addv1,:adda2,:addv2,:adda3,:addv3,:anon1,:anon2,:anon3,:anon4,:btype1,:btype2,:dtype1,:sln)


    </querytext>
  </fullquery>

  <fullquery name="get_pattern_info">      
    <querytext>
    SELECT * from beehive_pattern where num = :numberp    
    </querytext>
  </fullquery>

  <fullquery name="get_session_info">      
    <querytext>
    SELECT * from beehive_ses WHERE tutor = :namet AND stype= :stypew AND datew= :datew AND titlew= :titlew    
    </querytext>
  </fullquery>

  <fullquery name="save_session_creator_info">      
    <querytext>

      insert into beehive_sesf (snumber,teacherid) values (:number,:user_id)


    </querytext>
  </fullquery>


  <fullquery name="update_values_of_session">      
    <querytext>

       UPDATE beehive_ses SET roles = :roles,mx = :mx ,mn = :mn,df= :df,datew= :datew,titlew= :titlew,stype =:stypew,t2= :t2,t4= :t4,t5= :t5,t6= :t6,t7= :t7,t8= :t8,t9= :t9,t10= :t10,t11= :t11,t12= :t12,t13= :t13,t14= :t14,t15= :t15,t17= :t17,t18 =:t18,t19 =:t19,t20 =:t20,t22 =:t22,t23 =:t23,t24 =:t24,t26 =:t26,t27 =:t27,t28 =:t28,t29 =:t29,t30 =:t30,t31 =:t31,t32 =:t32,t33 =:t33,t34 =:t34,t35  =:t35,t36 =:t36 ,t37 =:t37,t38 =:t38,ctype1 =:ctype1,ctype2 =:ctype2,ctype3 =:ctype3,controlld1 =:controlld1,controlld2 =:controlld2,adda1 =:adda1,addv1 =:addv1,adda2 =:adda2,addv2 =:addv2,adda3 =:adda3,addv3 =:addv3,anon1 =:anon1,anon2 =:anon2,anon3 =:anon3,anon4 =:anon4,btype1 =:btype1,btype2 =:btype2, dtype1 =:dtype1,sln =:sln WHERE number =:session_id0


    </querytext>
  </fullquery>


  <fullquery name="get_info">      
    <querytext>
    SELECT * from beehive_ses WHERE number = :session_id0
    </querytext>
  </fullquery>

</queryset>
