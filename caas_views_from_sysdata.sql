grant select on sysdata.company to CAAS_ADMIN;
grant select on sysdata.network_owner to CAAS_ADMIN;
grant select on sysdata.product_type to CAAS_ADMIN;
grant select on sysdata.location to CAAS_ADMIN;
grant select on sysdata.contact to CAAS_ADMIN;
grant select on sysdata.phone to CAAS_ADMIN;
grant select on sysdata.email to CAAS_ADMIN;

alter table sysdata.company add network_abbreviation varchar2(50 char);
alter table sysdata.company add fulfillment_house_url_address(50 char);
alter table sysdata.company add external_id varchar2(50 char);
alter table sysdata.product_type add max_questions number(2,0);l
alter table sysdata.product_type add product_type_code varchar2(1 char);
alter table sysdata.location add name varchar2(50 char);

RENAME TABLE CAAS_ADMIN.ADV to CAAS_ADMIN.ADV_TAB;

CREATE VIEW CAAS_ADMIN.ADV 
    ( 
adv_xid
,created_by
,created_dt
,active_flg
,version
,adv_id
,adv_parent_id
,adv_catg_id
,adv_name
,grp_id
,fin_grp_id
,sales_grp_id
,updated_by
,updated_dt
) 
as select id - 30000 as adv_xid
,substr(created_by,1,30) as created_by
,created_date as created_dt
,(case is_deleted when 0 then '1' else '0' end) as active_flg
,version as version
,substr(external_id,1,30) as adv_id
,substr(external_id,1,30) as adv_parent_id
,substr(category,1,30) as adv_catg_id
,substr(client_code,1,75) as adv_name
,null as grp_id
,null as fin_grp_id
,null as sales_grp_id
,updated_by as updated_by
,edited_date as updated_dt
from sysdata.company
where company_type = 'Advertiser'
;

RENAME TABLE CAAS_ADMIN.FFH to CAAS_ADMIN.FFH_TAB;

CREATE VIEW CAAS_ADMIN.FFH (
ffh_xid
,created_by
,created_dt
,active_flg
,version
,ffh_id
,co_name
,cntct_last_name
,cntct_first_name
,cntct_phone
,ip_addr
,url_addr
,updated_by
,updated_dt
,email
)
as select cmp.id - 40000
,cmp.created_by
,cmp.created_date
,(case cmp.is_deleted when 0 then '1' else '0' end)
,cmp.version
,cmp.external_id
,cmp.company_name
,cnt.last_name
,cnt.first_name
,ph.phone_number
,null
,cmp.fulfillment_house_url_address
,cmp.updated_by
,cmp.edited_date
,em.email_address
from sysdata.company cmp 
left outer join sysdata.contact cnt on cmp.id = cnt.id
left outer join sysdata.phone ph on cnt.id = ph.contact_id
left outer join sysdata.email em on cnt.id = em.contact_id
where cmp.company_type = 'Fulfillment House'
;

RENAME TABLE CAAS_ADMIN.NTWK to CAAS_ADMIN.NTWK_TAB;

CREATE VIEW CAAS_ADMIN.NTWK (
ntwk_xid
,created_by
,created_dt
,active_flg
,version
,ntwk_name
,ntwk_desc
,start_dt
,dual_feed
,updated_by
,updated_dt
,ntwk_id
,nielsen_cd
,ntwk_abbrev
)
as select id - 50000
,created_by
,created_date
,(case is_deleted when 0 then '1' else '0' end)
,version
,network_name
,description
,certified_date
,null
,updated_by
,edited_date
,external_id
,network_abbreviation
,network_abbreviation
from sysdata.company 
where company_type = 'Network'
;

RENAME TABLE CAAS_ADMIN.PROGMR to CAAS_ADMIN.PROGMR_TAB;

CREATE VIEW CAAS_ADMIN.PROGMR (
,progmr_xid
,created_by
,created_dt
,active_flg
,version
,progmr_id
,progmr_desc
,updated_by
,updated_dt
)
as select id - 60000 
,created_by
,created_date
,(case is_deleted when 0 then '1' else '0' end)
,version
,external_id
,description
,updated_by
,edited_date
from sysdata.company
where company_type = 'Programmer'
;

RENAME TABLE CAAS_ADMIN.PROGMR_NTWK_DATA to CAAS_ADMIN.PROGMR_NTWK_DATA_TAB;

CREATE VIEW CAAS_ADMIN.PROGMR_NTWK_DATA (
progmr_ntwk_data_xid
,created_by
,created_dt
,active_flg
,version
,progmr_xid
,ntwk_xid
,updated_by
,updated_dt
) as select id
,created_by
,created_date
,(case when relation_start_date < sysdate and (relation_end_date is null or relation_end_date > sysdate) then '1' else '0' end)
,version
,programmer_id - 60000
,network_id - 50000
,updated_by
,edited_date
from sysdata.network_owner
;

RENAME TABLE CAAS_ADMIN.PROD_TYPE to CAAS_ADMIN.PROD_TYPE_TAB;

CREATE VIEW CAAS_ADMIN.PROD_TYPE (
prod_type_xid
,created_by
,created_dt
,active_flg
,version
,prod_type_id
,prod_name
,dflt_max_questions
,updated_by
,updated_dt
) as select id
,created_by
,created_date
,(case is_deleted when 0 then '1' else '0' end)
,version
,product_type_code
,name
,max_questions
,updated_by
,edited_date
from sysdata.product_type
;

RENAME TABLE CAAS_ADMIN.OFFICE to CAAS_ADMIN.OFFICE_TAB;

CREATE VIEW CAAS_ADMIN.OFFICE (
office_xid
,created_by
,created_dt
,active_flg
,version
,office_id
,us_state_xid
,office_name
,addr_line1
,addr_line2
,city
,main_phone
,main_fax
,status_cd
,region_xid
,updated_by
,updated_dt
,zip_code_plus4
)
as select id
,created_by
,created_date
,(case is_deleted when 0 then '1' else '0' end)
,version
,description
,(select us_state_xid from caas_admin.us_state where state =  sysdata.location.state and active_flg = '1')
,name
,address1
,address2
,city
,(select phone_number from sysdata.phone where type = 'Main' and company_id = location.company_id) 
,(select phone_number from sysdata.phone where type = 'Fax' and company_id  = location.company_id) 
,null
,3
,updated_by
,edited_date
,postal_code9
from sysdata.location 
where company_id =  (select id from sysdata.company where company_type = 'Canoe') 
and location_type = 'Office'
;

RENAME TABLE CAAS_ADMIN.STAFF to CAAS_ADMIN.STAFF_TAB;

CREATE VIEW CAAS_ADMIN.STAFF (
staff_xid
,created_by
,created_dt
,active_flg
,version
,staff_id
,office_xid
,name_pref
,first_name
,mid_initial
,last_name
,dept_id
,job_title_xid
,home_phone
,work_phone
,fax
,email
,updated_by
,updated_dt
,location
)
as select id
,created_by
,created_date
,(case is_deleted when 0 then '1' else '0' end)
,version
,username
,(select id from sysdata.location where description = canoe_office)
,alternate_name
,first_name
,null
,last_name
,'0'
,1
,(select phone_number from sysdata.phone where phone.contact_id=contact.id and phone.type = 'Home')
,(select phone_number from sysdata.phone where phone.contact_id=contact.id and phone.type = 'Work')
,(select phone_number from sysdata.phone where phone.contact_id=contact.id and phone.type = 'Fax')
,(select email_address from sysdata.email where email.contact_id=contact.id and email.email_type = 'Work')
,updated_by
,edited_date
,null
from sysdata.contact 
where company_id =  (select id from sysdata.company where company_type = 'Canoe' )
;

