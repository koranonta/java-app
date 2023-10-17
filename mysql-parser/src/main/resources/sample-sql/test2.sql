/*
 * getSupplierDetail.sql
 */

declare @login_id int, @current_language char(5), @default_language char(5),
		@supplier_id int;
		
select @login_id = ?, @current_language=?, @default_language=?, @supplier_id=?;
-- select @login_id = 4, @current_language='de', @default_language='en', @supplier_id=1;

select s.SUPPLIER_ID pkey, s.COMPANY_NAME _s_company_name, s.AVAILABLE _b_available
from SUPPLIERS s
where s.SUPPLIER_ID = @supplier_id

-- Declare the order of associated objects
select 5 declareObjects, 1 name, 2 address, 3 message, 4 introduction, 5 logo

-- Query the associated objects
select s.SUPPLIER_ID pkey, t.TEXT_LANGUAGE lang, 'name' object, t.TEXT _s_text, t.TEXT_ID _x_text_id --Comment 0
from SUPPLIERS s, STRINGS t                                                                          --Comment 1
where s.NAME_ID = t.TEXT_ID
  and s.SUPPLIER_ID = @supplier_id

select s.SUPPLIER_ID pkey, '' lang, 'address' object, a.ADDRESS_ID _x_address_id, a.ADDRESS_NAME _s_address_name,
													a.STREET1 _t_street1, a.STREET2 _t_street2, a.POSTCODE _s_postcode,
													a.CITY _s_city, a.COUNTRY _s_country, a.TIMEZONE _s_timezone, 
													a.PHONE _s_phone, a.EMAIL _s_email
from SUPPLIERS s, ADDRESS_INFO a
where s.ADDRESS_ID = a.ADDRESS_ID
  and s.SUPPLIER_ID = @supplier_id

select s.SUPPLIER_ID pkey, t.TEXT_LANGUAGE lang, 'message' object, t.TEXT _t_text, t.TEXT_ID _x_text_id
from SUPPLIERS s, STRINGS t
where s.MESSAGE_ID = t.TEXT_ID
  and s.SUPPLIER_ID = @supplier_id

select s.SUPPLIER_ID pkey, t.TEXT_LANGUAGE lang, 'introduction' object, t.TEXT _t_text, t.TEXT_ID _x_text_id
from SUPPLIERS s, STRINGS t
where s.INTRODUCTION_ID = t.TEXT_ID
  and s.SUPPLIER_ID = @supplier_id

select s.SUPPLIER_ID pkey, '' lang, 'logo' object, u.PATH _f_path, u.MIMETYPE _r_mimetype, u.TITLE _s_title, 
		u.DATE _r_date, u.UPLOAD_ID _x_upload_id, u.UPLOADED_BY _x_uploaded_by --COMMENT 10
from SUPPLIERS s, UPLOADS u
where s.LOGO_ID = u.UPLOAD_ID
  and s.SUPPLIER_ID = @supplier_id

