USE [master]
GO
/****** Object:  Database [DMS]    Script Date: 3/24/2017 6:00:46 PM ******/
CREATE DATABASE [DMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMS', FILENAME = N'D:\Programs Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\DMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMS_log', FILENAME = N'D:\Programs Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\DMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMS] SET RECOVERY FULL 
GO
ALTER DATABASE [DMS] SET  MULTI_USER 
GO
ALTER DATABASE [DMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMS', N'ON'
GO
ALTER DATABASE [DMS] SET QUERY_STORE = OFF
GO
USE [DMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DMS]
GO
/****** Object:  Table [dbo].[md_audit_sub_type]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_audit_sub_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[audit_type_id] [int] NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_audit_sub_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_audit_type]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_audit_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_audit_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_certificate_status]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_certificate_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_certificate_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_company_details]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_company_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_md_company_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_country]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_question_ISO_20000]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_question_ISO_20000](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_md_question_ISO_20000] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_question_ISO_27001]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_question_ISO_27001](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_md_question_ISO_27001] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_question_ISO_9001]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_question_ISO_9001](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_md_question_ISO_9001] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_question_overall_complexity]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_question_overall_complexity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_md_question_overall_complexity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_table_identity]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_table_identity](
	[name] [varchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_iso_question]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_iso_question](
	[q_id] [varchar](50) NOT NULL,
	[iso_audit_type] [int] NOT NULL,
	[caption] [varchar](max) NOT NULL,
	[caption_id] [int] NULL,
	[data] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_overall_complexity]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_overall_complexity](
	[q_id] [varchar](50) NOT NULL,
	[caption] [varchar](max) NULL,
	[caption_id] [int] NULL,
	[response] [varchar](50) NULL,
	[support] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_request]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_request](
	[quotation_id] [varchar](50) NOT NULL,
	[custname] [varchar](100) NOT NULL,
	[mr] [varchar](50) NULL,
	[street] [varchar](max) NULL,
	[phone] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[website] [varchar](100) NULL,
	[fax] [varchar](50) NULL,
	[branch] [varchar](max) NULL,
	[industry] [varchar](max) NULL,
	[country] [int] NULL,
	[otherinfo] [varchar](max) NULL,
	[createdon] [datetime] NULL,
	[date] [date] NULL,
	[place] [varchar](50) NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_quotation_request] PRIMARY KEY CLUSTERED 
(
	[quotation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_request_company_details]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_request_company_details](
	[q_id] [varchar](50) NOT NULL,
	[caption] [varchar](max) NOT NULL,
	[caption_id] [int] NULL,
	[data] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_request_scope]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_request_scope](
	[q_id] [varchar](50) NULL,
	[audit_id] [int] NULL,
	[caption] [varchar](50) NULL,
	[caption_id] [int] NULL,
	[already] [bit] NULL,
	[Certified] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_request_scope_details]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotation_request_scope_details](
	[q_id] [varchar](50) NULL,
	[audit_type] [int] NULL,
	[c_status] [int] NULL,
	[scope] [varchar](max) NULL,
	[siteaddress] [varchar](max) NULL,
	[workdesc] [varchar](max) NULL,
	[empstrength] [int] NULL,
	[managerial] [int] NULL,
	[technical] [int] NULL,
	[it] [int] NULL,
	[business] [int] NULL,
	[admin] [int] NULL,
	[hr] [int] NULL,
	[finance] [int] NULL,
	[other] [int] NULL,
	[offsite] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[md_audit_sub_type] ON 

INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (1, 1, N'ISO 9001:2015')
INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (2, 1, N'ISO 27001:2013')
INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (3, 1, N'ISO 20000:2011')
SET IDENTITY_INSERT [dbo].[md_audit_sub_type] OFF
SET IDENTITY_INSERT [dbo].[md_audit_type] ON 

INSERT [dbo].[md_audit_type] ([id], [description]) VALUES (1, N'ISO')
INSERT [dbo].[md_audit_type] ([id], [description]) VALUES (2, N'CMMI')
SET IDENTITY_INSERT [dbo].[md_audit_type] OFF
SET IDENTITY_INSERT [dbo].[md_certificate_status] ON 

INSERT [dbo].[md_certificate_status] ([id], [description]) VALUES (1, N'Expiring Soon')
INSERT [dbo].[md_certificate_status] ([id], [description]) VALUES (2, N'Want to Transfer')
INSERT [dbo].[md_certificate_status] ([id], [description]) VALUES (3, N'Any Other')
SET IDENTITY_INSERT [dbo].[md_certificate_status] OFF
SET IDENTITY_INSERT [dbo].[md_company_details] ON 

INSERT [dbo].[md_company_details] ([id], [description]) VALUES (1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[md_company_details] ([id], [description]) VALUES (2, N'Relationship with Parent/holding company (if applicable)')
INSERT [dbo].[md_company_details] ([id], [description]) VALUES (3, N'What are the regulatory requirements applicable to your organization?')
INSERT [dbo].[md_company_details] ([id], [description]) VALUES (4, N'What are legislative requirements applicable to your organization?')
INSERT [dbo].[md_company_details] ([id], [description]) VALUES (5, N'If consultancy was taken, then from whom and what was the nature of consultancy taken?')
INSERT [dbo].[md_company_details] ([id], [description]) VALUES (6, N'What are the exclusions that are applicable to your organization (if applicable)')
SET IDENTITY_INSERT [dbo].[md_company_details] OFF
SET IDENTITY_INSERT [dbo].[md_country] ON 

INSERT [dbo].[md_country] ([id], [description]) VALUES (1, N'India')
INSERT [dbo].[md_country] ([id], [description]) VALUES (2, N'USA')
INSERT [dbo].[md_country] ([id], [description]) VALUES (3, N'Singapore')
SET IDENTITY_INSERT [dbo].[md_country] OFF
SET IDENTITY_INSERT [dbo].[md_question_ISO_20000] ON 

INSERT [dbo].[md_question_ISO_20000] ([id], [description]) VALUES (1, N'Do you have service continuity plan in place?')
INSERT [dbo].[md_question_ISO_20000] ([id], [description]) VALUES (2, N'Do you have Capacity and Availability Management process in place?')
INSERT [dbo].[md_question_ISO_20000] ([id], [description]) VALUES (3, N'Do you have process defined for Incident Resolution and Prevention')
INSERT [dbo].[md_question_ISO_20000] ([id], [description]) VALUES (4, N'Are the internal audits being carried out?')
SET IDENTITY_INSERT [dbo].[md_question_ISO_20000] OFF
SET IDENTITY_INSERT [dbo].[md_question_ISO_27001] ON 

INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (2, N'Do you have an ISMS policy')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (3, N'Do you have a Statement of Applicability')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (4, N'Have you identified applicable ISMS legislation?')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (5, N'Have you prepared a documented management system description?')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (6, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (8, N'Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)?')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (9, N'If yes, have you identified and addressed risks associated with such interfaces?')
SET IDENTITY_INSERT [dbo].[md_question_ISO_27001] OFF
SET IDENTITY_INSERT [dbo].[md_question_ISO_9001] ON 

INSERT [dbo].[md_question_ISO_9001] ([id], [description]) VALUES (1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[md_question_ISO_9001] ([id], [description]) VALUES (2, N'Do you have defined product development processes?')
INSERT [dbo].[md_question_ISO_9001] ([id], [description]) VALUES (3, N'Are internal audits been carried out?')
INSERT [dbo].[md_question_ISO_9001] ([id], [description]) VALUES (4, N'Have you defined processes for training?')
SET IDENTITY_INSERT [dbo].[md_question_ISO_9001] OFF
SET IDENTITY_INSERT [dbo].[md_question_overall_complexity] ON 

INSERT [dbo].[md_question_overall_complexity] ([id], [description]) VALUES (1, N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[md_question_overall_complexity] ([id], [description]) VALUES (2, N'Institutionalization of management system – measured by Awareness, Internal Audits happening, Management Reviews happening')
INSERT [dbo].[md_question_overall_complexity] ([id], [description]) VALUES (3, N'Completeness and Maturity of Management System documentation')
INSERT [dbo].[md_question_overall_complexity] ([id], [description]) VALUES (4, N'How complicated is the integrated use of Hardware, Software, and Services in your business?')
SET IDENTITY_INSERT [dbo].[md_question_overall_complexity] OFF
INSERT [dbo].[md_table_identity] ([name], [value]) VALUES (N'QuotationId', 12)
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Do you have defined product development processes?', 2, N'Do you have defined product development processes?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are internal audits been carried out?', 3, N'Are internal audits been carried out?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Have you defined processes for training?', 4, N'Have you defined processes for training?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have Capacity and Availability Management process in place?', 2, N'Do you have Capacity and Availability Management process in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have process defined for Incident Resolution and Prevention', 3, N'Do you have process defined for Incident Resolution and Prevention')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Are the internal audits being carried out?', 4, N'Are the internal audits being carried out?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Do you have an ISMS policy', 2, N'Do you have an ISMS policy')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Do you have a Statement of Applicability', 3, N'Do you have a Statement of Applicability')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you identified applicable ISMS legislation?', 4, N'Have you identified applicable ISMS legislation?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you prepared a documented management system description?', 5, N'Have you prepared a documented management system description?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?', 6, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)?', 8, N' Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'If yes, have you identified and addressed risks associated with such interfaces?', 9, N'If yes, have you identified and addressed risks associated with such interfaces?')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Institutionalization of management system – measured by Awareness, Internal Audits happening, Management Reviews happening', 2, N'High', N'Institutionalization of management system – measured by Awareness, Internal Audits happening, Management Reviews happening')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Completeness and Maturity of Management System documentation', 3, N'medium', N'Completeness and Maturity of Management System documentation')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'How complicated is the integrated use of Hardware, Software, and Services in your business?', 4, N'low', N'How complicated is the integrated use of Hardware, Software, and Services in your business?')
INSERT [dbo].[quotation_request] ([quotation_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry], [country], [otherinfo], [createdon], [date], [place], [name]) VALUES (N'Kars_11', N'Karson', N'ashish', N'Radhay', N'329379372', N'91291', N'sjkajs', N'akjsk', N'213213', N'Noida', N'Sales', 1, N'xdfdgdgdf', CAST(N'2017-03-24T12:27:05.783' AS DateTime), CAST(N'2017-03-24' AS Date), N'NOIDA', N'Abhay')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Relationship with Parent/holding company (if applicable)', 2, N'Relationship with Parent/holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'What are the regulatory requirements applicable to your organization?', 3, N'What are the regulatory requirements applicable to your organization?')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'What are legislative requirements applicable to your organization?', 4, N'What are legislative requirements applicable to your organization?')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'If consultancy was taken, then from whom and what was the nature of consultancy taken?', 5, N'If consultancy was taken, then from whom and what was the nature of consultancy taken?')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'What are the exclusions that are applicable to your organization (if applicable)', 6, N'dsd')
INSERT [dbo].[quotation_request_scope] ([q_id], [audit_id], [caption], [caption_id], [already], [Certified]) VALUES (N'Kars_11', 1, N'ISO 9001:2015', NULL, 1, N'a')
INSERT [dbo].[quotation_request_scope] ([q_id], [audit_id], [caption], [caption_id], [already], [Certified]) VALUES (N'Kars_11', 2, N'ISO 27001:2013', NULL, 1, N'b')
INSERT [dbo].[quotation_request_scope] ([q_id], [audit_id], [caption], [caption_id], [already], [Certified]) VALUES (N'Kars_11', 3, N'ISO 20000:2011', NULL, 1, N'c')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 1, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N'dsdsd', 40, 11, 11, 11, 11, 6, 5, 5, 132, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 1, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N'dsdsd', 40, 11, 11, 11, 11, 6, 5, 5, 132, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 1, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N'dsdsd', 40, 11, 11, 11, 11, 6, 5, 5, 132, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 2, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N' Description of work performed (Services or Products) ', 40, 11, 11, 11, 111, 5, 6, 56, 63, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 3, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N' Description of work performed (Services or Products) ', 30, 11, 11, 11, 11, 9, 4, 46, 46, N'Describe if there are any offsite or outsourced activities')
ALTER TABLE [dbo].[quotation_request] ADD  CONSTRAINT [DF_quotation_request_createdon]  DEFAULT (getdate()) FOR [createdon]
GO
ALTER TABLE [dbo].[md_audit_sub_type]  WITH CHECK ADD  CONSTRAINT [FK_md_audit_sub_type_md_audit_type] FOREIGN KEY([audit_type_id])
REFERENCES [dbo].[md_audit_type] ([id])
GO
ALTER TABLE [dbo].[md_audit_sub_type] CHECK CONSTRAINT [FK_md_audit_sub_type_md_audit_type]
GO
ALTER TABLE [dbo].[quotation_iso_question]  WITH CHECK ADD  CONSTRAINT [FK_quotation_iso_question_md_audit_sub_type] FOREIGN KEY([iso_audit_type])
REFERENCES [dbo].[md_audit_sub_type] ([id])
GO
ALTER TABLE [dbo].[quotation_iso_question] CHECK CONSTRAINT [FK_quotation_iso_question_md_audit_sub_type]
GO
ALTER TABLE [dbo].[quotation_iso_question]  WITH CHECK ADD  CONSTRAINT [FK_quotation_iso_question_quotation_request] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[quotation_iso_question] CHECK CONSTRAINT [FK_quotation_iso_question_quotation_request]
GO
ALTER TABLE [dbo].[quotation_overall_complexity]  WITH CHECK ADD  CONSTRAINT [FK_quotation_overall_complexity_quotation_request] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[quotation_overall_complexity] CHECK CONSTRAINT [FK_quotation_overall_complexity_quotation_request]
GO
ALTER TABLE [dbo].[quotation_request_company_details]  WITH CHECK ADD  CONSTRAINT [FK_quotation_request_company_details_quotation_request] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[quotation_request_company_details] CHECK CONSTRAINT [FK_quotation_request_company_details_quotation_request]
GO
ALTER TABLE [dbo].[quotation_request_scope]  WITH CHECK ADD  CONSTRAINT [FK_quotation_request_scope_md_audit_sub_type] FOREIGN KEY([audit_id])
REFERENCES [dbo].[md_audit_sub_type] ([id])
GO
ALTER TABLE [dbo].[quotation_request_scope] CHECK CONSTRAINT [FK_quotation_request_scope_md_audit_sub_type]
GO
ALTER TABLE [dbo].[quotation_request_scope]  WITH CHECK ADD  CONSTRAINT [FK_quotation_request_scope_quotation_request] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[quotation_request_scope] CHECK CONSTRAINT [FK_quotation_request_scope_quotation_request]
GO
ALTER TABLE [dbo].[quotation_request_scope_details]  WITH CHECK ADD  CONSTRAINT [FK_quotation_request_scope_details_md_audit_sub_type] FOREIGN KEY([audit_type])
REFERENCES [dbo].[md_audit_sub_type] ([id])
GO
ALTER TABLE [dbo].[quotation_request_scope_details] CHECK CONSTRAINT [FK_quotation_request_scope_details_md_audit_sub_type]
GO
ALTER TABLE [dbo].[quotation_request_scope_details]  WITH CHECK ADD  CONSTRAINT [FK_quotation_request_scope_details_quotation_request] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[quotation_request_scope_details] CHECK CONSTRAINT [FK_quotation_request_scope_details_quotation_request]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_master_data]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
 Author:		<Author,,Ashish>
 Create date: <Create Date,,>
 Description:	<Description,,>
 =============================================*/

-- EXEC sp_get_master_data 'md_question_ISO_20000','description'

CREATE PROCEDURE [dbo].[sp_get_master_data]
-- Add the parameters for the stored procedure here
      @tableName VARCHAR(50), @columnName VARCHAR(50)= NULL
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;
         DECLARE @SQL NVARCHAR(250);
         DECLARE @val INT= 0;
         IF(@columnName IS NULL)
             BEGIN
                 SET @SQL = N'select id,description from '+@tableName+'';
                 EXEC sp_executesql @SQL;
             END;
         ELSE
             BEGIN
                 SET @SQL = N'select id,description from '+@tableName+' ORDER BY '+@columnName+'';
                 EXEC sp_executesql @SQL;
             END;
     END;
GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_iso_question]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_quotation_iso_question]
	-- Add the parameters for the stored procedure here
	   @q_id varchar(50)
      ,@iso_audit_type int
      ,@caption varchar(max)
      ,@caption_id int
      ,@data varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT 1 FROM quotation_iso_question WHERE q_id=@q_id AND iso_audit_type=@iso_audit_type AND caption_id=@caption_id)
	    BEGIN
			 INSERT INTO quotation_iso_question (q_id,iso_audit_type,caption,caption_id,[data]) VALUES
			 (@q_id  ,@iso_audit_type ,@caption  ,@caption_id   ,@data) 
	    END
    ELSE
	   BEGIN
			 UPDATE quotation_iso_question SET 
								   caption =@caption
								  ,caption_id =@caption_id
								  ,[data]=@data
						 WHERE q_id =@q_id AND iso_audit_type =@iso_audit_type
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_overall_complexity]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_quotation_overall_complexity]
	-- Add the parameters for the stored procedure here
	   @q_id varchar(50)
      ,@response varchar(50)
      ,@caption varchar(max)
      ,@caption_id int
      ,@support varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT 1 FROM quotation_overall_complexity WHERE q_id=@q_id AND caption_id=@caption_id)
	    BEGIN
			 INSERT INTO quotation_overall_complexity (q_id,response,caption,caption_id,support) VALUES
			 (@q_id  ,@response ,@caption  ,@caption_id   ,@support) 
	    END
    ELSE
	   BEGIN
			 UPDATE quotation_overall_complexity SET 
								    response=@response
								  , caption =@caption
								  ,caption_id =@caption_id
								  ,support=@support
						 WHERE q_id =@q_id 
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_company_details]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_quotation_request_company_details]
	-- Add the parameters for the stored procedure here
	   @q_id varchar(50)     
      ,@caption varchar(max)
      ,@caption_id int
      ,@data varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT 1 FROM quotation_request_company_details WHERE q_id=@q_id AND caption_id=@caption_id)
	    BEGIN
			 INSERT INTO quotation_request_company_details (q_id,caption,caption_id,[data]) VALUES
			 (@q_id   ,@caption  ,@caption_id   ,@data) 
	    END
    ELSE
	   BEGIN
			 UPDATE quotation_request_company_details SET 
								   caption =@caption
								  ,caption_id =@caption_id
								  ,[data]=@data
						 WHERE q_id =@q_id 
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_form]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================*/
CREATE PROCEDURE [dbo].[sp_quotation_request_form]
	-- Add the parameters for the stored procedure here
	  @quotation_id varchar(50)=null
      ,@custname varchar(100)
      ,@mr varchar(50)
      ,@street varchar(max)
      ,@phone varchar(50)
      ,@zip varchar(50)
      ,@email varchar(50)
      ,@website varchar(100)
      ,@fax varchar(max)
      ,@branch varchar(max)
      ,@industry varchar(max)
      ,@country int
      ,@otherinfo varchar(max)
      ,@date date
      ,@place varchar(50)
      ,@name varchar(50)
	 ,@id  varchar(50) OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @Qid varchar(50);
	SET NOCOUNT ON;
	if(@quotation_id IS NULL)
	   BEGIN
	   SELECT @Qid=[value] FROM md_table_identity WHERE [name]='QuotationId';

	   UPDATE md_table_identity SET [VALUE]=[VALUE]+1 WHERE [name]='QuotationId';
	   SELECT @Qid=SUBSTRING(@custname,1,4)+'_'+ cast(@Qid AS varchar(10))

		  INSERT INTO quotation_request (
			quotation_id 
		    ,custname 
		    ,mr 
		    ,street 
		    ,phone 
		    ,zip 
		    ,email 
		    ,website 
		    ,fax 
		    ,branch 
		    ,industry 
		    ,country 
		    ,otherinfo     
		    ,[date] 
		    ,place 
		    ,[name] 
		  )
		  VALUES
		  (
			@Qid 
		    ,@custname 
		    ,@mr 
		    ,@street 
		    ,@phone 
		    ,@zip 
		    ,@email 
		    ,@website 
		    ,@fax 
		    ,@branch 
		    ,@industry 
		    ,@country 
		    ,@otherinfo     
		    ,@date 
		    ,@place 
		    ,@name 
		  )
		  SET @id=@Qid;
	   END
	 ELSE
	   BEGIN
		  UPDATE quotation_request SET
					  custname =@custname
					 ,mr =@mr
					 ,street =@street
					 ,phone =@phone
					 ,zip =@zip
					 ,email=@email 
					 ,website =@website
					 ,fax =@fax
					 ,branch =@branch
					 ,industry =@industry
					 ,country =@country
					 ,otherinfo =@otherinfo    
					 ,[date] =@date
					 ,place =@place
					 ,[name]=@name
		    WHERE
				    quotation_id=@quotation_id
				     
					SET @id=@quotation_id;

	   END
END
	   

    -- Insert statements for procedure here
	


GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_scope]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_quotation_request_scope]
	-- Add the parameters for the stored procedure here
	   @q_id varchar(50)
      ,@audit_id int
      ,@caption varchar(max)
     -- ,@caption_id int
      ,@already int
	 ,@Certified varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT 1 FROM quotation_request_scope WHERE q_id=@q_id AND audit_id=@audit_id)
	    BEGIN
			 INSERT INTO quotation_request_scope (q_id,audit_id,caption,already,Certified) VALUES
			 (@q_id  ,@audit_id ,@caption     ,@already,@Certified) 
	    END
    ELSE
	   BEGIN
			 UPDATE quotation_request_scope SET 
								   caption =@caption
								 -- ,caption_id =@caption_id
								  ,already=@already
								  ,Certified=@Certified
						 WHERE q_id =@q_id AND audit_id =@audit_id
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_scope_details]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_quotation_request_scope_details]
	-- Add the parameters for the stored procedure here
		@q_id VARCHAR(max)
      ,@audit_type int
      ,@c_status int
      ,@scope VARCHAR(max)
      ,@siteaddress VARCHAR(max)
      ,@workdesc VARCHAR(max)
      ,@empstrength int
      ,@managerial int
      ,@technical int
      ,@it int
      ,@business int
      ,@admin int
      ,@hr int
      ,@finance int
      ,@other int
      ,@offsite VARCHAR(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM quotation_request_scope_details WHERE q_id=@q_id AND audit_type=@audit_type)
	   BEGIN
	   INSERT INTO quotation_request_scope_details (q_id
										    ,audit_type
										    ,c_status
										    ,scope
										    ,siteaddress
										    ,workdesc
										    ,empstrength
										    ,managerial
										    ,technical
										    ,it
										    ,business
										    ,[admin]
										    ,hr
										    ,finance
										    ,other
										    ,offsite)
								    VALUES
										  (@q_id
										    ,@audit_type
										    ,@c_status
										    ,@scope
										    ,@siteaddress
										    ,@workdesc
										    ,@empstrength
										    ,@managerial
										    ,@technical
										    ,@it
										    ,@business
										    ,@admin
										    ,@hr
										    ,@finance
										    ,@other
										    ,@offsite)
	   END
    ELSE
	   BEGIN
		  UPDATE quotation_request_scope_details SET 
										 audit_type=@audit_type
										    ,c_status=@c_status
										    ,scope=@scope
										    ,siteaddress=@siteaddress
										    ,workdesc=@workdesc
										    ,empstrength=@empstrength
										    ,managerial=@managerial
										    ,technical=@technical
										    ,it=@it
										    ,business=@business
										    ,[admin]=@admin
										    ,hr=@hr
										    ,finance=@finance
										    ,other=@other
										    ,offsite=@offsite
								    WHERE  q_id=@q_id
										    
									   
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_select_statement]    Script Date: 3/24/2017 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================*/

CREATE PROCEDURE [dbo].[sp_quotation_select_statement]
	
/* Add the parameters for the stored procedure here*/

      @condition VARCHAR(100), @quotation_id VARCHAR(50)= NULL
AS
     BEGIN
	
/* SET NOCOUNT ON added to prevent extra result sets from
	 interfering with SELECT statements.*/

         SET NOCOUNT ON;

         /* SELECT ISO Audit Type*/

         IF(@condition = 'AuditSubType')
             BEGIN
                 SELECT ast.[id], ast.[description]
                 FROM [dbo].[md_audit_type] mat
                      INNER JOIN [dbo].[md_audit_sub_type] ast ON mat.id =
                      ast.[audit_type_id]
                 WHERE ast.[audit_type_id] = 1;
             END;
         IF(@condition = 'QuotationForm')
             BEGIN
                 SELECT [quotation_id], [custname], [mr], [street],
                 [phone], [zip], [email], [website], [fax], [branch],
                 [industry], [country], [otherinfo], [createdon], CONVERT(varchar(10),[date],103) AS [date],CONVERT(varchar(11),[date],106) AS [condate],
                 [place], [name]
                 FROM dbo.quotation_request qr
                 WHERE qr.quotation_id = @quotation_id;
             END;
         IF(@condition = 'CompanyDetail')
             BEGIN
                 SELECT qrcd.caption_id AS id, qrcd.caption AS description,
                 qrcd.data
                 FROM dbo.quotation_request_company_details qrcd
                 WHERE qrcd.q_id = @quotation_id;
             END;
         IF(@condition = 'ISOQuestion9001')
             BEGIN
                 SELECT qiq.caption_id AS id, qiq.caption AS description,
                 qiq.data
                 FROM dbo.quotation_iso_question qiq
                 WHERE qiq.q_id = @quotation_id
                       AND qiq.iso_audit_type = 1;
             END;
         IF(@condition = 'ISOQuestion27001')
             BEGIN
                 SELECT qiq.caption_id AS id, qiq.caption AS description,
                 qiq.data
                 FROM dbo.quotation_iso_question qiq
                 WHERE qiq.q_id = @quotation_id
                       AND qiq.iso_audit_type = 2;
             END;
         IF(@condition = 'ISOQuestion20000')
             BEGIN
                 SELECT qiq.caption_id AS id, qiq.caption AS description,
                 qiq.data
                 FROM dbo.quotation_iso_question qiq
                 WHERE qiq.q_id = @quotation_id
                       AND qiq.iso_audit_type = 3;
             END;
         IF(@condition = 'Complexcity')
             BEGIN
                 SELECT qoc.caption_id AS id, qoc.caption AS description,
                 qoc.response, qoc.support
                 FROM dbo.quotation_overall_complexity qoc
                 WHERE qoc.q_id = @quotation_id;
             END;
         IF(@condition = 'Scope')
             BEGIN
                 SELECT qrs.audit_id AS id, qrs.caption AS description,
                 qrs.already, qrs.Certified
                 FROM dbo.quotation_request_scope qrs
                 WHERE qrs.q_id = @quotation_id;
             END;
         IF(@condition = 'ScopeDetails')
             BEGIN
                 SELECT *,mcs.description AS status
                 FROM dbo.quotation_request_scope_details qrsd INNER JOIN dbo.md_certificate_status mcs ON mcs.id=qrsd.c_status
                 WHERE qrsd.q_id = @quotation_id;
             END;
     END;
GO
USE [master]
GO
ALTER DATABASE [DMS] SET  READ_WRITE 
GO
