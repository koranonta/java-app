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
