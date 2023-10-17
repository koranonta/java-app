/*
 * getServiceGroupOptions.sql
 * Get input options belong to the group option
 */
declare @login_id int, @current_language char(5), @default_language char(5), 
		@group_id int;

select @login_id=?, @current_language=?, @default_language=?, 
		@group_id = ?;

--select @login_id=4, @current_language='de', @default_language='en', @product_id = 32;
--select @login_id=4, @current_language='de', @default_language='en', @product_id = 4;

select  po.OPTION_ID pkey,
		po.OPTION_NAME _r_option_name,
		po.STP_CODE _r_stp_code,
		po.FIELD_TYPE _r_field_type,
		po.VALUE _t_value

		
from PRODUCT_OPTIONS po, OPTION_ASSIGNED oa
where oa.ASSIGNED_ID	= po.OPTION_ID
  and oa.OPTION_ID        = @group_id
  and po.AVAILABLE = 1;
  
select 3 declareObjects, 1 name, 2 description, 3 tooltip

-- Query the associated objects
select po.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'name' object, t.TEXT _s_text, t.TEXT_ID _x_text_id
from PRODUCT_OPTIONS po, STRINGS t
where po.NAME_ID = t.TEXT_ID

select po.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'description' object, t.TEXT _t_text, t.TEXT_ID _x_text_id
from PRODUCT_OPTIONS po, STRINGS t
where po.DESCRIPTION_ID = t.TEXT_ID

select po.OPTION_ID pkey, t.TEXT_LANGUAGE lang, 'tooltip' object, t.TEXT _t_text, t.TEXT_ID _x_text_id
from PRODUCT_OPTIONS po, STRINGS t
where po.TOOLTIP_ID = t.TEXT_ID
  