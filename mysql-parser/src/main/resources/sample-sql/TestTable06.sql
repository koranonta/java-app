CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] NOT NULL,
	[InvoiceTypeID] [int] NOT NULL,
	[InvoiceRuleID] [int] NULL,
	[BillingRunID] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[UpToDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[InvoiceNumber] [varchar](20) NULL,
	[PurchaseOrderNumber] [varchar](50) NULL,
	[InvoiceTotalPreTax] [dbo].[bigmoney] NULL,
	[InvoiceTotalPostTax] [dbo].[bigmoney] NULL,
	[InvoiceAlternateTotalPreTax] [dbo].[bigmoney] NULL,
	[InvoiceAlternateTotalPostTax] [dbo].[bigmoney] NULL,
	[TaxAmount] [money] NULL,
	[AlternateTaxAmount] [dbo].[bigmoney] NULL,
	[TaxRate] [money] NULL,
	[ExchangeRate] [dbo].[bigmoney] NULL,
	[BPCode] [varchar](50) NULL,
	[Attention] [nvarchar](256) NULL,
	[BillToAddress] [nvarchar](max) NULL,
	[MailToAddress] [nvarchar](max) NULL,
	[TerminalInfo] [nvarchar](max) NULL,
	[PaymentTerm] [varchar](50) NULL,
	[UsagePeriodStartDate] [datetime] NULL,
	[UsagePeriodEndDate] [datetime] NULL,
	[InvoiceStatus] [int] NULL,
	[Editable] [bit] NOT NULL CONSTRAINT [DF__Invoices__Editab__12BEA5E7]  DEFAULT ((0)),
	[CurrencyID] [int] NULL,
	[AlternateCurrencyID] [int] NULL,
	[DivisionID] [int] NULL,
	[RegionID] [char](2) NULL,
	[SalesPersonID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[TaxDisplayName] [varchar](50) NULL,
	[InvoicePath] [varchar](max) NULL,
	[CCBatchNumber] [varchar](50) NULL,
	[CCReferenceNumber] [varchar](50) NULL,
	[CCStatus] [varchar](50) NULL,
	[CCErrorMessage] [varchar](max) NULL,
	[CCAliasName] [varchar](50) NULL,
	[CCErrorDetail] [varchar](max) NULL,
	[CSVFeePath] [varchar](max) NULL,
	[CSVUsagePath] [varchar](max) NULL,
	[CSVHMCMailPath] [varchar](max) NULL,
	[TaxCode] [varchar](20) NULL,
	[RBSBucket] [varchar](16) NULL,
 CONSTRAINT [PK_INVOICES] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_InvoiceNumber_DateDeleted] UNIQUE NONCLUSTERED 
(
	[InvoiceNumber] ASC,
	[DateDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[InvoiceDeliveries](
	[InvoiceDeliveryId] [int] NOT NULL,
	[InvoiceRuleId] [int] NOT NULL,
	[DeliveryId] [int] NOT NULL,
	[HardCopy] [bit] NOT NULL DEFAULT ((0)),
	[EmailPdf] [bit] NOT NULL DEFAULT ((0)),
	[EmailUsage] [bit] NOT NULL DEFAULT ((0)),
	[EmailFee] [bit] NOT NULL DEFAULT ((0)),
	[EmailHmcmail] [bit] NOT NULL DEFAULT ((0)),
	[FtpPdf] [bit] NOT NULL DEFAULT ((0)),
	[FtpUsage] [bit] NOT NULL DEFAULT ((0)),
	[FtpFee] [bit] NOT NULL DEFAULT ((0)),
	[FtpHmcmail] [bit] NOT NULL DEFAULT ((0)),
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[StartDate] [datetime] NOT NULL DEFAULT ('2001-01-01'),
	[EndDate] [datetime] NOT NULL DEFAULT ('2099-12-31 23:59:59.997'),
	[EmailInZip] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceDeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[InmarsatSIMInfo](
	[SETID] [nvarchar](255) NULL,
	[ICC_ID] [nvarchar](255) NULL,
	[IMSI] [nvarchar](255) NULL,
	[MASTER_MSISDN] [nvarchar](255) NULL,
	[STATUS] [nvarchar](255) NULL,
	[CUSTOMER NAME] [nvarchar](255) NULL,
	[DP_CUST_ID] [nvarchar](255) NULL,
	[BSS_CUST_ID] [nvarchar](255) NULL,
	[DP_PKG_INST_ID] [nvarchar](255) NULL,
	[BSS_PKG_INST_ID] [nvarchar](255) NULL,
	[PKG_PLAN_ID] [nvarchar](255) NULL,
	[PKG_PLAN_NAME] [nvarchar](255) NULL,
	[RATEPLAN_ID] [nvarchar](255) NULL,
	[RATEPLAN_NAME] [nvarchar](255) NULL,
	[INDUSTRY] [nvarchar](255) NULL,
	[DATE_IMPORT] [datetime] NULL DEFAULT (getdate()),
	[IMPORT_STATUS] [nvarchar](255) NULL,
	[IMPORT_ID] [int] NULL,
	[ENABLED_APNS] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])

GO

ALTER TABLE [dbo].[ActionTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_ACTIONTY_GROUPACTI_ACTIONTY] FOREIGN KEY([ActionTypeGroupID])
REFERENCES [dbo].[ActionTypeGroups] ([ActionTypeGroupID])

GO
ALTER TABLE [dbo].[ActionTypes] CHECK CONSTRAINT [FK_ACTIONTY_GROUPACTI_ACTIONTY]
GO

ALTER TABLE [dbo].[ActionTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_ACTIONTY_GROUPACTI_ACTIONTY] FOREIGN KEY([ActionTypeGroupID])
REFERENCES [dbo].[ActionTypeGroups] ([ActionTypeGroupID])
GO
ALTER TABLE [dbo].[ActionTypes] CHECK CONSTRAINT [FK_ACTIONTY_GROUPACTI_ACTIONTY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESSE_ADDRESSCO_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_ADDRESSE_ADDRESSCO_COUNTRIE]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Clients]
GO
ALTER TABLE [dbo].[AddressProperties]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESSP_ADDRESSPR_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[AddressProperties] CHECK CONSTRAINT [FK_ADDRESSP_ADDRESSPR_PROPERTY]
GO
ALTER TABLE [dbo].[AddressProperties]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESSP_CLIENTCON_ADDRESSE] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[AddressProperties] CHECK CONSTRAINT [FK_ADDRESSP_CLIENTCON_ADDRESSE]
GO
ALTER TABLE [dbo].[AirtimeProviderProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_AIRTIMEP_AIRTIMEPR_AIRTIMEP] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[AirtimeProviderProperties] CHECK CONSTRAINT [FK_AIRTIMEP_AIRTIMEPR_AIRTIMEP]
GO
ALTER TABLE [dbo].[AirtimeProviderProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_AIRTIMEP_PROPAIRTI_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[AirtimeProviderProperties] CHECK CONSTRAINT [FK_AIRTIMEP_PROPAIRTI_PROPERTY]
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankAccounts_BillingEntities] FOREIGN KEY([BillingEntityId])
REFERENCES [dbo].[BillingEntities] ([BillingEntityID])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_BankAccounts_BillingEntities]
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankAccounts_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_BankAccounts_Currencies]
GO
ALTER TABLE [dbo].[BillingEntities]  WITH NOCHECK ADD  CONSTRAINT [FK_BILLINGE_SUPPORTBI_TECHNICA] FOREIGN KEY([TechnicalSupportID])
REFERENCES [dbo].[TechnicalSupports] ([TechnicalSupportID])
GO
ALTER TABLE [dbo].[BillingEntities] CHECK CONSTRAINT [FK_BILLINGE_SUPPORTBI_TECHNICA]
GO
ALTER TABLE [dbo].[BillingEntityProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_BillingEntityProperties_BillingEntities] FOREIGN KEY([BillingEntityId])
REFERENCES [dbo].[BillingEntities] ([BillingEntityID])
GO
ALTER TABLE [dbo].[BillingEntityProperties] CHECK CONSTRAINT [FK_BillingEntityProperties_BillingEntities]
GO
ALTER TABLE [dbo].[BillingEntityProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_BillingEntityProperties_PropertyTypes] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[BillingEntityProperties] CHECK CONSTRAINT [FK_BillingEntityProperties_PropertyTypes]
GO
ALTER TABLE [dbo].[BillingRuns]  WITH CHECK ADD  CONSTRAINT [FK_BILLINGR_CLIENTRUN_INVOICER] FOREIGN KEY([InvoiceRuleID])
REFERENCES [dbo].[InvoiceRules] ([InvoiceRuleID])
GO
ALTER TABLE [dbo].[BillingRuns] CHECK CONSTRAINT [FK_BILLINGR_CLIENTRUN_INVOICER]
GO
ALTER TABLE [dbo].[BillingSchemeProperties]  WITH CHECK ADD  CONSTRAINT [FK_BILLINGS_BILLINGSC_BILLINGS] FOREIGN KEY([BillingSchemeID])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[BillingSchemeProperties] CHECK CONSTRAINT [FK_BILLINGS_BILLINGSC_BILLINGS]
GO
ALTER TABLE [dbo].[BillingSchemeProperties]  WITH CHECK ADD  CONSTRAINT [FK_BILLINGS_PROPBILLI_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[BillingSchemeProperties] CHECK CONSTRAINT [FK_BILLINGS_PROPBILLI_PROPERTY]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_BillingSchemes] FOREIGN KEY([ParentId])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_BillingSchemes]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_ClientID] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_ClientID]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_Currencies]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_EquipmentTypes] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_EquipmentTypes]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_ProviderPackageRatePlanID] FOREIGN KEY([ProviderPackageRatePlanID])
REFERENCES [dbo].[ProviderPackageRatePlans] ([ProviderPackageRatePlanID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_ProviderPackageRatePlanID]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_QuotationID] FOREIGN KEY([QuotationID])
REFERENCES [quote].[Quotations] ([QuotationID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_QuotationID]
GO
ALTER TABLE [dbo].[BillingSchemes]  WITH CHECK ADD  CONSTRAINT [FK_BillingSchemes_SchemeTypes] FOREIGN KEY([SchemeTypeID])
REFERENCES [dbo].[SchemeTypes] ([SchemeTypeID])
GO
ALTER TABLE [dbo].[BillingSchemes] CHECK CONSTRAINT [FK_BillingSchemes_SchemeTypes]
GO
ALTER TABLE [dbo].[BPCodes]  WITH CHECK ADD  CONSTRAINT [FK_BPCODES_BPCODEDIV_DIVISION] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[BPCodes] CHECK CONSTRAINT [FK_BPCODES_BPCODEDIV_DIVISION]
GO
ALTER TABLE [dbo].[BPCodes]  WITH NOCHECK ADD  CONSTRAINT [FK_BPCODES_BPCODEREG_REGIONS] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[BPCodes] CHECK CONSTRAINT [FK_BPCODES_BPCODEREG_REGIONS]
GO
ALTER TABLE [dbo].[BPCodes]  WITH CHECK ADD  CONSTRAINT [FK_BPCODES_CLIENTBPCOD_BPCODES] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[BPCodes] CHECK CONSTRAINT [FK_BPCODES_CLIENTBPCOD_BPCODES]
GO
ALTER TABLE [dbo].[BPCodes]  WITH CHECK ADD  CONSTRAINT [FK_BPCodes_SalesPersons] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[BPCodes] CHECK CONSTRAINT [FK_BPCodes_SalesPersons]
GO
ALTER TABLE [dbo].[BranchOffices]  WITH CHECK ADD  CONSTRAINT [FK_BRANCHOF_BRANCHOFF_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[BranchOffices] CHECK CONSTRAINT [FK_BRANCHOF_BRANCHOFF_COUNTRIE]
GO
ALTER TABLE [dbo].[CalculationRules]  WITH NOCHECK ADD  CONSTRAINT [FK_CALCULAT_AIRTIMEPR_AIRTIMEP] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CalculationRules] CHECK CONSTRAINT [FK_CALCULAT_AIRTIMEPR_AIRTIMEP]
GO
ALTER TABLE [dbo].[CalledToGrouping]  WITH CHECK ADD  CONSTRAINT [FK_CalledToGrouping_AirtimeProviders] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CalledToGrouping] CHECK CONSTRAINT [FK_CalledToGrouping_AirtimeProviders]
GO
ALTER TABLE [dbo].[CalledToGrouping]  WITH CHECK ADD  CONSTRAINT [FK_CalledToGrouping_CallTypes] FOREIGN KEY([FromCallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CalledToGrouping] CHECK CONSTRAINT [FK_CalledToGrouping_CallTypes]
GO
ALTER TABLE [dbo].[CalledToGrouping]  WITH CHECK ADD  CONSTRAINT [FK_CalledToGrouping_CallTypes1] FOREIGN KEY([ToCallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CalledToGrouping] CHECK CONSTRAINT [FK_CalledToGrouping_CallTypes1]
GO
ALTER TABLE [dbo].[CalledToMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_CalledToMapping_AirtimeProviders] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CalledToMapping] CHECK CONSTRAINT [FK_CalledToMapping_AirtimeProviders]
GO
ALTER TABLE [dbo].[CalledToMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_CalledToMapping_CallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CalledToMapping] CHECK CONSTRAINT [FK_CalledToMapping_CallTypes]
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_CallFromCallTypeCallToMapping_AirtimeProviders] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping] CHECK CONSTRAINT [FK_CallFromCallTypeCallToMapping_AirtimeProviders]
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_CallFromCallTypeCallToMapping_CallFromCallTypes] FOREIGN KEY([CallFromCallTypeID])
REFERENCES [dbo].[CallFromCallTypes] ([CallFromCallTypeID])
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping] CHECK CONSTRAINT [FK_CallFromCallTypeCallToMapping_CallFromCallTypes]
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_CallFromCallTypeCallToMapping_CallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CallFromCallTypeCallToMapping] CHECK CONSTRAINT [FK_CallFromCallTypeCallToMapping_CallTypes]
GO
ALTER TABLE [dbo].[CallFromCallTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_CALLFROM_EQUIPMENT_EQUIPMEN] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CallFromCallTypes] CHECK CONSTRAINT [FK_CALLFROM_EQUIPMENT_EQUIPMEN]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_CDRJOB_IMPORTJO] FOREIGN KEY([ImportJobID])
REFERENCES [dbo].[ImportJobs] ([ImportJobID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_CDRJOB_IMPORTJO]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_CDRTYPES_CDRTYPES] FOREIGN KEY([CdrTypeID])
REFERENCES [dbo].[CdrTypes] ([CdrTypeID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_CDRTYPES_CDRTYPES]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_ChargeUnits] FOREIGN KEY([ChargeUnitId])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_ChargeUnits]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_DESTINATI_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_DESTINATI_COUNTRIE]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_DESTINATI_COUNTRYN] FOREIGN KEY([CountryNetworkID])
REFERENCES [dbo].[CountryNetworks] ([CountryNetworkID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_DESTINATI_COUNTRYN]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_DUPLICATE_CDR] FOREIGN KEY([ParentID])
REFERENCES [dbo].[CDR] ([CdrID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_DUPLICATE_CDR]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_CDR_PROVIDERC_AIRTIMEP] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_CDR_PROVIDERC_AIRTIMEP]
GO
ALTER TABLE [dbo].[CDR]  WITH CHECK ADD  CONSTRAINT [FK_Countries_FleetOneCountryId] FOREIGN KEY([FleetOneCountryId])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[CDR] CHECK CONSTRAINT [FK_Countries_FleetOneCountryId]
GO
ALTER TABLE [dbo].[CdrCharges]  WITH CHECK ADD  CONSTRAINT [FK_CDRCHARG_CHARGEINV_INVOICEI] FOREIGN KEY([InvoiceItemID])
REFERENCES [dbo].[InvoiceItems] ([InvoiceItemID])
GO
ALTER TABLE [dbo].[CdrCharges] CHECK CONSTRAINT [FK_CDRCHARG_CHARGEINV_INVOICEI]
GO
ALTER TABLE [dbo].[CdrCharges]  WITH CHECK ADD  CONSTRAINT [FK_CDRCHARG_CLIENTEQU_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CdrCharges] CHECK CONSTRAINT [FK_CDRCHARG_CLIENTEQU_CLIENTEQ]
GO
ALTER TABLE [dbo].[CdrCharges]  WITH CHECK ADD  CONSTRAINT [FK_CdrCharges_CDR] FOREIGN KEY([CdrID])
REFERENCES [dbo].[CDR] ([CdrID])
GO
ALTER TABLE [dbo].[CdrCharges] CHECK CONSTRAINT [FK_CdrCharges_CDR]
GO
ALTER TABLE [dbo].[CdrCharges]  WITH CHECK ADD  CONSTRAINT [FK_CdrCharges_SchemeTariffs] FOREIGN KEY([SchemeTariffID])
REFERENCES [dbo].[SchemeTariffs] ([SchemeTariffID])
GO
ALTER TABLE [dbo].[CdrCharges] CHECK CONSTRAINT [FK_CdrCharges_SchemeTariffs]
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ClientEquipmentId])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ClientEquipmentId])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Deliveries] ([DeliveryId])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Deliveries] ([DeliveryId])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ParentClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveries]  WITH CHECK ADD FOREIGN KEY([ParentClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ClientEquipmentId])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ClientEquipmentId])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ParentClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrDeliveriesIBIS]  WITH CHECK ADD FOREIGN KEY([ParentClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CdrTypeMappingRules]  WITH CHECK ADD  CONSTRAINT [FK_CdrRuleID] FOREIGN KEY([CdrRuleID])
REFERENCES [dbo].[CdrRules] ([CdrRuleID])
GO
ALTER TABLE [dbo].[CdrTypeMappingRules] CHECK CONSTRAINT [FK_CdrRuleID]
GO
ALTER TABLE [dbo].[CdrTypeMappingRules]  WITH CHECK ADD  CONSTRAINT [FK_CdrTypeMappingID] FOREIGN KEY([CdrTypeMappingID])
REFERENCES [dbo].[CdrTypeMappings] ([CdrTypeMappingID])
GO
ALTER TABLE [dbo].[CdrTypeMappingRules] CHECK CONSTRAINT [FK_CdrTypeMappingID]
GO
ALTER TABLE [dbo].[CdrTypeMappings]  WITH CHECK ADD  CONSTRAINT [FK_AirtimeProviderID] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[CdrTypeMappings] CHECK CONSTRAINT [FK_AirtimeProviderID]
GO
ALTER TABLE [dbo].[CdrTypeMappings]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentTypeID] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[CdrTypeMappings] CHECK CONSTRAINT [FK_EquipmentTypeID]
GO
ALTER TABLE [dbo].[CdrTypes]  WITH CHECK ADD  CONSTRAINT [FK_CDRTYPES_CALLFROMC_CALLFROM] FOREIGN KEY([CallFromCallTypeID])
REFERENCES [dbo].[CallFromCallTypes] ([CallFromCallTypeID])
GO
ALTER TABLE [dbo].[CdrTypes] CHECK CONSTRAINT [FK_CDRTYPES_CALLFROMC_CALLFROM]
GO
ALTER TABLE [dbo].[CdrTypes]  WITH CHECK ADD  CONSTRAINT [FK_CdrTypes_CallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CdrTypes] CHECK CONSTRAINT [FK_CdrTypes_CallTypes]
GO
ALTER TABLE [dbo].[CDRWatch]  WITH CHECK ADD  CONSTRAINT [FK_CDRWATCH_CLIENTEQCDRWATCH_CDRWATCH] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[CDRWatch] CHECK CONSTRAINT [FK_CDRWATCH_CLIENTEQCDRWATCH_CDRWATCH]
GO
ALTER TABLE [dbo].[CDRWatch]  WITH CHECK ADD  CONSTRAINT [FK_CDRWATCH_SCHEMETYPCDRWATCH_SCHEMETYP] FOREIGN KEY([SchemeTypeID])
REFERENCES [dbo].[SchemeTypes] ([SchemeTypeID])
GO
ALTER TABLE [dbo].[CDRWatch] CHECK CONSTRAINT [FK_CDRWATCH_SCHEMETYPCDRWATCH_SCHEMETYP]
GO
ALTER TABLE [dbo].[ClientAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTAD_ADDRESSECLIENTAD_ADDRESSE] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[ClientAddresses] CHECK CONSTRAINT [FK_CLIENTAD_ADDRESSECLIENTAD_ADDRESSE]
GO
ALTER TABLE [dbo].[ClientAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTAD_ADDRESSTCLIENTAD_ADDRESST] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])
GO
ALTER TABLE [dbo].[ClientAddresses] CHECK CONSTRAINT [FK_CLIENTAD_ADDRESSTCLIENTAD_ADDRESST]
GO
ALTER TABLE [dbo].[ClientAddresses]  WITH CHECK ADD  CONSTRAINT [FK_ClientAddresses_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[ClientAddresses] CHECK CONSTRAINT [FK_ClientAddresses_Clients]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_ACTIONEQ_CLIENTEQ] FOREIGN KEY([MovedClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_ACTIONEQ_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CURRENTBS_BILLINGS] FOREIGN KEY([CurrentBillingSchemeID])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_CURRENTBS_BILLINGS]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_MOVEDCLIE_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_MOVEDCLIE_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_PREVBS_BILLINGS] FOREIGN KEY([PreviousBillingSchemeID])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_PREVBS_BILLINGS]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_PROVIDERM_PROVIDER] FOREIGN KEY([ProviderMessageID])
REFERENCES [dbo].[ProviderMessages] ([ProviderMessageID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_PROVIDERM_PROVIDER]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_TYPEEQACT_ACTIONTY] FOREIGN KEY([ActionTypeID])
REFERENCES [dbo].[ActionTypes] ([ActionTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_CLIENTEQ_TYPEEQACT_ACTIONTY]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipmentActions_SchemeTariffs] FOREIGN KEY([SchemeTariffID])
REFERENCES [dbo].[SchemeTariffs] ([SchemeTariffID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_ClientEquipmentActions_SchemeTariffs]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_FromClient] FOREIGN KEY([FromClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_FromClient]
GO
ALTER TABLE [dbo].[ClientEquipmentActions]  WITH CHECK ADD  CONSTRAINT [FK_ToClientID] FOREIGN KEY([ToClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[ClientEquipmentActions] CHECK CONSTRAINT [FK_ToClientID]
GO
ALTER TABLE [dbo].[ClientEquipmentCharges]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_EQCHARGES_INVOICEI] FOREIGN KEY([InvoiceItemID])
REFERENCES [dbo].[InvoiceItems] ([InvoiceItemID])
GO
ALTER TABLE [dbo].[ClientEquipmentCharges] CHECK CONSTRAINT [FK_CLIENTEQ_EQCHARGES_INVOICEI]
GO
ALTER TABLE [dbo].[ClientEquipmentCharges]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_EQUIPEMEN_SCHEMETA] FOREIGN KEY([SchemeTariffID])
REFERENCES [dbo].[SchemeTariffs] ([SchemeTariffID])
GO
ALTER TABLE [dbo].[ClientEquipmentCharges] CHECK CONSTRAINT [FK_CLIENTEQ_EQUIPEMEN_SCHEMETA]
GO
ALTER TABLE [dbo].[ClientEquipmentCharges]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_EQUIPMENT_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentCharges] CHECK CONSTRAINT [FK_CLIENTEQ_EQUIPMENT_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipmentCharges]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_SchemeTypes] FOREIGN KEY([SchemeTypeID])
REFERENCES [dbo].[SchemeTypes] ([SchemeTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentCharges] CHECK CONSTRAINT [FK_CLIENTEQ_SchemeTypes]
GO
ALTER TABLE [dbo].[ClientEquipmentCharges]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQUIPMENTACTION] FOREIGN KEY([ClientEquipmentActionID])
REFERENCES [dbo].[ClientEquipmentActions] ([ClientEquipmentActionID])
GO
ALTER TABLE [dbo].[ClientEquipmentCharges] CHECK CONSTRAINT [FK_CLIENTEQUIPMENTACTION]
GO
ALTER TABLE [dbo].[ClientEquipmentProperties]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CLIENTEQU_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentProperties] CHECK CONSTRAINT [FK_CLIENTEQ_CLIENTEQU_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipmentProperties]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_IDENTIFIE_IDENTIFI] FOREIGN KEY([IdentifierTypeID])
REFERENCES [dbo].[IdentifierTypes] ([IdentifierTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentProperties] CHECK CONSTRAINT [FK_CLIENTEQ_IDENTIFIE_IDENTIFI]
GO
ALTER TABLE [dbo].[ClientEquipmentProperties]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_PROPCLIEN_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentProperties] CHECK CONSTRAINT [FK_CLIENTEQ_PROPCLIEN_PROPERTY]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CLIENSTATUS_SYSTEMSTATUS] FOREIGN KEY([Status])
REFERENCES [dbo].[SystemStatus] ([SystemStatusId])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_CLIENTEQ_CLIENSTATUS_SYSTEMSTATUS]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CLIENSUPSTATUS_SYSTEMSTATUS] FOREIGN KEY([SupStatus])
REFERENCES [dbo].[SystemStatus] ([SystemStatusId])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_CLIENTEQ_CLIENSUPSTATUS_SYSTEMSTATUS]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_PARENTEQU_CLIENTEQ] FOREIGN KEY([ParentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_CLIENTEQ_PARENTEQU_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipments_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_ClientEquipments_Clients]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipments_EquipmentTypes] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_ClientEquipments_EquipmentTypes]
GO
ALTER TABLE [dbo].[ClientEquipments]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipments_IdentifierTypes] FOREIGN KEY([IdentifierTypeID])
REFERENCES [dbo].[IdentifierTypes] ([IdentifierTypeID])
GO
ALTER TABLE [dbo].[ClientEquipments] CHECK CONSTRAINT [FK_ClientEquipments_IdentifierTypes]
GO
ALTER TABLE [dbo].[ClientEquipmentSchemeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipmentSchemeProperties_ClientEquipmentSchemes] FOREIGN KEY([ClientEquipmentSchemeID])
REFERENCES [dbo].[ClientEquipmentSchemes] ([ClientEquipmentSchemeID])
GO
ALTER TABLE [dbo].[ClientEquipmentSchemeProperties] CHECK CONSTRAINT [FK_ClientEquipmentSchemeProperties_ClientEquipmentSchemes]
GO
ALTER TABLE [dbo].[ClientEquipmentSchemeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipmentSchemeProperties_PropertyTypes] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentSchemeProperties] CHECK CONSTRAINT [FK_ClientEquipmentSchemeProperties_PropertyTypes]
GO
ALTER TABLE [dbo].[ClientEquipmentSchemes]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CESCHEME_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentSchemes] CHECK CONSTRAINT [FK_CLIENTEQ_CESCHEME_CLIENTEQ]
GO
ALTER TABLE [dbo].[ClientEquipmentSchemes]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEQ_CLIENTEQU_BILLINGS] FOREIGN KEY([BillingSchemeID])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[ClientEquipmentSchemes] CHECK CONSTRAINT [FK_CLIENTEQ_CLIENTEQU_BILLINGS]
GO
ALTER TABLE [dbo].[ClientEquipmentSepiBucketProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipmentSepiBucketProperties_ClientEquipments] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[ClientEquipmentSepiBucketProperties] CHECK CONSTRAINT [FK_ClientEquipmentSepiBucketProperties_ClientEquipments]
GO
ALTER TABLE [dbo].[ClientEquipmentSepiBucketProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientEquipmentSepiBucketProperties_PropertyTypes] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ClientEquipmentSepiBucketProperties] CHECK CONSTRAINT [FK_ClientEquipmentSepiBucketProperties_PropertyTypes]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTPR_CLIENTPRO_CLIENTS] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_CLIENTPR_CLIENTPRO_CLIENTS]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTPR_PROPCLIEN_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_CLIENTPR_PROPCLIEN_PROPERTY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_CLIENTPAY_PAYMENTT] FOREIGN KEY([PaymentTermID])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_CLIENTPAY_PAYMENTT]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_CLIENTSDEALERS_DEALERS] FOREIGN KEY([DealerID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_CLIENTSDEALERS_DEALERS]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_CLIENTTYP_CLIENTTY] FOREIGN KEY([ClientTypeID])
REFERENCES [dbo].[ClientTypes] ([ClientTypeID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_CLIENTTYP_CLIENTTY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_PARENTCLI_CLIENTS] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_PARENTCLI_CLIENTS]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_PurchaseOrders] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_PurchaseOrders]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_SALESCLIEAM_SALESPER] FOREIGN KEY([AccountManagerID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_SALESCLIEAM_SALESPER]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_SALESCLIESA_SALESPER] FOREIGN KEY([SaleAdministratorID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_SALESCLIESA_SALESPER]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_SECONDTIE_CLIENTGR] FOREIGN KEY([ClientGroupID])
REFERENCES [dbo].[ClientGroups] ([ClientGroupID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_CLIENTS_SECONDTIE_CLIENTGR]
GO
ALTER TABLE [dbo].[CommissionTariffs]  WITH CHECK ADD  CONSTRAINT [FK_CommissionTariffs_CommissionSchemeId] FOREIGN KEY([CommissionSchemeId])
REFERENCES [dbo].[CommissionSchemes] ([CommissionSchemeId])
GO
ALTER TABLE [dbo].[CommissionTariffs] CHECK CONSTRAINT [FK_CommissionTariffs_CommissionSchemeId]
GO
ALTER TABLE [dbo].[CommissionTariffs]  WITH CHECK ADD  CONSTRAINT [FK_CommissionTariffs_TariffCategoryId] FOREIGN KEY([TariffCategoryId])
REFERENCES [dbo].[TariffCategories] ([TariffCategoryID])
GO
ALTER TABLE [dbo].[CommissionTariffs] CHECK CONSTRAINT [FK_CommissionTariffs_TariffCategoryId]
GO
ALTER TABLE [dbo].[CommissionTariffs]  WITH CHECK ADD  CONSTRAINT [FK_CommissionTariffs_TariffTypeId] FOREIGN KEY([TariffTypeId])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [dbo].[CommissionTariffs] CHECK CONSTRAINT [FK_CommissionTariffs_TariffTypeId]
GO
ALTER TABLE [dbo].[CountryNetworks]  WITH NOCHECK ADD  CONSTRAINT [FK_COUNTRYN_NETWORKCO_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[CountryNetworks] CHECK CONSTRAINT [FK_COUNTRYN_NETWORKCO_COUNTRIE]
GO
ALTER TABLE [dbo].[CountryPattern]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRYP_COUNTRYPA_ADDRESSP] FOREIGN KEY([AddressPatternId])
REFERENCES [dbo].[AddressPatterns] ([AddressPatternId])
GO
ALTER TABLE [dbo].[CountryPattern] CHECK CONSTRAINT [FK_COUNTRYP_COUNTRYPA_ADDRESSP]
GO
ALTER TABLE [dbo].[CountryPattern]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRYP_COUNTRYPA_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[CountryPattern] CHECK CONSTRAINT [FK_COUNTRYP_COUNTRYPA_COUNTRIE]
GO
ALTER TABLE [dbo].[CreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CreditCards_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CreditCards] CHECK CONSTRAINT [FK_CreditCards_Clients]
GO
ALTER TABLE [dbo].[CreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CreditCards_CreditCardTypes] FOREIGN KEY([CreditCardTypeID])
REFERENCES [dbo].[CreditCardTypes] ([CreditCardTypeID])
GO
ALTER TABLE [dbo].[CreditCards] CHECK CONSTRAINT [FK_CreditCards_CreditCardTypes]
GO
ALTER TABLE [dbo].[DealerCommissions]  WITH CHECK ADD  CONSTRAINT [FK_DealerCommissions_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[DealerCommissions] CHECK CONSTRAINT [FK_DealerCommissions_ClientId]
GO
ALTER TABLE [dbo].[DealerCommissions]  WITH CHECK ADD  CONSTRAINT [FK_DealerCommissions_CommissionSchemeId] FOREIGN KEY([CommissionSchemeId])
REFERENCES [dbo].[CommissionSchemes] ([CommissionSchemeId])
GO
ALTER TABLE [dbo].[DealerCommissions] CHECK CONSTRAINT [FK_DealerCommissions_CommissionSchemeId]
GO
ALTER TABLE [dbo].[DealerCommissions]  WITH CHECK ADD  CONSTRAINT [FK_DealerCommissions_DealerId] FOREIGN KEY([DealerId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[DealerCommissions] CHECK CONSTRAINT [FK_DealerCommissions_DealerId]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([FtpAccountId])
REFERENCES [dbo].[FtpAccounts] ([FtpAccountId])
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD FOREIGN KEY([FtpAccountId])
REFERENCES [dbo].[FtpAccounts] ([FtpAccountId])
GO
ALTER TABLE [dbo].[Delivieries]  WITH CHECK ADD  CONSTRAINT [FK_DELIVIER_DESTDELIV_DELIVERY] FOREIGN KEY([DeliveryDestinationID])
REFERENCES [dbo].[DeliveryDestinations] ([DeliveryDestinationID])
GO
ALTER TABLE [dbo].[Delivieries] CHECK CONSTRAINT [FK_DELIVIER_DESTDELIV_DELIVERY]
GO
ALTER TABLE [dbo].[EquipmentChargeUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMENCHAR_AIRTIMEQUIPMEN_AIRTIMEPRO] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[EquipmentChargeUnits] CHECK CONSTRAINT [FK_EQUIPMENCHAR_AIRTIMEQUIPMEN_AIRTIMEPRO]
GO
ALTER TABLE [dbo].[EquipmentChargeUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNIT] FOREIGN KEY([DurationChargeUnitID])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[EquipmentChargeUnits] CHECK CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNIT]
GO
ALTER TABLE [dbo].[EquipmentChargeUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNITMES] FOREIGN KEY([MessageChargeUnitID])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[EquipmentChargeUnits] CHECK CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNITMES]
GO
ALTER TABLE [dbo].[EquipmentChargeUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNITVOL] FOREIGN KEY([VolumeChargeUnitID])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[EquipmentChargeUnits] CHECK CONSTRAINT [FK_EQUIPMENCHAR_CHARGEEQUIPMEN_CHRAGEUNITVOL]
GO
ALTER TABLE [dbo].[EquipmentChargeUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMENCHAR_EQUIPEQUIPMEN_EQUIPMENT] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EquipmentChargeUnits] CHECK CONSTRAINT [FK_EQUIPMENCHAR_EQUIPEQUIPMEN_EQUIPMENT]
GO
ALTER TABLE [dbo].[EquipmentProviderPackages]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPROPA_EQUIPEQUIP_EQUIPMEN] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EquipmentProviderPackages] CHECK CONSTRAINT [FK_EQUIPROPA_EQUIPEQUIP_EQUIPMEN]
GO
ALTER TABLE [dbo].[EquipmentProviderPackages]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPROPA_EQUIPPROP_PROVIDERPAC] FOREIGN KEY([ProviderPackageID])
REFERENCES [dbo].[ProviderPackages] ([ProviderPackageID])
GO
ALTER TABLE [dbo].[EquipmentProviderPackages] CHECK CONSTRAINT [FK_EQUIPROPA_EQUIPPROP_PROVIDERPAC]
GO
ALTER TABLE [dbo].[EquipmentStateTransitions]  WITH NOCHECK ADD  CONSTRAINT [EquipmentStatus] FOREIGN KEY([SystemStatusId])
REFERENCES [dbo].[SystemStatus] ([SystemStatusId])
GO
ALTER TABLE [dbo].[EquipmentStateTransitions] CHECK CONSTRAINT [EquipmentStatus]
GO
ALTER TABLE [dbo].[EquipmentStateTransitions]  WITH NOCHECK ADD  CONSTRAINT [NextEquipmentStatus] FOREIGN KEY([NextSystemStatusId])
REFERENCES [dbo].[SystemStatus] ([SystemStatusId])
GO
ALTER TABLE [dbo].[EquipmentStateTransitions] CHECK CONSTRAINT [NextEquipmentStatus]
GO
ALTER TABLE [dbo].[EquipmentTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentTypeMapping_AirtimeProviders] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[EquipmentTypeMapping] CHECK CONSTRAINT [FK_EquipmentTypeMapping_AirtimeProviders]
GO
ALTER TABLE [dbo].[EquipmentTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentTypeMapping_EquipmentTypes] FOREIGN KEY([FromEquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EquipmentTypeMapping] CHECK CONSTRAINT [FK_EquipmentTypeMapping_EquipmentTypes]
GO
ALTER TABLE [dbo].[EquipmentTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentTypeMapping_EquipmentTypes1] FOREIGN KEY([ToEquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EquipmentTypeMapping] CHECK CONSTRAINT [FK_EquipmentTypeMapping_EquipmentTypes1]
GO
ALTER TABLE [dbo].[EquipmentTypeProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_EQTYPE_PROP_STOCKTYPE_PROP] FOREIGN KEY([StockTypePropertyID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[EquipmentTypeProperties] CHECK CONSTRAINT [FK_EQTYPE_PROP_STOCKTYPE_PROP]
GO
ALTER TABLE [dbo].[EquipmentTypeProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMEN_EQTYPEPRO_EQUIPMEN] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EquipmentTypeProperties] CHECK CONSTRAINT [FK_EQUIPMEN_EQTYPEPRO_EQUIPMEN]
GO
ALTER TABLE [dbo].[EquipmentTypeProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMEN_PROPEQUIP_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[EquipmentTypeProperties] CHECK CONSTRAINT [FK_EQUIPMEN_PROPEQUIP_PROPERTY]
GO
ALTER TABLE [dbo].[EquipmentTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMEN_EQUIPMENT_PROVIDER] FOREIGN KEY([ExternalProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[EquipmentTypes] CHECK CONSTRAINT [FK_EQUIPMEN_EQUIPMENT_PROVIDER]
GO
ALTER TABLE [dbo].[EquipmentTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_EQUIPMEN_GROUPEQUI_EQUIPMEN] FOREIGN KEY([EquipmentTypeGroupID])
REFERENCES [dbo].[EquipmentTypeGroups] ([EquipmentTypeGroupID])
GO
ALTER TABLE [dbo].[EquipmentTypes] CHECK CONSTRAINT [FK_EQUIPMEN_GROUPEQUI_EQUIPMEN]
GO
ALTER TABLE [dbo].[ExchangeRates]  WITH CHECK ADD  CONSTRAINT [FK_EXCHANGE_EXCHFROM_CURRENCI] FOREIGN KEY([FromCurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[ExchangeRates] CHECK CONSTRAINT [FK_EXCHANGE_EXCHFROM_CURRENCI]
GO
ALTER TABLE [dbo].[ExchangeRates]  WITH CHECK ADD  CONSTRAINT [FK_EXCHANGE_EXCHTO_CURRENCI] FOREIGN KEY([ToCurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[ExchangeRates] CHECK CONSTRAINT [FK_EXCHANGE_EXCHTO_CURRENCI]
GO
ALTER TABLE [dbo].[FeeProfileProperties]  WITH CHECK ADD  CONSTRAINT [FK_FeeProfileProperties_FeeProfiles] FOREIGN KEY([FeeProfileID])
REFERENCES [dbo].[FeeProfiles] ([FeeProfileID])
GO
ALTER TABLE [dbo].[FeeProfileProperties] CHECK CONSTRAINT [FK_FeeProfileProperties_FeeProfiles]
GO
ALTER TABLE [dbo].[FeeProfileProperties]  WITH CHECK ADD  CONSTRAINT [FK_FeeProfileProperties_PropertyTypes] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[FeeProfileProperties] CHECK CONSTRAINT [FK_FeeProfileProperties_PropertyTypes]
GO
ALTER TABLE [dbo].[FleetOneSession]  WITH CHECK ADD  CONSTRAINT [FK_CdrId] FOREIGN KEY([CdrId])
REFERENCES [dbo].[CDR] ([CdrID])
GO
ALTER TABLE [dbo].[FleetOneSession] CHECK CONSTRAINT [FK_CdrId]
GO
ALTER TABLE [dbo].[FtpAccounts]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[GenericTokenData]  WITH CHECK ADD  CONSTRAINT [FK_GENERICT_CALLTYPET_CALLTYPE] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[GenericTokenData] CHECK CONSTRAINT [FK_GENERICT_CALLTYPET_CALLTYPE]
GO
ALTER TABLE [dbo].[GenericTokenData]  WITH CHECK ADD  CONSTRAINT [FK_GENERICT_DATATOKEN_GENERICT] FOREIGN KEY([GenericTokenID])
REFERENCES [dbo].[GenericTokens] ([GenericTokenID])
GO
ALTER TABLE [dbo].[GenericTokenData] CHECK CONSTRAINT [FK_GENERICT_DATATOKEN_GENERICT]
GO
ALTER TABLE [dbo].[GeographicRegions]  WITH NOCHECK ADD  CONSTRAINT [FK_GEOGRAPH_AIRTIMEPGEOGRAPH_AIRTIMEP] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[GeographicRegions] CHECK CONSTRAINT [FK_GEOGRAPH_AIRTIMEPGEOGRAPH_AIRTIMEP]
GO
ALTER TABLE [dbo].[HorizonCallTypes]  WITH CHECK ADD FOREIGN KEY([CountryNetworkID])
REFERENCES [dbo].[CountryNetworks] ([CountryNetworkID])
GO
ALTER TABLE [dbo].[InitiatorPatternMapping]  WITH CHECK ADD  CONSTRAINT [FK_InitiatorPatternMapping_AirtimeProviders] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[InitiatorPatternMapping] CHECK CONSTRAINT [FK_InitiatorPatternMapping_AirtimeProviders]
GO
ALTER TABLE [dbo].[InitiatorPatternMapping]  WITH CHECK ADD  CONSTRAINT [FK_InitiatorPatternMapping_EquipmentTypes] FOREIGN KEY([ToEquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[InitiatorPatternMapping] CHECK CONSTRAINT [FK_InitiatorPatternMapping_EquipmentTypes]
GO
ALTER TABLE [dbo].[InvoiceDeliveries]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Deliveries] ([DeliveryId])
GO
ALTER TABLE [dbo].[InvoiceDeliveries]  WITH CHECK ADD FOREIGN KEY([InvoiceRuleId])
REFERENCES [dbo].[InvoiceRules] ([InvoiceRuleID])
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_INVITEMREF] FOREIGN KEY([RefInvoiceItemID])
REFERENCES [dbo].[InvoiceItems] ([InvoiceItemID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_INVITEMREF]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_INVITEMSEQUIPMENT] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_INVITEMSEQUIPMENT]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICEI_INVOICETA_TARIFFTY] FOREIGN KEY([TariffTypeID])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_INVOICEI_INVOICETA_TARIFFTY]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICEI_ITEMINVOI_INVOICES] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_INVOICEI_ITEMINVOI_INVOICES]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICEITEM_CATEINVOICEITEM_TARIFFCATE] FOREIGN KEY([TariffCategoryID])
REFERENCES [dbo].[TariffCategories] ([TariffCategoryID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_INVOICEITEM_CATEINVOICEITEM_TARIFFCATE]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItems_ClientEquipments] FOREIGN KEY([ClientEquipmentId])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_InvoiceItems_ClientEquipments]
GO
ALTER TABLE [dbo].[InvoiceRuleItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_CLIENT_RU_CLIENTS] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[InvoiceRuleItems] CHECK CONSTRAINT [FK_INVOICER_CLIENT_RU_CLIENTS]
GO
ALTER TABLE [dbo].[InvoiceRuleItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_EQTYPERUL_EQUIPMEN] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[InvoiceRuleItems] CHECK CONSTRAINT [FK_INVOICER_EQTYPERUL_EQUIPMEN]
GO
ALTER TABLE [dbo].[InvoiceRuleItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_EQUIPMENT_CLIENTEQ] FOREIGN KEY([ClientEquipmentID])
REFERENCES [dbo].[ClientEquipments] ([ClientEquipmentID])
GO
ALTER TABLE [dbo].[InvoiceRuleItems] CHECK CONSTRAINT [FK_INVOICER_EQUIPMENT_CLIENTEQ]
GO
ALTER TABLE [dbo].[InvoiceRuleItems]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_INVOICERU_INVOICER] FOREIGN KEY([InvoiceRuleID])
REFERENCES [dbo].[InvoiceRules] ([InvoiceRuleID])
GO
ALTER TABLE [dbo].[InvoiceRuleItems] CHECK CONSTRAINT [FK_INVOICER_INVOICERU_INVOICER]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_CLIENTRUL_CLIENTS] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_INVOICER_CLIENTRUL_CLIENTS]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_CYCLERULE_BILLINGC] FOREIGN KEY([BillingCycleID])
REFERENCES [dbo].[BillingCycles] ([BillingCycleID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_INVOICER_CYCLERULE_BILLINGC]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_ENTITYRUL_BILLINGE] FOREIGN KEY([BillingEntityID])
REFERENCES [dbo].[BillingEntities] ([BillingEntityID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_INVOICER_ENTITYRUL_BILLINGE]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_INVOICER_SCHEMRULE_SCHEMET] FOREIGN KEY([SchemeTypeID])
REFERENCES [dbo].[SchemeTypes] ([SchemeTypeID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_INVOICER_SCHEMRULE_SCHEMET]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_INVOICERULCREDIT] FOREIGN KEY([CreditCardID])
REFERENCES [dbo].[CreditCards] ([CreditCardID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_INVOICERULCREDIT]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_Addresses] FOREIGN KEY([InvoiceAddressId])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_Addresses]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_Addresses1] FOREIGN KEY([MailToAddressId])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_Addresses1]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_BPCodes] FOREIGN KEY([BPCodeID])
REFERENCES [dbo].[BPCodes] ([BPCodeID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_BPCodes]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_Currencies] FOREIGN KEY([AltCurrencyId])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_Currencies]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_PaymentTerms] FOREIGN KEY([PaymentTermId])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermID])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_PaymentTerms]
GO
ALTER TABLE [dbo].[InvoiceRules]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceRules_Taxes] FOREIGN KEY([TaxId])
REFERENCES [dbo].[Taxes] ([TaxId])
GO
ALTER TABLE [dbo].[InvoiceRules] CHECK CONSTRAINT [FK_InvoiceRules_Taxes]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_ALTERNAIDINVOICES_CURRENCIES] FOREIGN KEY([AlternateCurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_ALTERNAIDINVOICES_CURRENCIES]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_CURRENCYIDINVOICES_CURRENCIES] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_CURRENCYIDINVOICES_CURRENCIES]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_DIVIINVOICE_DIVISIONS] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_DIVIINVOICE_DIVISIONS]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_INVOICERU_BILLINGR] FOREIGN KEY([BillingRunID])
REFERENCES [dbo].[BillingRuns] ([BillingRunID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_INVOICERU_BILLINGR]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_REGIONINVOICE_REGIONS] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_REGIONINVOICE_REGIONS]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_RULEINVOI_INVOICER] FOREIGN KEY([InvoiceRuleID])
REFERENCES [dbo].[InvoiceRules] ([InvoiceRuleID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_RULEINVOI_INVOICER]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_SALEPINVOICE_SALESPERSONS] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_SALEPINVOICE_SALESPERSONS]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_INVOICES_TYPEINVOI_INVOICET] FOREIGN KEY([InvoiceTypeID])
REFERENCES [dbo].[InvoiceTypes] ([InvoiceTypeID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_INVOICES_TYPEINVOI_INVOICET]
GO
ALTER TABLE [dbo].[InvoiceSent]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceSent]  WITH CHECK ADD FOREIGN KEY([InvoiceDeliveryId])
REFERENCES [dbo].[InvoiceDeliveries] ([InvoiceDeliveryId])
GO
ALTER TABLE [dbo].[LoginPermissionAssigned]  WITH CHECK ADD  CONSTRAINT [FK_ASSIGNED_TYPEPERMI_PERMISSI] FOREIGN KEY([LoginPermissionTypeID])
REFERENCES [dbo].[LoginPermissionTypes] ([LoginPermissionTypeID])
GO
ALTER TABLE [dbo].[LoginPermissionAssigned] CHECK CONSTRAINT [FK_ASSIGNED_TYPEPERMI_PERMISSI]
GO
ALTER TABLE [dbo].[LoginPermissionAssigned]  WITH CHECK ADD  CONSTRAINT [FK_LoginPermissionAssigned_LoginRoles] FOREIGN KEY([LoginRoleID])
REFERENCES [dbo].[LoginRoles] ([LoginRoleID])
GO
ALTER TABLE [dbo].[LoginPermissionAssigned] CHECK CONSTRAINT [FK_LoginPermissionAssigned_LoginRoles]
GO
ALTER TABLE [dbo].[LoginRoleAssigned]  WITH CHECK ADD  CONSTRAINT [FK_LoginRoleAssigned_LoginRoles] FOREIGN KEY([LoginRoleID])
REFERENCES [dbo].[LoginRoles] ([LoginRoleID])
GO
ALTER TABLE [dbo].[LoginRoleAssigned] CHECK CONSTRAINT [FK_LoginRoleAssigned_LoginRoles]
GO
ALTER TABLE [dbo].[LoginRoleAssigned]  WITH CHECK ADD  CONSTRAINT [FK_LoginRoleAssigned_Logins] FOREIGN KEY([LoginID])
REFERENCES [dbo].[Logins] ([LoginID])
GO
ALTER TABLE [dbo].[LoginRoleAssigned] CHECK CONSTRAINT [FK_LoginRoleAssigned_Logins]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_LOGINS_USERLOGINS_USERS] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_LOGINS_USERLOGINS_USERS]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_products_providerPackageRatePlans] FOREIGN KEY([ProviderPackageRatePlanID])
REFERENCES [dbo].[ProviderPackageRatePlans] ([ProviderPackageRatePlanID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_products_providerPackageRatePlans]
GO
ALTER TABLE [dbo].[PropertyTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_PROPERTY_GROUPPROP_PROPERTY] FOREIGN KEY([PropertyTypeGroupID])
REFERENCES [dbo].[PropertyTypeGroups] ([PropertyTypeGroupID])
GO
ALTER TABLE [dbo].[PropertyTypes] CHECK CONSTRAINT [FK_PROPERTY_GROUPPROP_PROPERTY]
GO
ALTER TABLE [dbo].[ProviderLogins]  WITH CHECK ADD  CONSTRAINT [FK_PROVIDER_PROVIDERL_PROVIDER] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[ProviderLogins] CHECK CONSTRAINT [FK_PROVIDER_PROVIDERL_PROVIDER]
GO
ALTER TABLE [dbo].[ProviderMessageError]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Message_Error] FOREIGN KEY([ProviderMessageID])
REFERENCES [dbo].[ProviderMessages] ([ProviderMessageID])
GO
ALTER TABLE [dbo].[ProviderMessageError] CHECK CONSTRAINT [FK_Provider_Message_Error]
GO
ALTER TABLE [dbo].[ProviderMessageProperties]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Message_Property] FOREIGN KEY([ProviderMessageID])
REFERENCES [dbo].[ProviderMessages] ([ProviderMessageID])
GO
ALTER TABLE [dbo].[ProviderMessageProperties] CHECK CONSTRAINT [FK_Provider_Message_Property]
GO
ALTER TABLE [dbo].[ProviderMessageProperties]  WITH CHECK ADD  CONSTRAINT [FK_PROVIDER_MESSAGEPA_PROVIDER] FOREIGN KEY([ProviderPackagePropertyID])
REFERENCES [dbo].[ProviderPackageProperties] ([ProviderPackagePropertyID])
GO
ALTER TABLE [dbo].[ProviderMessageProperties] CHECK CONSTRAINT [FK_PROVIDER_MESSAGEPA_PROVIDER]
GO
ALTER TABLE [dbo].[ProviderMessages]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Package_ActionTypes] FOREIGN KEY([ProviderPackageActionTypeID])
REFERENCES [dbo].[ProviderPackageActionTypes] ([ProviderPackageActionTypeId])
GO
ALTER TABLE [dbo].[ProviderMessages] CHECK CONSTRAINT [FK_Provider_Package_ActionTypes]
GO
ALTER TABLE [dbo].[ProviderMessages]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Package_Message] FOREIGN KEY([ProviderPackageID])
REFERENCES [dbo].[ProviderPackages] ([ProviderPackageID])
GO
ALTER TABLE [dbo].[ProviderMessages] CHECK CONSTRAINT [FK_Provider_Package_Message]
GO
ALTER TABLE [dbo].[ProviderMessages]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Package_RatePlan] FOREIGN KEY([ProviderPackageRatePlanID])
REFERENCES [dbo].[ProviderPackageRatePlans] ([ProviderPackageRatePlanID])
GO
ALTER TABLE [dbo].[ProviderMessages] CHECK CONSTRAINT [FK_Provider_Package_RatePlan]
GO
ALTER TABLE [dbo].[ProviderPackageActionTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_PROVIDERPKG_ACTIONTY] FOREIGN KEY([ActionTypeId])
REFERENCES [dbo].[ActionTypes] ([ActionTypeID])
GO
ALTER TABLE [dbo].[ProviderPackageActionTypes] CHECK CONSTRAINT [FK_PROVIDERPKG_ACTIONTY]
GO
ALTER TABLE [dbo].[ProviderPackageActionTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_ProviderPkg_PackageId] FOREIGN KEY([ProviderPackageId])
REFERENCES [dbo].[ProviderPackages] ([ProviderPackageID])
GO
ALTER TABLE [dbo].[ProviderPackageActionTypes] CHECK CONSTRAINT [FK_ProviderPkg_PackageId]
GO
ALTER TABLE [dbo].[ProviderPackageProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_property_providerpackage] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[ProviderPackageProperties] CHECK CONSTRAINT [FK_property_providerpackage]
GO
ALTER TABLE [dbo].[ProviderPackageProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_PROVIDER_PROVIDERP_PROVIDER] FOREIGN KEY([ProviderPackageID])
REFERENCES [dbo].[ProviderPackages] ([ProviderPackageID])
GO
ALTER TABLE [dbo].[ProviderPackageProperties] CHECK CONSTRAINT [FK_PROVIDER_PROVIDERP_PROVIDER]
GO
ALTER TABLE [dbo].[ProviderPackageProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_PROVIDERPACKAGE_PPROP_EQTYPE_PROP] FOREIGN KEY([EquipmentTypePropertyID])
REFERENCES [dbo].[EquipmentTypeProperties] ([EquipmentTypePropertyID])
GO
ALTER TABLE [dbo].[ProviderPackageProperties] CHECK CONSTRAINT [FK_PROVIDERPACKAGE_PPROP_EQTYPE_PROP]
GO
ALTER TABLE [dbo].[ProviderPackageRatePlans]  WITH CHECK ADD  CONSTRAINT [FK__ProviderP__Provi__4C82C9D6] FOREIGN KEY([ProviderPackageID])
REFERENCES [dbo].[ProviderPackages] ([ProviderPackageID])
GO
ALTER TABLE [dbo].[ProviderPackageRatePlans] CHECK CONSTRAINT [FK__ProviderP__Provi__4C82C9D6]
GO
ALTER TABLE [dbo].[ProviderPackages]  WITH NOCHECK ADD  CONSTRAINT [FK_PROVIDER_PACKAGEPR_PROVIDER] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[ProviderPackages] CHECK CONSTRAINT [FK_PROVIDER_PACKAGEPR_PROVIDER]
GO
ALTER TABLE [dbo].[ProviderScheduledMaintenancePlans]  WITH CHECK ADD  CONSTRAINT [FK_PROVIDER_SCHEDULED_MAINT_PROVIDER] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[ProviderScheduledMaintenancePlans] CHECK CONSTRAINT [FK_PROVIDER_SCHEDULED_MAINT_PROVIDER]
GO
ALTER TABLE [dbo].[PurchaseOrderProperties]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderProperties_PurchaseOrders] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[PurchaseOrderProperties] CHECK CONSTRAINT [FK_PurchaseOrderProperties_PurchaseOrders]
GO
ALTER TABLE [dbo].[RegionCountries]  WITH NOCHECK ADD  CONSTRAINT [FK_REGIONCO_GEOREGION_GEOGRAPH] FOREIGN KEY([GeographicRegionID])
REFERENCES [dbo].[GeographicRegions] ([GeographicRegionID])
GO
ALTER TABLE [dbo].[RegionCountries] CHECK CONSTRAINT [FK_REGIONCO_GEOREGION_GEOGRAPH]
GO
ALTER TABLE [dbo].[RegionCountries]  WITH NOCHECK ADD  CONSTRAINT [FK_REGIONCO_REGCOUNTR_COUNTRIE] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[RegionCountries] CHECK CONSTRAINT [FK_REGIONCO_REGCOUNTR_COUNTRIE]
GO
ALTER TABLE [dbo].[RunningNumbers]  WITH CHECK ADD  CONSTRAINT [FK_RunningNumbers_NumberTemplates] FOREIGN KEY([NumberTemplateId])
REFERENCES [dbo].[NumberTemplates] ([NumberTemplateId])
GO
ALTER TABLE [dbo].[RunningNumbers] CHECK CONSTRAINT [FK_RunningNumbers_NumberTemplates]
GO
ALTER TABLE [dbo].[SalesPersons]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersons_SalesPersonTypes] FOREIGN KEY([SalesPersonTypeID])
REFERENCES [dbo].[SalesPersonTypes] ([SalesPersonTypeID])
GO
ALTER TABLE [dbo].[SalesPersons] CHECK CONSTRAINT [FK_SalesPersons_SalesPersonTypes]
GO
ALTER TABLE [dbo].[SalesPersons]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersons_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[SalesPersons] CHECK CONSTRAINT [FK_SalesPersons_Users]
GO
ALTER TABLE [dbo].[SaleSupports]  WITH CHECK ADD  CONSTRAINT [FK_SALESUPP_SUPPORTDI_DIVISION] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[SaleSupports] CHECK CONSTRAINT [FK_SALESUPP_SUPPORTDI_DIVISION]
GO
ALTER TABLE [dbo].[SaleSupports]  WITH CHECK ADD  CONSTRAINT [FK_SALESUPP_SUPPORTRE_REGIONS] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[SaleSupports] CHECK CONSTRAINT [FK_SALESUPP_SUPPORTRE_REGIONS]
GO
ALTER TABLE [dbo].[SchemeTariffs]  WITH CHECK ADD  CONSTRAINT [FK_SCHEMETA_GROUPTARI_TARIFFTY] FOREIGN KEY([TariffTypeID])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [dbo].[SchemeTariffs] CHECK CONSTRAINT [FK_SCHEMETA_GROUPTARI_TARIFFTY]
GO
ALTER TABLE [dbo].[SchemeTariffs]  WITH CHECK ADD  CONSTRAINT [FK_SCHEMETA_TARIFFBIL_BILLINGS] FOREIGN KEY([BillingSchemeID])
REFERENCES [dbo].[BillingSchemes] ([BillingSchemeID])
GO
ALTER TABLE [dbo].[SchemeTariffs] CHECK CONSTRAINT [FK_SCHEMETA_TARIFFBIL_BILLINGS]
GO
ALTER TABLE [dbo].[SepiPropertyTypeValueMappings]  WITH CHECK ADD FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[SepiPropertyTypeValueMappings]  WITH CHECK ADD FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[SepiPropertyTypeValueMappings]  WITH CHECK ADD FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[SepiPropertyTypeValueMappings]  WITH CHECK ADD FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[StockTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCKTYP_EQUIPMENTSTOCKTYP_EQUIPMENT] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[StockTypes] CHECK CONSTRAINT [FK_STOCKTYP_EQUIPMENTSTOCKTYP_EQUIPMENT]
GO
ALTER TABLE [dbo].[TariffLedgers]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFLE_LEDGERTAR_LEDGERS] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([LedgerID])
GO
ALTER TABLE [dbo].[TariffLedgers] CHECK CONSTRAINT [FK_TARIFFLE_LEDGERTAR_LEDGERS]
GO
ALTER TABLE [dbo].[TariffLedgers]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFLE_TARIFFTYP_TARIFFTY] FOREIGN KEY([TariffTypeID])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [dbo].[TariffLedgers] CHECK CONSTRAINT [FK_TARIFFLE_TARIFFTYP_TARIFFTY]
GO
ALTER TABLE [dbo].[TariffTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_PROPTARIF_PROPERTY] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[TariffTypeProperties] CHECK CONSTRAINT [FK_TARIFFTY_PROPTARIF_PROPERTY]
GO
ALTER TABLE [dbo].[TariffTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_TRARIFFPR_TARIFFTY] FOREIGN KEY([TariffTypeID])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [dbo].[TariffTypeProperties] CHECK CONSTRAINT [FK_TARIFFTY_TRARIFFPR_TARIFFTY]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_AIRTIMETA_AIRTIMEP] FOREIGN KEY([AirtimeProviderID])
REFERENCES [dbo].[AirtimeProviders] ([AirtimeProviderID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_AIRTIMETA_AIRTIMEP]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_CALCULATI_CALCULAT] FOREIGN KEY([CalculationRuleID])
REFERENCES [dbo].[CalculationRules] ([CalculationRuleID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_CALCULATI_CALCULAT]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_CALLFROMR_GEOGRAPH] FOREIGN KEY([CallFromRegionID])
REFERENCES [dbo].[GeographicRegions] ([GeographicRegionID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_CALLFROMR_GEOGRAPH]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_CALLTOREG_GEOGRAPH] FOREIGN KEY([CallToRegionID])
REFERENCES [dbo].[GeographicRegions] ([GeographicRegionID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_CALLTOREG_GEOGRAPH]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_CHARGEUNI_CHARGEUN] FOREIGN KEY([ChargeUnitID])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_CHARGEUNI_CHARGEUN]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_INCREMENT_CHARGEUN] FOREIGN KEY([IncrementUnitID])
REFERENCES [dbo].[ChargeUnits] ([ChargeUnitID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_INCREMENT_CHARGEUN]
GO
ALTER TABLE [dbo].[TariffTypes]  WITH CHECK ADD  CONSTRAINT [FK_TARIFFTY_TYPETARIF_TARIFFCA] FOREIGN KEY([TariffCategoryID])
REFERENCES [dbo].[TariffCategories] ([TariffCategoryID])
GO
ALTER TABLE [dbo].[TariffTypes] CHECK CONSTRAINT [FK_TARIFFTY_TYPETARIF_TARIFFCA]
GO
ALTER TABLE [dbo].[UserBranchOffices]  WITH CHECK ADD  CONSTRAINT [FK_USERBRAN_OFFICEUSE_USERS] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserBranchOffices] CHECK CONSTRAINT [FK_USERBRAN_OFFICEUSE_USERS]
GO
ALTER TABLE [dbo].[UserBranchOffices]  WITH CHECK ADD  CONSTRAINT [FK_USERBRAN_USEROFFIC_BRANCHOF] FOREIGN KEY([BranchOfficeID])
REFERENCES [dbo].[BranchOffices] ([BranchOfficeID])
GO
ALTER TABLE [dbo].[UserBranchOffices] CHECK CONSTRAINT [FK_USERBRAN_USEROFFIC_BRANCHOF]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_USERS_ADDRESSUSER_ADDRESSE] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_USERS_ADDRESSUSER_ADDRESSE]
GO
ALTER TABLE [dbo].[WatchDeliveries]  WITH CHECK ADD FOREIGN KEY([CDRWatchId])
REFERENCES [dbo].[CDRWatch] ([CDRWatchID])
GO
ALTER TABLE [dbo].[WatchDeliveries]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Deliveries] ([DeliveryId])
GO
ALTER TABLE [quote].[GNProductRatePlans]  WITH CHECK ADD  CONSTRAINT [FK_GNProductRatePlans_FeeProfileID] FOREIGN KEY([FeeProfileID])
REFERENCES [dbo].[FeeProfiles] ([FeeProfileID])
GO
ALTER TABLE [quote].[GNProductRatePlans] CHECK CONSTRAINT [FK_GNProductRatePlans_FeeProfileID]
GO
ALTER TABLE [quote].[ItemMapping]  WITH CHECK ADD  CONSTRAINT [FK_ItemMapping_QuotationTypeItemID] FOREIGN KEY([QuotationTypeItemID])
REFERENCES [quote].[QuotationTypeItems] ([QuotationTypeItemID])
GO
ALTER TABLE [quote].[ItemMapping] CHECK CONSTRAINT [FK_ItemMapping_QuotationTypeItemID]
GO
ALTER TABLE [quote].[ItemMapping]  WITH CHECK ADD  CONSTRAINT [FK_ItemMapping_TarifftypeID] FOREIGN KEY([TariffTypeID])
REFERENCES [dbo].[TariffTypes] ([TariffTypeID])
GO
ALTER TABLE [quote].[ItemMapping] CHECK CONSTRAINT [FK_ItemMapping_TarifftypeID]
GO
ALTER TABLE [quote].[MarginTypes]  WITH CHECK ADD  CONSTRAINT [FK_MarginTypes_QuotationTypeID] FOREIGN KEY([QuotationTypeID])
REFERENCES [quote].[QuotationTypes] ([QuotationTypeID])
GO
ALTER TABLE [quote].[MarginTypes] CHECK CONSTRAINT [FK_MarginTypes_QuotationTypeID]
GO
ALTER TABLE [quote].[QuotationItems]  WITH CHECK ADD  CONSTRAINT [FK_QuotationItems_MarginTypeID] FOREIGN KEY([MarginTypeID])
REFERENCES [quote].[MarginTypes] ([MarginTypeID])
GO
ALTER TABLE [quote].[QuotationItems] CHECK CONSTRAINT [FK_QuotationItems_MarginTypeID]
GO
ALTER TABLE [quote].[QuotationItems]  WITH CHECK ADD  CONSTRAINT [FK_QuotationItems_QuotationID] FOREIGN KEY([QuotationID])
REFERENCES [quote].[Quotations] ([QuotationID])
GO
ALTER TABLE [quote].[QuotationItems] CHECK CONSTRAINT [FK_QuotationItems_QuotationID]
GO
ALTER TABLE [quote].[QuotationItems]  WITH CHECK ADD  CONSTRAINT [FK_QuotationItems_QuotationTypeItemID] FOREIGN KEY([QuotationTypeItemID])
REFERENCES [quote].[QuotationTypeItems] ([QuotationTypeItemID])
GO
ALTER TABLE [quote].[QuotationItems] CHECK CONSTRAINT [FK_QuotationItems_QuotationTypeItemID]
GO
ALTER TABLE [quote].[QuotationMargins]  WITH CHECK ADD  CONSTRAINT [FK_QuotationMargins_MarginTypeID] FOREIGN KEY([MarginTypeID])
REFERENCES [quote].[MarginTypes] ([MarginTypeID])
GO
ALTER TABLE [quote].[QuotationMargins] CHECK CONSTRAINT [FK_QuotationMargins_MarginTypeID]
GO
ALTER TABLE [quote].[QuotationPackages]  WITH CHECK ADD  CONSTRAINT [FK_QuotationPackages_ClientID] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [quote].[QuotationPackages] CHECK CONSTRAINT [FK_QuotationPackages_ClientID]
GO
ALTER TABLE [quote].[QuotationPackages]  WITH CHECK ADD  CONSTRAINT [FK_QuotationPackages_QuotationID] FOREIGN KEY([QuotationID])
REFERENCES [quote].[Quotations] ([QuotationID])
GO
ALTER TABLE [quote].[QuotationPackages] CHECK CONSTRAINT [FK_QuotationPackages_QuotationID]
GO
ALTER TABLE [quote].[QuotationTypeItems]  WITH CHECK ADD  CONSTRAINT [FK_QuotationTypeItems_MarginTypeID] FOREIGN KEY([MarginTypeID])
REFERENCES [quote].[MarginTypes] ([MarginTypeID])
GO
ALTER TABLE [quote].[QuotationTypeItems] CHECK CONSTRAINT [FK_QuotationTypeItems_MarginTypeID]
GO
ALTER TABLE [quote].[QuotationTypeItems]  WITH CHECK ADD  CONSTRAINT [FK_QuotationTypeItems_QuotationTypeID] FOREIGN KEY([QuotationTypeID])
REFERENCES [quote].[QuotationTypes] ([QuotationTypeID])
GO
ALTER TABLE [quote].[QuotationTypeItems] CHECK CONSTRAINT [FK_QuotationTypeItems_QuotationTypeID]
GO
ALTER TABLE [quote].[QuotationTypeItemValues]  WITH CHECK ADD  CONSTRAINT [FK_QuotationTypeItemValues_EquipmentTypeID] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([EquipmentTypeID])
GO
ALTER TABLE [quote].[QuotationTypeItemValues] CHECK CONSTRAINT [FK_QuotationTypeItemValues_EquipmentTypeID]
GO
ALTER TABLE [quote].[QuotationTypeItemValues]  WITH CHECK ADD  CONSTRAINT [FK_QuotationTypeItemValues_QuotationTypeItemID] FOREIGN KEY([QuotationTypeItemID])
REFERENCES [quote].[QuotationTypeItems] ([QuotationTypeItemID])
GO
ALTER TABLE [quote].[QuotationTypeItemValues] CHECK CONSTRAINT [FK_QuotationTypeItemValues_QuotationTypeItemID]
GO
