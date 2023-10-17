/*
 * getRequestOptions.sql
 * 
 */
declare @login_id int, @current_language char(5), @default_language char(5), 
		@service_id int, @prod_group_id int, @client_group_id int;

select @login_id=?, @current_language=?, @default_language=?, @service_id = ?, @prod_group_id = ?;
-- select @login_id=4, @current_language='en', @default_language='en',  @service_id = 1, @prod_group_id = ?;

select @client_group_id=acg.CLIENT_GROUP_ID
from ASSIGNED_CLIENT_GROUP acg, SUBSCRIBERS s, LOGINS l
where l.SUBSCRIBER_ID = s.SUBSCRIBER_ID 
  and s.CLIENT_ID = acg.CLIENT_ID
  and acg.PROD_GROUP_ID = @prod_group_id
  AND l.LOGIN_ID = @login_id

-- This inhenently only selects product groups with assigned objects
-- pgo=group options, pio=input options 
select  pio.OPTION_ID pkey,
		pio.OPTION_TYPE _r_option_type,
		pio.OPTION_USAGE _l_option_usage,
		pio.FIELD_TYPE _r_field_type,
		pio.FIELD_LENGTH _r_field_length,
		pio.STP_CODE _r_stp_code,
		pio.VALUE _r_value
from SERVICES s, SERVICE_OPTIONS so, PRODUCT_OPTIONS pgo, PRODUCT_OPTIONS pio, OPTION_ASSIGNED oa
where s.SERVICE_ID		   = so.SERVICE_ID
	and so.OPTION_ID	   = pgo.OPTION_ID
    and pgo.AVAILABLE      = 1
	and oa.OPTION_ID	   = pgo.OPTION_ID
	and oa.ASSIGNED_ID	   = pio.OPTION_ID
	and pio.AVAILABLE      = 1
	and pio.VISIBLE        = 1
	and s.SERVICE_ID	   = @service_id
  AND (so.CLIENT_GROUP_ID = @client_group_id or so.CLIENT_GROUP_ID=-1)
	and so.PROD_GROUP_ID   = @prod_group_id

order by pgo.SORT_ORDER, oa.SORT_ORDER,pio.SORT_ORDER

select 3 declareObjects, 1 name, 2 description, 3 tooltip

-- Query the associated objects
select pio.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'name' object, t.TEXT _s_text
from SERVICES s, SERVICE_OPTIONS so, PRODUCT_OPTIONS pgo, PRODUCT_OPTIONS pio, OPTION_ASSIGNED oa, STRINGS t
where s.SERVICE_ID		= so.SERVICE_ID
	and so.OPTION_ID	= pgo.OPTION_ID
    and pgo.AVAILABLE	= 1
	and oa.OPTION_ID	= pgo.OPTION_ID
	and oa.ASSIGNED_ID	= pio.OPTION_ID
    and pio.NAME_ID		= t.TEXT_ID
	and pio.AVAILABLE      = 1
	and pio.VISIBLE        = 1
	and s.SERVICE_ID	   = @service_id
  AND (so.CLIENT_GROUP_ID = @client_group_id or so.CLIENT_GROUP_ID=-1)
	and so.PROD_GROUP_ID   = @prod_group_id

select pio.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'description' object, t.TEXT _s_text
from SERVICES s, SERVICE_OPTIONS so, PRODUCT_OPTIONS pgo, PRODUCT_OPTIONS pio, OPTION_ASSIGNED oa, STRINGS t
where s.SERVICE_ID			= so.SERVICE_ID
	and so.OPTION_ID		= pgo.OPTION_ID
    and pgo.AVAILABLE    	= 1
	and oa.OPTION_ID		= pgo.OPTION_ID
	and oa.ASSIGNED_ID		= pio.OPTION_ID
    and pio.DESCRIPTION_ID	= t.TEXT_ID
	and pio.AVAILABLE      = 1
	and pio.VISIBLE        = 1
	and s.SERVICE_ID	   = @service_id
  AND (so.CLIENT_GROUP_ID = @client_group_id or so.CLIENT_GROUP_ID=-1)
	and so.PROD_GROUP_ID   = @prod_group_id

select pio.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'tooltip' object, t.TEXT _s_text
from SERVICES s, SERVICE_OPTIONS so, PRODUCT_OPTIONS pgo, PRODUCT_OPTIONS pio, OPTION_ASSIGNED oa, STRINGS t
where s.SERVICE_ID		= so.SERVICE_ID
	and so.OPTION_ID	= pgo.OPTION_ID
    and pgo.AVAILABLE   = 1
	and oa.OPTION_ID	= pgo.OPTION_ID
	and oa.ASSIGNED_ID	= pio.OPTION_ID
    and pio.TOOLTIP_ID  = t.TEXT_ID
	and pio.AVAILABLE      = 1
	and pio.VISIBLE        = 1
	and s.SERVICE_ID	   = @service_id
  AND (so.CLIENT_GROUP_ID = @client_group_id or so.CLIENT_GROUP_ID=-1)
	and so.PROD_GROUP_ID   = @prod_group_id

