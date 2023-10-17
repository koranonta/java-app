USE [satcom-billing-prod]
GO

/****** Object:  Table [dbo].[ActionTypeGroups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActionTypeGroups](
	[ActionTypeGroupID] [int] NOT NULL,
	[ActionTypeGroupName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ACTIONTYPEGROUPS] PRIMARY KEY CLUSTERED 
(
	[ActionTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActionTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActionTypes](
	[ActionTypeID] [int] NOT NULL,
	[ActionTypeGroupID] [int] NOT NULL,
	[ActionTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ACTIONTYPES] PRIMARY KEY CLUSTERED 
(
	[ActionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[CountryID] [int] NOT NULL,
	[AddressName] [varchar](250) NOT NULL,
	[Attn] [varchar](100) NULL,
	[Street1] [nvarchar](max) NULL,
	[PostCode] [varchar](20) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[Note] [varchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ADDRESSES] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressPatterns]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressPatterns](
	[AddressPatternId] [int] NOT NULL,
	[AddressPatternName] [varchar](50) NOT NULL,
	[Pattern] [varchar](4000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ADDRESSPATTERNS] PRIMARY KEY CLUSTERED 
(
	[AddressPatternId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressProperties](
	[AddressPropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_ADDRESSPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[AddressPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressTypes](
	[AddressTypeID] [int] NOT NULL,
	[AddressTypeName] [varchar](50) NOT NULL,
	[AddressType] [smallint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ADDRESSTYPES] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AirtimeProviderProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AirtimeProviderProperties](
	[AirtimeProviderPropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_AIRTIMEPROVIDERPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[AirtimeProviderPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AirtimeProviders]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AirtimeProviders](
	[AirtimeProviderID] [int] NOT NULL,
	[AirtimeProviderName] [varchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_AIRTIMEPROVIDERS] PRIMARY KEY CLUSTERED 
(
	[AirtimeProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [int] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[AppPage] [varchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[ClassName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditClientEquipments]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditClientEquipments](
	[AuditClientEquipmentId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_AuditClientEquipments] PRIMARY KEY CLUSTERED 
(
	[AuditClientEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditSepi]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditSepi](
	[AuditSepiId] [int] NOT NULL,
	[ProviderMessageId] [int] NULL,
	[eventDate] [datetime] NOT NULL,
	[sourceProcedure] [nchar](256) NULL,
	[AuditEventDescription] [nchar](2048) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_AuditSepi] PRIMARY KEY CLUSTERED 
(
	[AuditSepiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[BankAccountID] [int] NOT NULL,
	[BillingEntityId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[AccountName] [varchar](50) NULL,
	[BSB] [varchar](50) NULL,
	[Bank] [varchar](50) NULL,
	[Branch] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[SwiftCode] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeteled] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[RoutingNumber] [varchar](50) NULL,
	[ABANumber] [varchar](50) NULL,
	[IBANShortCode] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
 CONSTRAINT [PK_BANKACCOUNTS] PRIMARY KEY NONCLUSTERED 
(
	[BankAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingCycleGroups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingCycleGroups](
	[BillingCycleGroupID] [int] NULL,
	[BillingCycleGroupTypeID] [int] NULL,
	[BillingCycleID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[MidifiedBy] [int] NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillingCycleGroupTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingCycleGroupTypes](
	[BillingCycleGroupTypeID] [int] NULL,
	[BillingCycleGroupTypeName] [varchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[MidifiedBy] [int] NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingCycles]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingCycles](
	[BillingCycleID] [int] NOT NULL,
	[BillingCycleName] [varchar](50) NOT NULL,
	[BillingCycleDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_BILLINGCYCLES] PRIMARY KEY CLUSTERED 
(
	[BillingCycleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingEntities]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingEntities](
	[BillingEntityID] [int] NOT NULL,
	[TechnicalSupportID] [int] NULL,
	[BillingEntityName] [varchar](50) NOT NULL,
	[ShortCode] [varchar](1) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_BILLINGENTITIES] PRIMARY KEY CLUSTERED 
(
	[BillingEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingEntityProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingEntityProperties](
	[EntityPropertyId] [int] NOT NULL,
	[BillingEntityId] [int] NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_BILLINGENTITYPROPERTIES] PRIMARY KEY NONCLUSTERED 
(
	[EntityPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillingRuns]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingRuns](
	[BillingRunID] [int] NOT NULL,
	[InvoiceRuleID] [int] NOT NULL,
	[BatchID] [varchar](20) NOT NULL,
	[ErrorMessage] [varchar](max) NULL,
	[UpToDate] [datetime] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BillingRunState] [int] NULL,
	[ClientEquipments] [xml] NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_BILLINGRUNS] PRIMARY KEY CLUSTERED 
(
	[BillingRunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingSchemeProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingSchemeProperties](
	[BillingSchemePropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[BillingSchemeID] [int] NOT NULL,
	[PropertyValue] [varchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_BILLINGSCHEMEPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[BillingSchemePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingSchemes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingSchemes](
	[BillingSchemeID] [int] NOT NULL,
	[ParentId] [int] NULL,
	[SchemeTypeID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[CurrencyID] [int] NULL,
	[BillingSchemeName] [varchar](500) NULL,
	[STPCode] [varchar](50) NULL,
	[Priority] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[InclusivePeriod] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ClientID] [int] NULL,
	[ProviderPackageRatePlanID] [int] NULL,
	[AliasName] [varchar](500) NULL,
	[QuotationID] [int] NULL,
 CONSTRAINT [PK_BILLINGSCHEMES] PRIMARY KEY CLUSTERED 
(
	[BillingSchemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPCodes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPCodes](
	[BPCodeID] [int] NOT NULL,
	[RegionID] [char](2) NULL,
	[DivisionID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[BPCode] [varchar](10) NULL,
	[ClientID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IsDefault] [bit] NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[ParentBPCode] [varchar](32) NULL,
	[GroupName] [varchar](256) NULL,
	[Territory] [varchar](256) NULL,
 CONSTRAINT [PK_BPCODES] PRIMARY KEY CLUSTERED 
(
	[BPCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BranchOffices]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BranchOffices](
	[BranchOfficeID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[OfficeName] [varchar](128) NOT NULL,
	[OfficeAddress] [varchar](500) NOT NULL,
	[OfficeAddress2] [varchar](500) NULL,
	[Symbol] [varchar](2) NULL,
	[ORMailAddress] [varchar](256) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_BRANCHOFFICES] PRIMARY KEY CLUSTERED 
(
	[BranchOfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalculationRules]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalculationRules](
	[CalculationRuleID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CalculationRuleName] [varchar](256) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[ProcedureName] [varchar](256) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CALCULATIONRULES] PRIMARY KEY CLUSTERED 
(
	[CalculationRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalledToGrouping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalledToGrouping](
	[CalledToGroupingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[FromCallTypeID] [int] NOT NULL,
	[ToCallTypeID] [int] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CALLED_TO_GROUPING] PRIMARY KEY CLUSTERED 
(
	[CalledToGroupingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalledToGroupingCreationLog]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalledToGroupingCreationLog](
	[Msg] [varchar](500) NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalledToMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalledToMapping](
	[CalledToMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CalledToNumber] [varchar](255) NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CALLED_TO_MAPPING] PRIMARY KEY CLUSTERED 
(
	[CalledToMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallFromCallTypeCallToMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallFromCallTypeCallToMapping](
	[CallFromCallTypeCallToMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CallFromCallTypeID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[RunAfterMatching] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CALL_FROM_CALL_TYPE_CALL_TO_MAPPING] PRIMARY KEY CLUSTERED 
(
	[CallFromCallTypeCallToMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallFromCallTypeCallToMappingBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallFromCallTypeCallToMappingBUP](
	[CallFromCallTypeCallToMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CallFromCallTypeID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallFromCallTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CallFromCallTypes](
	[CallFromCallTypeID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[ConnectionType] [varchar](20) NOT NULL,
	[Speed] [varchar](10) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ChargeUnitGroup] [int] NULL,
 CONSTRAINT [PK_CALLFROMCALLTYPES] PRIMARY KEY CLUSTERED 
(
	[CallFromCallTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CallTypes](
	[CallTypeID] [int] NOT NULL,
	[CallTypeName] [varchar](255) NOT NULL,
	[AliasName] [varchar](256) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CALLTYPES] PRIMARY KEY CLUSTERED 
(
	[CallTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CDR]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDR](
	[CdrID] [int] NOT NULL,
	[CountryNetworkID] [int] NULL,
	[ParentID] [int] NULL,
	[CdrTypeID] [int] NOT NULL,
	[ImportJobID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CountryID] [int] NULL,
	[ChargeUnitId] [int] NULL,
	[Initiator] [varchar](50) NOT NULL,
	[CalledTo] [varchar](50) NOT NULL,
	[CallDuration] [decimal](38, 12) NULL,
	[UpstreamVolume] [decimal](19, 6) NULL,
	[UpStreamRate] [decimal](18, 5) NULL,
	[DownstreamVolume] [decimal](19, 6) NULL,
	[DownstreamRate] [decimal](18, 0) NULL,
	[Unit] [varchar](50) NULL,
	[CallDateTime] [datetime] NOT NULL,
	[RawInitiatorCountry] [varchar](64) NULL,
	[RawCalledToCountry] [varchar](64) NULL,
	[ServiceCode] [varchar](50) NULL,
	[TimeZoneIndicator] [varchar](6) NULL,
	[LineNoInSourceFile] [int] NOT NULL,
	[Info] [varchar](500) NULL,
	[Status] [int] NOT NULL,
	[CalculationStatus] [int] NULL,
	[Rate] [money] NULL,
	[Cost] [dbo].[bigmoney] NULL,
	[VendorReference] [varchar](256) NULL,
	[OceanRegion] [varchar](4) NULL,
	[Description] [varchar](500) NULL,
	[PartialRecordIndicator] [char](2) NULL,
	[CallEndDatetime] [datetime] NULL,
	[CallForwarding] [varchar](50) NULL,
	[Debug] [varchar](100) NULL,
	[APN] [varchar](256) NULL,
	[DateCreated] [datetime] NULL,
	[FleetOneCountryId] [int] NULL,
 CONSTRAINT [PK_CDR] PRIMARY KEY CLUSTERED 
(
	[CdrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrCharges]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CdrCharges](
	[CdrChargeID] [int] NOT NULL,
	[SchemeTariffID] [int] NOT NULL,
	[InvoiceItemID] [int] NULL,
	[CdrID] [int] NOT NULL,
	[CallDateTime] [datetime] NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[SchemeTypeId] [int] NOT NULL,
	[Amount] [money] NULL,
	[RawAmount] [money] NOT NULL,
	[Rate] [money] NULL,
	[TotalCharged] [dbo].[bigmoney] NULL,
	[ChargeDuration] [dbo].[bigmoney] NULL,
	[ChargeDataVolume] [dbo].[bigmoney] NULL,
	[CalculationDate] [datetime] NULL,
	[ChargeAllowance] [dbo].[bigmoney] NULL,
	[VolumeAllowance] [dbo].[bigmoney] NULL,
	[DurationAllowance] [dbo].[bigmoney] NULL,
	[SmsAllowance] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CDRCHARGES] PRIMARY KEY CLUSTERED 
(
	[CdrChargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CdrDeliveries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrDeliveries](
	[CdrDeliveryId] [int] NOT NULL,
	[ParentClientId] [int] NOT NULL,
	[DeliveryId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[EquipmentTypeId] [int] NULL,
	[ClientEquipmentId] [int] NULL,
	[FileName] [varchar](32) NULL,
	[ShowRate] [int] NOT NULL DEFAULT ((1)),
	[ResendType] [int] NOT NULL DEFAULT ((2)),
	[ResendAmount] [int] NOT NULL DEFAULT ((1)),
	[LastUptoDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CdrDeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrDeliveriesIBIS]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrDeliveriesIBIS](
	[CdrDeliveryIBISId] [int] NOT NULL,
	[ParentClientId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[EquipmentTypeId] [int] NULL,
	[ClientEquipmentId] [int] NULL,
	[FileName] [varchar](32) NULL,
	[ShowRate] [int] NOT NULL DEFAULT ((1)),
	[ResendType] [int] NOT NULL DEFAULT ((2)),
	[ResendAmount] [int] NOT NULL DEFAULT ((1)),
	[LastUptoDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CdrDeliveryIBISId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrRules]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrRules](
	[CdrRuleID] [int] NOT NULL,
	[FieldName] [varchar](100) NULL,
	[Value] [varchar](200) NULL,
	[Description] [varchar](255) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CdrRuleID] PRIMARY KEY CLUSTERED 
(
	[CdrRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CDRSource]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDRSource](
	[CdrSourceID] [int] IDENTITY(1,1) NOT NULL,
	[ImportJobID] [int] NOT NULL,
	[LineNumber] [int] NOT NULL,
	[Content] [varchar](4000) NULL,
 CONSTRAINT [PK_CDRSRCE] PRIMARY KEY CLUSTERED 
(
	[CdrSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrTypeCreationLog]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrTypeCreationLog](
	[KeyID] [int] NULL,
	[Msg] [varchar](500) NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrTypeMappingRules]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CdrTypeMappingRules](
	[CdrTypeMappingRuleID] [int] NOT NULL,
	[CdrTypeMappingID] [int] NOT NULL,
	[CdrRuleID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CdrTypeMappingRuleID] PRIMARY KEY CLUSTERED 
(
	[CdrTypeMappingRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CdrTypeMappings]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrTypeMappings](
	[CdrTypeMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[ConnectionType] [varchar](20) NULL,
	[Speed] [varchar](10) NULL,
	[Destination] [varchar](100) NULL,
	[Description] [varchar](255) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CdrTypeMappingID] PRIMARY KEY CLUSTERED 
(
	[CdrTypeMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrTypes](
	[CdrTypeID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[CallFromCallTypeID] [int] NOT NULL,
	[CdrTypeName] [varchar](255) NOT NULL,
	[MajorTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[CallIdentifierID] [varchar](6) NULL,
	[CSVCallFrom] [varchar](512) NULL,
	[CSVCalledTo] [varchar](512) NULL,
 CONSTRAINT [PK_CDRTYPES] PRIMARY KEY CLUSTERED 
(
	[CdrTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CdrTypesBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CdrTypesBUP](
	[CdrTypeID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[CallFromCallTypeID] [int] NOT NULL,
	[CdrTypeName] [varchar](255) NOT NULL,
	[MajorTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CDRWatch]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDRWatch](
	[CDRWatchID] [int] NOT NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[SchemeTypeID] [int] NOT NULL,
	[Threshold] [dbo].[bigmoney] NOT NULL,
	[CurrentBalance] [dbo].[bigmoney] NOT NULL CONSTRAINT [DF_CDRWatch_CurrentBalance]  DEFAULT ((0)),
	[WatchType] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[WatchActionType] [int] NOT NULL,
	[AutoResetType] [int] NULL,
	[ResetFrequency] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ExpiryDate] [datetime] NULL,
 CONSTRAINT [PK_CDRWatch] PRIMARY KEY CLUSTERED 
(
	[CDRWatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChargeUnits]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChargeUnits](
	[ChargeUnitID] [int] NOT NULL,
	[ShortCode] [varchar](20) NOT NULL,
	[ChargeUnitName] [varchar](50) NOT NULL,
	[Divisor] [dbo].[bigmoney] NOT NULL,
	[RoundType] [int] NOT NULL,
	[ChargedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[CSVUnitName] [varchar](10) NULL,
 CONSTRAINT [PK_CHARGEUNITS] PRIMARY KEY CLUSTERED 
(
	[ChargeUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientAddresses]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientAddresses](
	[ClientAddressID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ClientAddresses] PRIMARY KEY CLUSTERED 
(
	[ClientAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientDealers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientDealers](
	[ClientID] [int] NOT NULL,
	[DealerID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientEquipmentActions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentActions](
	[ClientEquipmentActionID] [int] NOT NULL,
	[CurrentBillingSchemeID] [int] NULL,
	[SchemeTariffID] [int] NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[ActionTypeID] [int] NOT NULL,
	[ProviderMessageID] [int] NULL,
	[PreviousBillingSchemeID] [int] NULL,
	[MovedClientEquipmentID] [int] NULL,
	[FromClientID] [int] NULL,
	[ToClientID] [int] NULL,
	[FromNumber] [varchar](50) NULL,
	[ToNumber] [varchar](50) NULL,
	[ActionDate] [datetime] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ChargeDate] [datetime] NULL,
	[NotifyDate] [datetime] NULL,
	[Duration] [decimal](10, 5) NULL,
	[PenaltyFlatRate] [money] NULL,
	[DebitDeactivation] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Info] [varchar](200) NULL,
	[IsCarryOnMonthBlock] [bit] NULL,
	[IsCarryOnContract] [bit] NULL,
	[IsChargePenalty] [bit] NULL,
	[IsCalculateCorrective] [bit] NULL,
	[IsCarryOnAllowance] [int] NULL,
	[IsCarryOver] [bit] NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTACTIONS] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentActionsBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentActionsBUP](
	[ClientEquipmentActionID] [int] NOT NULL,
	[CurrentBillingSchemeID] [int] NULL,
	[SchemeTariffID] [int] NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[ActionTypeID] [int] NOT NULL,
	[ProviderMessageID] [int] NULL,
	[PreviousBillingSchemeID] [int] NULL,
	[MovedClientEquipmentID] [int] NULL,
	[FromClientID] [int] NULL,
	[ToClientID] [int] NULL,
	[FromNumber] [varchar](50) NULL,
	[ToNumber] [varchar](50) NULL,
	[ActionDate] [datetime] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ChargeDate] [datetime] NULL,
	[NotifyDate] [datetime] NULL,
	[Duration] [decimal](10, 5) NULL,
	[PenaltyFlatRate] [money] NULL,
	[DebitDeactivation] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Info] [varchar](100) NULL,
	[IsCarryOnMonthBlock] [bit] NULL,
	[IsCarryOnContract] [bit] NULL,
	[IsChargePenalty] [bit] NULL,
	[IsCalculateCorrective] [bit] NULL,
	[IsCarryOnAllowance] [int] NULL,
	[IsCarryOver] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentCharges]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentCharges](
	[ClientEquipmentChargeID] [int] NOT NULL,
	[InvoiceItemID] [int] NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[SchemeTariffID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Rate] [money] NOT NULL,
	[Quantity] [decimal](12, 2) NOT NULL,
	[Amount] [money] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[SchemeTypeID] [int] NOT NULL,
	[Prorata] [bit] NOT NULL CONSTRAINT [DF_ClientEquipmentCharges_Prorata]  DEFAULT ((0)),
	[ClientEquipmentActionID] [int] NULL,
	[Info] [varchar](100) NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTCHARGES] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentChargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentChargesBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentChargesBUP](
	[ClientEquipmentChargeID] [int] NOT NULL,
	[InvoiceItemID] [int] NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[SchemeTariffID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Rate] [money] NOT NULL,
	[Quantity] [decimal](12, 2) NOT NULL,
	[Amount] [money] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[SchemeTypeID] [int] NOT NULL,
	[Prorata] [bit] NOT NULL,
	[ClientEquipmentActionID] [int] NULL,
	[Info] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentProperties](
	[ClientEquipmentPropertyID] [int] NOT NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](max) NULL,
	[IsDefaultProperty] [bit] NULL,
	[Mandatory] [bit] NULL,
	[IdentifierTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[IsIdentifier] [bit] NULL,
	[ShowInInvoice] [bit] NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipments]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipments](
	[ClientEquipmentID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[IdentifierTypeID] [int] NULL,
	[ParentID] [int] NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[Identifier] [varchar](250) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsPrepaid] [bit] NULL,
	[UniqueID] [varchar](32) NULL,
	[CustomerRef] [varchar](255) NULL,
	[NoticePeriod] [int] NULL,
	[Notes] [varchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NULL,
	[SupStatus] [int] NULL,
	[BalanceRetrieval] [bit] NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTS] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentSchemeProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentSchemeProperties](
	[ClientEquipmentSchemePropertyID] [int] NOT NULL,
	[ClientEquipmentSchemeID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ClientEquipmentSchemeProperties] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentSchemePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientEquipmentSchemes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientEquipmentSchemes](
	[ClientEquipmentSchemeID] [int] NOT NULL,
	[BillingSchemeID] [int] NOT NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Prorata] [bit] NOT NULL,
	[InclusiveTerm] [int] NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractTerm] [int] NULL,
	[MFMonthBlock] [int] NULL,
	[MFMonthAdvance] [int] NULL,
	[CycleDay] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[MonthBlockStartDateCalculation] [int] NULL,
	[ContractStartDateCalculation] [int] NULL,
	[RevolvingPeriod] [int] NULL,
	[NotificationPeriod] [int] NULL,
	[DeactivationFeeCalculation] [int] NULL,
	[ReturnCredit] [bit] NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTSCHEMES] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentSchemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientEquipmentSepiBucketProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientEquipmentSepiBucketProperties](
	[ClientEquipmentSepiBucketPropertyID] [int] NOT NULL,
	[ClientEquipmentID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NULL,
	[IsDefaultProperty] [bit] NULL,
	[Mandatory] [bit] NULL,
	[IdentifierTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ClientRequestID] [int] NULL,
 CONSTRAINT [PK_CLIENTEQUIPMENTSEPIBUCKETPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ClientEquipmentSepiBucketPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientGroups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientGroups](
	[ClientGroupID] [int] NOT NULL,
	[ClientGroupName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CLIENTGROUPS] PRIMARY KEY CLUSTERED 
(
	[ClientGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[ClientPropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CLIENTPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ClientPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] NOT NULL,
	[BPCodeID] [int] NULL,
	[DealerID] [int] NULL,
	[PaymentTermID] [int] NULL,
	[ClientTypeID] [int] NOT NULL,
	[ClientGroupID] [int] NULL,
	[SaleAdministratorID] [int] NULL,
	[AccountManagerID] [int] NULL,
	[PurchaseOrderID] [int] NULL,
	[ParentID] [int] NULL,
	[ClientName] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Note] [varchar](max) NULL,
	[BalanceRetrieval] [bit] NULL,
 CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientTypes](
	[ClientTypeID] [int] NOT NULL,
	[ClientTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CLIENTTYPES] PRIMARY KEY CLUSTERED 
(
	[ClientTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommissionSchemes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommissionSchemes](
	[CommissionSchemeId] [int] NOT NULL,
	[CommissionSchemeName] [varchar](200) NOT NULL,
	[SchemeTypeId] [int] NOT NULL,
	[EquipmentTypeId] [int] NOT NULL,
	[BillingSchemeId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CommissionSchemeId] PRIMARY KEY CLUSTERED 
(
	[CommissionSchemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommissionTariffs]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommissionTariffs](
	[CommissionTariffId] [int] NOT NULL,
	[CommissionSchemeId] [int] NOT NULL,
	[TariffCategoryId] [int] NULL,
	[TariffTypeId] [int] NULL,
	[TariffRate] [money] NULL,
	[TariffPercentage] [money] NULL,
	[LedgerId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CommissionTariffId] PRIMARY KEY CLUSTERED 
(
	[CommissionTariffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyDivisions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyDivisions](
	[CompanyDivisionID] [int] NOT NULL,
	[CompanyDivisionName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_COMPANYDIVISIONS] PRIMARY KEY CLUSTERED 
(
	[CompanyDivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyRegions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyRegions](
	[CompanyRegionID] [int] NOT NULL,
	[CompanyRegionName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_COMPANYREGIONS] PRIMARY KEY CLUSTERED 
(
	[CompanyRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configurations](
	[ConfigurationId] [int] NOT NULL,
	[ModuleName] [varchar](5) NOT NULL,
	[ConfigurationKey] [varchar](max) NOT NULL,
	[ConfigurationValue] [varchar](max) NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CostFBB]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CostFBB](
	[PackageRatePlanId] [int] NULL,
	[PackageRatePlanName] [varchar](1000) NULL,
	[MonthBlock] [int] NULL,
	[MinimumContract] [int] NULL,
	[Voice] [varchar](max) NULL,
	[Data] [varchar](max) NULL,
	[SMS] [varchar](max) NULL,
	[Dollar] [money] NULL,
	[TarifftypeId] [int] NULL,
	[TarifftypeName] [varchar](100) NULL,
	[Tariff] [money] NULL,
	[Impliedtariff] [money] NULL,
	[Inclusive] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[ISO2Code] [char](2) NULL,
	[ISO3Code] [char](3) NULL,
	[ISONumber] [int] NULL,
	[CountryIridiumID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_COUNTRIES] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryNetworks]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryNetworks](
	[CountryNetworkID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[RegularExpression] [varchar](1000) NULL,
	[IsCellular] [bit] NULL,
	[StartingDigits] [varchar](16) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_COUNTRYNETWORKS] PRIMARY KEY CLUSTERED 
(
	[CountryNetworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryPattern]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryPattern](
	[AddressPatternId] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRYPATTERN] PRIMARY KEY CLUSTERED 
(
	[AddressPatternId] ASC,
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CreditCards](
	[CreditCardID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[CreditCardTypeID] [int] NOT NULL,
	[CreditCardNumber] [varchar](50) NULL,
	[CreditCardName] [varchar](100) NULL,
	[ExpiryMonth] [int] NOT NULL,
	[ExpiryYear] [int] NOT NULL,
	[AliasName] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[LastFourDigits] [varchar](4) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[CreditCards] ADD [Street] [varchar](100) NULL
ALTER TABLE [dbo].[CreditCards] ADD [City] [varchar](100) NULL
ALTER TABLE [dbo].[CreditCards] ADD [Zipcode] [varchar](100) NULL
ALTER TABLE [dbo].[CreditCards] ADD [Description] [varchar](512) NULL
PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CreditCardTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CreditCardTypes](
	[CreditCardTypeID] [int] NOT NULL,
	[CreditCardTypeName] [varchar](50) NOT NULL,
	[CreditCardIconPath] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CreditCardTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CSVTest]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CSVTest](
	[ID] [int] NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[BirthDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currencies](
	[CurrencyID] [int] NOT NULL,
	[CurrencyCode] [char](3) NOT NULL,
	[CurrencyName] [varchar](50) NOT NULL,
	[ISONumber] [int] NULL,
	[FactDigits] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Symbol] [nvarchar](3) NULL,
 CONSTRAINT [PK_CURRENCIES] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CyberTimeZone]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CyberTimeZone](
	[ZoneID] [varchar](2) NOT NULL,
	[Offset] [varchar](5) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_CYBERTIMEZONE] PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerCommissions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerCommissions](
	[DealerCommissionId] [int] NOT NULL,
	[CommissionSchemeId] [int] NOT NULL,
	[DealerId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DealerCommissionId] PRIMARY KEY CLUSTERED 
(
	[DealerCommissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dealers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dealers](
	[DealerID] [int] NOT NULL,
	[DealerName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DEALERS] PRIMARY KEY CLUSTERED 
(
	[DealerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DefaultPropertyGenericTokensMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DefaultPropertyGenericTokensMapping](
	[DefaultPropertyGenericTokensMappingID] [int] NOT NULL,
	[PropertyName] [varchar](50) NOT NULL,
	[ConnectionType] [varchar](50) NOT NULL,
	[Speed] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DEFAULT_PROPERTY_GENERIC_TOKENS_MAPPING] PRIMARY KEY CLUSTERED 
(
	[DefaultPropertyGenericTokensMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deliveries](
	[DeliveryId] [int] NOT NULL,
	[FtpAccountId] [int] NULL,
	[AddressId] [int] NULL,
	[Description] [varchar](512) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeliveryDestinations]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryDestinations](
	[DeliveryDestinationID] [int] NOT NULL,
	[MediaType] [int] NOT NULL,
	[FTPUser] [varchar](50) NULL,
	[FTPPassword] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DELIVERYDESTINATIONS] PRIMARY KEY CLUSTERED 
(
	[DeliveryDestinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delivieries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivieries](
	[DelivieryID] [int] NOT NULL,
	[DeliveryDestinationID] [int] NOT NULL,
	[DeliveryDate] [timestamp] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_DELIVIERIES] PRIMARY KEY CLUSTERED 
(
	[DelivieryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](64) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Divisions](
	[DivisionID] [int] NOT NULL,
	[DivisionName] [varchar](50) NOT NULL,
	[ShortCode] [varchar](20) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_DIVISIONS] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[EmailTemplateId] [int] NOT NULL,
	[EmailTemplateName] [nvarchar](255) NOT NULL,
	[ProfileName] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](1000) NOT NULL,
	[MessageHeader] [nvarchar](max) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[MessageFooter] [nvarchar](max) NULL,
	[Format] [nvarchar](50) NOT NULL,
	[Important] [nvarchar](50) NULL,
	[ReplyTo] [nvarchar](1000) NULL,
	[MailCC] [nvarchar](max) NULL,
	[MailBCC] [nvarchar](max) NULL,
	[FileAttachments] [nvarchar](max) NULL,
	[DynamicMessage] [bit] NOT NULL,
	[EmailTemplateType] [nvarchar](50) NULL,
	[DealerId] [int] NULL,
	[ProviderId] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[EmailTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentChargeUnits]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentChargeUnits](
	[EquipmentChargeUnitID] [int] NOT NULL,
	[AirtimeProviderID] [int] NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[DurationChargeUnitID] [int] NULL,
	[VolumeChargeUnitID] [int] NULL,
	[MessageChargeUnitID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EquipmentChargeUnitID] PRIMARY KEY CLUSTERED 
(
	[EquipmentChargeUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentCreationMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentCreationMapping](
	[EquipmentCreationMappingID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[EquipmentTypePropertyName] [varchar](100) NOT NULL,
	[StockPropertyName] [varchar](100) NOT NULL,
	[CreationCode] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EQUIPMENT_CREATION_MAPPING] PRIMARY KEY CLUSTERED 
(
	[EquipmentCreationMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentProviderPackages]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentProviderPackages](
	[EquipmentProviderPackageID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[ProviderPackageID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_EquipmentProviderPackages] PRIMARY KEY CLUSTERED 
(
	[EquipmentProviderPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentStateTransitions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentStateTransitions](
	[EquipmentStateTransitionId] [int] NOT NULL,
	[SystemStatusId] [int] NOT NULL,
	[NextSystemStatusId] [int] NULL,
	[EquipmentStateActions] [varchar](64) NULL,
 CONSTRAINT [PK_EQUIPMENTSTATETRANSITIONS] PRIMARY KEY CLUSTERED 
(
	[EquipmentStateTransitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentTypeGroups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentTypeGroups](
	[EquipmentTypeGroupID] [int] NOT NULL,
	[EquipmentTypeGroupName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EQUIPMENT_TYPE_GROUP_ID] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentTypeMainIdentifier]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentTypeMainIdentifier](
	[EquipmentTypeID] [int] NULL,
	[PropertyTypeID] [int] NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DateModified] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentTypeMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentTypeMapping](
	[EquipmentTypeMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[FromEquipmentTypeID] [int] NOT NULL,
	[ToEquipmentTypeID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EQUIPMENT_TYPE_MAPPING] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentTypeProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentTypeProperties](
	[EquipmentTypePropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NULL,
	[Mandatory] [bit] NULL,
	[ValidValues] [varchar](max) NULL,
	[IdentifierTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[IsIdentifier] [bit] NULL,
	[ShowOnPincodeReport] [bit] NULL,
	[ShowInInvoice] [bit] NULL,
	[ShowOnGN] [bit] NULL,
	[StockTypePropertyID] [int] NULL,
	[CreationCode] [int] NULL,
	[ActivationConfirmLabel] [varchar](50) NULL,
	[ActivationConfirmLineNumber] [int] NULL,
 CONSTRAINT [PK_EQUIPMENTTYPEPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentTypes](
	[EquipmentTypeID] [int] NOT NULL,
	[ExternalProviderID] [int] NULL,
	[EquipmentTypeName] [varchar](256) NULL,
	[ShowOnGN] [bit] NULL,
	[EquipmentTypeGroupID] [int] NULL,
	[ShowOnPincodeReport] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_EQUIPMENTTYPES] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRates](
	[ExchangeRateID] [int] NOT NULL,
	[FromCurrencyID] [int] NOT NULL,
	[ToCurrencyID] [int] NOT NULL,
	[ExchangeRate] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_EXCHANGERATES] PRIMARY KEY CLUSTERED 
(
	[ExchangeRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeeProfileProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeeProfileProperties](
	[FeeProfilePropertyID] [int] NOT NULL,
	[FeeProfileID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_FeeProfileProperties] PRIMARY KEY CLUSTERED 
(
	[FeeProfilePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeeProfiles]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeeProfiles](
	[FeeProfileID] [int] NOT NULL,
	[FeeProfileName] [varchar](256) NOT NULL,
	[Notes] [varchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_FeeProfiles] PRIMARY KEY CLUSTERED 
(
	[FeeProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FGICustomers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FGICustomers](
	[FGICustomerID] [int] NOT NULL,
	[BPCode] [varchar](32) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Bucket] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleetOneSession]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleetOneSession](
	[CdrId] [int] NOT NULL,
	[SessionId] [varchar](70) NULL,
	[FleetOneISO3] [varchar](10) NULL,
	[Completed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CdrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FtpAccounts]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FtpAccounts](
	[FtpAccountId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[FtpUsername] [varchar](50) NULL,
	[FtpPassword] [varchar](50) NULL,
	[FtpPath] [varchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FtpAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenericTokenData]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenericTokenData](
	[GenericTokenDataID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[GenericTokenID] [int] NOT NULL,
	[RegularExpression] [varchar](1000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_GENERICTOKENDATA] PRIMARY KEY CLUSTERED 
(
	[GenericTokenDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenericTokenDataBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenericTokenDataBUP](
	[GenericTokenDataID] [int] NOT NULL,
	[CallTypeID] [int] NOT NULL,
	[GenericTokenID] [int] NOT NULL,
	[RegularExpression] [varchar](1000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenericTokens]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GenericTokens](
	[GenericTokenID] [int] NOT NULL,
	[GenericTokenName] [varchar](32) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_GENERICTOKENS] PRIMARY KEY CLUSTERED 
(
	[GenericTokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeographicRegions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeographicRegions](
	[GeographicRegionID] [int] NOT NULL,
	[GeographicRegionName] [varchar](256) NOT NULL,
	[AirtimeProviderID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_GEOGRAPHICREGIONS] PRIMARY KEY CLUSTERED 
(
	[GeographicRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GLSysCodes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GLSysCodes](
	[LedgerCode] [varchar](10) NOT NULL,
	[DivisionID] [int] NOT NULL,
	[RegionID] [varchar](2) NOT NULL,
	[SysCode] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_GLSYSCODES] PRIMARY KEY CLUSTERED 
(
	[LedgerCode] ASC,
	[DivisionID] ASC,
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] NOT NULL,
	[GroupName] [varchar](64) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_GROUPS] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HealthMonitoring]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HealthMonitoring](
	[HealthMonitoringID] [int] NOT NULL,
	[numActionMessagesProcessed] [int] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_HealthMonitoring] PRIMARY KEY CLUSTERED 
(
	[HealthMonitoringID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HMCMailTemp]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMCMailTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriberID] [int] NULL,
	[ItemDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceItemID] [int] NULL,
	[ClientEquipmentID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HorizonCallTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HorizonCallTypes](
	[HorizonCountryNetworkID] [int] NOT NULL,
	[CountryName] [varchar](100) NULL,
	[CallTypeName] [varchar](100) NULL,
	[StartingDigits] [varchar](max) NULL,
	[Forbidden] [int] NULL DEFAULT ((0)),
	[CountryNetworkID] [int] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_HORIZON_CALL_TYPES] PRIMARY KEY CLUSTERED 
(
	[HorizonCountryNetworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdentifierTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdentifierTypes](
	[IdentifierTypeID] [int] NOT NULL,
	[IdentifierTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_IDENTIFIERTYPES] PRIMARY KEY CLUSTERED 
(
	[IdentifierTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImportJobs]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportJobs](
	[ImportJobID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[SourceFile] [varchar](255) NOT NULL,
	[ImportDate] [datetime] NOT NULL,
	[Note] [varchar](4000) NULL,
	[MachineSource] [varchar](64) NULL,
	[SupplierInvoiceNo] [varchar](32) NULL,
	[FileName] [varchar](255) NULL,
 CONSTRAINT [PK_IMPORTJOBS] PRIMARY KEY CLUSTERED 
(
	[ImportJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InitiatorPatternMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InitiatorPatternMapping](
	[InitiatorMappingID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[InitiatorPattern] [varchar](100) NOT NULL,
	[ToEquipmentTypeID] [int] NOT NULL,
	[Remarks] [varchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_INITIATOR_PATTERN_MAPPING] PRIMARY KEY CLUSTERED 
(
	[InitiatorMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InmarsatInvoice]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InmarsatInvoice](
	[LineNo] [int] NULL,
	[DPName] [varchar](100) NULL,
	[DPID] [int] NULL,
	[InvoiceId] [varchar](100) NULL,
	[Invoicedate] [varchar](50) NULL,
	[ProcessMonth] [varchar](50) NULL,
	[ChargeGroup] [varchar](100) NULL,
	[Product] [varchar](50) NULL,
	[PPID] [varchar](50) NULL,
	[PkgPlan] [varchar](100) NULL,
	[RPID] [varchar](50) NULL,
	[RatePlan] [varchar](100) NULL,
	[PromotionID] [varchar](50) NULL,
	[PromotionName] [varchar](100) NULL,
	[TerminalGroupID] [varchar](50) NULL,
	[TerminalGroup] [varchar](100) NULL,
	[ContractStartDate] [varchar](50) NULL,
	[ContractEndDate] [varchar](50) NULL,
	[IMSI] [varchar](50) NULL,
	[MSISDN] [varchar](50) NULL,
	[SCAPID] [varchar](50) NULL,
	[Service] [varchar](100) NULL,
	[CallDirection] [varchar](100) NULL,
	[APNGroup] [varchar](256) NULL,
	[IPGroup] [varchar](50) NULL,
	[BitRate] [varchar](100) NULL,
	[TerminatingRegion] [varchar](100) NULL,
	[EventCount] [int] NULL,
	[TrafficUnitofMeasure] [varchar](50) NULL,
	[TrafficCU] [varchar](100) NULL,
	[INOUTAllowance] [varchar](50) NULL,
	[RatingUnit] [varchar](50) NULL,
	[RatingCU] [varchar](50) NULL,
	[BaseCharge] [money] NULL,
	[Promo] [varchar](50) NULL,
	[Adjustment] [varchar](max) NULL,
	[USValue] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InmarsatSIMInfo]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[InvoiceDeliveries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[InvoiceItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceItems](
	[InvoiceItemID] [int] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[TariffTypeID] [int] NULL,
	[TariffCategoryID] [int] NULL,
	[ClientEquipmentId] [int] NOT NULL,
	[ChargeUnitID] [int] NULL,
	[LineItemNumber] [int] NULL,
	[ProRata] [bit] NOT NULL CONSTRAINT [DF_InvoiceItems_ProRata]  DEFAULT ((0)),
	[ItemPeriodStartDate] [datetime] NULL,
	[ItemPeriodEndDate] [datetime] NULL,
	[Quantity] [dbo].[bigmoney] NULL,
	[AmountPerUnit] [money] NULL,
	[TotalAmount] [dbo].[bigmoney] NULL,
	[ItemDescription] [varchar](max) NULL,
	[Editable] [bit] NOT NULL CONSTRAINT [DF__InvoiceIt__Edita__08411774]  DEFAULT ((0)),
	[LedgerCode] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Notes] [varchar](max) NULL,
	[EquipmentTypeID] [int] NULL,
	[RefInvoiceItemID] [int] NULL,
 CONSTRAINT [PK_INVOICEITEMS] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceNumbers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceNumbers](
	[InvoiceNumberId] [int] NOT NULL,
	[InvoiceNumber] [varchar](20) NOT NULL,
	[TemplateCode] [varchar](2) NOT NULL,
	[CycleCode] [varchar](4) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_InvoiceNumbers] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoicePDFCopy]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoicePDFCopy](
	[InvoiceId] [int] NOT NULL,
	[InvoiceNumber] [varchar](20) NULL,
	[InvoicePath] [varchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CopyStatus] [int] NOT NULL,
	[ErrorMessage] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceRuleItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceRuleItems](
	[InvoiceRuleItemID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[InvoiceRuleID] [int] NOT NULL,
	[ClientEquipmentID] [int] NULL,
	[EquipmentTypeID] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_INVOICERULEITEMS] PRIMARY KEY CLUSTERED 
(
	[InvoiceRuleItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceRules]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceRules](
	[InvoiceRuleID] [int] NOT NULL,
	[InvoiceAddressId] [int] NULL,
	[SchemeTypeID] [int] NOT NULL,
	[BillingCycleID] [int] NOT NULL,
	[BillingEntityID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[PaymentTermId] [int] NULL,
	[AltCurrencyId] [int] NULL,
	[BPCodeID] [int] NULL,
	[MailToAddressId] [int] NULL,
	[TaxId] [int] NULL,
	[InvoiceTemplateCode] [varchar](2) NULL,
	[Name] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[CreditCardRef] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[CreditCardID] [int] NULL,
	[PurchaseOrderId] [varchar](50) NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_INVOICERULES] PRIMARY KEY CLUSTERED 
(
	[InvoiceRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceSent]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceSent](
	[InvoiceSentId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[InvoiceDeliveryId] [int] NOT NULL,
	[EmailSentDate] [datetime] NULL,
	[EmailErrorMessage] [varchar](max) NULL,
	[FtpSentDate] [datetime] NULL,
	[FtpErrorMessage] [varchar](max) NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[MailQueueItemId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceSentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceTypes](
	[InvoiceTypeID] [int] NOT NULL,
	[InvoiceTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_INVOICETYPES] PRIMARY KEY CLUSTERED 
(
	[InvoiceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IridiumANDIOPSIM]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IridiumANDIOPSIM](
	[ICCID] [varchar](32) NULL,
	[MSISDN1] [varchar](32) NULL,
	[MSISDN2] [varchar](32) NULL,
	[MSISDN3] [varchar](32) NULL,
	[IMSI] [varchar](32) NULL,
	[Vessel] [varchar](128) NULL,
	[ActivationDate] [datetime] NULL,
	[PlanPackage] [varchar](128) NULL,
	[OldIP] [varchar](32) NULL,
	[NewIP] [varchar](32) NULL,
	[CreatedBy] [varchar](16) NULL,
	[IridiumContractID] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IridiumPrepaidSIMs]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IridiumPrepaidSIMs](
	[MSISDN] [varchar](32) NULL,
	[IMSI] [varchar](32) NULL,
	[ICCID] [varchar](32) NULL,
	[CreatedBy] [varchar](16) NULL,
	[ActivationDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[UnitBalance] [money] NULL,
	[ServiceType] [varchar](32) NULL,
	[SPAlert] [bit] NULL,
	[Status] [varchar](16) NULL,
	[Language] [varchar](16) NULL,
	[CO_ID] [varchar](16) NULL,
	[ReportDate] [datetime] NULL,
	[IsPrepaid] [bit] NULL,
	[FileName] [varchar](512) NULL,
	[CompanyName] [varchar](50) NULL,
	[FKSubscriberEquipmentID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[UnitsExp] [money] NULL,
	[ExpDate] [datetime] NULL,
	[Serials] [varchar](512) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IRPLUSONEFIX]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IRPLUSONEFIX](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](100) NULL,
	[BillingCycleName] [varchar](100) NULL,
	[ParentName] [varchar](100) NULL,
	[Identifier] [varchar](100) NULL,
	[CesStartDate] [datetime] NULL,
	[CesEndDate] [datetime] NULL,
	[LCDCeaID] [int] NULL,
	[ActionTypeID] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[ActionDate] [datetime] NULL,
	[Info] [varchar](100) NULL,
	[PaLcdCeaID] [int] NULL,
	[PaActionTypeID] [int] NULL,
	[PaEffectiveDate] [datetime] NULL,
	[PaActionDate] [datetime] NULL,
	[PaInfo] [varchar](100) NULL,
	[ClientID] [int] NULL,
	[BillingCycleID] [int] NULL,
	[TopClientID] [int] NULL,
	[ClientEquipmentID] [int] NULL,
	[ParentID] [int] NULL,
	[CesId] [int] NULL,
	[BillingSchemeID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KEYS]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KEYS](
	[TABLENAME] [varchar](256) NOT NULL,
	[LAST_KEY] [int] NOT NULL,
	[LAST_USED] [datetime] NOT NULL,
 CONSTRAINT [PK_KEYS] PRIMARY KEY CLUSTERED 
(
	[TABLENAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KEYSBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KEYSBUP](
	[TABLENAME] [varchar](256) NOT NULL,
	[LAST_KEY] [int] NOT NULL,
	[LAST_USED] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KTCDRPROD]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KTCDRPROD](
	[FileName] [varchar](255) NULL,
	[EquipmentTypeName] [varchar](256) NULL,
	[Divisor] [dbo].[bigmoney] NOT NULL,
	[CdrTypeName] [varchar](255) NOT NULL,
	[CdrID] [int] NOT NULL,
	[CountryNetworkID] [int] NULL,
	[ParentID] [int] NULL,
	[CdrTypeID] [int] NOT NULL,
	[ImportJobID] [int] NOT NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CountryID] [int] NULL,
	[ChargeUnitId] [int] NULL,
	[Initiator] [varchar](50) NOT NULL,
	[CalledTo] [varchar](50) NOT NULL,
	[CallDuration] [decimal](38, 12) NULL,
	[UpstreamVolume] [decimal](19, 6) NULL,
	[UpStreamRate] [decimal](18, 5) NULL,
	[DownstreamVolume] [decimal](19, 6) NULL,
	[DownstreamRate] [decimal](18, 0) NULL,
	[Unit] [varchar](50) NULL,
	[CallDateTime] [datetime] NOT NULL,
	[RawInitiatorCountry] [varchar](64) NULL,
	[RawCalledToCountry] [varchar](64) NULL,
	[ServiceCode] [varchar](50) NULL,
	[TimeZoneIndicator] [varchar](6) NULL,
	[LineNoInSourceFile] [int] NOT NULL,
	[Info] [varchar](500) NULL,
	[Status] [int] NOT NULL,
	[CalculationStatus] [int] NULL,
	[Rate] [money] NULL,
	[Cost] [dbo].[bigmoney] NULL,
	[VendorReference] [varchar](256) NULL,
	[OceanRegion] [varchar](4) NULL,
	[Description] [varchar](500) NULL,
	[PartialRecordIndicator] [char](2) NULL,
	[CallEndDatetime] [datetime] NULL,
	[CallForwarding] [varchar](50) NULL,
	[Debug] [varchar](100) NULL,
	[APN] [varchar](256) NULL,
	[DateCreated] [datetime] NULL,
	[FleetOneCountryId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ledgers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ledgers](
	[LedgerID] [int] NOT NULL,
	[LedgerCode] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[Description] [varchar](max) NULL,
	[SAPAccountCode] [varchar](50) NULL,
 CONSTRAINT [PK_LEDGERS] PRIMARY KEY CLUSTERED 
(
	[LedgerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginPermissionAssigned]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginPermissionAssigned](
	[LoginPermissionAssignID] [int] NOT NULL,
	[LoginRoleID] [int] NOT NULL,
	[LoginPermissionTypeID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ASSIGNEDPERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[LoginPermissionAssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginPermissionTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginPermissionTypes](
	[LoginPermissionTypeID] [int] NOT NULL,
	[PermissionTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PERMISSIONTYPES] PRIMARY KEY CLUSTERED 
(
	[LoginPermissionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginRoleAssigned]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginRoleAssigned](
	[LoginRoleAssignID] [int] NOT NULL,
	[LoginID] [int] NOT NULL,
	[LoginRoleID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_LoginRoleAssigned] PRIMARY KEY CLUSTERED 
(
	[LoginRoleAssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginRoles]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginRoles](
	[LoginRoleID] [int] NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_LoginRoles] PRIMARY KEY CLUSTERED 
(
	[LoginRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logins](
	[LoginID] [int] NOT NULL,
	[UserID] [int] NULL,
	[LoginName] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FriendlyName] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ResetPasswordCode] [varchar](50) NULL,
	[ResetPasswordSent] [datetime] NULL,
	[LoginStatus] [int] NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_LOGINS] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MailQueueItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MailQueueItems](
	[MailQueueItemId] [int] NOT NULL,
	[FromAddress] [varchar](500) NULL,
	[ToAddress] [varchar](500) NULL,
	[ReplyToAddress] [varchar](500) NULL,
	[CcAddress] [varchar](500) NULL,
	[BccAddress] [varchar](500) NULL,
	[Subject] [nvarchar](500) NULL,
	[BodyMessage] [nvarchar](max) NULL,
	[Attachment] [varchar](max) NULL,
	[MimeType] [varchar](50) NULL,
	[ZipFileName] [varchar](500) NULL,
	[Status] [int] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[DeletedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MailQueueItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsgDat]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsgDat](
	[MSGDATID] [int] IDENTITY(1,1) NOT NULL,
	[ACCOUNT] [varchar](30) NULL,
	[INSTALLID] [varchar](8) NULL,
	[CALLID] [float] NULL,
	[UTC] [varchar](14) NULL,
	[RECP_COUNT] [float] NULL,
	[PRIORITY] [varchar](1) NULL,
	[MSG_SOURCE] [varchar](1) NULL,
	[ORIGINATOR] [varchar](200) NULL,
	[RECIPIENT] [varchar](200) NULL,
	[SUBJECT] [varchar](80) NULL,
	[DCLASS] [varchar](6) NULL,
	[SIZE] [float] NULL,
	[ZIPPED] [float] NULL,
	[COST] [float] NULL,
	[ACC_MAIN] [varchar](20) NULL,
	[ACC_SUB1] [varchar](20) NULL,
	[GW_SERVICE] [varchar](3) NULL,
	[GW_UTC_SUB] [varchar](14) NULL,
	[GW_SIZE] [float] NULL,
	[GW_IDA] [varchar](64) NULL,
	[GW_IDB] [varchar](64) NULL,
	[GW_EXTENT] [float] NULL,
	[GWPROVIDER] [varchar](10) NULL,
	[GW_STATUS] [varchar](4) NULL,
	[GW_AB] [varchar](30) NULL,
	[CDRID] [int] NULL,
 CONSTRAINT [PK_MsgDat] PRIMARY KEY CLUSTERED 
(
	[MSGDATID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MTSDIRDB]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MTSDIRDB](
	[ACCOUNT] [varchar](64) NULL,
	[CNT_IPM] [float] NULL,
	[SIZE] [float] NULL,
	[CONNECT] [varchar](14) NULL,
	[LOCATION] [varchar](30) NULL,
	[OUTLOOK] [varchar](20) NULL,
	[SW_VER] [varchar](20) NULL,
	[DISPLAY] [varchar](128) NULL,
	[PASSWORD] [varchar](40) NULL,
	[TERM_TYPE] [varchar](26) NULL,
	[OBJECT] [varchar](1) NULL,
	[ALT_RECIP] [varchar](254) NULL,
	[ADDRESS] [varchar](100) NULL,
	[RULES] [varchar](40) NULL,
	[CREATED] [varchar](14) NULL,
	[DEACTIVEDATE] [varchar](14) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NumberTemplates]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumberTemplates](
	[NumberTemplateId] [int] NOT NULL,
	[TemplateCode] [varchar](2) NOT NULL,
	[RunningDigit] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_NUMBERTEMPLATES] PRIMARY KEY NONCLUSTERED 
(
	[NumberTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OceanRegions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OceanRegions](
	[OceanRegionCode] [varchar](4) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_OCEANREGIONS] PRIMARY KEY CLUSTERED 
(
	[OceanRegionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentTerms]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentTerms](
	[PaymentTermID] [int] NOT NULL,
	[TermName] [varchar](50) NOT NULL,
	[TermDescription] [varchar](250) NULL,
	[TermDays] [int] NULL,
	[IsDefault] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PAYMENTTERMS] PRIMARY KEY CLUSTERED 
(
	[PaymentTermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[BillingSchemeID] [int] NOT NULL,
	[FeeProfileID] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[StartDateAvailable] [datetime] NULL,
	[EndDateAvailable] [datetime] NULL,
	[ProductName] [varchar](500) NULL,
	[SABACode] [varchar](50) NULL,
	[SAPCode] [varchar](50) NULL,
	[RequireStock] [bit] NULL,
	[ProviderPackageRatePlanID] [int] NOT NULL,
 CONSTRAINT [PK__Products__4AEDF071] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductsTemporaryConsolidation]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductsTemporaryConsolidation](
	[SABACode] [varchar](50) NOT NULL,
	[ProviderPackageRatePlanId] [int] NULL,
	[pprpPackageName] [varchar](max) NULL,
	[pprpPackageDefinition] [varchar](max) NULL,
	[pprpPackageId] [varchar](max) NULL,
	[pprpRatePlanName] [varchar](max) NULL,
	[pprpRatePlanId] [varchar](max) NULL,
	[stpPackageDefinition] [varchar](max) NULL,
	[stpPackagePlanId] [varchar](max) NULL,
	[stpRatePlanPackageId] [varchar](max) NULL,
	[stpEquipmentName] [varchar](max) NULL,
	[stpSchemeName] [varchar](max) NULL,
	[stpTemplateName] [varchar](max) NULL,
	[gnProductName] [varchar](max) NULL,
	[gnProductId] [varchar](max) NULL,
	[gnProductGroupId] [varchar](max) NULL,
	[gnAvailable] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyTypeGroups]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyTypeGroups](
	[PropertyTypeGroupID] [int] NOT NULL,
	[PropertyTypeGroupName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROPERTYTYPEGROUPS] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyTypes](
	[PropertyTypeID] [int] NOT NULL,
	[PropertyTypeGroupID] [int] NOT NULL,
	[PropertyTypeName] [varchar](100) NOT NULL,
	[IsNumeric] [bit] NULL,
	[DataType] [varchar](50) NULL,
	[ActualDataType] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[ValuesAllowable] [varchar](max) NULL,
	[ValueValidation] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[IsInitiator] [bit] NULL,
 CONSTRAINT [PK_PROPERTYTYPES] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderLogins]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderLogins](
	[ProviderLoginID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[LoginName] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERLOGINS] PRIMARY KEY CLUSTERED 
(
	[ProviderLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessageAudit]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessageAudit](
	[ProviderMessageAuditID] [int] NOT NULL,
	[AuditProviderMessageID] [int] NOT NULL,
	[AuditProviderPackageID] [int] NOT NULL,
	[AuditProviderPackageActionTypeID] [int] NOT NULL,
	[AuditStatus] [int] NOT NULL,
	[AuditDateCreated] [datetime] NOT NULL,
	[AuditDateModified] [datetime] NOT NULL,
	[AuditDateDeleted] [datetime] NULL,
	[AuditCreatedBy] [varchar](50) NOT NULL,
	[AuditModifiedBy] [varchar](50) NOT NULL,
	[AuditClientEquipmentID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEAUDIT] PRIMARY KEY CLUSTERED 
(
	[ProviderMessageAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessageError]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessageError](
	[ProviderMessageErrorID] [int] NOT NULL,
	[ProviderMessageID] [int] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[ErrorType] [char](3) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEERROR] PRIMARY KEY CLUSTERED 
(
	[ProviderMessageErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessageErrorHistory]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessageErrorHistory](
	[ProviderMessageErrorHistoryId] [int] NOT NULL,
	[ArchivedProviderMessageErrorID] [int] NOT NULL,
	[ArchivedProviderMessageID] [int] NOT NULL,
	[ArchivedMessage] [varchar](max) NOT NULL,
	[ArchivedErrorType] [char](3) NOT NULL,
	[ArchivedDateCreated] [datetime] NOT NULL,
	[ArchivedDateModified] [datetime] NOT NULL,
	[ArchivedDateDeleted] [datetime] NULL,
	[ArchivedCreatedBy] [varchar](50) NOT NULL,
	[ArchivedModifiedBy] [varchar](50) NOT NULL,
	[ArchivedDeletedBy] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEERRORHISTORY] PRIMARY KEY CLUSTERED 
(
	[ProviderMessageErrorHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessageHistory]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessageHistory](
	[ProviderMessageHistoryID] [int] NOT NULL,
	[ArchivedProviderMessageID] [int] NOT NULL,
	[ArchivedProviderPackageID] [int] NOT NULL,
	[ArchivedProviderPackageActionTypeID] [int] NOT NULL,
	[ArchivedStatus] [int] NOT NULL,
	[ArchivedDateCreated] [datetime] NOT NULL,
	[ArchivedDateModified] [datetime] NOT NULL,
	[ArchivedDateDeleted] [datetime] NULL,
	[ArchivedCreatedBy] [varchar](50) NOT NULL,
	[ArchivedModifiedBy] [varchar](50) NOT NULL,
	[ArchivedClientEquipmentID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ArchivedProviderPackageRatePlanID] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEHISTORY] PRIMARY KEY CLUSTERED 
(
	[ProviderMessageHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessageProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessageProperties](
	[ProviderMessagePropertyID] [int] NOT NULL,
	[ProviderPackagePropertyID] [int] NOT NULL,
	[ProviderMessageID] [int] NOT NULL,
	[ValueSent] [varchar](max) NULL,
	[ValueReceived] [varchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ProviderMessagePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessagePropertyHistory]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderMessagePropertyHistory](
	[ProviderMessagePropertyHistoryID] [int] NOT NULL,
	[ArchivedProviderMessagePropertyID] [int] NOT NULL,
	[ArchivedProviderMessageID] [int] NOT NULL,
	[ArchivedProviderPackagePropertyId] [int] NOT NULL,
	[ArchivedValueSent] [varchar](max) NULL,
	[ArchivedValueReceived] [varchar](max) NULL,
	[ArchivedDateCreated] [datetime] NOT NULL,
	[ArchivedCreatedBy] [varchar](50) NOT NULL,
	[ArchivedDateModified] [datetime] NOT NULL,
	[ArchivedUpdatedBy] [varchar](50) NOT NULL,
	[ArchivedDateDeleted] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERMESSAGEPROPERTYHIST] PRIMARY KEY CLUSTERED 
(
	[ProviderMessagePropertyHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderMessages]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderMessages](
	[ProviderMessageID] [int] NOT NULL,
	[ProviderPackageID] [int] NOT NULL,
	[ProviderPackageActionTypeID] [int] NOT NULL,
	[ClientEquipmentID] [int] NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[ProviderPackageRatePlanID] [int] NOT NULL,
 CONSTRAINT [PK_PROVIDERMESSAGES] PRIMARY KEY CLUSTERED 
(
	[ProviderMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderPackageActionTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderPackageActionTypes](
	[ProviderPackageActionTypeId] [int] NOT NULL,
	[ActionTypeId] [int] NOT NULL,
	[ProviderPackageId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERPACKAGEACTIONTYPES] PRIMARY KEY CLUSTERED 
(
	[ProviderPackageActionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderPackageProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderPackageProperties](
	[ProviderPackagePropertyID] [int] NOT NULL,
	[ProviderPackageID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[Mandatory] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[PropagateToSaba] [int] NULL,
	[ScreenAttribute] [int] NULL,
	[DefaultValue] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[EquipmentTypePropertyID] [int] NULL,
 CONSTRAINT [PK_PROVIDERPACKAGEPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ProviderPackagePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderPackageRatePlans]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderPackageRatePlans](
	[ProviderPackageRatePlanID] [int] NOT NULL,
	[ProviderPackageID] [int] NOT NULL,
	[ExternalProviderPackageName] [varchar](250) NOT NULL,
	[ExternalProviderPackageDefinition] [varchar](100) NULL,
	[ExternalProviderPackageId] [varchar](100) NULL,
	[ExternalProviderRatePlanName] [varchar](250) NOT NULL,
	[ExternalProviderRatePlanId] [varchar](100) NULL,
	[ExternalProviderPackageType] [varchar](100) NULL,
	[ExternalProviderSubDivision] [varchar](100) NULL,
	[ExternalProviderDefaultPrePaidRatePlanName] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[AdditionalInfo1] [varchar](100) NULL,
	[AdditionalInfo2] [varchar](100) NULL,
	[AdditionalInfo3] [varchar](100) NULL,
	[AdditionalInfo4] [varchar](100) NULL,
	[AdditionalInfo5] [varchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ProviderPackageRatePlans] PRIMARY KEY CLUSTERED 
(
	[ProviderPackageRatePlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderPackages]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderPackages](
	[ProviderPackageID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ProviderPackageName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[ExternalPackageId] [varchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERPACKAGES] PRIMARY KEY CLUSTERED 
(
	[ProviderPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDERS] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderScheduledMaintenancePlans]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderScheduledMaintenancePlans](
	[ProviderScheduledMaintenancePlanID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ScheduledMaintenanceStart] [datetime] NOT NULL,
	[ScheduledMaintenanceEnd] [datetime] NOT NULL,
	[Active] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PROVIDER_SCHEDULED_MAINTENANCE_PLANS] PRIMARY KEY CLUSTERED 
(
	[ProviderScheduledMaintenancePlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrderProperties](
	[PurchaseOrderPropertyId] [int] NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[PurchaseOrderNumber] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_PURCHASEORDERPROPERTIES] PRIMARY KEY NONCLUSTERED 
(
	[PurchaseOrderPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderId] [int] NOT NULL,
	[ProfileName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Query]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Query](
	[ACCOUNT] [varchar](30) NULL,
	[INSTALLID] [varchar](8) NULL,
	[CALLID] [float] NULL,
	[UTC] [varchar](14) NULL,
	[RECP_COUNT] [float] NULL,
	[PRIORITY] [varchar](1) NULL,
	[MSG_SOURCE] [varchar](1) NULL,
	[ORIGINATOR] [varchar](200) NULL,
	[RECIPIENT] [varchar](200) NULL,
	[SUBJECT] [varchar](80) NULL,
	[DCLASS] [varchar](6) NULL,
	[SIZE] [float] NULL,
	[ZIPPED] [float] NULL,
	[COST] [float] NULL,
	[ACC_MAIN] [varchar](20) NULL,
	[ACC_SUB1] [varchar](20) NULL,
	[GW_SERVICE] [varchar](3) NULL,
	[GW_UTC_SUB] [varchar](14) NULL,
	[GW_SIZE] [float] NULL,
	[GW_IDA] [varchar](64) NULL,
	[GW_IDB] [varchar](64) NULL,
	[GW_EXTENT] [float] NULL,
	[GWPROVIDER] [varchar](10) NULL,
	[GW_STATUS] [varchar](4) NULL,
	[GW_AB] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegionCountries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionCountries](
	[RegionCountryID] [int] NOT NULL,
	[GeographicRegionID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_REGIONCOUNTRIES] PRIMARY KEY CLUSTERED 
(
	[RegionCountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regions]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionID] [char](2) NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_REGIONS] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportId] [int] NOT NULL,
	[ReportName] [varchar](100) NOT NULL,
	[Locking] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_REPORTS] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Revenues]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Revenues](
	[RevenueID] [int] NOT NULL,
	[RevenueName] [varchar](32) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_REVENUES] PRIMARY KEY CLUSTERED 
(
	[RevenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RunningNumbers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RunningNumbers](
	[RunningNumberId] [int] NOT NULL,
	[NumberTemplateId] [int] NOT NULL,
	[LastValue] [int] NOT NULL,
	[CycleCode] [varchar](4) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_RunningNumbers] PRIMARY KEY CLUSTERED 
(
	[RunningNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SabaUpdateLog]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SabaUpdateLog](
	[CeID] [int] NULL,
	[CeaID] [int] NULL,
	[CecID] [int] NULL,
	[NewCeID] [int] NULL,
	[Identifier] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[ActionDate] [datetime] NULL,
	[CreatedBy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesPersons]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesPersons](
	[SalesPersonID] [int] NOT NULL,
	[UserID] [int] NULL,
	[SalesPersonTypeID] [int] NULL,
	[Email] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[HiredDate] [datetime] NULL,
	[ResignDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SALESPERSONS] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesPersonTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesPersonTypes](
	[SalesPersonTypeID] [int] NOT NULL,
	[SalesPersonTypeName] [varchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SalesPersonType] PRIMARY KEY CLUSTERED 
(
	[SalesPersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaleSupports]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleSupports](
	[SaleSupportID] [int] NOT NULL,
	[DivisionID] [int] NOT NULL,
	[RegionID] [char](2) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SALESUPPORTS] PRIMARY KEY CLUSTERED 
(
	[SaleSupportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAPBPCode]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAPBPCode](
	[DB] [varchar](20) NULL,
	[BPCode] [varchar](255) NULL,
	[BPName] [varchar](255) NULL,
	[SalesPerson] [varchar](255) NULL,
	[Division] [varchar](10) NULL,
	[Region] [varchar](10) NULL,
	[GroupName] [varchar](255) NULL,
	[Territory] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchemeTariffs]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchemeTariffs](
	[SchemeTariffID] [int] NOT NULL,
	[TariffTypeID] [int] NOT NULL,
	[BillingSchemeID] [int] NOT NULL,
	[Tariff] [money] NULL,
	[TariffRatio] [money] NULL,
	[ImpliedTariff] [money] NULL,
	[InclusiveType] [int] NOT NULL,
	[AmountUpTo] [money] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SCHEMETARIFFS] PRIMARY KEY CLUSTERED 
(
	[SchemeTariffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchemeTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchemeTypes](
	[SchemeTypeID] [int] NOT NULL,
	[SchemeTypeName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SCHEMETYPES] PRIMARY KEY CLUSTERED 
(
	[SchemeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SepiPropertyTypeValueMappings]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SepiPropertyTypeValueMappings](
	[PropertyTypeID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ValuesAllowable] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_SepiPropertyTypeValueMappings] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SimMoveLog]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SimMoveLog](
	[ClientEquipmentID] [int] NULL,
	[OldClientID] [int] NULL,
	[NewClientID] [int] NULL,
	[Msg] [varchar](100) NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockItemProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockItemProperties](
	[StockItemPropertyID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_STOCKTITEM_PROPERTIES] PRIMARY KEY CLUSTERED 
(
	[StockItemPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockItems](
	[StockItemID] [int] NOT NULL,
	[StockTypeID] [int] NOT NULL,
	[Identifier] [varchar](100) NOT NULL,
	[IdentifierTypeID] [int] NOT NULL,
	[ClientEquipmentID] [int] NULL,
	[MoveOutDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_STOCKTITEMS] PRIMARY KEY CLUSTERED 
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockTypeFieldMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockTypeFieldMapping](
	[StockTypeMappingID] [int] NOT NULL,
	[StockTypeID] [int] NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[ColumnIndex] [int] NOT NULL,
	[MainIdentifier] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_STOCK_TYPE_FIELD_MAPPING] PRIMARY KEY CLUSTERED 
(
	[StockTypeMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockTypes](
	[StockTypeID] [int] NOT NULL,
	[StockTypeName] [varchar](100) NOT NULL,
	[ImportClassName] [varchar](200) NOT NULL,
	[CreationClassName] [varchar](200) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[EquipmentTypeID] [int] NULL,
 CONSTRAINT [PK_STOCKTYPES] PRIMARY KEY CLUSTERED 
(
	[StockTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STP_ClientSchemes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STP_ClientSchemes](
	[ClientSchemeId] [int] NOT NULL,
	[SchemeName] [varchar](255) NULL,
	[GNCode] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STPCdr]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STPCdr](
	[ID] [int] NOT NULL,
	[ImportjobId] [int] NOT NULL,
	[Initiator] [varchar](max) NOT NULL,
	[Calledto] [varchar](max) NULL,
	[CallDatetime] [datetime] NOT NULL,
	[InvvoiceJobId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STPInvoiceDelivery]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STPInvoiceDelivery](
	[SubscriberId] [int] NULL,
	[SubscriberName] [varchar](1000) NULL,
	[ClientId] [int] NULL,
	[ClientName] [varchar](1000) NULL,
	[AutomatedEmailID] [int] NULL,
	[ProfileName] [varchar](1000) NULL,
	[EmailAddresses] [varchar](4000) NULL,
	[DOC] [int] NULL,
	[PDF] [int] NULL,
	[CSV] [int] NULL,
	[MRC] [int] NULL,
	[HMCMail] [int] NULL,
	[FTPPDF] [int] NULL,
	[FTPCSV] [int] NULL,
	[FTPMRC] [int] NULL,
	[FTPHMCMail] [int] NULL,
	[FTPUser] [varchar](100) NULL,
	[SABAInvoiceRuleId] [int] NULL,
	[deleted] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STPMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STPMapping](
	[TableName] [varchar](50) NULL,
	[STPKey] [int] NULL,
	[SABAKey] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemStatus]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemStatus](
	[SystemStatusId] [int] NOT NULL,
	[SystemName] [varchar](50) NOT NULL,
	[StateName] [varchar](250) NOT NULL,
	[StateId] [int] NOT NULL,
	[StateDescription] [varchar](max) NULL,
 CONSTRAINT [PK_SYSTEMSTATUS] PRIMARY KEY CLUSTERED 
(
	[SystemStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TariffCategories]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TariffCategories](
	[TariffCategoryID] [int] NOT NULL,
	[TariffCategoryName] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_TARIFFCATEGORY] PRIMARY KEY CLUSTERED 
(
	[TariffCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TariffLedgers]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TariffLedgers](
	[TariffLedgerID] [int] NOT NULL,
	[LedgerID] [int] NOT NULL,
	[TariffTypeID] [int] NOT NULL,
	[Division] [int] NOT NULL,
	[Region] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_TARIFFLEDGER] PRIMARY KEY CLUSTERED 
(
	[TariffLedgerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TariffTypeProperties]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TariffTypeProperties](
	[TariffTypePropertyID] [int] NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[TariffTypeID] [int] NOT NULL,
	[PropertyValue] [varchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_TARIFFTYPEPROPERTIES] PRIMARY KEY CLUSTERED 
(
	[TariffTypePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TariffTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TariffTypes](
	[TariffTypeID] [int] NOT NULL,
	[CalculationRuleID] [int] NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CallFromRegionID] [int] NULL,
	[ChargeUnitID] [int] NOT NULL,
	[TariffCategoryID] [int] NOT NULL,
	[CallToRegionID] [int] NULL,
	[IncrementUnitID] [int] NULL,
	[TariffTypeName] [varchar](255) NOT NULL,
	[TariffTypeAlias] [varchar](255) NULL,
	[Minimum] [dbo].[bigmoney] NULL,
	[Increment] [dbo].[bigmoney] NULL,
	[MajorTypeID] [int] NULL,
	[SubTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_TARIFFTYPES] PRIMARY KEY CLUSTERED 
(
	[TariffTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TariffTypesBUP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TariffTypesBUP](
	[TariffTypeID] [int] NOT NULL,
	[CalculationRuleID] [int] NULL,
	[AirtimeProviderID] [int] NOT NULL,
	[CallFromRegionID] [int] NULL,
	[ChargeUnitID] [int] NOT NULL,
	[TariffCategoryID] [int] NOT NULL,
	[CallToRegionID] [int] NULL,
	[IncrementUnitID] [int] NULL,
	[TariffTypeName] [varchar](255) NOT NULL,
	[TariffTypeAlias] [varchar](255) NULL,
	[Minimum] [dbo].[bigmoney] NULL,
	[Increment] [dbo].[bigmoney] NULL,
	[MajorTypeID] [int] NULL,
	[SubTypeID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Taxes](
	[TaxId] [int] NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[TaxCode] [varchar](20) NOT NULL,
	[Percentage] [money] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Taxes] PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TechnicalSupports]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TechnicalSupports](
	[TechnicalSupportID] [int] NOT NULL,
	[TechnicalName] [varchar](50) NULL,
	[TelephoneNumber] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[TollFree] [varchar](50) NULL,
	[RAK] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_TECHNICALSUPPORTS] PRIMARY KEY CLUSTERED 
(
	[TechnicalSupportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempBP]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempBP](
	[DB] [varchar](255) NULL,
	[BPCodeOld] [varchar](255) NULL,
	[Prefix] [varchar](255) NULL,
	[BPCode] [varchar](255) NULL,
	[BPName] [varchar](255) NULL,
	[SalesPerson] [varchar](255) NULL,
	[Division] [int] NULL,
	[Region] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempBPCodes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempBPCodes](
	[BPCode] [varchar](255) NULL,
	[BPName] [varchar](255) NULL,
	[SalesPerson] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[Region] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserBranchOffices]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBranchOffices](
	[UserBranchOfficeID] [int] NOT NULL,
	[BranchOfficeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_USERBRANCHOFFICES] PRIMARY KEY CLUSTERED 
(
	[UserBranchOfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[UserName] [varchar](255) NULL,
	[FriendlyName] [varchar](128) NULL,
	[Initials] [varchar](12) NULL,
	[AddressID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[SMTPAddress] [varchar](250) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WatchDeliveries]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDeliveries](
	[WatchDeliveryId] [int] NOT NULL,
	[CDRWatchId] [int] NOT NULL,
	[DeliveryId] [int] NOT NULL,
	[WarningPercentage] [decimal](5, 2) NULL CONSTRAINT [DF_WatchDeliveries_WarningPercentage]  DEFAULT ((85)),
	[IntervalPercentage] [decimal](5, 2) NULL CONSTRAINT [DF_WatchDeliveries_IntervalPercentage]  DEFAULT ((10)),
	[SentThreshold] [money] NULL,
	[SentBalance] [money] NULL,
	[SentStartDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DeletedBy] [int] NULL,
	[SentExpiryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WatchDeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[x_ErrorLog]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[ErrorNumber] [varchar](30) NOT NULL,
	[ErrorSeverity] [varchar](30) NOT NULL,
	[ErrorState] [varchar](30) NOT NULL,
	[ErrorProcedure] [varchar](30) NOT NULL,
	[ErrorLine] [varchar](30) NOT NULL,
	[ErrorMessage] [varchar](200) NOT NULL,
	[ErrorDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SYSERRORLOG] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[GNProductRatePlans]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[GNProductRatePlans](
	[GNProductRatePlanID] [int] IDENTITY(1,1) NOT NULL,
	[GNProductID] [int] NOT NULL,
	[RPID] [int] NOT NULL,
	[FeeProfileID] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[OrderBy] [tinyint] NOT NULL DEFAULT ((0)),
	[SABACodePrefix] [varchar](32) NULL,
	[SABACodePostfix] [varchar](32) NULL,
 CONSTRAINT [PK_GNProductRatePlanID] PRIMARY KEY CLUSTERED 
(
	[GNProductRatePlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[ItemMapping]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quote].[ItemMapping](
	[ItemMappingID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeItemID] [int] NULL,
	[TariffTypeID] [int] NULL,
	[FreeCall] [bit] NULL,
 CONSTRAINT [PK_ItemMappingID] PRIMARY KEY CLUSTERED 
(
	[ItemMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [quote].[MarginTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[MarginTypes](
	[MarginTypeID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeID] [int] NOT NULL,
	[MarginTypeName] [varchar](250) NOT NULL,
	[DefaultValue] [decimal](15, 2) NOT NULL,
	[MinValue] [decimal](15, 2) NOT NULL,
	[MaxValue] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_MarginTypeID] PRIMARY KEY CLUSTERED 
(
	[MarginTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[QuotationItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[QuotationItems](
	[QuotationItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeItemID] [int] NOT NULL,
	[QuotationID] [int] NOT NULL,
	[RPID] [int] NOT NULL,
	[CostValue] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[MarginTypeID] [int] NULL,
	[Margin] [decimal](15, 2) NULL,
	[SaleValue] [varchar](50) NULL,
 CONSTRAINT [PK_QuotationItemID] PRIMARY KEY CLUSTERED 
(
	[QuotationItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[QuotationMargins]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quote].[QuotationMargins](
	[QuotationMarginID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationPackageID] [int] NOT NULL,
	[MarginTypeID] [int] NULL,
	[Margin] [decimal](15, 2) NULL,
 CONSTRAINT [PK_QuotationMarginID] PRIMARY KEY CLUSTERED 
(
	[QuotationMarginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [quote].[QuotationPackages]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[QuotationPackages](
	[QuotationPackageID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationID] [int] NOT NULL,
	[RPID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[BillingSchemeName] [varchar](500) NULL,
 CONSTRAINT [PK_QuotationPackageID] PRIMARY KEY CLUSTERED 
(
	[QuotationPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[Quotations]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quote].[Quotations](
	[QuotationID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_QuotationID] PRIMARY KEY CLUSTERED 
(
	[QuotationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [quote].[QuotationTypeItems]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[QuotationTypeItems](
	[QuotationTypeItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeItemName] [varchar](max) NULL,
	[QuotationTypeID] [int] NOT NULL,
	[MarginTypeID] [int] NULL,
	[Header] [bit] NOT NULL DEFAULT ((0)),
	[IsVisible] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_QuotationTypeItemID] PRIMARY KEY CLUSTERED 
(
	[QuotationTypeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[QuotationTypeItemValues]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[QuotationTypeItemValues](
	[QuotationTypeItemValueID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeItemID] [int] NOT NULL,
	[RPID] [int] NOT NULL,
	[Value] [varchar](50) NULL,
	[InclusiveType] [int] NULL,
	[EquipmentTypeID] [int] NULL,
	[Multiplier] [int] NULL,
	[RateType] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
 CONSTRAINT [PK_QuotationTypeItemValueID] PRIMARY KEY CLUSTERED 
(
	[QuotationTypeItemValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [quote].[QuotationTypes]    Script Date: 3/22/2016 1:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [quote].[QuotationTypes](
	[QuotationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationTypeName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_QuotationTypeID] PRIMARY KEY CLUSTERED 
(
	[QuotationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
