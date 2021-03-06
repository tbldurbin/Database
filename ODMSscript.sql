USE [master]
GO
/****** Object:  Database [ODMS]    Script Date: 20-Aug-2018 9:40:13 PM ******/
CREATE DATABASE [ODMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MStore', FILENAME = N'D:\All Excercies\ASP.Net\Database\ODMS.mdf' , SIZE = 55744KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MStore_log', FILENAME = N'D:\All Excercies\ASP.Net\Database\ODMS_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ODMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ODMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ODMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ODMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ODMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ODMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ODMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ODMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ODMS] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [ODMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ODMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ODMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ODMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ODMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ODMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ODMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ODMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ODMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ODMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ODMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ODMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ODMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ODMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ODMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ODMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ODMS] SET  MULTI_USER 
GO
ALTER DATABASE [ODMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ODMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ODMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ODMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ODMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ODMS]
GO
/****** Object:  User [ODMS]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE USER [ODMS] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DMS]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE USER [DMS] FOR LOGIN [DMS] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ODMS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ODMS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ODMS]
GO
ALTER ROLE [db_owner] ADD MEMBER [DMS]
GO
/****** Object:  UserDefinedFunction [dbo].[FunctionStringtoIntlist]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FunctionStringtoIntlist](@list as varchar(8000), @delim as varchar(10))
RETURNS @listTable table(
  Value INT
  )
AS
BEGIN
    --Declare helper to identify the position of the delim
    DECLARE @DelimPosition INT
    
    --Prime the loop, with an initial check for the delim
    SET @DelimPosition = CHARINDEX(@delim, @list)

    --Loop through, until we no longer find the delimiter
    WHILE @DelimPosition > 0
    BEGIN
        --Add the item to the table
        INSERT INTO @listTable(Value)
            VALUES(CAST(RTRIM(LEFT(@list, @DelimPosition - 1)) AS INT))
    
        --Remove the entry from the List
        SET @list = right(@list, len(@list) - @DelimPosition)

        --Perform position comparison
        SET @DelimPosition = CHARINDEX(@delim, @list)
    END

    --If we still have an entry, add it to the list
    IF len(@list) > 0
        insert into @listTable(Value)
        values(CAST(RTRIM(@list) AS INT))

  RETURN
END

GO
/****** Object:  Table [dbo].[status]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[status](
	[status_Id] [int] NOT NULL,
	[status_code] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_calendar]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_calendar](
	[id] [int] NOT NULL,
	[Date] [date] NULL,
	[ShortDate] [varchar](20) NULL,
	[DayNo] [int] NULL,
	[Weekdays] [varchar](20) NULL,
	[Month] [varchar](20) NULL,
	[MonthNo] [int] NULL,
	[Year] [int] NULL,
	[isHolyday] [int] NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_calendar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MainMenu]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MainMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuName] [varchar](50) NULL,
	[Controller] [varchar](50) NULL,
	[Action] [varchar](50) NULL,
	[sl] [int] NULL,
 CONSTRAINT [PK_tblMainMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Manu_Role_mapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Manu_Role_mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Roleid] [int] NOT NULL,
	[MainMenuid] [int] NOT NULL,
	[SubMenuid] [int] NOT NULL,
	[SubMenuSecondid] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Manu_Role_mapping] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbl_Manu_Role_mapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbl_Manu_Role_mapping] ON [dbo].[tbl_Manu_Role_mapping]
(
	[Roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubMenu]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [varchar](50) NULL,
	[Controller] [varchar](100) NULL,
	[Action] [varchar](100) NULL,
	[MainMenuId] [int] NULL,
	[sl] [int] NULL,
 CONSTRAINT [PK_tblSubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SubMenuSecond]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SubMenuSecond](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [varchar](50) NULL,
	[Controller] [varchar](100) NULL,
	[Action] [varchar](100) NULL,
	[SubMenuId] [int] NULL,
	[MainMenuId] [int] NULL,
	[sl] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_AdjustmentStock]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_AdjustmentStock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbid] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL CONSTRAINT [DF_tbld_AdjustmentStock_date]  DEFAULT (getdate()),
	[Syatemdate] [datetime2](7) NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_tbld_AdjustmentStock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbld_AdjustmentStockItem]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_AdjustmentStockItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[AdjustmentStockID] [int] NOT NULL,
	[SKUID] [int] NOT NULL,
	[BatchNo] [int] NULL,
	[PreviousQty] [int] NOT NULL,
	[CurrentQty] [int] NOT NULL,
	[AdjustedQty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbld_bundle_price]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_bundle_price](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_bundle_price_details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_bundle_price_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bundle_price_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[db_lifting_price] [float] NOT NULL,
	[outlet_lifting_price] [float] NOT NULL,
	[mrp] [float] NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbld_business_zone]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_business_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[biz_zone_name] [varchar](30) NOT NULL,
	[biz_zone_code] [varchar](30) NOT NULL,
	[biz_zone_description] [varchar](30) NOT NULL,
	[biz_zone_category_id] [int] NOT NULL,
	[parent_biz_zone_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_business_zone_hierarchy]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_business_zone_hierarchy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[biz_zone_category_name] [varchar](30) NOT NULL,
	[biz_zone_category_code] [varchar](30) NOT NULL,
	[biz_zone_category_description] [varchar](30) NOT NULL,
	[parent_category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [biz_zone_category_name] UNIQUE NONCLUSTERED 
(
	[biz_zone_category_name] ASC,
	[biz_zone_category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_cluster]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_cluster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_distribution_employee]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distribution_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_code] [varchar](30) NULL,
	[Name] [varchar](256) NULL,
	[Emp_address] [varchar](255) NULL,
	[User_role_id] [int] NULL,
	[DistributionId] [int] NULL,
	[login_user_id] [varchar](255) NULL,
	[login_user_password] [varchar](255) NULL,
	[contact_no] [varchar](255) NULL,
	[joining_date] [date] NULL,
	[designation] [varchar](255) NULL,
	[Emp_Type] [int] NULL,
	[d_o_b] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[emergency_contact_person] [varchar](255) NULL,
	[emergency_contact_number] [varchar](255) NULL,
	[educational_qualification] [varchar](255) NULL,
	[image] [varchar](100) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_tbld_distribution_employee] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tbld_distribution_employee]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_distribution_employee] ON [dbo].[tbld_distribution_employee]
(
	[DistributionId] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_distribution_employee_Type]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distribution_employee_Type](
	[EmpTypeid] [int] IDENTITY(1,1) NOT NULL,
	[EmpType] [varchar](50) NULL,
 CONSTRAINT [PK_tbld_distribution_employee_Type] PRIMARY KEY CLUSTERED 
(
	[EmpTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_distribution_house]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbld_distribution_house](
	[DB_Id] [int] IDENTITY(1,1) NOT NULL,
	[DBName] [varchar](50) NOT NULL,
	[DBCode] [varchar](50) NULL,
	[DBDescription] [text] NULL,
	[OfficeAddress] [nvarchar](max) NULL,
	[WarehouseAddress] [text] NULL,
	[OwnerName] [varchar](50) NULL,
	[OwnerMoble] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Cluster_id] [int] NOT NULL,
	[Zone_id] [int] NOT NULL,
	[PriceBuandle_id] [int] NOT NULL,
	[DeliveryModuleStatus] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[MV] [int] NULL,
	[NMV] [int] NULL,
	[LastReplacement] [datetime] NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_tbld_distribution_house] PRIMARY KEY CLUSTERED 
(
	[DB_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_distributor_Route]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distributor_Route](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteCode] [varchar](100) NOT NULL,
	[RouteName] [varchar](200) NOT NULL,
	[RouteType] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [int] NOT NULL,
	[DistributorID] [int] NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_tbld_distributor_Route] PRIMARY KEY NONCLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tbld_distributor_Route]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_distributor_Route] ON [dbo].[tbld_distributor_Route]
(
	[RouteID] ASC,
	[DistributorID] ASC,
	[RouteType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_distributor_RouteType]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distributor_RouteType](
	[RouteType] [int] IDENTITY(1,1) NOT NULL,
	[RouteTypeCode] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_management_employee]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_management_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sales_emp_code] [varchar](30) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[sales_emp_address] [varchar](30) NOT NULL,
	[sales_role_id] [int] NOT NULL,
	[sales_manager_id] [int] NOT NULL,
	[login_user_id] [int] NOT NULL,
	[biz_zone_id] [int] NOT NULL,
	[email] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Outlet]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet](
	[OutletId] [int] IDENTITY(1,1) NOT NULL,
	[OutletCode] [varchar](50) NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](max) NULL,
	[OwnerName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NOT NULL,
	[HaveVisicooler] [int] NOT NULL,
	[parentid] [int] NOT NULL,
	[outlet_category_id] [int] NOT NULL,
	[grading] [int] NOT NULL,
	[channel] [int] NOT NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](200) NULL,
	[IsActive] [int] NOT NULL,
	[createdate] [datetime] NOT NULL CONSTRAINT [DF_tbld_Outlet_createdate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbld_Outlet] PRIMARY KEY NONCLUSTERED 
(
	[OutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tbld_Outlet]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Outlet] ON [dbo].[tbld_Outlet]
(
	[Distributorid] ASC,
	[parentid] ASC,
	[OutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_Outlet_category]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[outlet_category_name] [varchar](30) NOT NULL,
	[outlet_category_code] [varchar](30) NOT NULL,
	[outlet_category_description] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Outlet_channel]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[code] [varchar](100) NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Outlet_grade]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet_grade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[code] [varchar](50) NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Outlet_new]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet_new](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutletCode] [varchar](50) NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](max) NULL,
	[OwnerName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NOT NULL,
	[HaveVisicooler] [int] NOT NULL,
	[parentid] [int] NOT NULL,
	[outlet_category_id] [int] NOT NULL,
	[grading] [int] NOT NULL,
	[channel] [int] NOT NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](200) NULL,
	[IsActive] [int] NOT NULL,
	[verify_status] [int] NOT NULL,
	[verifydate] [datetime] NOT NULL,
	[verify_by] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[createdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_ReportList]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_ReportList](
	[id] [int] NOT NULL,
	[ReportCode] [varchar](10) NULL,
	[ReportName] [varchar](50) NULL,
	[ReportController] [varchar](50) NULL,
	[ReportAction] [varchar](50) NULL,
	[ReportType] [varchar](50) NULL,
 CONSTRAINT [PK_tbld_ReportList] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Route_Plan]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Route_Plan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_plan_name] [varchar](250) NULL,
	[route_plan_code] [varchar](250) NULL,
	[route_plan_description] [varchar](250) NULL,
	[db_id] [int] NOT NULL,
	[db_emp_id] [int] NOT NULL,
	[creation_date] [date] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[Modify_date] [date] NOT NULL,
	[created_by] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Route_plan_Current_Route]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Route_plan_Current_Route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NOT NULL,
	[db_emp_id] [int] NOT NULL,
	[route_plan_id] [int] NOT NULL,
	[route_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbld_Route_Plan_Detail]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Route_Plan_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_plan_id] [int] NULL,
	[route_id] [int] NULL,
	[dbid] [int] NULL,
	[db_emp_id] [int] NULL,
	[planned_visit_date] [date] NULL,
	[delivery_date] [date] NULL,
	[no_of_outlet] [int] NULL,
 CONSTRAINT [PK_tbld_Route_Plan_Detail] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbld_Route_Plan_Detail]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Route_Plan_Detail] ON [dbo].[tbld_Route_Plan_Detail]
(
	[planned_visit_date] ASC,
	[dbid] ASC,
	[db_emp_id] ASC,
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_Route_Plan_Mapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Route_Plan_Mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NOT NULL,
	[db_emp_id] [int] NOT NULL,
	[route_plan_id] [int] NOT NULL,
	[route_id] [int] NOT NULL,
	[day] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbld_Route_Plan_Mapping] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_Route_Plan_Mapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_Route_Plan_Mapping] ON [dbo].[tbld_Route_Plan_Mapping]
(
	[db_emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_SKU]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU](
	[SKU_id] [int] IDENTITY(1,1) NOT NULL,
	[SKUName] [varchar](200) NOT NULL,
	[SKUsl] [int] NOT NULL,
	[SKUcode] [int] NOT NULL,
	[SKUdescription] [varchar](200) NOT NULL,
	[SKUtype_id] [int] NOT NULL,
	[SKUnodetype_id] [int] NOT NULL,
	[SKUStatus] [int] NOT NULL,
	[SKUcreationdate] [datetime] NOT NULL,
	[SKUlaunchdate] [datetime] NOT NULL,
	[SKUexpirydate] [datetime] NOT NULL,
	[SKUbrand_id] [int] NOT NULL,
	[SKUcategoryid] [int] NOT NULL,
	[SKUVolume_ml] [float] NOT NULL,
	[SKUVolume_8oz] [float] NOT NULL,
	[SKUName_B] [varchar](200) NOT NULL,
	[SKUContainertypeid] [int] NOT NULL,
	[SKUlpc] [int] NOT NULL,
	[SKUUnit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SKU_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_SKU_Brand]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU_Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[element_name] [varchar](50) NOT NULL,
	[element_code] [varchar](50) NOT NULL,
	[element_description] [varchar](50) NOT NULL,
	[element_category_id] [int] NOT NULL,
	[parent_element_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_SKU_Brand_category]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU_Brand_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_category] [varchar](50) NULL,
 CONSTRAINT [PK_tbld_SKU_Brand_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_sku_category]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_sku_category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sku_category_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_SKU_unit]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [varchar](30) NOT NULL,
	[unit_short_name] [varchar](30) NOT NULL,
	[unit_code] [varchar](30) NOT NULL,
	[unit_description] [varchar](30) NOT NULL,
	[qty] [int] NOT NULL,
	[height] [float] NOT NULL,
	[width] [float] NOT NULL,
	[length] [float] NOT NULL,
	[weight] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unit_name] UNIQUE NONCLUSTERED 
(
	[unit_name] ASC,
	[unit_short_name] ASC,
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_SKUContainertype]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKUContainertype](
	[ContainertypeId] [int] NOT NULL,
	[Containertype] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContainertypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_SKUtype]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKUtype](
	[SKUtypeId] [int] NOT NULL,
	[SKUtype] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SKUtypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Target]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Target](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[MonthNo] [int] NOT NULL,
	[Year] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Target_Details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Target_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NOT NULL,
	[db_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[qtyinCS] [float] NOT NULL,
	[qtyinPS] [float] NOT NULL,
	[total_Qty] [float] NOT NULL,
 CONSTRAINT [PK_tbld_Target_Details] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbld_Target_Details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Target_Details] ON [dbo].[tbld_Target_Details]
(
	[target_id] DESC,
	[db_id] ASC,
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_Target_PSR_Details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Target_PSR_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[qtyinCS] [float] NOT NULL,
	[qtyinPS] [float] NOT NULL,
	[total_Qty] [float] NOT NULL,
 CONSTRAINT [PK_tbld_Target_PSR_Details] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbld_Target_PSR_Details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Target_PSR_Details] ON [dbo].[tbld_Target_PSR_Details]
(
	[target_id] DESC,
	[db_id] ASC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbll_inventory_log]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbll_inventory_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NULL,
	[sku_id] [int] NULL,
	[batch_id] [int] NULL,
	[price] [float] NULL,
	[tx_qty_ps] [int] NULL,
	[tx_type] [int] NULL,
	[tx_System_date] [date] NULL,
	[tx_date] [datetime2](7) NULL CONSTRAINT [DF_tbll_inventory_log_tx_date]  DEFAULT (getdate()),
	[tx_challan] [int] NULL,
 CONSTRAINT [PK_tbll_inventory_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbll_inventory_tx_type]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbll_inventory_tx_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_tbll_inventory_tx_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbll_procedure_log]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbll_procedure_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbid] [int] NULL,
	[procedure_name] [varchar](50) NOT NULL,
	[start_time] [datetime2](7) NULL,
	[end_time] [datetime2](7) NULL,
 CONSTRAINT [PK_tbll_procedure_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblm_notorder_reason]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_notorder_reason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exception_name] [varchar](30) NOT NULL,
	[exception_code] [varchar](30) NOT NULL,
	[exception_description] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblm_UserLogin]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Date_time_stamp] [datetime2](6) NOT NULL DEFAULT (getdate()),
	[PSR_id] [int] NOT NULL,
	[current_lat] [varchar](100) NOT NULL,
	[current_lon] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblm_UserLogin] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tblm_UserLogin]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tblm_UserLogin] ON [dbo].[tblm_UserLogin]
(
	[id] ASC,
	[Date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblm_visicooler_info]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_visicooler_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[Psr_id] [int] NOT NULL,
	[sub_route_id] [int] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[purity_id] [int] NOT NULL,
	[charging_id] [int] NOT NULL,
	[image_upload] [varchar](255) NULL,
	[order_qty_CS] [int] NOT NULL,
	[order_date_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tblm_visicooler_info] PRIMARY KEY CLUSTERED 
(
	[id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblm_visit_detail]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_visit_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[psr_id] [int] NULL,
	[route_id] [int] NULL,
	[outlet_id] [int] NULL,
	[visit_type] [int] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[lat] [varchar](50) NULL,
	[lon] [varchar](50) NULL,
	[remark] [varchar](50) NULL,
 CONSTRAINT [PK_tblm_visit_detail_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblm_visit_detail]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [IX_tblm_visit_detail] ON [dbo].[tblm_visit_detail]
(
	[date] DESC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblm_visit_type]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_visit_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visittype] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblm_visit_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_Challan]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_Challan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[challan_number] [varchar](50) NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[psr_Name] [varchar](50) NULL,
	[route_id] [int] NOT NULL,
	[route_Name] [varchar](50) NULL,
	[challan_status] [int] NOT NULL,
	[No_of_memo] [int] NOT NULL,
	[No_of_Outlet] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NOT NULL,
	[Create_date_time] [datetime] NOT NULL,
	[System_date] [date] NOT NULL,
	[grand_total_CS] [float] NOT NULL,
	[delivery_grand_total_CS] [float] NOT NULL,
	[grand_total] [float] NOT NULL,
	[delivery_grand_total] [float] NOT NULL,
	[challantype] [int] NULL,
 CONSTRAINT [PK_tblt_Challan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_Challan_line]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_Challan_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[challan_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[Order_qty] [int] NOT NULL,
	[Extra_qty] [int] NOT NULL,
	[Free_qty] [int] NOT NULL,
	[Total_qty] [int] NOT NULL,
	[Confirm_qty] [int] NOT NULL,
	[Confirm_Free_qty] [int] NOT NULL,
	[Return_qty] [float] NOT NULL,
	[Order_qty_price] [float] NOT NULL,
	[Extra_qty_price] [float] NOT NULL,
	[Total_qty_price] [float] NOT NULL,
	[Confirm_qty_price] [float] NOT NULL,
 CONSTRAINT [PK_tblt_Challan_line] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_Challan_line]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_Challan_line] ON [dbo].[tblt_Challan_line]
(
	[challan_id] DESC,
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblt_inventory]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbId] [int] NOT NULL,
	[skuId] [int] NOT NULL,
	[packSize] [int] NOT NULL,
	[BundleItemid] [int] NOT NULL,
	[batchNo] [int] NOT NULL,
	[qtyPs] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblt_Order]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_Order](
	[Orderid] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [varchar](255) NOT NULL,
	[local_so_id] [varchar](50) NOT NULL,
	[route_id] [int] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[Challan_no] [int] NOT NULL,
	[planned_order_date] [datetime2](7) NOT NULL,
	[order_date_time] [datetime2](7) NOT NULL,
	[shipping_date] [datetime2](7) NOT NULL,
	[delivery_date] [datetime2](7) NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[so_status] [int] NOT NULL,
	[total_order] [float] NULL,
	[total_confirmed] [float] NULL,
	[total_delivered] [float] NULL,
	[sales_order_type_id] [int] NULL,
	[manual_discount] [float] NULL,
	[isProcess] [int] NOT NULL CONSTRAINT [DF_tblt_Order_isProcess]  DEFAULT ((0)),
	[delivery_Process_Date] [datetime2](7) NULL,
 CONSTRAINT [PK_tblt_Order] PRIMARY KEY CLUSTERED 
(
	[Orderid] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_Order_line]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_Order_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Orderid] [int] NOT NULL,
	[Bundelitmeid] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[Betch_id] [int] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[unit_sale_price] [float] NOT NULL,
	[sku_order_type_id] [int] NOT NULL,
	[promotion_id] [int] NOT NULL,
	[lpec] [int] NOT NULL,
	[quantity_ordered] [int] NOT NULL,
	[quantity_confirmed] [int] NOT NULL,
	[quantity_delivered] [int] NOT NULL,
	[total_sale_price] [float] NOT NULL,
	[total_discount_amount] [float] NOT NULL,
	[total_billed_amount] [float] NOT NULL,
 CONSTRAINT [PK_tblt_Order_line_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_Order_line]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_Order_line] ON [dbo].[tblt_Order_line]
(
	[Orderid] DESC,
	[id] ASC,
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblt_Order_Line_type]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_Order_Line_type](
	[sku_order_type_id] [int] NOT NULL,
	[sku_order_type] [varchar](50) NULL,
 CONSTRAINT [PK_tblt_Order_Line_type] PRIMARY KEY CLUSTERED 
(
	[sku_order_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_OrderStatus]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_OrderStatus](
	[OrderStatus_id] [int] NULL,
	[OrderStatus_code] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_OrderType]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_OrderType](
	[OrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTypeName] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblt_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_PurchaseOrder]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_PurchaseOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChallanNo] [int] NOT NULL,
	[DbId] [int] NOT NULL,
	[ChallanDate] [date] NULL,
	[ReceivedDate] [date] NULL,
	[Timestamp] [datetime] NULL CONSTRAINT [DF_tblt_PurchaseOrder_Timestamp]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblt_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblt_PurchaseOrderLine]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_PurchaseOrderLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[POId] [int] NOT NULL,
	[BundelItem] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[BatchId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[PackSize] [int] NOT NULL,
	[ChallanQty] [int] NOT NULL,
	[ReciveQty] [int] NOT NULL,
 CONSTRAINT [PK_tblt_PurchaseOrdeLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblt_System]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_System](
	[SystemId] [int] IDENTITY(1,1) NOT NULL,
	[DBid] [int] NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[PreviousDate] [date] NOT NULL,
	[NextDate] [date] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tblt_System] PRIMARY KEY CLUSTERED 
(
	[SystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblt_TradePromotion]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[TP_type] [int] NOT NULL,
	[TPOffer_type] [int] NOT NULL,
	[promotion_unit_id] [int] NOT NULL,
	[promotion_sub_unit_id] [int] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[expiry_date] [date] NULL,
	[create_date] [datetime2](7) NULL,
	[is_active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_TradePromotionConditionType]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionConditionType](
	[id] [int] NOT NULL,
	[ConditionType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblt_TradePromotionConditionType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_TradePromotionDBhouseMapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionDBhouseMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promo_id] [int] NOT NULL,
	[db_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tblt_TradePromotionDBhouseMapping_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_TradePromotionDBhouseMapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_TradePromotionDBhouseMapping] ON [dbo].[tblt_TradePromotionDBhouseMapping]
(
	[promo_id] DESC,
	[db_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblt_TradePromotionDefinition]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionDefinition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promo_id] [int] NOT NULL,
	[rule_type] [int] NOT NULL,
	[promo_line_type] [int] NOT NULL,
	[condition_type] [int] NOT NULL,
	[offer_type] [int] NOT NULL,
	[condition_sku_id] [int] NOT NULL,
	[condition_sku_Batch] [int] NOT NULL,
	[condition_sku_pack_size] [int] NOT NULL,
	[condition_sku_amount] [int] NOT NULL,
	[offer_sku_id] [int] NOT NULL,
	[offer_sku_pack_size] [int] NOT NULL,
	[offer_sku_Batch] [int] NOT NULL,
	[offer_sku_amount] [int] NOT NULL,
	[condition_bundle_qty_CS] [int] NOT NULL,
	[condition_sku_group] [int] NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblt_TradePromotionDefinition] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_TradePromotionDefinition]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_TradePromotionDefinition] ON [dbo].[tblt_TradePromotionDefinition]
(
	[promo_id] DESC,
	[condition_sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblt_TradePromotionOfferType]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionOfferType](
	[id] [int] NOT NULL,
	[offertype] [varchar](50) NULL,
 CONSTRAINT [PK_tblt_TradePromotionOfferType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_TradePromotionRule]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionRule](
	[TPRoles_type_id] [int] NOT NULL,
	[TPRoles_type_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TPRoles_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblt_TradePromotionType]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionType](
	[promo_type_id] [int] NOT NULL,
	[promo_type_name] [varchar](50) NULL,
 CONSTRAINT [PK_tblt_promo_type] PRIMARY KEY CLUSTERED 
(
	[promo_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_info]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_info](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](25) NULL,
	[User_Password] [varchar](25) NULL,
	[User_role_id] [int] NOT NULL,
	[User_status] [int] NULL,
	[User_biz_role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[user_role_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_name] [varchar](25) NOT NULL,
	[user_role_code] [varchar](25) NOT NULL,
	[user_role_status] [int] NULL,
	[isOnlineLogin] [int] NULL,
	[isReportView] [int] NULL,
	[isCreate] [int] NULL,
	[isEdit] [int] NULL,
	[isDelete] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[tbld_db_psr_zone_view]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_db_psr_zone_view]
AS
SELECT TOP (100) PERCENT dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name, REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National], 
                  dbo.tbld_distribution_house.Status, dbo.tbld_distribution_house.PriceBuandle_id, dbo.tbld_distribution_employee.Name, dbo.tbld_distribution_employee.id AS PSR_id, dbo.tbld_distribution_employee.Emp_code AS PSR_Code, 
                  dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_cluster.name AS cluster
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_distribution_employee ON dbo.tbld_distribution_house.DB_Id = dbo.tbld_distribution_employee.DistributionId INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id
WHERE  (dbo.tbld_distribution_employee.Emp_Type = 2)
ORDER BY REGION_id, AREA_id, CEAREA_id, dbo.tbld_distribution_house.DB_Id, PSR_id

GO
/****** Object:  View [dbo].[tbld_db_psr_outlet_zone_view]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_db_psr_outlet_zone_view]
AS
SELECT TOP (100) PERCENT D.DB_Id, D.DB_Name, D.CEAREA_id, D.CEAREA_Name, D.AREA_id, D.AREA_Name, D.REGION_id, D.REGION_Name, D.National_id, D.[National], D.Status, D.Name, D.PSR_id, D.PSR_Code, D.DBCode, D.OfficeAddress, 
                  D.cluster, B.RouteName, B.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Location, A.Address, A.GpsLocation, A.OwnerName, A.ContactNo, A.Distributorid, A.HaveVisicooler, A.parentid, A.outlet_category_id, 
                  A.grading, A.channel, A.Latitude, A.Longitude, A.picture, A.IsActive, dbo.tbld_Outlet_channel.name AS channel_name, dbo.tbld_Outlet_category.outlet_category_name, dbo.tbld_Outlet_grade.name AS Outlet_grade
FROM     dbo.tbld_Outlet AS A INNER JOIN
                  dbo.tbld_distributor_Route AS B ON A.parentid = B.RouteID LEFT OUTER JOIN
                  dbo.tbld_Outlet_channel ON A.channel = dbo.tbld_Outlet_channel.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_category ON A.outlet_category_id = dbo.tbld_Outlet_category.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_grade ON A.grading = dbo.tbld_Outlet_grade.id INNER JOIN
                      (SELECT DISTINCT db_id, db_emp_id, route_plan_id, route_id
                       FROM      dbo.tbld_Route_Plan_Mapping) AS C ON B.RouteID = C.route_id LEFT OUTER JOIN
                  dbo.tbld_db_psr_zone_view AS D ON D.PSR_id = C.db_emp_id
ORDER BY A.Distributorid, B.RouteID, D.PSR_id

GO
/****** Object:  View [dbo].[tbld_db_zone_view]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_db_zone_view]
AS
SELECT dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name, REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National], 
                  dbo.tbld_distribution_house.Status, dbo.tbld_cluster.name AS Cluster, dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_distribution_house.PriceBuandle_id
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id

GO
/****** Object:  View [dbo].[tbld_sku_View]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_sku_View]
AS
SELECT TOP (100) PERCENT t1.SKU_id, t1.SKUName, t1.SKUsl, t1.SKUcode, t1.SKUStatus, t1.SKUbrand_id, t3.element_name AS Sub_brand, t5.element_name AS Brand, t1.SKUcategoryid, t4.sku_category_name, t1.SKUtype_id, t6.SKUtype, 
                  t1.SKUVolume_ml, t1.SKUVolume_8oz, t2.qty AS Pack_Size
FROM     dbo.tbld_SKU AS t1 LEFT OUTER JOIN
                  dbo.tbld_SKU_unit AS t2 ON t1.SKUUnit = t2.id LEFT OUTER JOIN
                  dbo.tbld_SKU_Brand AS t3 ON t1.SKUbrand_id = t3.id LEFT OUTER JOIN
                  dbo.tbld_sku_category AS t4 ON t1.SKUcategoryid = t4.Id LEFT OUTER JOIN
                  dbo.tbld_SKU_Brand AS t5 ON t3.parent_element_id = t5.id LEFT OUTER JOIN
                  dbo.tbld_SKUtype AS t6 ON t1.SKUtype_id = t6.SKUtypeId

GO
/****** Object:  Index [Indx_tblt_Challan]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE NONCLUSTERED INDEX [Indx_tblt_Challan] ON [dbo].[tblt_Challan]
(
	[order_date] DESC,
	[db_id] ASC,
	[challan_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Indx_tblt_Order]    Script Date: 20-Aug-2018 9:40:14 PM ******/
CREATE NONCLUSTERED INDEX [Indx_tblt_Order] ON [dbo].[tblt_Order]
(
	[planned_order_date] DESC,
	[delivery_date] DESC,
	[db_id] ASC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblm_visicooler_info] ADD  DEFAULT (NULL) FOR [image_upload]
GO
ALTER TABLE [dbo].[tblm_visicooler_info] ADD  DEFAULT (getdate()) FOR [order_date_time]
GO
ALTER TABLE [dbo].[tbl_SubMenu]  WITH CHECK ADD  CONSTRAINT [FK_tblSubMenu_tblRoles] FOREIGN KEY([MainMenuId])
REFERENCES [dbo].[tbl_MainMenu] ([Id])
GO
ALTER TABLE [dbo].[tbl_SubMenu] CHECK CONSTRAINT [FK_tblSubMenu_tblRoles]
GO
ALTER TABLE [dbo].[tbl_SubMenuSecond]  WITH CHECK ADD  CONSTRAINT [FK_tbl_2ndSubMenu_tbl_SubMenu] FOREIGN KEY([SubMenuId])
REFERENCES [dbo].[tbl_SubMenu] ([Id])
GO
ALTER TABLE [dbo].[tbl_SubMenuSecond] CHECK CONSTRAINT [FK_tbl_2ndSubMenu_tbl_SubMenu]
GO
ALTER TABLE [dbo].[tbl_SubMenuSecond]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SubMenuSecond_tbl_MainMenu] FOREIGN KEY([MainMenuId])
REFERENCES [dbo].[tbl_MainMenu] ([Id])
GO
ALTER TABLE [dbo].[tbl_SubMenuSecond] CHECK CONSTRAINT [FK_tbl_SubMenuSecond_tbl_MainMenu]
GO
ALTER TABLE [dbo].[tbld_AdjustmentStockItem]  WITH CHECK ADD  CONSTRAINT [FK_tbld_AdjustmentStockItem_tbld_AdjustmentStock] FOREIGN KEY([AdjustmentStockID])
REFERENCES [dbo].[tbld_AdjustmentStock] ([id])
GO
ALTER TABLE [dbo].[tbld_AdjustmentStockItem] CHECK CONSTRAINT [FK_tbld_AdjustmentStockItem_tbld_AdjustmentStock]
GO
ALTER TABLE [dbo].[tbld_bundle_price_details]  WITH CHECK ADD  CONSTRAINT [FK_tbld_bundle_price_details_tbld_bundle_price] FOREIGN KEY([bundle_price_id])
REFERENCES [dbo].[tbld_bundle_price] ([Id])
GO
ALTER TABLE [dbo].[tbld_bundle_price_details] CHECK CONSTRAINT [FK_tbld_bundle_price_details_tbld_bundle_price]
GO
ALTER TABLE [dbo].[tbld_Route_Plan_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbld_Route_Plan_Detail_tbld_Route_Plan] FOREIGN KEY([route_plan_id])
REFERENCES [dbo].[tbld_Route_Plan] ([id])
GO
ALTER TABLE [dbo].[tbld_Route_Plan_Detail] CHECK CONSTRAINT [FK_tbld_Route_Plan_Detail_tbld_Route_Plan]
GO
ALTER TABLE [dbo].[tblt_Challan_line]  WITH CHECK ADD  CONSTRAINT [FK_tblt_Challan_line_tblt_Challan] FOREIGN KEY([challan_id])
REFERENCES [dbo].[tblt_Challan] ([id])
GO
ALTER TABLE [dbo].[tblt_Challan_line] CHECK CONSTRAINT [FK_tblt_Challan_line_tblt_Challan]
GO
ALTER TABLE [dbo].[tblt_Order_line]  WITH NOCHECK ADD  CONSTRAINT [FK_tblt_Order_line_tblt_Order] FOREIGN KEY([Orderid])
REFERENCES [dbo].[tblt_Order] ([Orderid])
GO
ALTER TABLE [dbo].[tblt_Order_line] NOCHECK CONSTRAINT [FK_tblt_Order_line_tblt_Order]
GO
ALTER TABLE [dbo].[tblt_PurchaseOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_tblt_PurchaseOrderLine_tblt_PurchaseOrder] FOREIGN KEY([POId])
REFERENCES [dbo].[tblt_PurchaseOrder] ([Id])
GO
ALTER TABLE [dbo].[tblt_PurchaseOrderLine] CHECK CONSTRAINT [FK_tblt_PurchaseOrderLine_tblt_PurchaseOrder]
GO
ALTER TABLE [dbo].[tblt_TradePromotionDefinition]  WITH CHECK ADD  CONSTRAINT [FK_tblt_TradePromotionDefinition_tblt_TradePromotion] FOREIGN KEY([promo_id])
REFERENCES [dbo].[tblt_TradePromotion] ([id])
GO
ALTER TABLE [dbo].[tblt_TradePromotionDefinition] CHECK CONSTRAINT [FK_tblt_TradePromotionDefinition_tblt_TradePromotion]
GO
/****** Object:  StoredProcedure [dbo].[ApiGetOutlet]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiGetOutlet] 
	@Psrid int
AS
BEGIN

SELECT PSR_id      
      ,RouteName
      ,RouteID
      ,OutletId
      ,OutletCode
      ,OutletName      
       ,Address
      ,GpsLocation
      ,OwnerName
      ,ContactNo
      ,Distributorid
      ,HaveVisicooler
      ,parentid     
      ,Latitude
      ,Longitude     
      ,IsActive
      ,channel_name
      ,outlet_category_name
      ,Outlet_grade
  FROM ODMS.dbo.tbld_db_psr_outlet_zone_view 
  where PSR_id=@Psrid and IsActive=1
END

GO
/****** Object:  StoredProcedure [dbo].[ApiGetSku]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[ApiGetSku]
	@dbid int
	
AS
BEGIN

 SELECT B.sku_id As SKUId, C.SKUName,C.SKUlpc, B.batch_id,D.qty As PackSize ,B.outlet_lifting_price AS TP, B.mrp AS MRP
FROM     tbld_distribution_house AS A INNER JOIN
                  tbld_bundle_price_details AS B ON A.PriceBuandle_id = B.bundle_price_id INNER JOIN
                  tbld_SKU AS C ON B.sku_id = C.SKU_id INNER JOIN
                  tbld_SKU_unit AS D ON C.SKUUnit = D.id
WHERE  (A.DB_Id = @dbid) and B.status=1 AND (B.end_date='0001-01-01' OR B.end_date>=GETDATE())  ANd C.SKUStatus=1
Order By C.SKUsl
END

GO
/****** Object:  StoredProcedure [dbo].[ApiGetSubRoute]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiGetSubRoute]
@psrid int,
@CurrentDate Datetime

AS
BEGIN
	SELECT DISTINCT  A.db_id,A.db_emp_id,A.route_id,C.RouteName,D.planned_visit_date
FROM ODMS.dbo.tbld_Route_Plan_Mapping  As A
Inner join tbld_distributor_Route As C On A.route_id=C.RouteID
LEFT JOIN (SELECT route_id
      ,dbid
      ,db_emp_id
      ,planned_visit_date
     
  FROM ODMS.dbo.tbld_Route_Plan_Detail As B
  where planned_visit_date=@CurrentDate AND B.db_emp_id=@psrid)AS D On A.db_emp_id=D.db_emp_id AND D.route_id=A.route_id
where A.db_emp_id=@psrid
END

GO
/****** Object:  StoredProcedure [dbo].[ApiGetTradePromotion]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiGetTradePromotion]
	@dbid int
	As
BEGIN
SELECT A.id, A.name, A.code, A.description, A.TP_type, A.TPOffer_type, A.promotion_unit_id, A.promotion_sub_unit_id, CONVERT(date,A.start_date)AS start_date , CONVERT(date,A.end_date) As end_date
FROM     tblt_TradePromotion AS A INNER JOIN
                  tblt_TradePromotionDBhouseMapping As B ON A.id = B.promo_id
WHERE  (A.start_date <= CAST(GETDATE() AS DATE)) AND (A.end_date >= CAST(GETDATE() AS DATE)) AND (A.is_active = 1) AND B.db_id=@dbid AND B.status=1
END

GO
/****** Object:  StoredProcedure [dbo].[ApiGetTradePromotionDefinition]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiGetTradePromotionDefinition]
	@dbid int
AS
BEGIN
	SELECT C.promo_id, C.rule_type, C.promo_line_type, C.condition_type, C.offer_type, C.condition_sku_id, C.condition_sku_Batch, C.condition_sku_pack_size, C.condition_sku_amount, C.offer_sku_id, C.offer_sku_pack_size, C.offer_sku_Batch, 
                  C.offer_sku_amount, C.condition_bundle_qty_CS, C.condition_sku_group
FROM     tblt_TradePromotion AS A INNER JOIN
                  tblt_TradePromotionDBhouseMapping AS B ON A.id = B.promo_id INNER JOIN
                  tblt_TradePromotionDefinition AS C ON A.id = C.promo_id
WHERE  (A.start_date <= CAST(GETDATE() AS DATE)) AND (A.end_date >= CAST(GETDATE() AS DATE)) AND (A.is_active = 1) AND (B.db_id = @dbid) AND (B.status = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[ApiUserLogin]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiUserLogin]
	@UserName varchar(50),
	@Password varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT TOP(1) A.id AS PSRid, A.Emp_code, A.Name As PSRName, A.DistributionId AS DBId, A.contact_no AS MobileNo, B.DBName
FROM     tbld_distribution_employee AS A INNER JOIN
                  tbld_distribution_house AS B ON A.DistributionId = B.DB_Id
WHERE  (A.active = 1) AND (A.Emp_Type = 2) AND (A.login_user_id = @UserName) AND (A.login_user_password = @Password) AND (B.Status = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_OutletWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_OutletWiseSKUWiseDelivery]
	@Db_id int,
	@BatchDate Datetime
	
AS
BEGIN
DELETE FROM [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseDelivery]  where [tblr_OutletWiseSKUWiseDelivery].BatchDate=@BatchDate AND [tblr_OutletWiseSKUWiseDelivery].Distributorid= @Db_id;
INSERT INTO [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseDelivery]
           ([BatchDate]
           ,[OutletId]
           ,[OutletCode]
           ,[OutletName]
           ,[Distributorid]
           ,[HaveVisicooler]
           ,[SKUId]
           ,[SKUName]
           ,[PackSize]
           ,[UnitPrice]
           ,[SKUVolume8oz]
           ,[Delivered_Quentity]
           ,[FreeDelivered_Quentity])
SELECT 
@BatchDate                       AS BatchDate
,A.OutletId
      ,A.OutletCode
      ,A.OutletName 
      ,A.Distributorid
      ,A.HaveVisicooler
	  ,B.sku_id AS SKUId
	  ,B.SKUName
	  ,B.PackSize AS PackSize
	  ,Isnull(C.UnitPrice, 0)         AS UnitPrice
	  ,B.SKUVolume_8oz As SKUVolume8oz
	  ,Isnull(C.Delivered_Quentity, 0)         AS Delivered_Quentity,       
       Isnull(D.FreeDelivered_Quentity, 0)     AS FreeDelivered_Quentity
       
  FROM [ODMS].[dbo].[tbld_Outlet] as A

   INNER JOIN (SELECT DISTINCT t1.db_id
		,t1.outlet_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size as PackSize,
		 t3.SKUVolume_8oz
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
                   WHERE  t1.delivery_date = @BatchDate ) AS B 
               ON A.Distributorid = B.db_id 
                  AND A.OutletId = B.outlet_id

				  Left Join (SELECT t1.db_id, t1.outlet_id, t2.sku_id,t2.unit_sale_price as UnitPrice, sum(t2.quantity_delivered) AS Delivered_Quentity
FROM     tblt_Order as t1 INNER JOIN
                  tblt_Order_line as t2 ON t1.Orderid = t2.Orderid
				  Left Join tbld_SKU as t3 on t2.sku_id=t3.SKU_id
				  where  t1.delivery_date=@BatchDate and  t2.sku_order_type_id=1
				  Group by t1.db_id,t1.outlet_id,t3.SKUName, t2.sku_id,t2.Pack_size,t2.unit_sale_price) As C on A.Distributorid=C.db_id AND A.OutletId=C.outlet_id AND B.sku_id=C.sku_id
				   Left Join (SELECT t1.db_id, t1.outlet_id, t2.sku_id,t3.SKUName,t2.Pack_size,sum(t2.quantity_delivered) AS FreeDelivered_Quentity
FROM     tblt_Order as t1 INNER JOIN
                  tblt_Order_line as t2 ON t1.Orderid = t2.Orderid
				  Left Join tbld_SKU as t3 on t2.sku_id=t3.SKU_id
				  where  t1.delivery_date=@BatchDate and  t2.sku_order_type_id=2
				  Group by t1.db_id,t1.outlet_id,t3.SKUName, t2.sku_id,t2.Pack_size) As D on A.Distributorid=D.db_id AND A.OutletId=D.outlet_id AND B.sku_id=D.sku_id
  where A.Distributorid=@Db_id
  
  

	
END

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_OutletWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_OutletWiseSKUWiseOrder] @Db_id int,
@BatchDate datetime

AS
BEGIN
  DELETE FROM [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder]  WHERE [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder].BatchDate = @BatchDate
    AND [tblr_OutletWiseSKUWiseOrder].Distributorid = @Db_id; --Delete if Data Exist
  INSERT INTO [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder] ([BatchDate]
  , [OutletId]
  , [OutletCode]
  , [OutletName]
  , [Distributorid]
  , [HaveVisicooler]
  , [SKUId]
  , [SKUName]
  , [PackSize]
  , [UnitPrice]
  , [SKUVolume8oz]
  , [Order_Quentity]
  , [Confirmed_Quantity]
  , [FreeOrder_Quentity]
  , [FreeConfirmed_Quantity])
    SELECT
      @BatchDate AS BatchDate,
      A.OutletId,
      A.OutletCode,
      A.OutletName,
      A.Distributorid,
      A.HaveVisicooler,
      B.SKUId,
      B.SKUName,
      B.Pack_size AS PackSize,
      ISNULL(B.unit_sale_price, 0) AS UnitPrice,
      B.SKUVolume_8oz AS SKUVolume8oz,
      ISNULL(B.quantity_ordered, 0) AS Order_Quentity,
      ISNULL(B.quantity_confirmed, 0) AS Confirmed_Quantity,
      ISNULL(B.FreeOrder_Quentity, 0) AS FreeOrder_Quentity,
      ISNULL(B.FreeConfirmed_Quantity, 0) AS FreeConfirmed_Quantity
    FROM [ODMS].[dbo].tbld_Outlet AS A
    INNER JOIN (SELECT
      t1.outlet_id,
      t1.db_id,
      t2.sku_id AS SKUId,
      t3.SKUName,
      t2.Pack_size,
      t2.unit_sale_price,
      t3.SKUVolume_8oz,
      SUM(CASE WHEN t2.sku_order_type_id = 1 THEN t2.quantity_ordered ELSE 0 END) AS quantity_ordered,
      SUM(CASE WHEN t2.sku_order_type_id = 1 THEN t2.quantity_confirmed ELSE 0 END) AS quantity_confirmed,
      SUM(CASE WHEN t2.sku_order_type_id = 2 THEN t2.quantity_confirmed ELSE 0 END) AS FreeOrder_Quentity,
      SUM(CASE WHEN t2.sku_order_type_id = 2 THEN t2.quantity_confirmed ELSE 0 END) AS FreeConfirmed_Quantity
    FROM tblt_Order AS t1  INNER JOIN 
	tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
    LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
    WHERE t1.planned_order_date = @BatchDate AND t1.so_status <> 9 AND t1.db_id=@Db_id
    GROUP BY t1.outlet_id,
             t1.db_id,
             t2.sku_id,
             t3.SKUName,
             t2.Pack_size,
             t2.unit_sale_price,
             t3.SKUVolume_8oz) AS B
      ON A.Distributorid = B.db_id
      AND A.OutletId = B.outlet_id
	  Where A.Distributorid=@Db_id
END


GO
/****** Object:  StoredProcedure [dbo].[DayEnd_PerformanceKPI]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_PerformanceKPI]
	@Db_id int,
	@BatchDate Datetime
	
AS
BEGIN

DELETE [ODMSBI].[dbo].[tblr_PerformanceKPI] where BatchDate=@BatchDate AND[DB_id]=@Db_id;

--Generate PSR KPI

INSERT INTO [ODMSBI].[dbo].[tblr_PerformanceKPI]
           ([DB_id]
           ,[BatchDate]
           ,[PerformerId]
           ,[PerformerName]
           ,[PerformerType]
           ,[SalesScheduleCall]
           ,[SalesMemo]
           ,[TotalLineSold]
           ,[TotalSoldInVolume]
           ,[TotalSoldInCase]
           ,[TotalSoldInValue]          
           ,[TotalOrderedInVolume]
           ,[TotalOrderedInCase]
           ,[TotalOrderedInValue])	

SELECT A.distributionid                  AS DB_id, 
       @BatchDate                     AS BatchDate, 
       A.id                              AS PerformerId, 
       A.NAME                            AS PerformerName, 
       A.emp_type                        AS PerformerType, 
       Isnull(B.salesschedulecall, 0)    AS SalesScheduleCall, 
       Isnull(C.salesmemo, 0)            AS SalesMemo, 
       Isnull(D.totallinesold, 0)        AS TotalLineSold, 
       Isnull(D.totalsoldinvolume, 0)    AS TotalSoldInVolume, 
       Isnull(D.totalsoldincase, 0)      AS TotalSoldInCase, 
       Isnull(D.totalsoldinvalue, 0)     AS TotalSoldInValue, 
       Isnull(E.totalorderedinvolume, 0) AS TotalOrderedInVolume, 
       Isnull(E.totalorderedincase, 0)   AS TotalOrderedInCase, 
       Isnull(E.totalorderedinvalue, 0)  AS TotalOrderedInValue 
FROM   tbld_distribution_employee AS A 
       LEFT JOIN (SELECT T1.dbid, 
                         T1.db_emp_id, 
                         Count(T2.outletid) AS SalesScheduleCall 
                  FROM   tbld_route_plan_detail AS T1 
                         INNER JOIN tbld_outlet AS T2 
                                 ON T1.route_id = T2.parentid 
                  WHERE  planned_visit_date = @BatchDate
                         AND isactive = 1 
                  GROUP  BY T1.db_emp_id, 
                            T1.dbid) AS B 
              ON A.distributionid = B.dbid 
                 AND A.id = B.db_emp_id 
       LEFT JOIN (SELECT db_id, 
                         psr_id, 
                         Count(orderid) AS SalesMemo 
                  FROM   tblt_order 
                  WHERE  planned_order_date = @BatchDate
                         AND so_status != 9 AND isProcess=1
                  GROUP  BY db_id, 
                            psr_id) AS C 
              ON A.distributionid = C.db_id 
                 AND A.id = C.psr_id 
       LEFT JOIN (SELECT T1.db_id, 
                         T1.psr_id, 
                         Sum(T2.lpec)AS 
                         TotalLineSold, 
                         Sum(Cast(T2.quantity_delivered AS FLOAT) * Cast( 
                             T3.skuvolume_8oz AS FLOAT))   AS 
                         TotalSoldInVolume, 
                         Sum(Cast(T2.quantity_delivered AS FLOAT) / Cast( 
                             pack_size AS FLOAT)) 
                                                                 AS 
                         TotalSoldInCase, 
                         Sum(Cast(T2.quantity_delivered AS FLOAT) * Cast( 
                             T2.unit_sale_price AS FLOAT)) AS 
                         TotalSoldInValue 
                  FROM   tblt_order AS T1 
                         INNER JOIN tblt_order_line AS T2 
                                 ON T1.orderid = T2.orderid 
                         INNER JOIN tbld_sku AS T3 
                                 ON T2.sku_id = T3.sku_id 
                  WHERE  ( T1.planned_order_date = @BatchDate) 
                         AND ( T1.so_status <> 9 ) AND ( T1.so_status =3 ) AND T1.isProcess=1
                  GROUP  BY T1.db_id, 
                            T1.psr_id)AS D 
              ON A.distributionid = D.db_id 
                 AND A.id = D.psr_id 
       LEFT JOIN (SELECT T1.db_id, 
                         T1.psr_id, 
                         Sum(Cast(T2.quantity_confirmed AS FLOAT) * Cast( 
                             T3.skuvolume_8oz AS FLOAT))   AS 
                         TotalOrderedInVolume, 
                         Sum(Cast(T2.quantity_confirmed AS FLOAT) / Cast( 
                             pack_size AS FLOAT)) 
                                                                 AS 
                         TotalOrderedInCase, 
                         Sum(Cast(T2.quantity_confirmed AS FLOAT) * Cast( 
                             T2.unit_sale_price AS FLOAT)) AS 
                         TotalOrderedInValue 
                  FROM   tblt_order AS T1 
                         INNER JOIN tblt_order_line AS T2 
                                 ON T1.orderid = T2.orderid 
                         INNER JOIN tbld_sku AS T3 
                                 ON T2.sku_id = T3.sku_id 
                  WHERE  ( T1.planned_order_date = @BatchDate) 
                         AND ( T1.so_status <> 9 ) AND T1.isProcess=1
                  GROUP  BY T1.db_id, 
                            T1.psr_id)AS E 
              ON A.distributionid = E.db_id 
                 AND A.id = E.psr_id 
WHERE  A.active = 1 
       AND A.emp_type = 2 
       AND A.distributionid =@Db_id

--Generate DB KPI 

INSERT INTO [ODMSBI].[dbo].[tblr_PerformanceKPI]
           ([DB_id]
           ,[BatchDate]
           ,[PerformerId]
           ,[PerformerName]
           ,[PerformerType]
           ,[SalesScheduleCall]
           ,[SalesMemo]
           ,[TotalLineSold]
           ,[TotalSoldInVolume]
           ,[TotalSoldInCase]
           ,[TotalSoldInValue]          
           ,[TotalOrderedInVolume]
           ,[TotalOrderedInCase]
           ,[TotalOrderedInValue])

SELECT A.DB_Id                  AS DB_id, 
       @BatchDate                      AS BatchDate, 
       A.DB_Id                              AS PerformerId, 
       A.DBName                            AS PerformerName, 
       1							      AS PerformerType, 
       Isnull(B.salesschedulecall, 0)    AS SalesScheduleCall, 
       Isnull(C.salesmemo, 0)            AS SalesMemo, 
       Isnull(D.totallinesold, 0)        AS TotalLineSold, 
       Isnull(D.totalsoldinvolume, 0)    AS TotalSoldInVolume, 
       Isnull(D.totalsoldincase, 0)      AS TotalSoldInCase, 
       Isnull(D.totalsoldinvalue, 0)     AS TotalSoldInValue, 
       Isnull(E.totalorderedinvolume, 0) AS TotalOrderedInVolume, 
       Isnull(E.totalorderedincase, 0)   AS TotalOrderedInCase, 
       Isnull(E.totalorderedinvalue, 0)  AS TotalOrderedInValue 
FROM   tbld_distribution_house AS A 
       LEFT JOIN (SELECT t1.dbid, 
                         Count(t2.outletid) AS SalesScheduleCall 
                  FROM   tbld_route_plan_detail AS t1 
                         INNER JOIN tbld_outlet AS t2 
                                 ON t1.route_id = t2.parentid 
                  WHERE  planned_visit_date = @BatchDate 
                         AND isactive = 1 
                  GROUP  BY  t1.dbid) AS B 
              ON A.DB_Id = B.dbid 
       LEFT JOIN (SELECT db_id, 
                         Count(orderid) AS SalesMemo 
                  FROM   tblt_order 
                  WHERE  planned_order_date = @BatchDate 
                         AND so_status != 9 
                  GROUP  BY db_id) AS C 
              ON A.DB_Id = C.db_id
       LEFT JOIN (SELECT t1.db_id ,
                         Sum(t2.lpec) AS TotalLineSold , 
                         Sum(Cast(t2.quantity_delivered AS FLOAT) * Cast( 
                             t3.skuvolume_8oz AS FLOAT)) AS 
                         TotalSoldInVolume ,
						  Sum(Cast(t2.quantity_delivered AS FLOAT) / Cast( 
                             pack_size AS FLOAT)) AS 
                         TotalSoldInCase 						 ,
                         Sum(Cast(t2.quantity_delivered AS FLOAT) * Cast( 
                             t2.unit_sale_price AS FLOAT)) AS 
                         TotalSoldInValue 
                  FROM   tblt_order AS t1 
                         INNER JOIN tblt_order_line AS t2 
                                 ON t1.orderid = t2.orderid 
                         INNER JOIN tbld_sku AS t3 
                                 ON t2.sku_id = t3.sku_id 
                  WHERE  ( t1.planned_order_date = @BatchDate ) 
                          
                         AND ( T1.so_status <> 9 ) AND ( T1.so_status =3 ) AND T1.isProcess=1
                  GROUP  BY t1.db_id)AS D 
              ON A.DB_Id = D.db_id 
       
       LEFT JOIN (SELECT t1.db_id ,
                         Sum(Cast(t2.quantity_delivered AS FLOAT) * Cast( 
                             t2.unit_sale_price AS FLOAT)) AS 
                         TotalSoldInValue , 
                         Sum(Cast(t2.quantity_confirmed AS FLOAT) * Cast( 
                             t3.skuvolume_8oz AS FLOAT)) AS 
                         TotalOrderedInVolume ,Sum(Cast(t2.quantity_confirmed AS FLOAT) / Cast( 
                             pack_size AS FLOAT)) AS 
                         TotalOrderedInCase ,
						 
                         Sum(Cast(t2.quantity_confirmed AS FLOAT) * Cast( 
                             t2.unit_sale_price AS FLOAT)) AS 
                         TotalOrderedInValue 
                  FROM   tblt_order AS t1 
                         INNER JOIN tblt_order_line AS t2 
                                 ON t1.orderid = t2.orderid 
                         INNER JOIN tbld_sku AS t3 
                                 ON t2.sku_id = t3.sku_id 
                  WHERE  ( t1.planned_order_date = @BatchDate ) 
                         AND ( t1.so_status <> 9 ) AND T1.isProcess=1
                  GROUP  BY t1.db_id)AS E 
              ON A.DB_Id = E.db_id     
           
WHERE  A.DB_Id =@Db_id
END
GO
/****** Object:  StoredProcedure [dbo].[DayEnd_Process]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_Process] 
	@Dbid int,
	@BatchDate Datetime
	
AS
BEGIN
declare @KPIorderdate as datetime = dateadd(day,-1, @BatchDate)

INSERT INTO [dbo].[tbll_procedure_log]([dbid],[procedure_name],[start_time],[end_time]) VALUES(@Dbid,'DayEnd_Process',GETDATE(),NULL)

/*Outlet StockMovement*/
EXEC [DayEnd_StockMovement] @Db_id = @Dbid, @BatchDate = @BatchDate;

/*Outlet Order&Sales*/
EXEC [DayEnd_OutletWiseSKUWiseOrder] @Db_id = @Dbid, @BatchDate = @BatchDate;
EXEC [DayEnd_OutletWiseSKUWiseDelivery] @Db_id = @Dbid, @BatchDate = @BatchDate;

/*PSR Order&Sales*/
EXEC [DayEnd_PSRWiseSKUWiseOrder] @Db_id = @Dbid, @BatchDate = @BatchDate;
EXEC [DayEnd_PSRWiseSKUWiseDelivery] @Db_id = @Dbid, @BatchDate = @BatchDate;



/*KPI*/
EXEC [DayEnd_PerformanceKPI] @Db_id = @Dbid,@BatchDate =@BatchDate;
EXEC [DayEnd_PerformanceKPI] @Db_id = @Dbid,@BatchDate =@KPIorderdate;


/*PSRWiseMonthTGT*/
EXEC [DayEnd_PSRWiseMonthTGT]	@Db_id = @Dbid,@BatchDate=@KPIorderdate
	
INSERT INTO [ODMSBI].[dbo].[tblr_Disributor_Day_End]([Dbid],[BatchDate],[ProcessDate])  VALUES (@Dbid,@BatchDate,GETDATE());

INSERT INTO [dbo].[tbll_procedure_log]([dbid],[procedure_name],[start_time],[end_time]) VALUES(@Dbid,'DayEnd_Process',NULL,GETDATE())

End

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_PSRWiseMonthTGT]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_PSRWiseMonthTGT]
	@Db_id int,
	@BatchDate Datetime
AS
BEGIN

Delete FROM [ODMSBI].[dbo].[tblr_PSRWiseMonthTGT]  where [target_id] in (SELECT [id]  FROM [ODMS].[dbo].[tbld_Target]  where start_date<=@BatchDate And end_date>=@BatchDate) AND db_id=@Db_id;


INSERT INTO [ODMSBI].[dbo].[tblr_PSRWiseMonthTGT]
           ([target_id]
           ,[db_id]
           ,[psr_id]
           ,[TotalTGTCS]
           ,[TotalTGTVolume8oz]
           ,[TGTOrder]
           ,[TGTConfirmed]
           ,[TGTDelivered])
SELECT a1.target_id, a1.db_id, a1.psr_id, Sum(a1.total_Qty/a1.Pack_size) As TotalTGTCS,  Sum(a1.total_Qty * a2.SKUVolume_8oz) TotalTGTVolume8oz,IsNULL(a3.TGTOrder,0)AS TGTOrder,IsNULL(a3.TGTConfirmed,0)As TGTConfirmed,IsNULL(a3.TGTDelivered,0)AS TGTDelivered
FROM     tbld_Target_PSR_Details AS a1 INNER JOIN
                  tbld_SKU AS a2 ON a1.sku_id = a2.SKU_id
				  Left Join (SELECT t1.db_id,t1.psr_id,Sum(t2.quantity_ordered/t2.Pack_size) AS TGTOrder, 
                  Sum(t2.quantity_confirmed/t2.Pack_size) AS TGTConfirmed, Sum(t2.quantity_delivered/t2.Pack_size) AS TGTDelivered
FROM     tblt_Order AS t1 INNER JOIN
                  tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
				  where datepart(month,t1.planned_order_date)=datepart(month,@BatchDate) AND t1.db_id=@Db_id
				  group by t1.db_id,t1.psr_id) As a3 on a3.db_id=a1.db_id and a3.psr_id=a1.psr_id
				  Where a1.db_id=@Db_id and a1.target_id in (SELECT [id]  FROM [ODMS].[dbo].[tbld_Target]  where start_date<=@BatchDate And end_date>=@BatchDate)
				  Group by a1.target_id, a1.db_id, a1.psr_id,a3.TGTOrder,a3.TGTConfirmed,a3.TGTDelivered
END

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_PSRWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_PSRWiseSKUWiseDelivery]
	@Db_id int,
	@BatchDate Datetime	
AS
BEGIN

DELETE FROM [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseDelivery] where [DB_id]=@Db_id  AND[BatchDate]=@BatchDate;

INSERT INTO [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseDelivery]
           ([DB_id]
           ,[BatchDate]
           ,[PSRId]
           ,[PSRName]
           ,[SKUId]
           ,[SKUName]
           ,[PackSize]
           ,[SKUVolume8oz]
           ,[UnitPrice]
           ,[Delivered_Quentity]
           ,[FreeDelivered_Quentity])
SELECT A.distributionid                    AS DB_id, 
       @BatchDate                         AS BatchDate, 
       A.id                                AS PSRId, 
       A.NAME                              AS PSRName, 
       B.sku_id                            AS SKUId, 
       B.skuname                           AS SKUName, 
       B.pack_size                         AS PackSize, 
       B.skuvolume_8oz                     AS SKUVolume8oz, 
       Isnull(C.unit_sale_price, 0)        AS UnitPrice, 
       Isnull(C.delivered_quentity, 0)     AS Delivered_Quentity, 
       Isnull(D.freedelivered_quentity, 0) AS FreeDelivered_Quentity 
FROM   tbld_distribution_employee AS A 
       INNER JOIN (SELECT DISTINCT t1.db_id, 
                                   t1.psr_id, 
                                   t2.sku_id, 
                                   t3.skuname, 
                                   t2.pack_size, 
                                   t3.skuvolume_8oz 
                   FROM   tblt_order AS t1 
                          INNER JOIN tblt_order_line AS t2 
                                  ON t1.orderid = t2.orderid 
                          LEFT JOIN tbld_sku AS t3 
                                 ON t2.sku_id = t3.sku_id 
                   WHERE  t1.delivery_date = @BatchDate ) AS B 
               ON A.distributionid = B.db_id 
                  AND A.id = B.psr_id 
       LEFT JOIN (SELECT t1.db_id, 
                         t1.psr_id, 
                         t2.sku_id, 
                         t3.skuname, 
                         t2.pack_size, 
                         t2.unit_sale_price, 
                         Sum(t2.quantity_delivered) AS Delivered_Quentity 
                  FROM   tblt_order AS t1 
                         INNER JOIN tblt_order_line AS t2 
                                 ON t1.orderid = t2.orderid 
                         LEFT JOIN tbld_sku AS t3 
                                ON t2.sku_id = t3.sku_id 
                  WHERE  t1.delivery_date = @BatchDate  
                         AND t2.sku_order_type_id = 1 
                  GROUP  BY t1.db_id, 
                            t1.psr_id, 
                            t3.skuname, 
                            t2.sku_id, 
                            t2.pack_size, 
                            t2.unit_sale_price) AS C 
              ON A.distributionid = C.db_id 
                 AND A.id = C.psr_id 
                 AND B.sku_id = C.sku_id 
       LEFT JOIN (SELECT t1.db_id, 
                         t1.psr_id, 
                         t2.sku_id, 
                         t3.skuname, 
                         t2.pack_size, 
                         Sum(t2.quantity_delivered) AS FreeDelivered_Quentity 
                  FROM   tblt_order AS t1 
                         INNER JOIN tblt_order_line AS t2 
                                 ON t1.orderid = t2.orderid 
                         LEFT JOIN tbld_sku AS t3 
                                ON t2.sku_id = t3.sku_id 
                  WHERE  t1.delivery_date = @BatchDate  
                         AND t2.sku_order_type_id = 2 
                  GROUP  BY t1.db_id, 
                            t1.psr_id, 
                            t3.skuname, 
                            t2.sku_id, 
                            t2.pack_size) AS D 
              ON A.distributionid = D.db_id 
                 AND A.id = D.psr_id 
                 AND B.sku_id = D.sku_id 
WHERE  A.active = 1 
       AND A.emp_type = 2 
       AND A.distributionid = @Db_id 
	
END

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_PSRWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_PSRWiseSKUWiseOrder]
	@Db_id int,
	@BatchDate Datetime	
AS
BEGIN
DELETE FROM [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseOrder] where [BatchDate]=@BatchDate AND [DB_id]=@Db_id;
INSERT INTO [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseOrder]
           ([DB_id]
           ,[BatchDate]
           ,[PSRId]
           ,[PSRName]
           ,[SKUId]
           ,[SKUName]
           ,[PackSize]
           ,[SKUVolume8oz]
           ,[UnitPrice]
           ,[Order_Quentity]
           ,[Confirmed_Quantity]
           ,[FreeOrder_Quentity]
           ,[FreeConfirmed_Quantity])
SELECT A.distributionid                    AS DB_id, 
       @BatchDate                         AS BatchDate, 
       A.id                                AS PSRId, 
       A.NAME                              AS PSRName, 
       B.sku_id                            AS SKUId, 
       B.skuname                           AS SKUName, 
       B.pack_size                         AS PackSize, 
       B.skuvolume_8oz                     AS SKUVolume8oz, 
	   Isnull(C.unit_sale_price, 0)        AS UnitPrice
	,Isnull(C.Order_Quentity, 0) AS Order_Quentity
	,Isnull(C.Confirmed_Quantity, 0) AS Confirmed_Quantity
	,Isnull(D.FreeOrder_Quentity, 0) AS FreeOrder_Quentity
	,Isnull(D.FreeConfirmed_Quantity, 0) AS FreeConfirmed_Quantity
FROM tbld_distribution_employee AS A
INNER JOIN (
	SELECT DISTINCT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size,
		 t3.SKUVolume_8oz
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
	) AS B ON A.DistributionId = B.db_id
	AND A.id = B.psr_id
LEFT JOIN (
	SELECT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size
		,t2.unit_sale_price
		,sum(t2.quantity_ordered) AS Order_Quentity
		,sum(t2.quantity_confirmed) AS Confirmed_Quantity
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
		AND t2.sku_order_type_id = 1
	GROUP BY t1.db_id
		,t1.psr_id
		,t3.SKUName
		,t2.sku_id
		,t2.Pack_size
		,t2.unit_sale_price
	) AS C ON A.DistributionId = C.db_id
	AND A.id = C.psr_id
	AND B.sku_id = C.sku_id
LEFT JOIN (
	SELECT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size
		,sum(t2.quantity_ordered) AS FreeOrder_Quentity
		,sum(t2.quantity_confirmed) AS FreeConfirmed_Quantity
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
		AND t2.sku_order_type_id = 2
	GROUP BY t1.db_id
		,t1.psr_id
		,t3.SKUName
		,t2.sku_id
		,t2.Pack_size
	) AS D ON A.DistributionId = D.db_id
	AND A.id = D.psr_id
	AND B.sku_id = D.sku_id
WHERE A.active = 1	AND A.emp_type = 2	AND A.distributionid = @Db_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[DayEnd_StockMovement]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DayEnd_StockMovement]
	@Db_id int,
	@BatchDate Datetime
	
AS
BEGIN
DELETE FROM [ODMSBI].[dbo].[tblr_StockMovement]  where [tblr_StockMovement].[BatchDate]=@BatchDate AND [tblr_StockMovement].[dbId]= @Db_id;
INSERT INTO [ODMSBI].[dbo].[tblr_StockMovement]
           ([BatchDate]
           ,[dbId]
           ,[SKUid]
           ,[BatchNo]
           ,[PackSize]
           ,[db_lifting_price]
           ,[outlet_lifting_price]
           ,[mrp]
           ,[ClosingSoundStockQty]
           ,[ClosingBookedStockQty]
           ,[PrimaryChallanQty]
           ,[PrimaryQty]
           ,[SalesQty]
           ,[FreeSalesQty])

		  SELECT  @BatchDate,C.dbId, A.sku_id As SKUid, A.batch_id As BatchNo , C.packSize As PackSize , A.db_lifting_price, A.outlet_lifting_price, A.mrp, C.qtyPs AS ClosingSoundStock, ISNULL(D.BookedStock, 0) AS ClosingBookedStock, 
                  ISNULL(E.ChallanQty,0) AS PrimaryChallanQty, ISNULL(E.ReciveQty,0) As PrimaryQty,ISNULL(F.Sales, 0) AS Sales,ISNULL(F.FreeSales, 0) AS FreeSales
FROM     tbld_bundle_price_details AS A INNER JOIN
                  tbld_distribution_house AS B ON A.bundle_price_id = B.PriceBuandle_id INNER JOIN
                  tblt_inventory AS C ON A.sku_id = C.skuId AND A.batch_id = C.batchNo LEFT OUTER JOIN
                      (SELECT t1.db_id, t2.sku_id, t2.batch_id, SUM(t2.Total_qty) AS BookedStock
                       FROM      tblt_Challan AS t1 INNER JOIN
                                         tblt_Challan_line AS t2 ON t1.id = t2.challan_id
                       WHERE   (t1.db_id = @Db_id) AND (t1.challan_status = 1)
                       GROUP BY t1.db_id, t2.sku_id, t2.batch_id) AS D ON D.db_id = C.dbId AND D.sku_id = A.sku_id AND D.batch_id = C.batchNo LEFT OUTER JOIN
                      (SELECT a1.DbId, a1.ReceivedDate, a2.sku_id, a2.BatchId, SUM(a2.ChallanQty) AS ChallanQty, SUM(a2.ReciveQty) AS ReciveQty
                       FROM      tblt_PurchaseOrder AS a1 INNER JOIN
                                         tblt_PurchaseOrderLine AS a2 ON a1.Id = a2.POId
                       WHERE   (a1.ReceivedDate = @BatchDate) AND a1.DbId=@Db_id
                       GROUP BY a1.DbId, a1.ReceivedDate, a2.sku_id, a2.BatchId) AS E ON E.DbId = C.dbId AND E.sku_id = A.sku_id AND E.BatchId = C.batchNo
					   LEFT OUTER JOIN
                      (SELECT t1.db_id, t2.sku_id, t2.batch_id, SUM(t2.Confirm_qty) AS Sales,SUM(t2.Confirm_Free_qty) AS FreeSales
                       FROM      tblt_Challan AS t1 INNER JOIN
                                         tblt_Challan_line AS t2 ON t1.id = t2.challan_id
                       WHERE   (t1.db_id = @Db_id) AND (t1.challan_status = 2) AND  t1.delivery_date=@BatchDate
                       GROUP BY t1.db_id, t2.sku_id, t2.batch_id) AS F ON F.db_id = C.dbId AND F.sku_id = A.sku_id AND F.batch_id = C.batchNo 
WHERE  (B.DB_Id = @Db_id)
END


GO
/****** Object:  StoredProcedure [dbo].[DB_User_check]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[DB_User_check]
	@UserName varchar(50),
	@Password varchar(50)
AS
	SELECT A.id, A.Name, A.User_role_id, A.DistributionId, A.login_user_id, A.active, B.user_role_code, tbld_distribution_house.Zone_id, tbld_business_zone.biz_zone_category_id
FROM     tbld_distribution_employee AS A INNER JOIN
                  user_role AS B ON A.User_role_id = B.user_role_id INNER JOIN
                  tbld_distribution_house ON A.DistributionId = tbld_distribution_house.DB_Id INNER JOIN
                  tbld_business_zone ON tbld_distribution_house.Zone_id = tbld_business_zone.id INNER JOIN
                  tbld_business_zone_hierarchy ON tbld_business_zone.biz_zone_category_id = tbld_business_zone_hierarchy.id
WHERE  (A.login_user_id = @UserName) AND (A.login_user_password = @Password) AND B.isOnlineLogin=1
GO
/****** Object:  StoredProcedure [dbo].[DBidbyASM]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DBidbyASM]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DB_Id],[AREA_id]
       FROM [MSTORE].[dbo].[tbld_db_zone_view] where [Status]=1
END

GO
/****** Object:  StoredProcedure [dbo].[DBidbyCE]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DBidbyCE]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DB_Id],[CEAREA_id]
       FROM [MSTORE].[dbo].[tbld_db_zone_view] where [Status]=1
END

GO
/****** Object:  StoredProcedure [dbo].[DBidbyNSM]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DBidbyNSM]
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DB_Id]
       FROM [MSTORE].[dbo].[tbld_db_zone_view] where [Status]=1
END

GO
/****** Object:  StoredProcedure [dbo].[DBidbyRSM]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DBidbyRSM]

AS
BEGIN
	
	SELECT [DB_Id],[REGION_id]
       FROM [MSTORE].[dbo].[tbld_db_zone_view] where   [Status]=1
END

GO
/****** Object:  StoredProcedure [dbo].[DBWisezone]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DBWisezone]

AS
BEGIN
SELECT dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name, REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National], 
                  dbo.tbld_distribution_house.Status
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id
END

GO
/****** Object:  StoredProcedure [dbo].[GetOutletList]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOutletList]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t1.DB_Id, t1.DB_Name, t1.CEAREA_id, t1.CEAREA_Name, t1.AREA_id, t1.AREA_Name, t1.REGION_id, t1.REGION_Name, t1.National_id, t1.[National], t1.Status, t2.Name, t4.RouteName, t5.OutletCode, t5.OutletName, t5.Address, 
                  t5.OwnerName, t5.ContactNo, t5.HaveVisicooler, t5.IsActive
FROM     tbld_db_zone_view AS t1 INNER JOIN
                  tbld_distribution_employee AS t2 ON t2.DistributionId = t1.DB_Id INNER JOIN
                  tbld_Route_plan_Current_Route AS t3 ON t2.id = t3.db_emp_id INNER JOIN
                  tbld_distributor_Route AS t4 ON t3.route_id = t4.RouteID INNER JOIN
                  tbld_Outlet AS t5 ON t4.RouteID = t5.parentid
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_ChallanVsDelivery]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_ChallanVsDelivery]
	-- Add the parameters for the stored procedure here
	@Challan_no int
AS
BEGIN
SELECT t4.SKUName,t1.sku_id, t1.batch_id,t1.Pack_size, t1.Total_qty AS Total_qty,ISNULL(A.Total_delivered,0) AS Total_delivered, t2.outlet_id,t6.OutletName,ISNULL(B.Total_delivered,0) As Delivery,ISNULL(C.Total_delivered,0) As FreeDelivery
FROM     tblt_Challan_line AS t1 
INNER JOIN tblt_Order AS t2 ON t2.Challan_no= t1.challan_id
INNER JOIN tbld_Outlet AS t6 on t2.outlet_id=t6.OutletId 
Right JOIN tbld_SKU AS t4 ON t1.sku_id = t4.SKU_id 

LEFT JOIN (SELECT y1.outlet_id,y2.sku_id ,SUM(y2.quantity_delivered) AS Total_delivered 
FROM  tblt_Order AS y1
INNER JOIN tblt_Order_line AS y2 ON y2.Orderid = y1.Orderid 
WHERE y1.Challan_no=@Challan_no AND y1.so_status!=9 AND y2.sku_order_type_id=1
GROUP BY y1.outlet_id, y2.sku_id		  
			) as B  ON t1.sku_id= B.sku_id AND B.outlet_id=t2.outlet_id

LEFT JOIN (SELECT y1.outlet_id,y2.sku_id ,SUM(y2.quantity_delivered) AS Total_delivered 
FROM  tblt_Order AS y1
INNER JOIN tblt_Order_line AS y2 ON y2.Orderid = y1.Orderid 
WHERE y1.Challan_no=@Challan_no AND y1.so_status!=9 AND y2.sku_order_type_id=2
GROUP BY y1.outlet_id,y2.sku_id		  
			) as C  ON t1.sku_id= C.sku_id AND C.outlet_id=t2.outlet_id

LEFT JOIN ( SELECT x2.sku_id, x2.Betch_id,SUM(x2.quantity_delivered) AS Total_delivered 
			FROM  tblt_Order AS x1
			INNER JOIN tblt_Order_line AS x2 ON x2.Orderid = x1.Orderid 
			WHERE x1.Challan_no=@Challan_no AND x1.so_status!=9
			GROUP BY x1.db_id, x2.sku_id, x2.Betch_id				  			  
			) as A  ON t1.sku_id= A.sku_id 
						

WHERE  (t1.challan_id = @Challan_no) 
group by t1.sku_id,t2.outlet_id, t1.batch_id,t1.Pack_size, t1.Total_qty ,t6.OutletName,t4.SKUName,A.Total_delivered,B.Total_delivered,C.Total_delivered
order by t1.sku_id,t2.outlet_id
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_CurrentStock]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[RPT_CurrentStock]
	@dbids varchar(Max)
AS
BEGIN
	
                 
SELECT t1.REGION_Name,t1.AREA_Name,t1.CEAREA_Name,t1.DB_Name,t1.Status, t1.DB_Id AS dbId, t5.SKUName, t2.sku_id, t2.batch_id, t2.db_lifting_price, 
                  t2.outlet_lifting_price, t2.mrp, t4.packSize, t4.qtyPs, ISNULL(A.bookedqty, 0) AS bookedqty, t4.qtyPs + ISNULL(A.bookedqty, 0) AS totalqty
FROM     tbld_db_zone_view AS t1 
INNER JOIN
                                   tbld_bundle_price_details AS t2 ON t1.PriceBuandle_id = t2.bundle_price_id INNER JOIN
                  tblt_inventory AS t4 ON t2.sku_id = t4.skuId AND t4.batchNo=t2.batch_id AND t1.DB_Id = t4.dbId INNER JOIN
                  tbld_SKU AS t5 ON t2.sku_id = t5.SKU_id LEFT OUTER JOIN
                      (SELECT t6.db_id, t7.sku_id, t7.batch_id, t7.Pack_size, SUM(t7.Total_qty) AS bookedqty
                       FROM      tblt_Challan AS t6 INNER JOIN
                                         tblt_Challan_line AS t7 ON t6.id = t7.challan_id
                       WHERE   (t6.challan_status = 1)
                       GROUP BY t6.db_id, t7.sku_id, t7.batch_id, t7.Pack_size) AS A ON A.sku_id = t2.sku_id AND A.db_id = t1.DB_Id AND A.batch_id = t2.batch_id
WHERE  t2.status = 1 AND t5.SKUStatus=1  And t1.DB_Id in  (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))

order by  t5.SKUsl

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_OrderVsStock]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_OrderVsStock] 	
	@DBID int
AS
BEGIN
	SELECT t2.db_id,t2.psr_id,t7.Name as PsrName,t5.skuId,t5.qtyPs As stockQty,A.quantity_ordered as orderQty,t4.SKUName, t1.sku_id, t1.Betch_id,t1.Pack_size,t6.OutletId,t6.OutletName,SUM(t1.quantity_ordered) AS quantity_ordered
FROM     tblt_Order AS t2 
INNER JOIN tblt_Order_line AS t1 ON t2.Orderid = t1.Orderid 
INNER JOIN tbld_Outlet AS t6 on t2.Orderid=t6.OutletId 
INNER JOIN tbld_SKU AS t4 ON t1.sku_id = t4.SKU_id 
INNER JOIN tbld_distribution_employee AS t7 ON t7.id=t2.psr_id
LEFT JOIN ( SELECT x1.db_id, x2.sku_id, x2.Betch_id,SUM(x2.quantity_ordered) AS quantity_ordered 
			FROM  tblt_Order AS x1
			INNER JOIN tblt_Order_line AS x2 ON x2.Orderid = x1.Orderid 
			WHERE x1.db_id=@DBID AND x1.so_status=1
			GROUP BY x1.db_id, x2.sku_id, x2.Betch_id				  			  
			) as A  ON t1.sku_id= A.sku_id AND t2.db_id=A.db_id AND A.Betch_id=t1.Betch_id
LEFT JOIN tblt_inventory as t5 ON t1.sku_id= t5.skuId AND t2.db_id=t5.dbId AND t1.Betch_id=t5.batchNo 
WHERE t2.db_id=@DBID AND t2.so_status=1
GROUP BY t2.db_id,t2.psr_id,t7.Name,t1.sku_id, t1.Betch_id,  t1.Pack_size, t4.SKUName,t5.skuId,t5.qtyPs,t6.OutletId,t6.OutletName,A.quantity_ordered
ORDER BY t2.db_id,t1.sku_id, t1.Betch_id
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_DBLifting]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[RPT_Realtime_DBLifting]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
AS
BEGIN

SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.National_id, A.[National], A.Status, A.Cluster, A.DBCode, A.OfficeAddress, A.PriceBuandle_id, B.Id, B.ChallanNo, B.DbId, 
                  B.ChallanDate, B.ReceivedDate, B.Timestamp ,C.ChallanQty,C.ReciveQty
FROM     tbld_db_zone_view AS A INNER JOIN
                  tblt_PurchaseOrder AS B ON A.DB_Id = B.DbId LEFT OUTER JOIN
                      (SELECT POId, SUM(ChallanQty / PackSize) AS ChallanQty, SUM(ReciveQty / PackSize) AS ReciveQty
                       FROM      tblt_PurchaseOrderLine
                       GROUP BY POId) AS C ON B.Id = C.POId
					   Where B.ReceivedDate between @Start_Date AND @End_Date And B.DbId in (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ','))
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OrderVsdeliveredDBDetails]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OrderVsdeliveredDBDetails]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.DBCode, A.cluster, G.SKU_id, G.SKUName, ISNULL(B.quantity_ordered, 0) AS quantity_ordered, ISNULL(B.quantity_confirmed, 
                  0) AS quantity_confirmed, ISNULL(B.quantity_ordered_value, 0) AS quantity_ordered_value, ISNULL(B.quantity_confirmed_value, 0) AS quantity_confirmed_value, ISNULL(C.Freequantity_ordered, 0) AS Freequantity_ordered, 
                  ISNULL(C.Freequantity_confirmed, 0) AS Freequantity_confirmed, ISNULL(D.quantity_delivered, 0) AS quantity_delivered, ISNULL(D.quantity_delivered_value, 0) AS quantity_delivered_value, ISNULL(E.Freequantity_delivered, 0) 
                  AS Freequantity_delivered
FROM     tbld_db_zone_view AS A INNER JOIN
                      (SELECT DISTINCT sku_id AS skuid, bundle_price_id
                       FROM      tbld_bundle_price_details AS t1
					   where t1.SKU_id IN                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@skuids, ',')
					   )) AS F ON A.PriceBuandle_id = F.bundle_price_id INNER JOIN
                  tbld_SKU AS G ON F.skuid = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t2.sku_id, SUM(t2.quantity_ordered / t2.Pack_size) AS quantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS quantity_confirmed, SUM(t2.quantity_ordered * t2.unit_sale_price) 
                                         AS quantity_ordered_value, SUM(t2.quantity_confirmed * t2.unit_sale_price) AS quantity_confirmed_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id, t2.sku_id) AS B ON A.DB_Id = B.db_id AND B.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t2.sku_id, SUM(t2.quantity_ordered / t2.Pack_size) AS Freequantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS Freequantity_confirmed
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id,t2.sku_id) AS C ON A.DB_Id = C.db_id AND C.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id,  t2.sku_id,SUM(t2.quantity_delivered / t2.Pack_size) AS quantity_delivered, SUM(t2.quantity_delivered * t2.unit_sale_price) AS quantity_delivered_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id,t2.sku_id) AS D ON A.DB_Id = D.db_id AND D.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t2.sku_id, SUM(t2.quantity_delivered / t2.Pack_size) AS Freequantity_delivered
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id  IN (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')) ) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id, t2.sku_id) AS E ON A.DB_Id = E.db_id AND E.sku_id = G.SKU_id
WHERE  (A.DB_Id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,G.SKU_id

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OrderVsdeliveredDBSummary]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OrderVsdeliveredDBSummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name,A.REGION_Name, A.DBCode,  A.cluster, ISNULL(B.quantity_ordered, 0) 
                  AS quantity_ordered, ISNULL(B.quantity_confirmed, 0) AS quantity_confirmed, ISNULL(B.quantity_ordered_value, 0) AS quantity_ordered_value, ISNULL(B.quantity_confirmed_value, 0) AS quantity_confirmed_value, 
                  ISNULL(C.Freequantity_ordered, 0) AS Freequantity_ordered, ISNULL(C.Freequantity_confirmed, 0) AS Freequantity_confirmed, ISNULL(D.quantity_delivered, 0) AS quantity_delivered, ISNULL(D.quantity_delivered_value, 0) 
                  AS quantity_delivered_value, ISNULL(E.Freequantity_delivered, 0) AS Freequantity_delivered
FROM     tbld_db_zone_view AS A LEFT OUTER JOIN
                      (SELECT t1.db_id, SUM(t2.quantity_ordered / t2.Pack_size) AS quantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS quantity_confirmed, SUM(t2.quantity_ordered * t2.unit_sale_price) AS quantity_ordered_value, 
                                         SUM(t2.quantity_confirmed * t2.unit_sale_price) AS quantity_confirmed_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value  FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id) AS B ON A.DB_Id = B.db_id LEFT OUTER JOIN
                      (SELECT t1.db_id,SUM(t2.quantity_ordered / t2.Pack_size) AS Freequantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS Freequantity_confirmed
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id) AS C ON  A.DB_Id = C.db_id LEFT OUTER JOIN
                      (SELECT t1.db_id, SUM(t2.quantity_delivered / t2.Pack_size) AS quantity_delivered, SUM(t2.quantity_delivered * t2.unit_sale_price) AS quantity_delivered_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value FROM      dbo.FunctionStringtoIntlist(@skuids, ',')))AND (t1.db_id IN
                                             (SELECT Value FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id) AS D ON A.DB_Id = D.db_id LEFT OUTER JOIN
                      (SELECT t1.db_id, SUM(t2.quantity_delivered / t2.Pack_size) AS Freequantity_delivered
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id = 15) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id) AS E ON  A.DB_Id = C.db_id
WHERE  (A.DB_Id IN
                      (SELECT Value FROM      dbo.FunctionStringtoIntlist(@dbids, ',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OrderVsdeliveredDetails]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OrderVsdeliveredDetails]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.cluster, G.SKU_id, G.SKUName, ISNULL(B.quantity_ordered, 0) AS quantity_ordered, ISNULL(B.quantity_confirmed, 
                  0) AS quantity_confirmed, ISNULL(B.quantity_ordered_value, 0) AS quantity_ordered_value, ISNULL(B.quantity_confirmed_value, 0) AS quantity_confirmed_value, ISNULL(C.Freequantity_ordered, 0) AS Freequantity_ordered, 
                  ISNULL(C.Freequantity_confirmed, 0) AS Freequantity_confirmed, ISNULL(D.quantity_delivered, 0) AS quantity_delivered, ISNULL(D.quantity_delivered_value, 0) AS quantity_delivered_value, ISNULL(E.Freequantity_delivered, 0) 
                  AS Freequantity_delivered
FROM     tbld_db_psr_zone_view AS A INNER JOIN
                      (SELECT DISTINCT sku_id AS skuid, bundle_price_id
                       FROM      tbld_bundle_price_details AS t1
					   where t1.SKU_id IN                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@skuids, ',')
					   )) AS F ON A.PriceBuandle_id = F.bundle_price_id INNER JOIN
                  tbld_SKU AS G ON F.skuid = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, t2.sku_id, SUM(t2.quantity_ordered / t2.Pack_size) AS quantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS quantity_confirmed, SUM(t2.quantity_ordered * t2.unit_sale_price) 
                                         AS quantity_ordered_value, SUM(t2.quantity_confirmed * t2.unit_sale_price) AS quantity_confirmed_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id, t1.psr_id, t2.sku_id) AS B ON A.PSR_id = B.psr_id AND B.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, t2.sku_id, SUM(t2.quantity_ordered / t2.Pack_size) AS Freequantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS Freequantity_confirmed
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id, t1.psr_id,t2.sku_id) AS C ON A.PSR_id = C.psr_id AND C.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id,  t2.sku_id,SUM(t2.quantity_delivered / t2.Pack_size) AS quantity_delivered, SUM(t2.quantity_delivered * t2.unit_sale_price) AS quantity_delivered_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id, t1.psr_id,t2.sku_id) AS D ON A.PSR_id = D.psr_id AND D.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, t2.sku_id, SUM(t2.quantity_delivered / t2.Pack_size) AS Freequantity_delivered
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id, t1.psr_id ,t2.sku_id) AS E ON A.PSR_id = E.psr_id AND E.sku_id = G.SKU_id
WHERE  (A.DB_Id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id,G.SKU_id

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OrderVsdeliveredSummary]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OrderVsdeliveredSummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name,A.REGION_Name, A.Name, A.PSR_id, A.PSR_Code, A.DBCode,  A.cluster, ISNULL(B.quantity_ordered, 0) 
                  AS quantity_ordered, ISNULL(B.quantity_confirmed, 0) AS quantity_confirmed, ISNULL(B.quantity_ordered_value, 0) AS quantity_ordered_value, ISNULL(B.quantity_confirmed_value, 0) AS quantity_confirmed_value, 
                  ISNULL(C.Freequantity_ordered, 0) AS Freequantity_ordered, ISNULL(C.Freequantity_confirmed, 0) AS Freequantity_confirmed, ISNULL(D.quantity_delivered, 0) AS quantity_delivered, ISNULL(D.quantity_delivered_value, 0) 
                  AS quantity_delivered_value, ISNULL(E.Freequantity_delivered, 0) AS Freequantity_delivered
FROM     tbld_db_psr_zone_view AS A LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, SUM(t2.quantity_ordered / t2.Pack_size) AS quantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS quantity_confirmed, SUM(t2.quantity_ordered * t2.unit_sale_price) AS quantity_ordered_value, 
                                         SUM(t2.quantity_confirmed * t2.unit_sale_price) AS quantity_confirmed_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id, t1.psr_id) AS B ON A.PSR_id = B.psr_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, SUM(t2.quantity_ordered / t2.Pack_size) AS Freequantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS Freequantity_confirmed
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id, t1.psr_id) AS C ON A.PSR_id = C.psr_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, SUM(t2.quantity_delivered / t2.Pack_size) AS quantity_delivered, SUM(t2.quantity_delivered * t2.unit_sale_price) AS quantity_delivered_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ',')))AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.db_id, t1.psr_id) AS D ON A.PSR_id = D.psr_id LEFT OUTER JOIN
                      (SELECT t1.db_id, t1.psr_id, SUM(t2.quantity_delivered / t2.Pack_size) AS Freequantity_delivered
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status = 3) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id = 15) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.db_id, t1.psr_id) AS E ON A.PSR_id = E.psr_id
WHERE  (A.DB_Id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OutletWiseOrder]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OutletWiseOrder]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT t4.REGION_Name, t4.AREA_Name, t4.CEAREA_Name,  t4.DB_Id, t4.DB_Name, t4.DBCode,t4.Cluster, t4.OfficeAddress,t4.PSR_id,T4.Name As PSR_Name,t5.RouteID,t5.RouteName,t4.OutletCode, t4.OutletName, 
                  t1.outlet_id, t2.sku_id,t6.SKUName, t2.Betch_id, t2.Pack_size, t2.unit_sale_price, t2.sku_order_type_id, sum(t2.quantity_ordered) AS quantity_ordered, sum(t2.quantity_confirmed) As quantity_confirmed, Sum(t2.quantity_ordered*t2.unit_sale_price)As OrderAmount,t4.REGION_id,t4.AREA_id, t4.CEAREA_id
FROM     tblt_Order AS t1 INNER JOIN
                  tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid Inner JOIN
                  tbld_db_psr_outlet_zone_view AS t4 ON t1.outlet_id = t4.OutletId left JOIN
                  tbld_distributor_Route AS t5 ON t5.RouteID = t4.parentid Inner join 
				  tbld_SKU As t6 on t2.sku_id=t6.SKU_id
				  Where t4.Distributorid IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')) and  planned_order_date between @Start_Date AND  @End_Date and t4.IsActive=1
GROUP BY t1.outlet_id, t2.sku_id,t6.SKUName,t4.DB_Id, t4.DB_Name,T4.Name, t4.CEAREA_id, t4.CEAREA_Name, t4.AREA_id, t4.AREA_Name, t4.REGION_id, t4.REGION_Name, t4.National_id, t4.[National], t4.Status, t4.Cluster, t4.DBCode, t4.OfficeAddress,t4.OutletName,t2.Betch_id, t2.Pack_size, t2.unit_sale_price, t2.sku_order_type_id,t4.OutletCode,t5.RouteID,t5.RouteName,t4.PSR_id
Order by  t4.REGION_id,t4.AREA_id, t4.CEAREA_id,t4.DB_Id,t4.PSR_id



END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_SKUWiseOrder]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_SKUWiseOrder]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.DBCode, A.cluster,A.PSR_Code,A.Name, G.SKU_id, G.SKUName, ISNULL(B.quantity_ordered, 0) AS quantity_ordered, ISNULL(B.quantity_confirmed, 
                  0) AS quantity_confirmed, ISNULL(B.quantity_ordered_value, 0) AS quantity_ordered_value, ISNULL(B.quantity_confirmed_value, 0) AS quantity_confirmed_value, ISNULL(C.Freequantity_ordered, 0) AS Freequantity_ordered, 
                  ISNULL(C.Freequantity_confirmed, 0) AS Freequantity_confirmed
FROM     tbld_db_psr_zone_view AS A INNER JOIN
                      (SELECT DISTINCT sku_id AS skuid, bundle_price_id
                       FROM      tbld_bundle_price_details AS t1
					   where t1.SKU_id IN                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@skuids, ',')
					   )) AS F ON A.PriceBuandle_id = F.bundle_price_id INNER JOIN
                  tbld_SKU AS G ON F.skuid = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.psr_id,t2.sku_id, SUM(CAST(t2.quantity_ordered AS float) / t2.Pack_size) AS quantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS quantity_confirmed, SUM(t2.quantity_ordered * t2.unit_sale_price) 
                                         AS quantity_ordered_value, SUM(t2.quantity_confirmed * t2.unit_sale_price) AS quantity_confirmed_value
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 1)
                       GROUP BY t1.psr_id,t2.sku_id) AS B ON A.PSR_id = B.psr_id AND B.sku_id = G.SKU_id LEFT OUTER JOIN
                      (SELECT t1.psr_id,t2.sku_id, SUM(CAST(t2.quantity_ordered AS float) / t2.Pack_size) AS Freequantity_ordered, SUM(t2.quantity_confirmed / t2.Pack_size) AS Freequantity_confirmed
                       FROM      tblt_Order AS t1 INNER JOIN
                                         tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
                       WHERE   (t1.so_status <> 9) AND (t2.sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))) AND (t1.db_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (t1.planned_order_date BETWEEN @Start_Date AND @End_Date) AND (t2.sku_order_type_id = 2)
                       GROUP BY t1.psr_id,t2.sku_id) AS C ON A.PSR_id = C.psr_id AND C.sku_id = G.SKU_id 
                      
WHERE  (A.DB_Id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,G.SKUsl

END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_TradepromotionDetails]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_TradepromotionDetails]	
@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
	
AS
BEGIN
SELECT C.REGION_Name, C.AREA_Name, C.CEAREA_Name, C.DB_Id, C.DB_Name, C.Cluster, A.code, A.name, A.name AS Tp_name, A.description, A.start_date, A.end_date, A.is_active
FROM     tblt_TradePromotion AS A INNER JOIN
                  tblt_TradePromotionDBhouseMapping AS B ON A.id = B.promo_id INNER JOIN
                  tbld_db_zone_view AS C ON B.db_id = C.DB_Id
WHERE  (A.is_active = 1) AND (B.db_id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND A.start_date between @Start_Date AND @End_Date



END

GO
/****** Object:  StoredProcedure [dbo].[RPT_RoutePlan]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[RPT_RoutePlan] 
	
AS
BEGIN
	SELECT t6.DB_Id, t6.DB_Name, t6.CEAREA_id, t6.CEAREA_Name, t6.AREA_id, t6.AREA_Name, t6.REGION_id, t6.REGION_Name, t6.Status, t2.Name, t3.RouteName, t1.db_emp_id, t1.route_plan_id, t1.route_id, COUNT(t5.OutletId) AS NoOfOutlet, 
                  t1.day
FROM     tbld_Route_Plan_Mapping AS t1 INNER JOIN
                  tbld_distribution_employee AS t2 ON t1.db_emp_id = t2.id INNER JOIN
                  tbld_distributor_Route AS t3 ON t1.route_id = t3.RouteID INNER JOIN
                  tbld_Outlet AS t5 ON t1.route_id = t5.parentid INNER JOIN
                  tbld_db_zone_view AS t6 ON t1.db_id = t6.DB_Id
WHERE  (t5.IsActive = 1)
GROUP BY t1.id, t1.db_emp_id, t1.route_plan_id, t1.route_id, t1.day, t3.RouteName, t2.Name, t6.DB_Id, t6.DB_Name, t6.CEAREA_id, t6.CEAREA_Name, t6.AREA_id, t6.AREA_Name, t6.REGION_id, t6.REGION_Name, t6.Status
ORDER BY t1.db_emp_id
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_List]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_TP_List]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)

AS
BEGIN
	SELECT DISTINCT
  (t1.id),
  t1.[name]

FROM [ODMS].[dbo].[tblt_TradePromotion] AS t1
INNER JOIN [ODMS].[dbo].tblt_TradePromotionDBhouseMapping AS t2
  ON t1.id = t2.promo_id
WHERE (t1.start_date BETWEEN @Start_Date AND @End_Date
AND is_active = 1
AND t2.db_id IN (SELECT Value FROM dbo.FunctionStringtoIntlist(@dbids, ',')))
OR (end_date BETWEEN @Start_Date AND @End_Date
AND is_active = 1
AND t2.db_id IN (SELECT Value FROM dbo.FunctionStringtoIntlist(@dbids, ',')))
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Daily_OrderDetails]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Daily_OrderDetails]	
AS
BEGIN

DECLARE @BatchDeliveryStartDate date;
DECLARE @BatchDeliveryEndDate date;

Set @BatchDeliveryStartDate =CAST((dateadd(day,-30, getdate())) as date);
Set @BatchDeliveryEndDate = CAST(GETDATE()as date);

DELETE FROM [ODMSBI].[dbo].[tblr_OrderDetails] WHERE delivery_Process_Date between @BatchDeliveryStartDate AND @BatchDeliveryEndDate ;

INSERT INTO [ODMSBI].[dbo].[tblr_OrderDetails]
           ([db_id]
           ,[psr_id]
		   ,so_id
           ,[planned_order_date]
           ,[delivery_date]
           ,[delivery_Process_Date]
           ,[Orderid]
           ,[outlet_id]
           ,[Challan_no]
           ,[sku_id]
           ,[Betch_id]
           ,[Pack_size]
           ,[unit_sale_price]
           ,[sku_order_type_id]
           ,[promotion_id]
           ,[quantity_ordered]
           ,[quantity_confirmed]
           ,[quantity_delivered]
           ,[total_sale_price])
SELECT t1.db_id, t1.psr_id,t1.so_id ,t1.planned_order_date, t1.delivery_date, t1.delivery_Process_Date, t1.Orderid, t1.outlet_id, t1.Challan_no, t2.sku_id, t2.Betch_id, t2.Pack_size, t2.unit_sale_price, 
                  t2.sku_order_type_id, t2.promotion_id, t2.quantity_ordered, t2.quantity_confirmed, t2.quantity_delivered, t2.total_sale_price
FROM     [ODMS].[dbo].tblt_Order AS t1 INNER JOIN
                  [ODMS].[dbo].tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
				  Where CAST(t1.delivery_Process_Date as date) between @BatchDeliveryStartDate AND @BatchDeliveryEndDate AND t1.so_status=3
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Daily_OutletWiseBuyer]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Daily_OutletWiseBuyer]

AS
BEGIN
DECLARE @BatchDeliveryDate date;

Set @BatchDeliveryDate = CAST(GETDATE()as date);
	

INSERT INTO [ODMSBI].[dbo].[tblr_OutletWiseBuyer]
           ([BatchDate]
           ,[BatchDeliveryDate]
           ,[DB_id]
           ,[Orderid]
           ,[outlet_id]
           ,[sku_id])
		    SELECT  A.planned_order_date As BatchDate,A.delivery_date As BatchDeliveryDate,A.db_id, A.Orderid,A.outlet_id,B.sku_id 
From [ODMS].[dbo].tblt_Order As A 
INNER JOIN [ODMS].[dbo].tblt_Order_line AS B ON A.Orderid = B.Orderid 
where B.sku_order_type_id=1 AND B.lpec=1 AND  CAST(A.delivery_Process_Date as date) = @BatchDeliveryDate  AND A.so_status=3
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_bundle_price_details]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Schedule_Weekly_tbld_bundle_price_details]
	
AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_bundle_price_details];
INSERT INTO [ODMSBI].[dbo].[tbld_bundle_price_details]
           ([bundle_price_id]
           ,[sku_id]
           ,[batch_id]
           ,[quantity]
           ,[db_lifting_price]
           ,[outlet_lifting_price]
           ,[mrp]
           ,[start_date]
           ,[end_date]
           ,[status])
SELECT [bundle_price_id]
      ,[sku_id]
      ,[batch_id]
      ,[quantity]
      ,[db_lifting_price]
      ,[outlet_lifting_price]
      ,[mrp]
      ,[start_date]
      ,[end_date]
      ,[status]
  FROM [ODMS].[dbo].[tbld_bundle_price_details]

END


GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_db_psr_outlet_zone]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Schedule_Weekly_tbld_db_psr_outlet_zone]
AS
	BEGIN
	TRUNCATE TABLE [ODMSBI].[dbo].[tbld_db_psr_outlet_zone];

INSERT INTO [ODMSBI].[dbo].[tbld_db_psr_outlet_zone]
           ([National_id]
           ,[National]
           ,[REGION_id]
           ,[REGION_Name]
           ,[AREA_id]
           ,[AREA_Name]
           ,[CEAREA_id]
           ,[CEAREA_Name]
           ,[DB_Id]
           ,[DB_Name]
           ,[Status]
           ,[Name]
           ,[PSR_id]
           ,[PSR_Code]
           ,[DBCode]
           ,[OfficeAddress]
           ,[cluster]
           ,[RouteName]
           ,[RouteID]
           ,[OutletId]
           ,[OutletCode]
           ,[OutletName]
           ,[OutletName_b]
           ,[Location]
           ,[Address]
           ,[GpsLocation]
           ,[OwnerName]
           ,[ContactNo]
           ,[Distributorid]
           ,[HaveVisicooler]
           ,[parentid]
           ,[outlet_category_id]
           ,[grading]
           ,[channel]
           ,[Latitude]
           ,[Longitude]
           ,[picture]
           ,[IsActive]
           ,[channel_name]
           ,[outlet_category_name]
           ,[Outlet_grade])
SELECT D.[National_id]
           ,D.[National]
           ,D.[REGION_id]
           ,D.[REGION_Name]
           ,D.[AREA_id]
           ,D.[AREA_Name]
           ,D.[CEAREA_id]
           ,D.[CEAREA_Name]
           ,D.[DB_Id]
           ,D.[DB_Name]
           ,D.[Status], D.Name, D.PSR_id, D.PSR_Code, D.DBCode, D.OfficeAddress, 
                  D.cluster, B.RouteName, B.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Location, A.Address, A.GpsLocation, A.OwnerName, A.ContactNo, A.Distributorid, A.HaveVisicooler, A.parentid, A.outlet_category_id, 
                  A.grading, A.channel, A.Latitude, A.Longitude, A.picture, A.IsActive, dbo.tbld_Outlet_channel.name AS channel_name, dbo.tbld_Outlet_category.outlet_category_name, dbo.tbld_Outlet_grade.name AS Outlet_grade
FROM     dbo.tbld_Outlet AS A INNER JOIN
                  dbo.tbld_distributor_Route AS B ON A.parentid = B.RouteID LEFT OUTER JOIN
                  dbo.tbld_Outlet_channel ON A.channel = dbo.tbld_Outlet_channel.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_category ON A.outlet_category_id = dbo.tbld_Outlet_category.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_grade ON A.grading = dbo.tbld_Outlet_grade.id INNER JOIN
                      (SELECT DISTINCT db_id, db_emp_id, route_plan_id, route_id
                       FROM      dbo.tbld_Route_Plan_Mapping) AS C ON B.RouteID = C.route_id LEFT OUTER JOIN
                  dbo.tbld_db_psr_zone_view AS D ON D.PSR_id = C.db_emp_id
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_db_psr_zone]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_db_psr_zone]
AS
	BEGIN
	TRUNCATE TABLE [ODMSBI].[dbo].[tbld_db_psr_zone];

INSERT INTO [ODMSBI].[dbo].[tbld_db_psr_zone]([National_id]
      ,[National]
      ,[REGION_id]
      ,[REGION_Name]
      ,[AREA_id]
      ,[AREA_Name]
      ,[CEAREA_id]
      ,[CEAREA_Name]
      ,[DB_Id]
      ,[DB_Name]
      ,[Status]
      ,[PriceBuandle_id]
      ,[Name]
      ,[PSR_id]
      ,[PSR_Code]
      ,[DBCode]
      ,[OfficeAddress]
      ,[cluster])
           
SELECT dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National],REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name,    dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name,
                  dbo.tbld_distribution_house.Status, dbo.tbld_distribution_house.PriceBuandle_id, dbo.tbld_distribution_employee.Name, dbo.tbld_distribution_employee.id AS PSR_id, dbo.tbld_distribution_employee.Emp_code AS PSR_Code, 
                  dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_cluster.name AS cluster
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_distribution_employee ON dbo.tbld_distribution_house.DB_Id = dbo.tbld_distribution_employee.DistributionId INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id
WHERE  (dbo.tbld_distribution_employee.Emp_Type = 2)
END
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_db_zone]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_db_zone]
AS
	BEGIN
	TRUNCATE TABLE [ODMSBI].[dbo].[tbld_db_zone];

INSERT INTO [ODMSBI].[dbo].[tbld_db_zone]([National_id]
      ,[National]
      ,[REGION_id]
      ,[REGION_Name]
      ,[AREA_id]
      ,[AREA_Name]
      ,[CEAREA_id]
      ,[CEAREA_Name]
      ,[DB_Id]
      ,[DB_Name]
      ,[Status]
      ,[PriceBuandle_id]      
      ,[DBCode]
      ,[OfficeAddress]
      ,[cluster])
           
SELECT dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National],REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name,dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name,
                  dbo.tbld_distribution_house.Status, dbo.tbld_distribution_house.PriceBuandle_id, 
                  dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_cluster.name AS cluster
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id

END
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_Outlet]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Schedule_Weekly_tbld_Outlet]
	@BatchDeliveryDate date
	
AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_Outlet];
INSERT INTO [ODMSBI].[dbo].[tbld_Outlet]
           ([OutletId]
           ,[OutletCode]
           ,[OutletName]
           ,[OutletName_b]
           ,[Location]
           ,[Address]
           ,[GpsLocation]
           ,[OwnerName]
           ,[ContactNo]
           ,[Distributorid]
           ,[HaveVisicooler]
           ,[parentid]
           ,[outlet_category_id]
           ,[grading]
           ,[channel]
           ,[Latitude]
           ,[Longitude]
           ,[picture]
           ,[IsActive]
           ,[createdate])
SELECT  [OutletId]
      ,[OutletCode]
      ,[OutletName]
      ,[OutletName_b]
      ,[Location]
      ,[Address]
      ,[GpsLocation]
      ,[OwnerName]
      ,[ContactNo]
      ,[Distributorid]
      ,[HaveVisicooler]
      ,[parentid]
      ,[outlet_category_id]
      ,[grading]
      ,[channel]
      ,[Latitude]
      ,[Longitude]
      ,[picture]
      ,[IsActive]
      ,[createdate]
  FROM [ODMS].[dbo].[tbld_Outlet]
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_Route_Plan_Mapping]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_Route_Plan_Mapping]

AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_Route_Plan_Mapping];

INSERT INTO [ODMSBI].[dbo].[tbld_Route_Plan_Mapping]
           ([db_id]
           ,[db_emp_id]
           ,[route_plan_id]
           ,[route_id]
           ,[day])
SELECT [db_id]
      ,[db_emp_id]
      ,[route_plan_id]
      ,[route_id]
      ,[day]
  FROM [ODMS].[dbo].[tbld_Route_Plan_Mapping]
END

GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_sku_list]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_sku_list]

AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_sku_list];

INSERT INTO  [ODMSBI].[dbo].[tbld_sku_list]
           ([SKU_id]
           ,[SKUName]
           ,[SKUsl]
           ,[SKUcode]
           ,[SKUStatus]
           ,[SKUbrand_id]
           ,[Sub_brand]
           ,[Brand]
           ,[SKUcategoryid]
           ,[sku_category_name]
           ,[SKUtype_id]
           ,[SKUtype]
           ,[SKUVolume_ml]
           ,[SKUVolume_8oz]
           ,[SKUUnit]
           ,[Pack_Size])

SELECT TOP (100) PERCENT t1.SKU_id, t1.SKUName, t1.SKUsl, t1.SKUcode, t1.SKUStatus, t1.SKUbrand_id, t3.element_name AS Sub_brand, t5.element_name AS Brand, t1.SKUcategoryid, t4.sku_category_name, t1.SKUtype_id, t6.SKUtype, 
                  t1.SKUVolume_ml, t1.SKUVolume_8oz,t1.SKUUnit, t2.qty AS Pack_Size
FROM     dbo.tbld_SKU AS t1 LEFT OUTER JOIN
                  dbo.tbld_SKU_unit AS t2 ON t1.SKUUnit = t2.id LEFT OUTER JOIN
                  dbo.tbld_SKU_Brand AS t3 ON t1.SKUbrand_id = t3.id LEFT OUTER JOIN
                  dbo.tbld_sku_category AS t4 ON t1.SKUcategoryid = t4.Id LEFT OUTER JOIN
                  dbo.tbld_SKU_Brand AS t5 ON t3.parent_element_id = t5.id LEFT OUTER JOIN
                  dbo.tbld_SKUtype AS t6 ON t1.SKUtype_id = t6.SKUtypeId
END

GO
/****** Object:  StoredProcedure [dbo].[User_check]    Script Date: 20-Aug-2018 9:40:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_check]
	@UserName varchar(50),
	@Password varchar(50)
AS
	SELECT A.*,B.user_role_code,C.first_name,C.biz_zone_id FROM user_info AS A
	INNER JOIN user_role AS B ON A.User_role_id=b.user_role_id
	INNER JOIN tbld_management_employee AS C ON C.login_user_id=A.User_id
	WHERE A.User_Name=@UserName AND A.User_Password=@Password AND B.isOnlineLogin=1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[25] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 7
               Left = 313
               Bottom = 170
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_channel"
            Begin Extent = 
               Top = 7
               Left = 555
               Bottom = 170
               Right = 749
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_category"
            Begin Extent = 
               Top = 7
               Left = 797
               Bottom = 170
               Right = 1075
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_grade"
            Begin Extent = 
               Top = 7
               Left = 1123
               Bottom = 170
               Right = 1317
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 175
               Left = 290
               Bottom = 338
               Right = 485
            End
            DisplayFla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'gs = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 42
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[7] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4[60] 2) )"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbld_distribution_house"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 257
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "CEAREA"
            Begin Extent = 
               Top = 7
               Left = 336
               Bottom = 170
               Right = 572
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AREA"
            Begin Extent = 
               Top = 7
               Left = 620
               Bottom = 170
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REGION"
            Begin Extent = 
               Top = 7
               Left = 904
               Bottom = 170
               Right = 1140
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_business_zone"
            Begin Extent = 
               Top = 188
               Left = 324
               Bottom = 351
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_distribution_employee"
            Begin Extent = 
               Top = 222
               Left = 993
               Bottom = 410
               Right = 1273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_cluster"
            Begin Extent = 
               Top = 284
               Left = 80
               Bottom = 447
             ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2892
         Alias = 1932
         Table = 2532
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[36] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbld_distribution_house"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "CEAREA"
            Begin Extent = 
               Top = 7
               Left = 336
               Bottom = 170
               Right = 572
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AREA"
            Begin Extent = 
               Top = 7
               Left = 620
               Bottom = 170
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REGION"
            Begin Extent = 
               Top = 7
               Left = 904
               Bottom = 170
               Right = 1140
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbld_business_zone"
            Begin Extent = 
               Top = 191
               Left = 1064
               Bottom = 354
               Right = 1300
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_cluster"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1200
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 7
               Left = 324
               Bottom = 170
               Right = 526
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t3"
            Begin Extent = 
               Top = 7
               Left = 574
               Bottom = 170
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t4"
            Begin Extent = 
               Top = 7
               Left = 854
               Bottom = 126
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t5"
            Begin Extent = 
               Top = 126
               Left = 854
               Bottom = 289
               Right = 1086
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t6"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 294
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_sku_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_sku_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_sku_View'
GO
USE [master]
GO
ALTER DATABASE [ODMS] SET  READ_WRITE 
GO
