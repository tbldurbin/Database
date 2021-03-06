USE [master]
GO
/****** Object:  Database [ODMSBI]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE DATABASE [ODMSBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ODMSBI', FILENAME = N'D:\All Excercies\ASP.Net\Database\ODMSBI.mdf' , SIZE = 86016KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ODMSBI_log', FILENAME = N'D:\All Excercies\ASP.Net\Database\ODMSBI_log.ldf' , SIZE = 102144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ODMSBI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ODMSBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ODMSBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ODMSBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ODMSBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ODMSBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ODMSBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [ODMSBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ODMSBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ODMSBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ODMSBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ODMSBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ODMSBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ODMSBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ODMSBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ODMSBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ODMSBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ODMSBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ODMSBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ODMSBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ODMSBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ODMSBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ODMSBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ODMSBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ODMSBI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ODMSBI] SET  MULTI_USER 
GO
ALTER DATABASE [ODMSBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ODMSBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ODMSBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ODMSBI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ODMSBI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ODMSBI]
GO
/****** Object:  UserDefinedFunction [dbo].[FunctionStringtoIntlist]    Script Date: 20-Aug-2018 9:41:44 PM ******/
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
/****** Object:  Table [dbo].[tbld_bundle_price_details]    Script Date: 20-Aug-2018 9:41:44 PM ******/
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
/****** Object:  Table [dbo].[tbld_db_psr_outlet_zone]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_db_psr_outlet_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[National_id] [int] NULL,
	[National] [varchar](50) NULL,
	[REGION_id] [int] NULL,
	[REGION_Name] [varchar](200) NULL,
	[AREA_id] [int] NULL,
	[AREA_Name] [varchar](200) NULL,
	[CEAREA_id] [int] NULL,
	[CEAREA_Name] [varchar](200) NULL,
	[DB_Id] [int] NULL,
	[DB_Name] [varchar](200) NULL,
	[Status] [int] NULL,
	[Name] [varchar](200) NULL,
	[PSR_id] [int] NULL,
	[PSR_Code] [int] NULL,
	[DBCode] [int] NULL,
	[OfficeAddress] [varchar](200) NULL,
	[cluster] [varchar](200) NULL,
	[RouteName] [varchar](200) NULL,
	[RouteID] [int] NULL,
	[OutletId] [int] NULL,
	[OutletCode] [int] NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](200) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[parentid] [int] NULL,
	[outlet_category_id] [int] NULL,
	[grading] [int] NULL,
	[channel] [int] NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[channel_name] [varchar](50) NULL,
	[outlet_category_name] [varchar](50) NULL,
	[Outlet_grade] [varchar](50) NULL,
 CONSTRAINT [PK_tbld_db_psr_outlet_zone] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_db_psr_outlet_zone]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_db_psr_outlet_zone] ON [dbo].[tbld_db_psr_outlet_zone]
(
	[DB_Id] ASC,
	[OutletId] ASC,
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_db_psr_zone]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_db_psr_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[National_id] [int] NULL,
	[National] [varchar](50) NULL,
	[REGION_id] [int] NULL,
	[REGION_Name] [varchar](200) NULL,
	[AREA_id] [int] NULL,
	[AREA_Name] [varchar](200) NULL,
	[CEAREA_id] [int] NULL,
	[CEAREA_Name] [varchar](200) NULL,
	[DB_Id] [int] NULL,
	[DB_Name] [varchar](200) NULL,
	[Status] [int] NULL,
	[PriceBuandle_id] [int] NULL,
	[Name] [varchar](200) NULL,
	[PSR_id] [int] NULL,
	[PSR_Code] [varchar](200) NULL,
	[DBCode] [int] NULL,
	[OfficeAddress] [varchar](200) NULL,
	[cluster] [varchar](200) NULL,
 CONSTRAINT [PK_tbld_db_psr_zone] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_db_psr_zone]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_db_psr_zone] ON [dbo].[tbld_db_psr_zone]
(
	[PSR_id] ASC,
	[DB_Id] ASC,
	[CEAREA_id] ASC,
	[AREA_id] ASC,
	[REGION_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_db_zone]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_db_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[National_id] [int] NULL,
	[National] [varchar](50) NULL,
	[REGION_id] [int] NULL,
	[REGION_Name] [varchar](200) NULL,
	[AREA_id] [int] NULL,
	[AREA_Name] [varchar](200) NULL,
	[CEAREA_id] [int] NULL,
	[CEAREA_Name] [varchar](200) NULL,
	[DB_Id] [int] NULL,
	[DB_Name] [varchar](200) NULL,
	[Status] [int] NULL,
	[PriceBuandle_id] [int] NULL,
	[DBCode] [varchar](200) NULL,
	[OfficeAddress] [varchar](200) NULL,
	[cluster] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbld_Outlet]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbld_Outlet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutletId] [int] NOT NULL,
	[OutletCode] [varchar](50) NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](max) NULL,
	[OwnerName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[parentid] [int] NULL,
	[outlet_category_id] [int] NULL,
	[grading] [int] NULL,
	[channel] [int] NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](200) NULL,
	[IsActive] [int] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_tbld_Outlet] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_Outlet]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_Outlet] ON [dbo].[tbld_Outlet]
(
	[Distributorid] ASC,
	[OutletId] ASC,
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_Route_Plan_Mapping]    Script Date: 20-Aug-2018 9:41:44 PM ******/
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
/****** Object:  Index [IX_tbld_Route_Plan_Mapping]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_Route_Plan_Mapping] ON [dbo].[tbld_Route_Plan_Mapping]
(
	[db_id] ASC,
	[db_emp_id] ASC,
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbld_sku_list]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_sku_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SKU_id] [int] NULL,
	[SKUName] [varchar](200) NULL,
	[SKUsl] [int] NULL,
	[SKUcode] [int] NULL,
	[SKUStatus] [int] NULL,
	[SKUbrand_id] [int] NULL,
	[Sub_brand] [varchar](200) NULL,
	[Brand] [varchar](200) NULL,
	[SKUcategoryid] [int] NULL,
	[sku_category_name] [varchar](200) NULL,
	[SKUtype_id] [int] NULL,
	[SKUtype] [varchar](200) NULL,
	[SKUVolume_ml] [float] NULL,
	[SKUVolume_8oz] [float] NULL,
	[SKUUnit] [int] NULL,
	[Pack_Size] [int] NULL,
 CONSTRAINT [PK_tbld_sku_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblr_Disributor_Day_End]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_Disributor_Day_End](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dbid] [int] NOT NULL,
	[BatchDate] [datetime] NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblr_OrderDetails]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NULL,
	[psr_id] [int] NULL,
	[so_id] [varchar](200) NULL,
	[planned_order_date] [datetime2](7) NULL,
	[delivery_date] [datetime2](7) NULL,
	[delivery_Process_Date] [datetime2](7) NULL,
	[Orderid] [int] NULL,
	[outlet_id] [int] NULL,
	[Challan_no] [int] NULL,
	[sku_id] [int] NULL,
	[Betch_id] [int] NULL,
	[Pack_size] [int] NULL,
	[unit_sale_price] [money] NULL,
	[sku_order_type_id] [int] NULL,
	[promotion_id] [int] NULL,
	[quantity_ordered] [int] NULL,
	[quantity_confirmed] [int] NULL,
	[quantity_delivered] [int] NULL,
	[total_sale_price] [money] NULL,
 CONSTRAINT [PK_tblr_OrderDetails] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblr_OrderDetails]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_OrderDetails] ON [dbo].[tblr_OrderDetails]
(
	[planned_order_date] DESC,
	[delivery_date] DESC,
	[Orderid] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_OutletWiseBuyer]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_OutletWiseBuyer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[BatchDeliveryDate] [date] NULL,
	[DB_id] [int] NULL,
	[Orderid] [int] NULL,
	[outlet_id] [int] NULL,
	[sku_id] [int] NULL,
 CONSTRAINT [PK_tblr_OutletWiseBuyer_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_tblr_OutletWiseBuyer]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_OutletWiseBuyer] ON [dbo].[tblr_OutletWiseBuyer]
(
	[BatchDate] DESC,
	[BatchDeliveryDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_OutletWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_OutletWiseSKUWiseDelivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[OutletId] [int] NULL,
	[OutletCode] [int] NULL,
	[OutletName] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[SKUId] [int] NULL,
	[SKUName] [varchar](50) NULL,
	[PackSize] [int] NULL,
	[UnitPrice] [float] NULL,
	[SKUVolume8oz] [money] NULL,
	[Delivered_Quentity] [money] NULL,
	[FreeDelivered_Quentity] [money] NULL,
 CONSTRAINT [PK_tblr_OutletWiseSKUWiseDelivery] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblr_OutletWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_OutletWiseSKUWiseDelivery] ON [dbo].[tblr_OutletWiseSKUWiseDelivery]
(
	[BatchDate] DESC,
	[Distributorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_OutletWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_OutletWiseSKUWiseOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[OutletId] [int] NULL,
	[OutletCode] [int] NULL,
	[OutletName] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[SKUId] [int] NULL,
	[SKUName] [varchar](50) NULL,
	[PackSize] [int] NULL,
	[UnitPrice] [float] NULL,
	[SKUVolume8oz] [money] NULL,
	[Order_Quentity] [money] NULL,
	[Confirmed_Quantity] [money] NULL,
	[FreeOrder_Quentity] [money] NULL,
	[FreeConfirmed_Quantity] [money] NULL,
 CONSTRAINT [PK_tblr_OutletWiseSKUWiseOrder] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tblr_OutletWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [Indx_tblr_OutletWiseSKUWiseOrder] ON [dbo].[tblr_OutletWiseSKUWiseOrder]
(
	[BatchDate] DESC,
	[OutletId] ASC,
	[Distributorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_PerformanceKPI]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_PerformanceKPI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DB_id] [varchar](100) NOT NULL,
	[BatchDate] [datetime] NOT NULL,
	[PerformerId] [varchar](100) NOT NULL,
	[PerformerName] [varchar](200) NOT NULL,
	[PerformerType] [int] NOT NULL,
	[SalesScheduleCall] [money] NOT NULL,
	[SalesMemo] [money] NOT NULL,
	[TotalLineSold] [money] NOT NULL,
	[TotalSoldInVolume] [money] NULL,
	[TotalSoldInCase] [money] NULL,
	[TotalSoldInValue] [money] NOT NULL,
	[TotalOrderedInVolume] [money] NULL,
	[TotalOrderedInCase] [money] NOT NULL,
	[TotalOrderedInValue] [money] NOT NULL,
 CONSTRAINT [PK_tblr_PerformanceKPI_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblr_PSRWiseMonthTGT]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_PSRWiseMonthTGT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NULL,
	[db_id] [int] NULL,
	[psr_id] [int] NULL,
	[TotalTGTCS] [money] NULL,
	[TotalTGTVolume8oz] [money] NULL,
	[TGTOrder] [money] NULL,
	[TGTConfirmed] [money] NULL,
	[TGTDelivered] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblr_PSRWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_PSRWiseSKUWiseDelivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DB_id] [int] NULL,
	[BatchDate] [date] NULL,
	[PSRId] [int] NULL,
	[PSRName] [varchar](50) NULL,
	[SKUId] [int] NULL,
	[SKUName] [varchar](50) NULL,
	[PackSize] [int] NULL,
	[SKUVolume8oz] [money] NULL,
	[UnitPrice] [money] NULL,
	[Delivered_Quentity] [money] NULL,
	[FreeDelivered_Quentity] [money] NULL,
 CONSTRAINT [PK_tblr_PSRWiseSKUWiseDelivery] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblr_PSRWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_PSRWiseSKUWiseDelivery] ON [dbo].[tblr_PSRWiseSKUWiseDelivery]
(
	[BatchDate] DESC,
	[DB_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_PSRWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_PSRWiseSKUWiseOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DB_id] [int] NULL,
	[BatchDate] [date] NULL,
	[PSRId] [int] NULL,
	[PSRName] [varchar](50) NULL,
	[SKUId] [int] NULL,
	[SKUName] [varchar](50) NULL,
	[PackSize] [int] NULL,
	[SKUVolume8oz] [money] NULL,
	[UnitPrice] [money] NULL,
	[Order_Quentity] [money] NULL,
	[Confirmed_Quantity] [money] NULL,
	[FreeOrder_Quentity] [money] NULL,
	[FreeConfirmed_Quantity] [money] NULL,
 CONSTRAINT [PK_tblr_PSRWiseSKUWiseOrder] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblr_PSRWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_PSRWiseSKUWiseOrder] ON [dbo].[tblr_PSRWiseSKUWiseOrder]
(
	[BatchDate] DESC,
	[DB_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblr_StockMovement]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_StockMovement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[dbId] [int] NULL,
	[SKUid] [int] NULL,
	[BatchNo] [int] NULL,
	[PackSize] [int] NULL,
	[db_lifting_price] [money] NULL,
	[outlet_lifting_price] [money] NULL,
	[mrp] [money] NULL,
	[ClosingSoundStockQty] [int] NULL,
	[ClosingBookedStockQty] [int] NULL,
	[PrimaryChallanQty] [int] NULL,
	[PrimaryQty] [int] NULL,
	[SalesQty] [int] NULL,
	[FreeSalesQty] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [IX_tblr_StockMovement]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_StockMovement] ON [dbo].[tblr_StockMovement]
(
	[BatchDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblr_PerformanceKPI]    Script Date: 20-Aug-2018 9:41:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblr_PerformanceKPI] ON [dbo].[tblr_PerformanceKPI]
(
	[BatchDate] DESC,
	[PerformerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByDBDetails]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByDBDetails]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN


SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.Status, A.Cluster, A.DBCode, A.OfficeAddress, C.SKU_id, C.SKUName, ISNULL(D.TotalOutlet, 0) AS TotalOutlet, ISNULL(E.BuyerOutlet, 0) AS BuyerOutlet, 
                  ISNULL(D.TotalOutlet, 0) - ISNULL(E.BuyerOutlet, 0) AS NonBuyer
FROM     tbld_db_zone AS A INNER JOIN
                      (SELECT DISTINCT sku_id AS skuid, bundle_price_id
                       FROM      tbld_bundle_price_details AS t1) AS B ON A.PriceBuandle_id = B.bundle_price_id INNER JOIN
                  tbld_sku_list AS C ON B.skuid = C.SKU_id LEFT OUTER JOIN
                      (SELECT Distributorid, COUNT(DISTINCT OutletId) AS TotalOutlet
                       FROM      tbld_Outlet AS a1
                       WHERE   (IsActive = 1)
                       GROUP BY Distributorid) AS D ON A.DB_Id = D.Distributorid LEFT OUTER JOIN
                      (SELECT t2.DB_id, t2.sku_id, COUNT(DISTINCT t1.OutletId) AS BuyerOutlet
                       FROM      tbld_Outlet AS t1 INNER JOIN
                                         tblr_OutletWiseBuyer AS t2 ON t1.OutletId = t2.outlet_id INNER JOIN
                                         tbld_Route_Plan_Mapping AS t3 ON t1.parentid = t3.route_id
                       WHERE   (t2.BatchDate BETWEEN @Start_Date AND @End_Date)
                       GROUP BY t2.DB_id, t2.sku_id) AS E ON A.DB_Id = E.DB_id AND B.skuid = E.sku_id
WHERE  (A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))) AND (B.skuid IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id, B.skuid

	

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByDBsOutletList]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByDBsOutletList]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT  A.REGION_Name, A.AREA_Name,A.CEAREA_Name, A.DB_Name,  A.DBCode,A.cluster,  A.Name As PSR_Name, A.PSR_Code,
                  A.RouteName,A.OutletCode, A.OutletName, A.Address,A.OwnerName, A.ContactNo, IIF(A.HaveVisicooler = 1,'Yes','No') AS HaveVisicooler, ISNULL(A.channel_name,'') As Channel, ISNULL(A.outlet_category_name,'') As Category, ISNULL(A.Outlet_grade,'') As Grade
FROM     tbld_db_psr_outlet_zone AS A 
where A.OutletId in (SELECT DISTINCT outlet_id AS OutletId
                       FROM      tblr_OutletWiseBuyer AS t2
                       WHERE   (BatchDate BETWEEN @Start_Date AND @End_Date) AND (sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))))  AND  (A.DB_Id IN(SELECT Value FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (A.IsActive = 1)
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id,A.RouteID
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByDBSummary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByDBSummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
Select A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name,A.REGION_Name,A.Status, A.cluster, A.DBCode, A.OfficeAddress, ISNULL(D.TotalOutlet,0) As TotalOutlet ,ISNULL(E.BuyerOutlet,0) As BuyerOutlet,(ISNULL(D.TotalOutlet,0)-ISNULL(E.BuyerOutlet,0)) AS NonBuyer
FROM     tbld_db_zone AS A
				  Left Join ( 
				  select a1.Distributorid, COUNT(DISTINCT a1.OutletId) AS TotalOutlet from tbld_Outlet As a1				 
				  where a1.IsActive=1
				  Group by  a1.Distributorid
				  ) As D On A.DB_Id=D.Distributorid 
				  Left Join ( 
				  select  t2.DB_id,COUNT(DISTINCT t1.OutletId) AS BuyerOutlet from tbld_Outlet As t1
				  Inner join tblr_OutletWiseBuyer As t2 on t1.OutletId =t2.outlet_id
				  Inner join tbld_Route_Plan_Mapping As t3 on t1.parentid=t3.route_id
				  Where t2.BatchDate between @Start_Date AND @End_Date And t2.sku_id In (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  Group by  t2.DB_id
				  ) As E On A.DB_Id=E.DB_id
				  where A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) 
				  order by A.REGION_id,A.AREA_id,A.CEAREA_id, A.DB_Id

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByPSRDetails]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByPSRDetails]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN


SELECT A.DB_Name, A.CEAREA_Name, A.AREA_Name,A.REGION_Name,A.PSR_id, A.PSR_Code, A.name As PSR_Name,A.cluster, A.DBCode, A.OfficeAddress, C.SKU_id, C.SKUName, ISNULL(D.TotalOutlet, 0) AS TotalOutlet, ISNULL(E.BuyerOutlet, 0) AS BuyerOutlet, 
                  ISNULL(D.TotalOutlet, 0) - ISNULL(E.BuyerOutlet, 0) AS NonBuyer
FROM     tbld_db_psr_zone AS A INNER JOIN
                      (SELECT DISTINCT sku_id AS skuid, bundle_price_id
                       FROM      tbld_bundle_price_details AS t1) AS B ON A.PriceBuandle_id = B.bundle_price_id INNER JOIN
                  tbld_sku_list AS C ON B.skuid = C.SKU_id  Left Join ( 
				  select a1.Distributorid,a2.db_emp_id As psr_id, COUNT(DISTINCT a1.OutletId) AS TotalOutlet from tbld_Outlet As a1
				  Inner join tbld_Route_Plan_Mapping As a2 on a1.parentid=a2.route_id				   
				  where a1.IsActive=1
				  Group by  a1.Distributorid,a2.db_emp_id
				  ) As D On A.DB_Id=D.Distributorid AND A.PSR_id=D.psr_id Left Join ( 
				  select  t2.DB_id,t3.db_emp_id As psr_id,t2.sku_id,COUNT(DISTINCT t1.OutletId) AS BuyerOutlet from tbld_Outlet As t1
				  Inner join tblr_OutletWiseBuyer As t2 on t1.OutletId =t2.outlet_id
				  Inner join tbld_Route_Plan_Mapping As t3 on t1.parentid=t3.route_id
				  Where t2.BatchDate between @Start_Date and @End_Date And t2.sku_id In (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  Group by  t2.DB_id,t3.db_emp_id,t2.sku_id
				  ) As E On A.DB_Id=E.DB_id And A.PSR_id=E.psr_id AND B.skuid = E.sku_id
WHERE  (A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))) AND (B.skuid IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,',')))
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id, B.skuid

	

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByPSRsOutletList]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByPSRsOutletList]
	@Start_Date Datetime,
	@End_Date Datetime,
	@Psrids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT  A.REGION_Name, A.AREA_Name,A.CEAREA_Name, A.DB_Name,  A.DBCode,A.cluster,  A.Name As PSR_Name, A.PSR_Code,
                  A.RouteName,A.OutletCode, A.OutletName, A.Address,A.OwnerName, A.ContactNo, IIF(A.HaveVisicooler = 1,'Yes','No') AS HaveVisicooler, ISNULL(A.channel_name,'') As Channel, ISNULL(A.outlet_category_name,'') As Category, ISNULL(A.Outlet_grade,'') As Grade
FROM     tbld_db_psr_outlet_zone AS A 
where A.OutletId in (SELECT DISTINCT outlet_id AS OutletId
                       FROM      tblr_OutletWiseBuyer AS t2
                       WHERE   (BatchDate BETWEEN @Start_Date AND @End_Date) AND (sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))))  AND  (A.PSR_id IN(SELECT Value FROM      dbo.FunctionStringtoIntlist(@Psrids, ','))) AND (A.IsActive = 1)
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id,A.RouteID
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_BuyerByPSRSummary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_BuyerByPSRSummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Name, A.CEAREA_Name, A.AREA_Name,A.REGION_Name,A.PSR_id, A.PSR_Code, A.name As PSR_Name,A.cluster, A.DBCode, A.OfficeAddress, ISNULL(D.TotalOutlet,0) As TotalOutlet ,ISNULL(E.BuyerOutlet,0) As BuyerOutlet,(ISNULL(D.TotalOutlet,0)-ISNULL(E.BuyerOutlet,0)) AS NonBuyer
FROM     tbld_db_psr_zone AS A
				  Left Join ( 
				  select a1.Distributorid,a2.db_emp_id As psr_id, COUNT(DISTINCT a1.OutletId) AS TotalOutlet from tbld_Outlet As a1
				  Inner join tbld_Route_Plan_Mapping As a2 on a1.parentid=a2.route_id				   
				  where a1.IsActive=1
				  Group by  a1.Distributorid,a2.db_emp_id
				  ) As D On A.DB_Id=D.Distributorid AND A.PSR_id=D.psr_id
				  Left Join ( 
				  select  t2.DB_id,t3.db_emp_id As psr_id,COUNT(DISTINCT t1.OutletId) AS BuyerOutlet from tbld_Outlet As t1
				  Inner join tblr_OutletWiseBuyer As t2 on t1.OutletId =t2.outlet_id
				  Inner join tbld_Route_Plan_Mapping As t3 on t1.parentid=t3.route_id
				  Where t2.BatchDate between @Start_Date and @End_Date And t2.sku_id In (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  Group by  t2.DB_id,t3.db_emp_id
				  ) As E On A.DB_Id=E.DB_id And A.PSR_id=E.psr_id
				  where A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))
				  Order by A.REGION_id,A.AREA_id,A.CEAREA_id,A.DB_Id,A.PSR_id

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_DBPerformanceKPISummary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE  [dbo].[RPT_Delivery_DBPerformanceKPISummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.DBCode, A.OfficeAddress, B.PerformerId,A.DB_Name AS PerformerName, 
                  C.TotalTGTCS, C.TotalTGTVolume8oz, SUM(B.SalesScheduleCall) AS SalesScheduleCall, SUM(B.SalesMemo) AS SalesMemo, SUM(B.TotalLineSold) AS TotalLineSold, SUM(B.TotalSoldInVolume) AS TotalSoldInVolume8oZ, 
                  SUM(B.TotalSoldInCase) AS TotalSoldInCase, SUM(B.TotalSoldInValue) AS TotalSoldInValue, SUM(B.TotalOrderedInVolume) AS TotalOrderedInVolume8oZ, SUM(B.TotalOrderedInCase) AS TotalOrderedInCase, 
                  SUM(B.TotalOrderedInValue) AS TotalOrderedInValue
FROM     tbld_db_zone AS A INNER JOIN tblr_PerformanceKPI AS B ON A.DB_Id = B.DB_id
LEFT JOIN (SELECT db_id,sum(TotalTGTCS) AS TotalTGTCS,Sum(TotalTGTVolume8oz) AS TotalTGTVolume8oz
FROM     tblr_PSRWiseMonthTGT
WHERE  target_id IN (SELECT DISTINCT t1.id FROM   ODMS.[dbo].tbld_Target AS t1 INNER JOIN
                                         ODMS.[dbo].tbl_calendar AS t2 ON t1.MonthNo = t2.MonthNo AND t1.Year=t2.Year
										 Where t2.Date between @Start_Date AND @End_Date)
GROUP BY db_id)AS C on C.db_id=A.DB_Id
Where B.BatchDate between @Start_Date AND @End_Date AND B.PerformerType=1 AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))
GROUP BY A.REGION_Name, A.AREA_Name, A.CEAREA_Name, A.DB_Id, A.DB_Name, A.DBCode,A.OfficeAddress, B.PerformerId, B.PerformerName, C.TotalTGTCS, C.TotalTGTVolume8oz

END



GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_NonBuyerByDBsOutletList]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_NonBuyerByDBsOutletList]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT  A.REGION_Name, A.AREA_Name,A.CEAREA_Name, A.DB_Name,  A.DBCode,A.cluster,  A.Name As PSR_Name, A.PSR_Code,
                  A.RouteName,A.OutletCode, A.OutletName, A.Address,A.OwnerName, A.ContactNo, IIF(A.HaveVisicooler = 1,'Yes','No') AS HaveVisicooler, ISNULL(A.channel_name,'') As Channel, ISNULL(A.outlet_category_name,'') As Category, ISNULL(A.Outlet_grade,'') As Grade
FROM     tbld_db_psr_outlet_zone AS A 
where A.OutletId Not in (SELECT DISTINCT outlet_id AS OutletId
                       FROM      tblr_OutletWiseBuyer AS t2
                       WHERE   (BatchDate BETWEEN @Start_Date AND @End_Date) AND (sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))))  AND  (A.DB_Id IN(SELECT Value FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND (A.IsActive = 1)
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id,A.RouteID
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_NonBuyerByPSRsOutletList]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_NonBuyerByPSRsOutletList]
	@Start_Date Datetime,
	@End_Date Datetime,
	@Psrids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT  A.REGION_Name, A.AREA_Name,A.CEAREA_Name, A.DB_Name,  A.DBCode,A.cluster,  A.Name As PSR_Name, A.PSR_Code,
                  A.RouteName,A.OutletCode, A.OutletName, A.Address,A.OwnerName, A.ContactNo, IIF(A.HaveVisicooler = 1,'Yes','No') AS HaveVisicooler, ISNULL(A.channel_name,'') As Channel, ISNULL(A.outlet_category_name,'') As Category, ISNULL(A.Outlet_grade,'') As Grade
FROM     tbld_db_psr_outlet_zone AS A 
where A.OutletId Not in (SELECT DISTINCT outlet_id AS OutletId
                       FROM      tblr_OutletWiseBuyer AS t2
                       WHERE   (BatchDate BETWEEN @Start_Date AND @End_Date) AND (sku_id IN
                                             (SELECT Value
                                              FROM      dbo.FunctionStringtoIntlist(@skuids, ','))))  AND  (A.PSR_id IN(SELECT Value FROM      dbo.FunctionStringtoIntlist(@Psrids, ','))) AND (A.IsActive = 1)
ORDER BY A.REGION_id, A.AREA_id, A.CEAREA_id, A.DB_Id,A.PSR_id,A.RouteID
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_OutletWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_OutletWiseSKUWiseDelivery]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.National_id, A.[National], A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress, A.cluster, 
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade, B.Distributorid,B.SKUId,B.SKUName,B.PackSize,SUM(B.Delivered_Quentity) AS Delivered_Quentity,SUM(B.Delivered_Quentity* B.UnitPrice) AS Value,
                   SUM(B.FreeDelivered_Quentity) AS FreeDelivered_Quentity
FROM     tbld_db_psr_outlet_zone AS A INNER JOIN
                  tblr_OutletWiseSKUWiseDelivery AS B ON A.OutletId = B.OutletId
				    where   B.BatchDate between @Start_Date AND @End_Date AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  Group by A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.National_id, A.[National], A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress, A.cluster, 
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade, B.Distributorid,B.SKUId,B.SKUName,B.PackSize

				
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_OutletWiseSummary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_OutletWiseSummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress,
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade, SUM(B.Delivered_Quentity/B.PackSize) AS Delivered_Quentity,SUM(B.Delivered_Quentity* B.UnitPrice) AS Value,
                   SUM(B.FreeDelivered_Quentity/B.PackSize) AS FreeDelivered_Quentity
FROM     ODMS.dbo.tbld_db_psr_outlet_zone AS A INNER JOIN
                  tblr_OutletWiseSKUWiseDelivery AS B ON A.OutletId = B.OutletId
				   where   B.BatchDate between @Start_Date AND @End_Date AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  Group by A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress,
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade



				
END

GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_PSRPerformanceKPISummary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[RPT_Delivery_PSRPerformanceKPISummary]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_Name, A.AREA_Name, A.REGION_Name, A.DBCode, A.OfficeAddress,A.cluster,A.PSR_Code, B.PerformerId, A.Name As PerformerName, 
                  C.TotalTGTCS, C.TotalTGTVolume8oz, SUM(B.SalesScheduleCall) AS SalesScheduleCall, SUM(B.SalesMemo) AS SalesMemo, SUM(B.TotalLineSold) AS TotalLineSold, SUM(B.TotalSoldInVolume) AS TotalSoldInVolume8oZ, 
                  SUM(B.TotalSoldInCase) AS TotalSoldInCase, SUM(B.TotalSoldInValue) AS TotalSoldInValue, SUM(B.TotalOrderedInVolume) AS TotalOrderedInVolume8oZ, SUM(B.TotalOrderedInCase) AS TotalOrderedInCase, 
                  SUM(B.TotalOrderedInValue) AS TotalOrderedInValue
FROM     tbld_db_psr_zone AS A INNER JOIN tblr_PerformanceKPI AS B ON A.DB_Id = B.DB_id AND A.PSR_id=B.PerformerId
LEFT JOIN (SELECT db_id, psr_id, sum(TotalTGTCS) AS TotalTGTCS,Sum(TotalTGTVolume8oz) AS TotalTGTVolume8oz
FROM     tblr_PSRWiseMonthTGT
WHERE  target_id IN (SELECT DISTINCT t1.id FROM      ODMS.dbo.tbld_Target AS t1 INNER JOIN
                                         ODMS.dbo.tbl_calendar AS t2 ON t1.MonthNo = t2.MonthNo AND t1.Year=t2.Year
										 Where t2.Date between @Start_Date AND @End_Date)
GROUP BY db_id, psr_id)AS C on C.db_id=A.DB_Id AND C.psr_id=B.PerformerId 
Where B.BatchDate between @Start_Date AND @End_Date AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))
GROUP BY A.REGION_Name, A.AREA_Name, A.CEAREA_Name, A.DB_Id, A.DB_Name, A.DBCode,A.OfficeAddress,A.cluster,A.PSR_Code, B.PerformerId, A.Name, C.TotalTGTCS, C.TotalTGTVolume8oz

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_PSRWiseSKUWiseDelivery]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_PSRWiseSKUWiseDelivery]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice, SUM(B.Delivered_Quentity)AS Delivered_Quentity, SUM(B.FreeDelivered_Quentity)AS FreeDelivered_Quentity
FROM     tbld_db_zone AS A INNER JOIN
                  tblr_PSRWiseSKUWiseDelivery AS B ON A.DB_Id = B.DB_id
				  where A.Status=1 and  (B.BatchDate between @Start_Date AND @End_Date) AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  GROUP BY A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name,B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice

END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Order_OutletWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Order_OutletWiseSKUWiseOrder]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids varchar(100),
	@skuids varchar(100)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.National_id, A.[National], A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress, A.cluster, 
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade, B.Distributorid,B.SKUId,B.SKUName,B.PackSize,SUM(B.Order_Quentity) AS Order_Quentity,SUM(B.Order_Quentity* B.UnitPrice) AS Value,
                   SUM(B.FreeOrder_Quentity) AS FreeOrder_Quentity
FROM     tbld_db_psr_outlet_zone AS A INNER JOIN
                  tblr_OutletWiseSKUWiseOrder AS B  ON A.OutletId = B.OutletId
WHERE  (B.BatchDate BETWEEN @Start_Date AND @End_Date)  AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
Group by A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, A.National_id, A.[National], A.Status, A.Name, A.PSR_id, A.PSR_Code, A.DBCode, A.OfficeAddress, A.cluster, 
                  A.RouteName, A.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Address, A.OwnerName, A.ContactNo, A.HaveVisicooler,A.IsActive, A.channel_name, A.outlet_category_name, A.Outlet_grade, B.Distributorid,B.SKUId,B.SKUName,B.PackSize				

				
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_Order_PSRWiseSKUWiseOrder]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Order_PSRWiseSKUWiseOrder]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice,SUM( B.Order_Quentity) AS Order_Quentity, SUM(B.Confirmed_Quantity)AS Confirmed_Quantity, SUM(B.FreeOrder_Quentity)AS FreeOrder_Quentity, SUM(B.FreeConfirmed_Quantity) AS FreeConfirmed_Quantity
FROM     tbld_db_zone AS A INNER JOIN
                  tblr_PSRWiseSKUWiseOrder AS B ON A.DB_Id = B.DB_id
				  where A.Status=1 and  (B.BatchDate between @Start_Date AND @End_Date) AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  GROUP BY A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name,B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_StockMovement]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_StockMovement] 	
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbid int
AS
BEGIN
	SELECT B.db_id, 
       A.sku_id, 
       E.skuname, 
       E.Pack_Size As PackSize, 
       A.batch_id, 
       A.db_lifting_price, 
       A.outlet_lifting_price, 
       A.mrp, 
       Isnull(C.openingsoundstockqty, 0) 
       AS OpeningSoundStockQty, 
       Isnull(C.openingbookedstockqty, 0) 
       AS OpeningBookedStockQty, 
       Isnull(D.primarychallanqty, 0) 
       AS PrimaryChallanQty, 
       Isnull(D.primaryqty, 0) 
       AS PrimaryQty, 
       Isnull(D.salesqty, 0) 
       AS SalesQty, 
       Isnull(D.freesalesqty, 0) 
       AS FreeSalesQty,
	   Isnull(( (Isnull(openingsoundstockqty,0) + Isnull(openingbookedstockqty,0) + Isnull(primaryqty,0)) - (Isnull(salesqty,0) + Isnull(freesalesqty,0)) ) 
       , 0)AS 
       ClosingStockQty
FROM   tbld_bundle_price_details AS A 
       INNER JOIN tbld_db_zone AS B 
               ON A.bundle_price_id = B.pricebuandle_id 
       LEFT OUTER JOIN (SELECT dbid, 
                               skuid, 
                               batchno, 
                               closingsoundstockqty  AS OpeningSoundStockQty, 
                               closingbookedstockqty AS OpeningBookedStockQty 
                        FROM   tblr_stockmovement 
                        WHERE  ( batchdate = dateadd(day,-1, @Start_Date) )) AS C 
                    ON C.dbid = B.db_id 
                       AND C.skuid = A.sku_id 
                       AND C.batchno = A.batch_id 
       LEFT OUTER JOIN (SELECT dbid, 
                               skuid, 
                               batchno, 
                               Sum(primarychallanqty) AS PrimaryChallanQty, 
                               Sum(primaryqty)        AS PrimaryQty, 
                               Sum(salesqty)          AS SalesQty, 
                               Sum(freesalesqty)      AS FreeSalesQty 
                        FROM   tblr_stockmovement 
                        WHERE  ( batchdate BETWEEN @Start_Date AND @End_Date
                               ) 
                        GROUP  BY dbid, 
                                  skuid, 
                                  batchno) AS D 
                    ON D.dbid = B.db_id 
                       AND D.skuid = A.sku_id 
                       AND D.batchno = A.batch_id 
       INNER JOIN tbld_sku_list AS E 
               ON A.sku_id = E.sku_id 
     
			  Where B.DB_Id =@dbid
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_OutletWiseDetails]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[RPT_TP_OutletWiseDetails]
		@Start_Date Datetime,
		@End_Date Datetime,
		@dbids Varchar(MAX),
	    @Promo_id Varchar(MAX)
AS
BEGIN
SELECT D.REGION_id, D.AREA_id, D.CEAREA_id,D.REGION_Name,D.AREA_Name,  D.CEAREA_Name, D.DBCode, D.DB_Name, D.Name As PSR,  D.PSR_Code,
                  D.RouteName, D.OutletCode, D.OutletName, D.Address, D.OwnerName, D.ContactNo, D.channel_name, D.outlet_category_name, D.Outlet_grade, B.id AS TPid, B.name AS TPName,  A.planned_order_date, 
                  A.delivery_date,A.Orderid,A.so_id, E.SKUName,A.Pack_size, A.unit_sale_price, A.sku_order_type_id, SUM(A.quantity_ordered) AS quantity_ordered, SUM(A.quantity_delivered) AS quantity_delivered
FROM     ODMSBI.dbo.tblr_OrderDetails AS A INNER JOIN
                  ODMS.dbo.tblt_TradePromotion AS B ON A.promotion_id = B.id INNER JOIN
                  ODMSBI.dbo.tbld_db_psr_outlet_zone AS D ON A.outlet_id = D.OutletId
				INNER JOIN
                  ODMSBI.dbo.tbld_sku_list AS E ON A.sku_id = E.SKU_id
WHERE  (A.db_id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))) and A.promotion_id IN (select Value FROM dbo.FunctionStringtoIntlist(@Promo_id,',')) AND A.planned_order_date between @Start_Date and @End_Date
GROUP BY B.id, B.name, A.db_id, A.outlet_id, D.OutletName, A.planned_order_date, A.delivery_date, A.so_id, E.SKUName,A.Pack_size, A.unit_sale_price, A.sku_order_type_id,D.REGION_Name,D.AREA_Name,  D.CEAREA_Name, D.DBCode, D.DB_Name, D.Name ,  D.PSR_Code,D.REGION_id, D.AREA_id, D.CEAREA_id,A.Orderid,
                  D.RouteName, D.OutletCode, D.OutletName, D.Address, D.OwnerName, D.ContactNo, D.channel_name, D.outlet_category_name, D.Outlet_grade
ORDER BY D.REGION_id, D.AREA_id, D.CEAREA_id, A.db_id, A.planned_order_date, b.id, A.outlet_id,A.Orderid ,A.Pack_size, A.sku_order_type_id
END


GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_Summary]    Script Date: 20-Aug-2018 9:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_TP_Summary]
		@Start_Date Datetime,
		@End_Date Datetime,
		@dbids Varchar(MAX),
	    @Promo_id Varchar(MAX)
AS
BEGIN
SELECT @Start_Date AS StartDate,@End_Date AS EndDate ,  F.REGION_Name, F.AREA_Name, F.CEAREA_Name, F.DB_Name, F.DBCode, F.OfficeAddress, F.cluster,C.db_id, 
       C.id                                 AS Promo_id, 
       C.NAME, 
       Stuff((SELECT ';' + B.condition_sku 
              FROM   (SELECT DISTINCT ( t1.condition_sku_id ), 
                                      t2.skuname AS condition_sku, 
                                      promo_id 
                      FROM   odms.dbo.tblt_tradepromotiondefinition AS t1 
                             LEFT JOIN ODMSBI.dbo.tbld_sku_list AS t2 
                                    ON t1.condition_sku_id = t2.sku_id 
                             
                      WHERE  t1.promo_line_type = 1) AS B 
              WHERE  C.id = B.promo_id 
              FOR xml path ('')), 1, 1, '') AS SKUList, 
			  Stuff((SELECT ';' + B.condition_sku 
              FROM   (SELECT DISTINCT ( t1.offer_sku_id ), 
                                      t2.skuname AS condition_sku, 
                                      promo_id 
                      FROM   odms.dbo.tblt_tradepromotiondefinition AS t1 
                             LEFT JOIN ODMSBI.dbo.tbld_sku_list AS t2 
                                    ON t1.offer_sku_id = t2.sku_id                             
                      WHERE  t1.promo_line_type = 2) AS B 
              WHERE  C.id = B.promo_id 
              FOR xml path ('')), 1, 1, '') AS FreeSKU,
       ISNULL(D.quantity_ordered,0) As quantity_ordered, 
	    ISNULL(D.quantity_delivered,0) As quantity_delivered,ISNULL(E.Free_quantity_ordered,0) As Free_quantity_ordered,ISNULL(E.Free_Amount_ordered,0)Free_Amount_ordered,ISNULL(E.Free_quantity_delivered,0) As Free_quantity_delivered
      ,ISNULL(E.Free_Amount_delivered,0) As Free_Amount_delivered
FROM   (SELECT A.db_id, 
               B.id, 
               B.NAME 
        FROM   ODMS.dbo.tblt_tradepromotiondbhousemapping AS A 
               INNER JOIN ODMS.dbo.tblt_tradepromotion AS B 
                       ON A.promo_id = B.id) AS C 
       LEFT JOIN (SELECT B.id                                    AS promo_id, 
                         A.db_id, 
                         Sum(CAST(A.quantity_ordered As float) / A.pack_size)   AS 
                         quantity_ordered, 
                         Sum(CAST(A.quantity_delivered As float) / A.pack_size) AS 
                         quantity_delivered 
                  FROM   odmsbi.dbo.tblr_orderdetails AS A 
                         INNER JOIN ODMS.dbo.tblt_tradepromotion AS B 
                                 ON A.promotion_id = B.id 
                  WHERE  A.sku_order_type_id = 1  and A.planned_order_date between @Start_Date and @End_Date
                  GROUP  BY B.id, 
                            B.NAME, 
                            A.db_id) AS D 
              ON C.db_id = D.db_id 
                 AND C.id = D.promo_id 
				 LEFT JOIN (SELECT B.id                                                   AS promo_id, 
       A.db_id, 
       Sum(Cast(A.quantity_ordered AS FLOAT) /A.pack_size)   AS 
       Free_quantity_ordered, 
	    Sum(Cast(A.quantity_ordered AS FLOAT) *D.db_lifting_price)   AS 
       Free_Amount_ordered, 
       Sum(Cast(A.quantity_delivered AS FLOAT) / A.pack_size) AS 
       Free_quantity_delivered ,
	   
       Sum(Cast(A.quantity_delivered AS FLOAT)  *D.db_lifting_price) AS 
       Free_Amount_delivered
FROM   ODMSBI.dbo.tblr_orderdetails AS A 
       INNER JOIN ODMS.dbo.tblt_tradepromotion AS B ON A.promotion_id = B.id 
	   Inner join ODMSBI.dbo.tbld_db_zone As C On A.db_id=C.DB_Id
	   Inner join ODMSBI.dbo.tbld_bundle_price_details As D on C.PriceBuandle_id=D.bundle_price_id AND A.sku_id=D.sku_id AND A.Betch_id=D.batch_id
	   
WHERE  A.sku_order_type_id = 2 and A.planned_order_date between @Start_Date and @End_Date
GROUP  BY B.id,           
          A.db_id ) AS E
              ON C.db_id = E.db_id 
                 AND C.id = E.promo_id 
				 Inner join ODMSBI.dbo.tbld_db_zone AS F ON F.DB_Id=C.db_id
WHERE  C.db_id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))  AND C.id IN (select Value FROM dbo.FunctionStringtoIntlist(@Promo_id,','))
GROUP  BY C.db_id, 
          C.id, 
          C.NAME, 
          D.quantity_ordered, 
          D.quantity_delivered,
		  E.Free_quantity_ordered,E.Free_Amount_ordered,E.Free_quantity_delivered,E.Free_Amount_delivered,F.REGION_Name, F.AREA_Name, F.CEAREA_Name, F.DB_Name, F.DBCode, F.OfficeAddress, F.cluster

END


GO
USE [master]
GO
ALTER DATABASE [ODMSBI] SET  READ_WRITE 
GO
