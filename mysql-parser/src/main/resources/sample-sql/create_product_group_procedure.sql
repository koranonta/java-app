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

DROP PROCEDURE insertProductGroup
DROP PROCEDURE updateProductGroup
DROP PROCEDURE deleteProductGroup
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE insertProductGroup (@available bit, @language char(5),  
								 @loc_name nvarchar(4000), @loc_description nvarchar(4000),
								 @loc_tooltip nvarchar(4000), @loc_announcement nvarchar(4000),
								 @group_name varchar(50),
								 @supplier_id int, @sort_order int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Get generated foreign keys into variables 
	declare @prod_group_id int, @name_id int, @description_id int, @tooltip_id int, @announcement_id int;

	BEGIN TRY

		BEGIN TRANSACTION
	
		-- insert the dependent records first
		exec getNextKey 'STRINGS',       @name_id OUTPUT;
		insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@name_id, @language, @loc_name);
	
		exec getNextKey 'STRINGS',       @description_id OUTPUT;
		insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@description_id, @language, @loc_description);
	
		exec getNextKey 'STRINGS',       @tooltip_id OUTPUT;
		insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@tooltip_id, @language, @loc_tooltip);
	
		exec getNextKey 'STRINGS',       @announcement_id OUTPUT;
		insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@announcement_id, @language, @loc_announcement);
	
		-- insert the product group record  
		exec getNextKey 'PRODUCT_GROUPS',     @prod_group_id OUTPUT;
		insert into PRODUCT_GROUPS (PROD_GROUP_ID, SUPPLIER_ID, NAME_ID, DESCRIPTION_ID, TOOLTIP_ID, 
									ANNOUNCEMENT_ID, AVAILABLE, SORT_ORDER, GROUP_NAME) 
				values (@prod_group_id, @supplier_id, @name_id, @description_id, @tooltip_id, 
									@announcement_id, @available, @sort_order, @group_name);
		
		COMMIT TRANSACTION
	
	    select @prod_group_id pkey, ERROR_NUMBER() error, '' message;
    
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
	    select ERROR_NUMBER() error, ERROR_MESSAGE() message;

    END CATCH;
	
	
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE updateProductGroup (@pkey int, @available bit, @language char(5),  
								 @loc_name nvarchar(4000), @loc_description nvarchar(4000),
								 @loc_tooltip nvarchar(4000), @loc_announcement nvarchar(4000),
								 @group_name varchar(50),
								 @supplier_id int, @sort_order int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Get all foreign keys to update those records
	declare @name_id int, @description_id int, @tooltip_id int, @announcement_id int;
	
	BEGIN TRY

		BEGIN TRANSACTION;
	
		select @name_id=NAME_ID, @description_id=DESCRIPTION_ID, 
				@tooltip_id = TOOLTIP_ID, @announcement_id = ANNOUNCEMENT_ID   
		from PRODUCT_GROUPS
		where PROD_GROUP_ID=@pkey;
		
		-- update the dependent records first
		
		update STRINGS set  
			TEXT = @loc_name
		where TEXT_ID=@name_id
		  and TEXT_LANGUAGE = @language;
		if @@rowcount = 0
			insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@name_id, @language, @loc_name);
	
		update STRINGS set
			TEXT = @loc_description
		where TEXT_ID=@description_id
		  and TEXT_LANGUAGE = @language;
		if @@rowcount = 0
			insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@description_id, @language, @loc_description);
	
		update STRINGS set
			TEXT = @loc_tooltip
		where TEXT_ID=@tooltip_id
		  and TEXT_LANGUAGE = @language;
		if @@rowcount = 0
			insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@tooltip_id, @language, @loc_tooltip);
	
		update STRINGS set
			TEXT = @loc_announcement
		where TEXT_ID=@announcement_id
		  and TEXT_LANGUAGE = @language;
		if @@rowcount = 0
			insert into STRINGS (TEXT_ID, TEXT_LANGUAGE, TEXT) values (@announcement_id, @language, @loc_announcement);
	
		SET NOCOUNT OFF;
	
		-- update the supplier record  
		update PRODUCT_GROUPS set
			GROUP_NAME  = @group_name, 
			SORT_ORDER  = @sort_order, 
			SUPPLIER_ID = @supplier_id, 
			AVAILABLE   = @available 
		where PROD_GROUP_ID = @pkey;
	
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

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE deleteProductGroup (@pkey int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRANSACTION;
	
		DELETE STRINGS
		from STRINGS s, PRODUCT_GROUPS pg
		where s.TEXT_ID in (pg.NAME_ID, pg.DESCRIPTION_ID, pg.TOOLTIP_ID, pg.ANNOUNCEMENT_ID)
		
		SET NOCOUNT OFF;
	
		DELETE PRODUCT_OPTIONS
		where OPTION_ID = @pkey
	
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


grant execute on insertProductGroup to public;
grant execute on updateProductGroup to public;
grant execute on deleteProductGroup to public;
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