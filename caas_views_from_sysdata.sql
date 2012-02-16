RENAME TABLE CAAS_ADMIN.ADV to CAAS_ADMIN.ADV_TAB;

CREATE VIEW CAAS_ADMIN.ADV 
    ( 
     ,ADV_XID
     ,CREATED_BY
     ,CREATED_DT
     ,ACTIVE_FLG
     ,VERSION
     ,ADV_ID
     ,ADV_PARENT_ID
     ,ADV_CATG_ID
     ,ADV_NAME
     ,GRP_ID
     ,FIN_GRP_ID
     ,SALES_GRP_ID
     ,UPDATED_BY
     ,UPDATED_DT 
    ) 
	as select ID as adv_xid
		,substr(created_by,1,30) as created_by
		,created_date as created_dt
		,(case is_deleted when 0 then '1' else '0' end case) as active_flg
		,version as version
		,substr(external_id,1,30) as adv_id
		,substr(external_id,1,30) as adv_parent_id
		,substr(external_id,1,30) as adv_catg_id
		,substr(description,1,75) as adv_name
		,null as grp_id
		,null as fin_grp_id
		,null as sales_grp_id
		,updated_by as updated_by
		,edited_date as updated_dt
		from sysdata.company
;

