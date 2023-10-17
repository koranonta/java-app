-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure insertSupplier.SQL
-- Create Procedure updateSupplier.SQL
-- Create Procedure deleteSupplier.SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE insertPurchase
DROP PROCEDURE updatePurchase
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE insertPurchase (@subscriber_id int, @customer_reference varchar(255), 
					@customer_instruction varchar(255), @sales_reference varchar(50), @status int,
					@firstname varchar(255), @lastname varchar(255), 
					@address_name varchar(255), @street1 varchar(255),@street2 varchar(255),
					@postcode varchar(50), @city varchar(255), @country varchar(50), @timezone varchar(50),
					@phone varchar(50), @email varchar(320),
					@cc_type int, @cc_name varchar(100), @cc_number varchar(100), @cc_csv varchar(10),
					@expiry_month char(2),@expiry_year char(2), @accounting_code varchar(50), @total money
					)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Get generated foreign keys into variables 
	declare @address_id int, @purchase_id int, @last_digits char(4), 
			@cc_number_encrypted varbinary(max), @cc_csv_encrypted varbinary(max), @creditleft money;

	-- CHECK credit
select @creditleft=CREDIT_AVAILABLE-@total from SUBSCRIBERS where SUBSCRIBER_ID=@subscriber_id;
if @creditleft >= 0 or @creditleft is null
BEGIN
	BEGIN TRY

	BEGIN TRANSACTION

	exec getNextKey 'ADDRESS_INFO',  @address_id OUTPUT;
	insert into ADDRESS_INFO (ADDRESS_ID, ADDRESS_NAME, STREET1, STREET2, POSTCODE, CITY, COUNTRY, TIMEZONE, PHONE, EMAIL)
			values (@address_id, @address_name, @street1, @street2, @postcode, @city, @country, @timezone, @phone, @email);

	if @cc_number is not null AND len(@cc_number) > 4
	begin
		select @last_digits = substring(@cc_number,len(@cc_number)-3,4);
	end 
	
	set @cc_number_encrypted=EncryptByCert(Cert_ID('CertGlobalNet'),@cc_number) 
	set @cc_csv_encrypted=EncryptByCert(Cert_ID('CertGlobalNet'),@cc_csv) 
	
	-- insert the purchase record  
	exec getNextKey 'PURCHASES',     @purchase_id OUTPUT;
	insert into PURCHASES (PURCHASE_ID, SUBSCRIBER_ID, ADDRESS_ID, DATE, CUSTOMER_REF, CUSTOMER_INSTRUCTION, SALES_REF, STATUS,
							CC_TYPE, CC_NAME, CC_EXPIRY, CC_LAST_DIGITS, CC_NUMBER, CC_CSV, ACCOUNTING_CODE)
			values (@purchase_id, @subscriber_id, @address_id, getdate(), @customer_reference, @customer_instruction, @sales_reference, 2,
					@cc_type, @cc_name, @expiry_month+@expiry_year, @last_digits, 
					@cc_number_encrypted, @cc_csv_encrypted, @accounting_code);
					
	update SUBSCRIBERS set CREDIT_AVAILABLE=@creditleft where SUBSCRIBER_ID=@subscriber_id;				
	
	COMMIT TRANSACTION
	
    select @purchase_id pkey, ERROR_NUMBER() error, '' message;
    
	END TRY
	BEGIN CATCH
	    -- Test XACT_STATE:
	        -- If 1, the transaction is committable.
	        -- If -1, the transaction is uncommittable and should be rolled back.
	        -- XACT_STATE = 0 means that there is no transaction and
	        --     a commit or rollback operation would generate an error.
	
	    IF (XACT_STATE()) = 1
	    BEGIN
			-- The transaction is committable. Committing transaction.
	        COMMIT TRANSACTION;   
	    END;

		-- Execute error retrieval routine.
	    select 0 pkey, ERROR_NUMBER() error, ERROR_MESSAGE() message;

    END CATCH;
END else
BEGIN
	select 0 pkey, '200' error, 'The purchase exceeds your available credit of '+str(CREDIT_AVAILABLE)+'$(USD)' message from SUBSCRIBERS where SUBSCRIBER_ID=@subscriber_id;
END
--- end check credit limit
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE updatePurchase (@pkey int, @status int, @processing_info nvarchar(max))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @processing_history nvarchar(max);

	BEGIN TRY

	BEGIN TRANSACTION;

	select @processing_history=isnull(PROCESSING_INFO, '')
	from PURCHASES
	WHERE PURCHASE_ID = @pkey

	SET NOCOUNT OFF;

	-- update the supplier record  
	update PURCHASES set
		PROCESSING_INFO = @processing_info+@processing_history, 
		STATUS          = @status
	WHERE PURCHASE_ID = @pkey

	COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
	    -- Test XACT_STATE:
	        -- If 1, the transaction is committable.
	        -- If -1, the transaction is uncommittable and should be rolled back.
	        -- XACT_STATE = 0 means that there is no transaction and
	        --     a commit or rollback operation would generate an error.
	
	    IF (XACT_STATE()) = -1
	    BEGIN
			-- The transaction is in an uncommittable state. Rolling back transaction.
	        ROLLBACK TRANSACTION;
	    END;
	
	    IF (XACT_STATE()) = 1
	    BEGIN
			-- The transaction is committable. Committing transaction.
	        COMMIT TRANSACTION;   
	    END;

		-- Execute error retrieval routine.
	    select ERROR_NUMBER() error, ERROR_MESSAGE() message;

    END CATCH;
END
GO

grant execute on insertPurchase to public;
grant execute on updatePurchase to public;
go


/* Test statements for the procedures:
 * 

exec insertSupplier 'SatCom','false','en','SatCom Distribution Ltd','Unit 3, The Woodford Centre, 
Lysander Way, Old Sarum ','','SP4 6BU','Salisbury','United Kingdom','GMT','SatCom Distribution',
'','','/files/suppliers/satcom.jpg','image/pjpeg','SatCom Group',1

exec updateSupplier 5, 'SatCom','false','en','SatCom Distribution Ltd','Unit 3, The Woodford Centre, 
Lysander Way, Old Sarum ','','SP4 6BU','Salisbury','United Kingdom','GMT','SatCom Distribution',
'English text','','/files/suppliers/satcom.jpg','image/pjpeg','SatCom Group',1

exec updateSupplier 5, 'SatCom','false','de','SatCom Distribution Ltd','Unit 3, The Woodford Centre, 
Lysander Way, Old Sarum ','','SP4 6BU','Salisbury','United Kingdom','GMT','SatCom Distribution',
'Text in Deutsch','','/files/suppliers/satcom.jpg','image/pjpeg','SatCom Group',1

 * 
*/