USE [master]
GO
/****** Object:  Database [DMS]    Script Date: 4/7/2017 5:09:05 PM ******/
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
/****** Object:  Table [dbo].[md_audit_report_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_audit_report_checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_md_audit_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[map_audit_report_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[map_audit_report_checklist](
	[programid] [int] NULL,
	[checklistid] [int] NULL,
	[options] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_audit_report_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_audit_report_checklist]
AS
SELECT        dbo.md_audit_report_checklist.id, dbo.md_audit_report_checklist.description, dbo.map_audit_report_checklist.options AS [option], dbo.map_audit_report_checklist.programid
FROM            dbo.md_audit_report_checklist INNER JOIN
                         dbo.map_audit_report_checklist ON dbo.md_audit_report_checklist.id = dbo.map_audit_report_checklist.checklistid

GO
/****** Object:  Table [dbo].[users]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[email] [varchar](100) NOT NULL,
	[mobile] [varchar](50) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[audit_type] [varchar](50) NULL,
	[user_type] [int] NULL,
	[isactive] [int] NULL,
	[pwdc] [varchar](50) NULL,
 CONSTRAINT [PK_users_1] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_users]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_users]
AS
SELECT        email, fname + ' ' + lname AS name
FROM            dbo.users


GO
/****** Object:  Table [dbo].[quotation_request]    Script Date: 4/7/2017 5:09:06 PM ******/
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
	[sponsor] [varchar](50) NULL,
 CONSTRAINT [PK_quotation_request] PRIMARY KEY CLUSTERED 
(
	[quotation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_request_scope]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  View [dbo].[vw_quotation_form]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_quotation_form]
AS
SELECT qr.quotation_id, qr.custname,qr.mr,    (SELECT        STUFF
                                                             ((SELECT        ', ' + CAST(caption AS VARCHAR(100)) [text()]
                                                                 FROM           dbo.quotation_request_scope qrs
			   WHERE        qrs.q_id = qr.quotation_id FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ')) AS [Audit Scope]										
													 FROM dbo.quotation_request qr      

GO
/****** Object:  Table [dbo].[assigned_auditor]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assigned_auditor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aprogramid] [int] NULL,
	[auditorid] [varchar](100) NULL,
	[auditornm] [varchar](100) NULL,
	[auitor_type] [int] NULL,
	[created_on] [datetime] NULL,
 CONSTRAINT [PK_assigned_auditor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[audit_finding]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_finding](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_loc] [varchar](500) NULL,
	[auditor_emailid] [varchar](50) NOT NULL,
	[auditee_name] [varchar](200) NULL,
	[proj_name] [varchar](500) NULL,
	[iso_9001] [varchar](max) NULL,
	[iso_27001] [varchar](max) NULL,
	[iso_20000] [varchar](max) NULL,
	[type_id] [int] NULL,
	[description] [varchar](max) NULL,
	[root_cause] [varchar](max) NULL,
	[corrective_action] [varchar](max) NULL,
	[preventive_actions] [varchar](max) NULL,
	[date_implementing_corrective_action] [datetime] NULL,
	[verification_dtl_corrective_action] [varchar](max) NULL,
	[Initials_of_mqas_auditor_reviewing_ca_proposed] [varchar](max) NULL,
	[date_proposed_ca_accepted_by_mqas] [datetime] NULL,
	[initials_mqas_auditor_verify_effect_of_corrective_action] [varchar](max) NULL,
	[date_ca_verified_by_mqas] [datetime] NULL,
	[mqas_auditor_comments_on_ca_verification] [varchar](max) NULL,
	[date_for_closure_of_non_conformity] [datetime] NULL,
	[date] [datetime] NULL,
	[audit_program_id] [int] NULL,
	[custname] [varchar](100) NULL,
	[mr] [varchar](50) NULL,
	[street] [varchar](max) NULL,
	[phone] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[website] [varchar](100) NULL,
	[fax] [varchar](50) NULL,
	[branch] [varchar](max) NULL,
	[industry] [varchar](max) NULL,
 CONSTRAINT [PK_audit_finding] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[audit_next_step]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_next_step](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[auditorstatement] [varchar](500) NULL,
 CONSTRAINT [PK_next_step] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[audit_program]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_program](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[q_id] [varchar](50) NULL,
	[stageid] [int] NULL,
	[stagename] [varchar](50) NULL,
	[nod] [int] NULL,
	[frmdt] [date] NULL,
	[todt] [date] NULL,
	[remark] [text] NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_audit_program] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[audit_report]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[audit_program_id] [int] NOT NULL,
	[statutoryregulatoryrequirement] [varchar](max) NULL,
	[exclusionsclaimedandaccepted] [varchar](max) NULL,
	[reference] [varchar](max) NULL,
	[internalauditprogramandmanagementreview] [varchar](max) NULL,
	[isbaseline] [bit] NULL,
	[custname] [varchar](100) NULL,
	[mr] [varchar](50) NULL,
	[street] [varchar](max) NULL,
	[phone] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[website] [varchar](100) NULL,
	[fax] [varchar](50) NULL,
	[branch] [varchar](max) NULL,
	[industry] [varchar](max) NULL,
	[sponsor] [varchar](50) NULL,
 CONSTRAINT [PK_audit_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditor_time]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditor_time](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[audit_program_id] [int] NOT NULL,
	[auditplanning] [varchar](500) NULL,
	[onsiteaudit] [varchar](500) NULL,
 CONSTRAINT [PK_audit_time] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[map_audit_report_statement]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[map_audit_report_statement](
	[audit_program_id] [int] NULL,
	[audit_report_id] [int] NULL,
	[audit_statement] [varchar](500) NULL,
	[statement_value] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[map_quotation_review_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[map_quotation_review_checklist](
	[quotation_id] [varchar](50) NULL,
	[review_id] [int] NULL,
	[remark] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[map_role_rights]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[map_role_rights](
	[roleid] [int] NULL,
	[screenid] [int] NULL,
	[read] [int] NULL,
	[write] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_audit_objective]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_audit_objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_md_audit_objective] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_audit_stage]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_audit_stage](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_audit_stage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_audit_sub_type]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_audit_type]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_auditor_type]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_auditor_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_auditor_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_certificate_status]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_company_details]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_country]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_finding_type]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_finding_type](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_impartiality_review_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_impartiality_review_checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sq_id] [int] NULL,
	[sqno] [varchar](10) NULL,
	[checkpoint] [varchar](500) NULL,
 CONSTRAINT [PK_md_impartiality_review_checklist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_question_ISO_20000]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_question_ISO_27001]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_question_ISO_9001]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_question_overall_complexity]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[md_role]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [md_role_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_screen]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_screen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
	[screen_name] [varchar](50) NULL,
	[folder] [varchar](50) NULL,
	[URL] [varchar](max) NULL,
	[ParentId] [int] NULL,
	[IsActive] [bit] NULL,
	[sq_no] [int] NULL,
	[menu_desc] [varchar](50) NULL,
 CONSTRAINT [PK_md_screen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_table_identity]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_table_identity](
	[name] [varchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[md_user_type]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[md_user_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_md_user_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotation_iso_question]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[quotation_overall_complexity]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[quotation_request_company_details]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[quotation_request_scope_details]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  Table [dbo].[user_rights]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_rights](
	[userid] [varchar](100) NULL,
	[screenid] [int] NULL,
	[read] [int] NULL,
	[write] [int] NULL,
	[date] [datetime] NULL,
	[role] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[userid] [varchar](100) NULL,
	[roleid] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[assigned_auditor] ON 

INSERT [dbo].[assigned_auditor] ([id], [aprogramid], [auditorid], [auditornm], [auitor_type], [created_on]) VALUES (3, 18, N'arvind@mqasglobal.com', N'Arvind Kumar', 2, CAST(N'2017-03-29T18:03:58.333' AS DateTime))
INSERT [dbo].[assigned_auditor] ([id], [aprogramid], [auditorid], [auditornm], [auitor_type], [created_on]) VALUES (5, 18, N'ashok@mqasglobal.com', N'Ashok Verdhan (9001,27001,20000)', 1, CAST(N'2017-04-03T13:21:34.063' AS DateTime))
INSERT [dbo].[assigned_auditor] ([id], [aprogramid], [auditorid], [auditornm], [auitor_type], [created_on]) VALUES (6, 18, NULL, N'cxvx', 3, CAST(N'2017-04-04T11:54:35.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[assigned_auditor] OFF
SET IDENTITY_INSERT [dbo].[audit_finding] ON 

INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (1, N'Washington DC', N'a', N'Gail, Kathy', N'MR', N'8.2.2:  Internal Audit', N'9.2 Internal audit', N'4.5.4.2 Internal audit', 2, N'Internal audits checklist exists in QMS and is used to conduct internal audits.  However, the log of audit findings is not evident for MAX project that was audited.', N'Since there was no finding in MAX project there is no entry in audit log.', N'An entry for project MAX will be recorded for audit performed.', N'An entry for each project/ function will be created even if there is no finding.', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'Log record the audit entry for MAX project with 0 findings.', N'RG', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'dsada', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'as', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2015-10-30T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (2, N'Washington DC', N'a', N'Gail, Kathy', N'MR', N'', N'', N'6.1 Service level management', 2, N'Strategic review of services being offered and reconciliation of catalogues with corporate website is not evident.  Catalog for Helpdesk service being provided is not evident.', N'Catalogue and Website changes are performed hand-in-hand, so reconcilation document is not produced. Helpdesk service is just crafted.', N'Publish Helpdesk Catalog.', N'', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'Helpdesk Catalog approval to publish received, will be published in scheduled change on 10-Nov-15.', N'RG', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2015-10-30T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (3, N'Washington DC', N'b', N'Kathy', N'Helpdesk for Cru-X suite of applications', N'8.2.3:  Monitoring & Measurement of Processes', N'', N'6.2 Service reporting', 3, N'SLA Fulfillment report is not evident in the project', N'Documentation gap, due to project reporting mechanism.', N'Add SLA fulfillment details in Monthly Status reports.', N'Alter the Monthly Status report template with addition of SLA fulfillment section as mandatory.', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'Monthly Status report template revised.', N'RG', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2015-11-02T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (4, N'Washington DC', N'c', N'Jim', N'Business Intelligence Services', N'8.2.3:  Monitoring & Measurement of Processes', N'', N'6.5 Capacity management', 3, N'Capacity Management report are not evident in the project', N'There was no change in the requirement and same capacity is being used since beginning of project', N'Capacity Management and tracking sheet will be added', N'Capacity Management and tracking sheet is part of process documents, will be made mandatory for all project.', CAST(N'2015-11-08T00:00:00.000' AS DateTime), N'Capacity Management sheet added for BI Services.
Capacity Management section made mandatory in PMP template.', N'RG', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2015-11-03T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (5, N'Washington DC', N'a', N'Alycia Rawls', N'HR & Training', N'6.2.2:  Competence, training and awareness', N'', N'4.4.2 Human resources', 3, N'Service training presentation exists in QMS.  But Gary Pinson who has joined and managing a service project has not been provided QMS trainings related to service processes.', N'Gary Pinson has joined recently.', N'QMS training for Gary Pinson is scheduled for 10-Nov-15.', N'', CAST(N'2015-11-08T00:00:00.000' AS DateTime), N'Schedule updated for Gary''s training.', N'RG', CAST(N'2015-11-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2015-11-04T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (6, N'dsadas', N'a', N'test', N'asd', N'asd', N'dsad', N'asdasd', 2, N'dasd', N'sad', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2017-03-31T00:00:00.000' AS DateTime), 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[audit_finding] ([id], [site_loc], [auditor_emailid], [auditee_name], [proj_name], [iso_9001], [iso_27001], [iso_20000], [type_id], [description], [root_cause], [corrective_action], [preventive_actions], [date_implementing_corrective_action], [verification_dtl_corrective_action], [Initials_of_mqas_auditor_reviewing_ca_proposed], [date_proposed_ca_accepted_by_mqas], [initials_mqas_auditor_verify_effect_of_corrective_action], [date_ca_verified_by_mqas], [mqas_auditor_comments_on_ca_verification], [date_for_closure_of_non_conformity], [date], [audit_program_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry]) VALUES (7, N'dsad', N'a', N'Testing', N'daa', N'', N'', N'', 2, N'dada', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2017-03-31T00:00:00.000' AS DateTime), 18, N'Karson', N'ashish', N'Radhay', N'329379372', N'91291', N'sjkajs', N'akjsk', N'213213', N'Noida', N'Sales')
SET IDENTITY_INSERT [dbo].[audit_finding] OFF
SET IDENTITY_INSERT [dbo].[audit_next_step] ON 

INSERT [dbo].[audit_next_step] ([id], [auditorstatement]) VALUES (1, N'Award of New Certificate')
INSERT [dbo].[audit_next_step] ([id], [auditorstatement]) VALUES (2, N'Continuation of existing Certificate')
INSERT [dbo].[audit_next_step] ([id], [auditorstatement]) VALUES (3, N'Inclusion of Changes in the scope of existing certification as per Section 11')
INSERT [dbo].[audit_next_step] ([id], [auditorstatement]) VALUES (4, N'Continuation of existing Certificate only after re-audit')
INSERT [dbo].[audit_next_step] ([id], [auditorstatement]) VALUES (5, N'Proceed with @stage ')
SET IDENTITY_INSERT [dbo].[audit_next_step] OFF
SET IDENTITY_INSERT [dbo].[audit_program] ON 

INSERT [dbo].[audit_program] ([id], [q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark], [createdon]) VALUES (18, N'Kars_11', 1, N'Stage 1 Audit', 2, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), N'ererer', CAST(N'2017-03-28T17:23:35.580' AS DateTime))
INSERT [dbo].[audit_program] ([id], [q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark], [createdon]) VALUES (19, N'Kars_11', 2, N'Stage 2 Audit', 2, CAST(N'2017-04-11' AS Date), CAST(N'2017-04-12' AS Date), N'ererer', CAST(N'2017-03-28T17:23:35.633' AS DateTime))
INSERT [dbo].[audit_program] ([id], [q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark], [createdon]) VALUES (20, N'Kars_11', 3, N'Surveillance 1 Audit', 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-12' AS Date), N'ererer', CAST(N'2017-03-28T17:23:35.633' AS DateTime))
INSERT [dbo].[audit_program] ([id], [q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark], [createdon]) VALUES (21, N'Kars_11', 4, N'Surveillance 2 Audit', 3, CAST(N'2019-04-11' AS Date), CAST(N'2019-04-12' AS Date), N'ererer', CAST(N'2017-03-28T17:23:35.633' AS DateTime))
INSERT [dbo].[audit_program] ([id], [q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark], [createdon]) VALUES (22, N'Kars_11', 5, N'Recertification', 3, CAST(N'2020-04-11' AS Date), CAST(N'2020-04-12' AS Date), N'ererer', CAST(N'2017-03-28T17:23:35.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[audit_program] OFF
SET IDENTITY_INSERT [dbo].[audit_report] ON 

INSERT [dbo].[audit_report] ([id], [audit_program_id], [statutoryregulatoryrequirement], [exclusionsclaimedandaccepted], [reference], [internalauditprogramandmanagementreview], [isbaseline], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry], [sponsor]) VALUES (1, 18, N'<p>As per existing government rules and regulations</p>', N'<p><strong>ISO 20000-1:2011</strong></p>
<p>None</p>
<p><strong>ISO 27001:2013</strong></p>
<p>A.10 CRYPTOGRAPHY</p>
<p>A.14.2.7 Outsourced development</p>', N'<p>Latest Version 1.1</p>', N'<p style="text-align: justify;">The audit findings (no major NCs) signify that the client has strengthened their internal audit programs and management reviews. &nbsp;The internal audits are being carried out regularly and management review meetings are being conducted. Two iterations of audits and management reviews were conducted were verified.</p>', 0, N'Karsun Solutions LLC', N'Gunawan Tanoto', N'13655 Dulles Technology Dr #110, 
Herndon, VA 20171, United States
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Gunawan Tanoto')
INSERT [dbo].[audit_report] ([id], [audit_program_id], [statutoryregulatoryrequirement], [exclusionsclaimedandaccepted], [reference], [internalauditprogramandmanagementreview], [isbaseline], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry], [sponsor]) VALUES (4, 19, N'asdsad', N'asda', N'dasdaasdada', N'sdas', 0, N'Karsun Solutions LLC', N'Gunawan Tanoto', N'13655 Dulles Technology Dr #110, 
Herndon, VA 20171, United States
', N'329379372', N'91291', N'sjkajs', N'akjsk', N'213213', N'Noida', N'Sales', N'Gunawan Tanoto')
INSERT [dbo].[audit_report] ([id], [audit_program_id], [statutoryregulatoryrequirement], [exclusionsclaimedandaccepted], [reference], [internalauditprogramandmanagementreview], [isbaseline], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry], [sponsor]) VALUES (5, 20, N'Statutory and Regulatory Requirements', N'Exclusions Claimed and Accepted', N'References (e.g. Statement of applicability with its version number)', N'How Reliable is Client Internal Audit Program and Management Review', 1, N'Karsun Solutions LLC', N'Gunawan Tanoto', N'13655 Dulles Technology Dr #110, 
Herndon, VA 20171, United States
', N'329379372', N'91291', N'sjkajs', N'akjsk', N'213213', N'Noida', N'Sales', N'Gunawan Tanoto')
SET IDENTITY_INSERT [dbo].[audit_report] OFF
SET IDENTITY_INSERT [dbo].[auditor_time] ON 

INSERT [dbo].[auditor_time] ([id], [audit_program_id], [auditplanning], [onsiteaudit]) VALUES (1, 18, N'2', N'8')
INSERT [dbo].[auditor_time] ([id], [audit_program_id], [auditplanning], [onsiteaudit]) VALUES (2, 19, N'2', N'8')
INSERT [dbo].[auditor_time] ([id], [audit_program_id], [auditplanning], [onsiteaudit]) VALUES (4, 18, N'3', N'2')
SET IDENTITY_INSERT [dbo].[auditor_time] OFF
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 1, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 2, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 3, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 4, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 5, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 6, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 7, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 8, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 9, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 10, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 11, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 12, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 13, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 14, N'Yes')
INSERT [dbo].[map_audit_report_checklist] ([programid], [checklistid], [options]) VALUES (18, 15, N'Yes')
SET IDENTITY_INSERT [dbo].[map_audit_report_statement] ON 

INSERT [dbo].[map_audit_report_statement] ([audit_program_id], [audit_report_id], [audit_statement], [statement_value], [id]) VALUES (20, NULL, N'Award of New Certificate', N'Yes', 1)
INSERT [dbo].[map_audit_report_statement] ([audit_program_id], [audit_report_id], [audit_statement], [statement_value], [id]) VALUES (20, NULL, N'Continuation of existing Certificate', N'Yes', 2)
INSERT [dbo].[map_audit_report_statement] ([audit_program_id], [audit_report_id], [audit_statement], [statement_value], [id]) VALUES (20, NULL, N'Inclusion of Changes in the scope of existing certification as per Section 11', N'No', 3)
INSERT [dbo].[map_audit_report_statement] ([audit_program_id], [audit_report_id], [audit_statement], [statement_value], [id]) VALUES (20, NULL, N'Continuation of existing Certificate only after re-audit', N'Yes', 4)
INSERT [dbo].[map_audit_report_statement] ([audit_program_id], [audit_report_id], [audit_statement], [statement_value], [id]) VALUES (20, NULL, N'Proceed with Stage 3 audit', N'No', 5)
SET IDENTITY_INSERT [dbo].[map_audit_report_statement] OFF
INSERT [dbo].[map_role_rights] ([roleid], [screenid], [read], [write]) VALUES (1, 3, 0, 1)
INSERT [dbo].[map_role_rights] ([roleid], [screenid], [read], [write]) VALUES (1, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[md_audit_objective] ON 

INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (1, N'Conformance to the requirements of the management system')
INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (2, N'Performance monitoring, measuring, reporting and reviewing against key performance objectives')
INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (3, N'Legal compliance')
INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (4, N'Effectiveness of the implementation of its processes;')
INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (5, N'Satisfaction of organization objectives')
INSERT [dbo].[md_audit_objective] ([id], [description]) VALUES (6, N'Management review meetings and audits and NC closure')
SET IDENTITY_INSERT [dbo].[md_audit_objective] OFF
SET IDENTITY_INSERT [dbo].[md_audit_report_checklist] ON 

INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (1, N'All findings were agreed with Management as being a true record of the facts observed.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (2, N'Results of previous internal audits were reviewed.  Actions taken by the organization to close the nonconformities and observations were reviewed and were found to be effective. All previous nonconformities and observations are now closed.')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (3, N'The nonconformities raised during this audit are required to be addressed effectively within the timescale agreed and recorded in the Audit Finding Report (3 days).  MQAS will verify the effectiveness of the corrective actions taken.')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (4, N'All clauses identified in the audit plan and programs were assessed.  The Management System was found in compliance with the standard and company management system, except for the non-conformities raised in the audit finding report.')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (5, N'It should be noted that the audit is only a sample exercise.  Hence, it does not mean that other non-conformities do not exist in audited and/or other areas.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (6, N'Management Reviews, Internal Audits, Preventive & Corrective Actions were found to have been implemented in accordance with the requirements of the audit standard.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (7, N'Customer complaints are handled and followed-up in accordance with established procedures.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (8, N'The management system documentation has been reviewed and found to be compliant with the standard.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (9, N'The management system has been changed to reflect changes in the organization.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (10, N'The management system is in line with the organization’s objectives and supports their attainment.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (11, N'Continual improvement of system performance activities are monitored for their progress and completion.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (12, N'The effectiveness of corrective actions in response to internal audits and management reviews are followed up.  ')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (13, N'The documents reviewed indicates the adequacy with respect to ISO 27001:2013 and also regulatory requirements like financial audits, employment act are being adhered to.')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (14, N'The organization has resources to carry out stage 2 audit')
INSERT [dbo].[md_audit_report_checklist] ([id], [description]) VALUES (15, N'The use of certification mark(s) is in accordance with requirements.  ')
SET IDENTITY_INSERT [dbo].[md_audit_report_checklist] OFF
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (1, N'Stage 1 Audit')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (2, N'Stage 2 Audit')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (3, N'Surveillance 1 Audit')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (4, N'Surveillance 2 Audit')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (5, N'Recertification')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (6, N'Transition Audit')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (7, N'Site Change')
INSERT [dbo].[md_audit_stage] ([id], [description]) VALUES (8, N'Name Change')
SET IDENTITY_INSERT [dbo].[md_audit_sub_type] ON 

INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (1, 1, N'ISO 9001:2015')
INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (2, 1, N'ISO 27001:2013')
INSERT [dbo].[md_audit_sub_type] ([id], [audit_type_id], [description]) VALUES (3, 1, N'ISO 20000:2011')
SET IDENTITY_INSERT [dbo].[md_audit_sub_type] OFF
SET IDENTITY_INSERT [dbo].[md_audit_type] ON 

INSERT [dbo].[md_audit_type] ([id], [description]) VALUES (1, N'ISO')
INSERT [dbo].[md_audit_type] ([id], [description]) VALUES (2, N'CMMI')
SET IDENTITY_INSERT [dbo].[md_audit_type] OFF
SET IDENTITY_INSERT [dbo].[md_auditor_type] ON 

INSERT [dbo].[md_auditor_type] ([id], [description]) VALUES (1, N'Lead Auditor')
INSERT [dbo].[md_auditor_type] ([id], [description]) VALUES (2, N'Auditor')
INSERT [dbo].[md_auditor_type] ([id], [description]) VALUES (3, N'Observer')
INSERT [dbo].[md_auditor_type] ([id], [description]) VALUES (4, N'Trainee')
SET IDENTITY_INSERT [dbo].[md_auditor_type] OFF
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
INSERT [dbo].[md_finding_type] ([id], [description]) VALUES (1, N'Major')
INSERT [dbo].[md_finding_type] ([id], [description]) VALUES (2, N'Minor')
INSERT [dbo].[md_finding_type] ([id], [description]) VALUES (3, N'Observation')
INSERT [dbo].[md_finding_type] ([id], [description]) VALUES (4, N'Opportunity for Improvement')
INSERT [dbo].[md_finding_type] ([id], [description]) VALUES (5, N'Strength')
SET IDENTITY_INSERT [dbo].[md_impartiality_review_checklist] ON 

INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (1, 1, N'1.', N'Has the following been verified that:')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (2, 1, N'a.', N'Audit team members have been explained about impartiality?')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (3, 1, N'b.', N'The audit team or anybody in audit team has not provided consultancy to client in last two years following the end of the consultancy.')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (4, 1, N'c.', N'MQAS or any member of audit team has not conducted internal audit for a minimum of last two years at client site following the end of internal audit. ')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (5, 1, N'd.', N'If there is any interest on part of any member of audit team to get involved in conflict of interest with client.')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (6, 2, N'2.', N'Members of audit team have given undertaking with respect to impartiality.')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (7, 3, N'3.', N'Undertaking of impartiality has been taken from technical expert if he is there along with audit team.')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (8, 4, N'4.', N'Is there any commercial, financial or other pressure to compromise impartiality, on part of audit team members or on MQAS?')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (9, 5, N'5.', N'MQAS has not provided consultancy for ISO to client in last two years following the end of consultancy.')
INSERT [dbo].[md_impartiality_review_checklist] ([id], [sq_id], [sqno], [checkpoint]) VALUES (10, 6, N'6.', N'Is there any other risk to impartiality perceived by MQAS?')
SET IDENTITY_INSERT [dbo].[md_impartiality_review_checklist] OFF
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
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (6, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?<br/><br/>Give brief description.')
INSERT [dbo].[md_question_ISO_27001] ([id], [description]) VALUES (8, N'Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)? <br/> <br/>If yes, have you identified and addressed risks associated with such interfaces?')
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
SET IDENTITY_INSERT [dbo].[md_role] ON 

INSERT [dbo].[md_role] ([id], [description]) VALUES (1, N'Admin')
INSERT [dbo].[md_role] ([id], [description]) VALUES (2, N'Auditor')
SET IDENTITY_INSERT [dbo].[md_role] OFF
SET IDENTITY_INSERT [dbo].[md_screen] ON 

INSERT [dbo].[md_screen] ([id], [description], [screen_name], [folder], [URL], [ParentId], [IsActive], [sq_no], [menu_desc]) VALUES (1, N'Quotation', N'QuotationRequestfrm.aspx', N'ISO', N'~/ISO/QuotationRequestfrm.aspx', 4, 1, 1, N'Quotation Form')
INSERT [dbo].[md_screen] ([id], [description], [screen_name], [folder], [URL], [ParentId], [IsActive], [sq_no], [menu_desc]) VALUES (2, N'Auditor Assigned Task', N'AuditorAuditList.aspx', N'ISO', N'~/ISO/AuditorAuditList.aspx', NULL, 1, 2, N'Auditor Assigned Task')
INSERT [dbo].[md_screen] ([id], [description], [screen_name], [folder], [URL], [ParentId], [IsActive], [sq_no], [menu_desc]) VALUES (3, N'Audit Program', N'AuditProgram.aspx', N'ISO', N'~/ISO/AuditProgram.aspx', 4, 1, 3, N'Audit Program')
INSERT [dbo].[md_screen] ([id], [description], [screen_name], [folder], [URL], [ParentId], [IsActive], [sq_no], [menu_desc]) VALUES (4, N'Audit', NULL, N'ISO', NULL, NULL, 1, 1, N'Audit')
SET IDENTITY_INSERT [dbo].[md_screen] OFF
INSERT [dbo].[md_table_identity] ([name], [value]) VALUES (N'QuotationId', 12)
SET IDENTITY_INSERT [dbo].[md_user_type] ON 

INSERT [dbo].[md_user_type] ([id], [description]) VALUES (1, N'Auditor')
SET IDENTITY_INSERT [dbo].[md_user_type] OFF
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
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
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
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are the people in organization aware of quality policy?', 1, N'Are the people in organization aware of quality policy?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have service continuity plan in place?', 1, N'Do you have service continuity plan in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Do you have an ISMS policy', 2, N'Do you have an ISMS policy')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
GO
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Briefly describe the level of security control you require for business or customer reasons', 1, N'Briefly describe the level of security control you require for business or customer reasons')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Do you have defined product development processes?', 2, N'Do you have defined product development processes?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Are internal audits been carried out?', 3, N'Are internal audits been carried out?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 1, N'Have you defined processes for training?', 4, N'Have you defined processes for training?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have Capacity and Availability Management process in place?', 2, N'Do you have Capacity and Availability Management process in place?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Do you have process defined for Incident Resolution and Prevention', 3, N'Do you have process defined for Incident Resolution and Prevention')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 3, N'Are the internal audits being carried out?', 4, N'Are the internal audits being carried out?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Do you have a Statement of Applicability', 3, N'Do you have a Statement of Applicability')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you identified applicable ISMS legislation?', 4, N'Have you identified applicable ISMS legislation?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you prepared a documented management system description?', 5, N'Have you prepared a documented management system description?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?<br/><br/>Give brief description.', 6, N'Have you completed information security risk assessment and risk treatment activities considering the nature of the organization business activities?')
INSERT [dbo].[quotation_iso_question] ([q_id], [iso_audit_type], [caption], [caption_id], [data]) VALUES (N'Kars_11', 2, N'Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)? <br/> <br/>If yes, have you identified and addressed risks associated with such interfaces?', 8, N' Are there any interfaces to services or activities that are external to the proposed scope of your certification (Example: sharing of facilities with other organizations such as IT systems, telecom systems)?')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Degree of similarity of process across teams, business units, locations', 1, N'LOW', N'Degree of similarity of process across teams, business units, locations')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Institutionalization of management system – measured by Awareness, Internal Audits happening, Management Reviews happening', 2, N'High', N'Institutionalization of management system – measured by Awareness, Internal Audits happening, Management Reviews happening')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'Completeness and Maturity of Management System documentation', 3, N'medium', N'Completeness and Maturity of Management System documentation')
INSERT [dbo].[quotation_overall_complexity] ([q_id], [caption], [caption_id], [response], [support]) VALUES (N'Kars_11', N'How complicated is the integrated use of Hardware, Software, and Services in your business?', 4, N'low', N'How complicated is the integrated use of Hardware, Software, and Services in your business?')
INSERT [dbo].[quotation_request] ([quotation_id], [custname], [mr], [street], [phone], [zip], [email], [website], [fax], [branch], [industry], [country], [otherinfo], [createdon], [date], [place], [name], [sponsor]) VALUES (N'Kars_11', N'<p>Karsun Solutions LLC</p>', N'Gunawan Tanoto', N'<p>13655 Dulles Technology Dr #110, Herndon, VA 20171, United States</p>', N'329379372', N'91291', N'sjkajs', N'akjsk', N'213213', N'Noida', N'Sales', 1, N'xdfdgdgdf', CAST(N'2017-03-24T12:27:05.783' AS DateTime), CAST(N'2017-03-24' AS Date), N'NOIDA', N'Abhay', N'Gunawan Tanoto')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
INSERT [dbo].[quotation_request_company_details] ([q_id], [caption], [caption_id], [data]) VALUES (N'Kars_11', N'Name of Parent or holding company (if applicable)', 1, N'Name of Parent or holding company (if applicable)')
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
INSERT [dbo].[quotation_request_scope] ([q_id], [audit_id], [caption], [caption_id], [already], [Certified]) VALUES (N'Kars_11', 2, N'ISO 27001:2013', NULL, 1, N'b')
INSERT [dbo].[quotation_request_scope] ([q_id], [audit_id], [caption], [caption_id], [already], [Certified]) VALUES (N'Kars_11', 3, N'ISO 20000:2011', NULL, 1, N'c')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 2, 1, N' Scope of certification ', N' Address of the locations to be assessed ', N' Description of work performed (Services or Products) ', 40, 11, 11, 11, 111, 5, 6, 56, 63, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[quotation_request_scope_details] ([q_id], [audit_type], [c_status], [scope], [siteaddress], [workdesc], [empstrength], [managerial], [technical], [it], [business], [admin], [hr], [finance], [other], [offsite]) VALUES (N'Kars_11', 3, 1, N' Scope of certification ', N' Address 2 of the locations to be assessed ', N' Description of work performed (Services or Products) ', 30, 11, 11, 11, 11, 9, 4, 46, 46, N'Describe if there are any offsite or outsourced activities')
INSERT [dbo].[users] ([email], [mobile], [fname], [lname], [pwd], [audit_type], [user_type], [isactive], [pwdc]) VALUES (N'arvind@mqasglobal.com', N'222', N'Arvind', N'Kumar', N'abc@123', N'9001,27001,20000', 1, 1, N'abc@123')
INSERT [dbo].[users] ([email], [mobile], [fname], [lname], [pwd], [audit_type], [user_type], [isactive], [pwdc]) VALUES (N'ashok@mqasglobal.com', N'333', N'Ashok', N'Verdhan', N'abc@123', N'9001,27001,20000', 1, 1, N'abc@123')
INSERT [dbo].[users] ([email], [mobile], [fname], [lname], [pwd], [audit_type], [user_type], [isactive], [pwdc]) VALUES (N'rajmqas@gmail.com', N'111', N'Raj', N'Maheshwari', N'abc@123', N'9001,27001,20000', 1, 1, N'abc@123')
INSERT [dbo].[users_roles] ([userid], [roleid]) VALUES (N'rajmqas@gmail.com', 1)
ALTER TABLE [dbo].[assigned_auditor] ADD  CONSTRAINT [DF_assigned_auditor_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[audit_program] ADD  CONSTRAINT [DF_audit_program_createdon]  DEFAULT (getdate()) FOR [createdon]
GO
ALTER TABLE [dbo].[audit_report] ADD  CONSTRAINT [DF_audit_report_isbaseline]  DEFAULT ((0)) FOR [isbaseline]
GO
ALTER TABLE [dbo].[md_screen] ADD  CONSTRAINT [DF__md_screen__URL__6CC31A31]  DEFAULT (NULL) FOR [URL]
GO
ALTER TABLE [dbo].[md_screen] ADD  CONSTRAINT [DF__md_screen__Paren__6DB73E6A]  DEFAULT (NULL) FOR [ParentId]
GO
ALTER TABLE [dbo].[md_screen] ADD  CONSTRAINT [DF__md_screen__IsAct__6EAB62A3]  DEFAULT (NULL) FOR [IsActive]
GO
ALTER TABLE [dbo].[md_screen] ADD  CONSTRAINT [DF__md_screen__sq_no__6F9F86DC]  DEFAULT (NULL) FOR [sq_no]
GO
ALTER TABLE [dbo].[md_screen] ADD  CONSTRAINT [DF__md_screen__menu___7093AB15]  DEFAULT (NULL) FOR [menu_desc]
GO
ALTER TABLE [dbo].[quotation_request] ADD  CONSTRAINT [DF_quotation_request_createdon]  DEFAULT (getdate()) FOR [createdon]
GO
ALTER TABLE [dbo].[quotation_request] ADD  DEFAULT (NULL) FOR [sponsor]
GO
ALTER TABLE [dbo].[user_rights] ADD  CONSTRAINT [DF_user_rights_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[assigned_auditor]  WITH CHECK ADD  CONSTRAINT [FK_assigned_auditor_audit_program] FOREIGN KEY([aprogramid])
REFERENCES [dbo].[audit_program] ([id])
GO
ALTER TABLE [dbo].[assigned_auditor] CHECK CONSTRAINT [FK_assigned_auditor_audit_program]
GO
ALTER TABLE [dbo].[audit_program]  WITH CHECK ADD  CONSTRAINT [FK_audit_program_md_audit_stage] FOREIGN KEY([q_id])
REFERENCES [dbo].[quotation_request] ([quotation_id])
GO
ALTER TABLE [dbo].[audit_program] CHECK CONSTRAINT [FK_audit_program_md_audit_stage]
GO
ALTER TABLE [dbo].[map_audit_report_checklist]  WITH CHECK ADD  CONSTRAINT [FK_map_audit_report_checklist_audit_program] FOREIGN KEY([programid])
REFERENCES [dbo].[audit_program] ([id])
GO
ALTER TABLE [dbo].[map_audit_report_checklist] CHECK CONSTRAINT [FK_map_audit_report_checklist_audit_program]
GO
ALTER TABLE [dbo].[map_audit_report_checklist]  WITH CHECK ADD  CONSTRAINT [FK_map_audit_report_checklist_md_audit_report_checklist] FOREIGN KEY([checklistid])
REFERENCES [dbo].[md_audit_report_checklist] ([id])
GO
ALTER TABLE [dbo].[map_audit_report_checklist] CHECK CONSTRAINT [FK_map_audit_report_checklist_md_audit_report_checklist]
GO
ALTER TABLE [dbo].[map_role_rights]  WITH CHECK ADD  CONSTRAINT [FK_map_role_rights_md_role] FOREIGN KEY([roleid])
REFERENCES [dbo].[md_role] ([id])
GO
ALTER TABLE [dbo].[map_role_rights] CHECK CONSTRAINT [FK_map_role_rights_md_role]
GO
ALTER TABLE [dbo].[map_role_rights]  WITH CHECK ADD  CONSTRAINT [FK_map_role_rights_md_screen] FOREIGN KEY([screenid])
REFERENCES [dbo].[md_screen] ([id])
GO
ALTER TABLE [dbo].[map_role_rights] CHECK CONSTRAINT [FK_map_role_rights_md_screen]
GO
ALTER TABLE [dbo].[md_audit_sub_type]  WITH CHECK ADD  CONSTRAINT [FK_md_audit_sub_type_md_audit_type] FOREIGN KEY([audit_type_id])
REFERENCES [dbo].[md_audit_type] ([id])
GO
ALTER TABLE [dbo].[md_audit_sub_type] CHECK CONSTRAINT [FK_md_audit_sub_type_md_audit_type]
GO
ALTER TABLE [dbo].[md_screen]  WITH CHECK ADD  CONSTRAINT [FK_md_screen_md_screen] FOREIGN KEY([id])
REFERENCES [dbo].[md_screen] ([id])
GO
ALTER TABLE [dbo].[md_screen] CHECK CONSTRAINT [FK_md_screen_md_screen]
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
ALTER TABLE [dbo].[user_rights]  WITH CHECK ADD  CONSTRAINT [FK_user_rights_md_screen] FOREIGN KEY([screenid])
REFERENCES [dbo].[md_screen] ([id])
GO
ALTER TABLE [dbo].[user_rights] CHECK CONSTRAINT [FK_user_rights_md_screen]
GO
ALTER TABLE [dbo].[user_rights]  WITH CHECK ADD  CONSTRAINT [FK_user_rights_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([email])
GO
ALTER TABLE [dbo].[user_rights] CHECK CONSTRAINT [FK_user_rights_users]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FK_users_roles_md_role] FOREIGN KEY([roleid])
REFERENCES [dbo].[md_role] ([id])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FK_users_roles_md_role]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FK_users_roles_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([email])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FK_users_roles_users]
GO
/****** Object:  StoredProcedure [dbo].[GetMenus]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMenus]  
@EmpId Varchar(50)=null,
@role int
AS
BEGIN
  
    
    SELECT * FROM 
    (
     SELECT ms.* FROM dbo.md_screen ms INNER JOIN dbo.map_role_rights mrr ON mrr.screenid=ms.id
    WHERE  mrr.write=1 AND mrr.roleid=1
    UNION 
    SELECT SC.*
    FROM MD_SCREEN SC WHERE id IN (SELECT S.ParentId FROM MD_SCREEN S
     INNER JOIN map_role_rights SR ON S.ID = SR.screenid WHERE   sr.roleid=@role AND write=1 )
UNION
	 SELECT SC.*
    FROM MD_SCREEN SC WHERE id IN (SELECT S1.ParentId FROM MD_SCREEN S1 WHERE S1.id
    IN (SELECT S.ParentId FROM MD_SCREEN S
     INNER JOIN map_role_rights SR ON S.ID = SR.screenid WHERE sr.roleid=@role AND write=1  ))
    --  SELECT S.*
    --FROM MD_SCREEN S
    --INNER JOIN user_rights SR ON S.ID = SR.screenid WHERE  SR.userid   = @EmpId AND sr.role=@role AND sr.write=1  AND IsActive=1
    --UNION 
    --SELECT SC.*
    --FROM MD_SCREEN SC WHERE id IN (SELECT S.ParentId FROM MD_SCREEN S
    -- INNER JOIN user_rights SR ON S.ID = SR.screenid WHERE  SR.userid   = @EmpId AND sr.role=@role AND write=1  AND IsActive=1)
    --UNION 
    --SELECT SC.*
    --FROM MD_SCREEN SC WHERE id IN (SELECT S1.ParentId FROM MD_SCREEN S1 WHERE S1.id
    --IN (SELECT S.ParentId FROM MD_SCREEN S
    -- INNER JOIN user_rights SR ON S.ID = SR.screenid WHERE  SR.userid   = @EmpId AND sr.role=@role AND write=1  AND IsActive=1))
    ) T ORDER BY SQ_NO
END





GO
/****** Object:  StoredProcedure [dbo].[sp_admin_select_statement]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================-- Author:		<Author,,Ashish>-- Create date: <Create Date,,>-- Description:	<Description,,>-- =============================================

CREATE PROCEDURE [dbo].[sp_admin_select_statement]
-- Add the parameters for the stored procedure here
      @condition VARCHAR(50), @role INT= NULL
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         IF(@condition = 'ScreenInfo')
             BEGIN
                 SELECT ms2.*
                 FROM md_screen AS ms2
                 WHERE ms2.URL IS NOT NULL
                       AND
                       isActive = 1 ORDER BY ms2.description;
             END;
         IF(@condition = 'RoleRights')
             BEGIN
                 SELECT *
                 FROM dbo.map_role_rights AS u
                 WHERE u.roleid = @role;
             END;
        

     END;
GO
/****** Object:  StoredProcedure [dbo].[sp_assign_auditor]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_assign_auditor]
	-- Add the parameters for the stored procedure here
	@id int=null,
      @aprogramid int=null,
      @auditorid varchar(100)=null,
      @auditornm varchar(100)=null,
      @auitor_type int=null,
	 @condition varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@condition='Save')
	   BEGIN
		  IF NOT EXISTS (SELECT 1 FROM 	[assigned_auditor] WHERE [auditorid]=@auditorid AND [auitor_type]=@auitor_type)
			 BEGIN
		  INSERT INTO [dbo].[assigned_auditor]
				   ([aprogramid]
				   ,[auditorid]
				   ,[auditornm]
				   ,[auitor_type]
				   )
			  VALUES
				   (@aprogramid
				   ,@auditorid
				   ,@auditornm
				   ,@auitor_type
				  )
				  SELECT 1;
		END
		ELSE
		  BEGIN
		    SELECT 2;
		  END
	END
    ELSE IF(@condition='Delete')
      BEGIN
		  DELETE FROM dbo.assigned_auditor  WHERE id=@id; 
		   SELECT 1;
	   END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_assign_roles_select_statement]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================-- Author:		<Author,,Name>-- Create date: <Create Date,,>-- Description:	<Description,,>-- =============================================
CREATE PROCEDURE [dbo].[sp_assign_roles_select_statement]
-- Add the parameters for the stored procedure here
       @condition VARCHAR(50), @roleid INT= NULL, @userid VARCHAR(100)= NULL
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         IF(@condition = 'UserDetails')
             BEGIN
                 SELECT u.email, u.fname+' '+u.lname AS Name
                 FROM dbo.users AS u
                 WHERE u.isactive = 1;
             END;
         IF(@condition = 'UserRoles')
             BEGIN
                 SELECT mr.id,mr.description
                 FROM dbo.users_roles  ur
			  INNER JOIN dbo.md_role mr ON mr.id=ur.roleid
                 WHERE ur.userid = @userid;
             END;
     END;

GO
/****** Object:  StoredProcedure [dbo].[sp_audit_finding]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------
CREATE PROCEDURE [dbo].[sp_audit_finding]
( 
@id int =null ,					@site_loc varchar(500)=null,		@auditor_emailid varchar(50)=null		 ,	@auditee_name varchar(200)=null,
@proj_name varchar(500)=null,	@iso_9001 varchar(max)=null,	    @iso_27001 varchar(max)=null ,	@iso_20000 varchar(max)=null,
@type_id INT=null,      @description varchar(500)=null,		@root_cause varchar(max)=null,	@corrective_action varchar(max)=null
,@preventive_actions varchar(max)=null,	@date_implementing_corrective_action DATETIME=null,	@verification_dtl_corrective_action varchar(max)=null,
@Initials_of_mqas_auditor_reviewing_ca_proposed varchar(500)=null   ,@date_proposed_ca_accepted_by_mqas DATETIME=null,
@initials_mqas_auditor_verify_effect_of_corrective_action varchar(max)=null,@date_ca_verified_by_mqas DATETIME=null
,@mqas_auditor_comments_on_ca_verification varchar(MAX)=null,@date_for_closure_of_non_conformity DATETIME=null,@date date=null
,@condition varchar(50)=NULL,@audit_program_id int=null
 )
	 
as
BEGIN
	  IF(@condition = 'Save')
            BEGIN
			 --IF NOT EXISTS (SELECT 1 FROM audit_finding WHERE q_id = @q_id AND [stageid] = @stageid)
				-- BEGIN
		
				-- END
				
                 insert into audit_finding
				 ([site_loc],[auditor_emailid],[auditee_name],[proj_name],[iso_9001],[iso_27001],[iso_20000],[type_id],[description],[root_cause],[corrective_action]
				,[preventive_actions],[date_implementing_corrective_action],[verification_dtl_corrective_action],[Initials_of_mqas_auditor_reviewing_ca_proposed]
				,[date_proposed_ca_accepted_by_mqas],[initials_mqas_auditor_verify_effect_of_corrective_action],[date_ca_verified_by_mqas]
				,[mqas_auditor_comments_on_ca_verification],[date_for_closure_of_non_conformity],[date],[audit_program_id]) values
				(
				@site_loc,@auditor_emailid,@auditee_name,@proj_name,@iso_9001,@iso_27001,@iso_20000,@type_id,@description,@root_cause,@corrective_action
				,@preventive_actions,@date_implementing_corrective_action,@verification_dtl_corrective_action,@Initials_of_mqas_auditor_reviewing_ca_proposed
				,@date_proposed_ca_accepted_by_mqas,@initials_mqas_auditor_verify_effect_of_corrective_action,@date_ca_verified_by_mqas
				,@mqas_auditor_comments_on_ca_verification,@date_for_closure_of_non_conformity,@date,@audit_program_id
				)
				
				select 1;
				
			END
	IF(@condition = 'Update')
            BEGIN
			 UPDATE audit_finding SET [site_loc]=@site_loc,	[auditor_emailid]=@auditor_emailid,[auditee_name]=@auditee_name,
									[proj_name]=@proj_name,[iso_9001]=@iso_9001,[iso_27001]=@iso_27001,[iso_20000]=@iso_20000,[type_id]=@type_id,
									[description]=@description,[root_cause]=@root_cause,[corrective_action]=@corrective_action
				,[preventive_actions]=@preventive_actions,[date_implementing_corrective_action]=@date_implementing_corrective_action,
				[verification_dtl_corrective_action]=@verification_dtl_corrective_action,[Initials_of_mqas_auditor_reviewing_ca_proposed]=@Initials_of_mqas_auditor_reviewing_ca_proposed
				,[date_proposed_ca_accepted_by_mqas]=@date_proposed_ca_accepted_by_mqas,[initials_mqas_auditor_verify_effect_of_corrective_action]=@initials_mqas_auditor_verify_effect_of_corrective_action,
				[date_ca_verified_by_mqas]=@date_ca_verified_by_mqas,[mqas_auditor_comments_on_ca_verification]=@mqas_auditor_comments_on_ca_verification,
				[date_for_closure_of_non_conformity]=@date_for_closure_of_non_conformity,[date]=@date where id=@id
				select 1;
			END

	IF(@condition='ShowAll')
			BEGIN
			select [id],[audit_program_id],users.fname+' ' +users.lname as name,[auditee_name],[proj_name],convert(varchar(10),date,103) date
	  from audit_finding   inner join users on audit_finding.[auditor_emailid]=users.email where audit_program_id=@audit_program_id
	  order by id

			END
	IF(@condition='ShowById')
			BEGIN
			

	  select [id],[site_loc],[auditor_emailid],[auditee_name],[proj_name],[iso_9001],[iso_27001],[iso_20000],[type_id],[description]
      ,[root_cause],[corrective_action],[preventive_actions],case date_implementing_corrective_action when '1900-01-01 00:00:00.000' then '' else convert(varchar(10),[date_implementing_corrective_action],103) end date_implementing_corrective_action,[verification_dtl_corrective_action]
      ,[Initials_of_mqas_auditor_reviewing_ca_proposed],case [date_proposed_ca_accepted_by_mqas] when '1900-01-01 00:00:00.000' then '' else convert(varchar(10),[date_proposed_ca_accepted_by_mqas],103) end [date_proposed_ca_accepted_by_mqas],[initials_mqas_auditor_verify_effect_of_corrective_action]
      ,case [date_ca_verified_by_mqas] when '1900-01-01 00:00:00.000' then '' else convert(varchar(10),[date_ca_verified_by_mqas],103) end [date_ca_verified_by_mqas],[mqas_auditor_comments_on_ca_verification],case [date_for_closure_of_non_conformity] when '1900-01-01 00:00:00.000' then '' else convert(varchar(10),[date_for_closure_of_non_conformity],103) end [date_for_closure_of_non_conformity] ,
	   convert(varchar(10),[date],103) [date]
	  from audit_finding where id=@id
			END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_audit_program]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================-- Author:		<Author,,Ashish>-- Create date: <Create Date,,>-- Description:	<Description,,>-- =============================================
CREATE PROCEDURE [dbo].[sp_audit_program]
-- Add the parameters for the stored procedure here
      @id INT= NULL, @q_id VARCHAR(50)= NULL, @stageid INT= NULL, @stagename VARCHAR(50)= NULL, @nod INT= NULL, @frmdt DATE= NULL, @todt DATE= NULL, @remark TEXT= NULL, @condition VARCHAR(50)
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         IF(@condition = 'Save')
             BEGIN
                 IF NOT EXISTS
                              (
                               SELECT 1
                               FROM [dbo].[audit_program]
                               WHERE q_id = @q_id
                                     AND [stageid] = @stageid
                              )
                     BEGIN
                         IF(@stageid <> 1)
                             BEGIN
                                 INSERT INTO [dbo].[audit_program]
                                                                  ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
                                                                  )
                                 VALUES
                                        (@q_id, @stageid, @stagename, @nod, @frmdt, @todt, @remark
                                        );
                             END;
                         ELSE
                             BEGIN
                                 DECLARE @cnt INT= 1;
                                 WHILE @cnt < 6
                                     BEGIN
							  if (@cnt=1)
								BEGIN
									INSERT INTO [dbo].[audit_program]
															   ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
															   )
									VALUES
										  (@q_id, @cnt, @stagename, @nod, @frmdt, @todt, @remark
										  );
								END
							 ELSE IF (@cnt=2)
								BEGIN

								   INSERT INTO [dbo].[audit_program]
															   ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
															   )
									VALUES
										  (@q_id, @cnt, @stagename, @nod,DATEADD(day,14, @frmdt), DATEADD(day,14,@todt), @remark
										  ); 
								END
							 ELSE IF (@cnt=3)
								BEGIN

								   INSERT INTO [dbo].[audit_program]
															   ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
															   )
									VALUES
										  (@q_id, @cnt, @stagename, @nod,DATEADD(YEAR,1,DATEADD(day,14, @frmdt)), DATEADD(YEAR,1,DATEADD(day,14,@todt)), @remark
										  ); 
								END
							  ELSE IF (@cnt=4)
								BEGIN

								   INSERT INTO [dbo].[audit_program]
															   ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
															   )
									VALUES
										  (@q_id, @cnt, @stagename, @nod,DATEADD(YEAR,2,DATEADD(day,14, @frmdt)), DATEADD(YEAR,2,DATEADD(day,14,@todt)), @remark
										  ); 
								END
							  ELSE IF (@cnt=5)
								BEGIN

								   INSERT INTO [dbo].[audit_program]
															   ([q_id], [stageid], [stagename], [nod], [frmdt], [todt], [remark]
															   )
									VALUES
										  (@q_id, @cnt, @stagename, @nod,DATEADD(YEAR,3,DATEADD(day,14, @frmdt)), DATEADD(YEAR,3,DATEADD(day,14,@todt)), @remark
										  ); 
								END
                                         SET @cnt = @cnt + 1;
                                     END;
                             END;
                         SELECT 2;
                     END;
                 ELSE
                     BEGIN
                         SELECT 1;
                     END;
             END;
         ELSE
         IF(@condition = 'Update')
             BEGIN
                 UPDATE [dbo].[audit_program]
                   SET [stageid] = @stageid, [stagename] = @stagename, [nod] = @nod, [frmdt] = @frmdt, [todt] = @todt, [remark] = @remark
                 WHERE id = @id;
                 SELECT 2;
             END;
     END;

GO
/****** Object:  StoredProcedure [dbo].[sp_audit_program_select_statement]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================-- Author:		<Author,,Name>-- Create date: <Create Date,,>-- Description:	<Description,,>-- =============================================
CREATE PROCEDURE [dbo].[sp_audit_program_select_statement] 
-- Add the parameters for the stored procedure here
      @condition VARCHAR(50), @id INT= NULL, @q_id VARCHAR(50)= NULL
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         IF(@condition = 'SingleAuditProgram')
             BEGIN
                 SELECT *, CONVERT(VARCHAR(11), ap.frmdt, 103
                                  ) AS frm, CONVERT(VARCHAR(11), ap.todt, 103
                                                   ) AS [to]
                 FROM dbo.audit_program ap
                 WHERE ap.id = @id;
             END;
         IF(@condition = 'AllAuditProgram')
             BEGIN
                 SELECT *, CONVERT(VARCHAR(11), ap.frmdt, 106
                                  ) AS frm, CONVERT(VARCHAR(11), ap.todt, 106
                                                   ) AS [to], mas.description
                 FROM dbo.audit_program ap
                      INNER JOIN [dbo].[md_audit_stage] mas ON mas.id = ap.stageid
                 WHERE ap.q_id = @q_id;
             END;
         IF(@condition = 'AuditorList')
             BEGIN
                 SELECT [email] AS id,[fname]+' '+[lname]+' ('+audit_type+')' AS [Name] FROM dbo.users u WHERE u.isactive=1
             END;
	   IF(@condition = 'AssignedAuditorList')
             BEGIN
			 SELECT *,mat.description FROM [assigned_auditor] aa INNER JOIN [dbo].[md_auditor_type] mat ON mat.id=aa.[auitor_type]
			 WHERE aa.aprogramid= @id
		   END;
	   IF(@condition='AuditNextStage')
		  BEGIN
		   SELECT ap.stagename FROM dbo.audit_program ap WHERE ap.q_id=@q_id AND ap.id=(@id+1);
		  END
     END;
GO
/****** Object:  StoredProcedure [dbo].[sp_audit_report]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_audit_report]
(

@id int =null,
      @audit_program_id int =null,
      @statutoryregulatoryrequirement varchar(max) =null,
      @exclusionsclaimedandaccepted varchar(max) =null,
      @reference varchar(max) =null,
      @internalauditprogramandmanagementreview varchar(max) =null,
	  @audit_statement varchar(500)=null,
	  @statement_value varchar(100)=null,
	  @auditstatementid varchar(100)=null,
	  @condition varchar(50)=null
)
AS
BEGIN
			IF(@condition='Save')
			BEGIN
				BEGIN TRANSACTION
				BEGIN TRY
						INSERT INTO audit_report 
						(audit_program_id,statutoryregulatoryrequirement,exclusionsclaimedandaccepted,reference,internalauditprogramandmanagementreview)
						VALUES 
						(@audit_program_id,@statutoryregulatoryrequirement,@exclusionsclaimedandaccepted,@reference,@internalauditprogramandmanagementreview)
						
						-- UPDATE CUSTOMER INFORMATION

					DECLARE @AUDITREPORTID INT

					SELECT @AUDITREPORTID=MAX(ID) FROM audit_report

					UPDATE ar set 
					ar.custname=quotation_request.custname
					,ar.mr=quotation_request.mr
					,ar.street=quotation_request.street
					,ar.phone=quotation_request.phone
					,ar.zip=quotation_request.zip,
					ar.email=quotation_request.email
					,ar.website=quotation_request.website
					,ar.fax=quotation_request.fax
					,ar.branch=quotation_request.branch
					,ar.industry=quotation_request.industry
					,ar.sponsor=quotation_request.sponsor
					FROM audit_report ar inner join audit_program on ar.audit_program_id=audit_program.id
					inner join quotation_request on audit_program.q_id=quotation_request.quotation_id
					where ar.audit_program_id=@audit_program_id AND ar.id=@AUDITREPORTID


						SELECT 1;
						COMMIT TRANSACTION
				END TRY

				BEGIN CATCH
				ROLLBACK TRANSACTION
				END CATCH
			END
			IF(@condition='Update')
			BEGIN
				UPDATE audit_report SET statutoryregulatoryrequirement=@statutoryregulatoryrequirement,exclusionsclaimedandaccepted=@exclusionsclaimedandaccepted,
				reference=@reference,internalauditprogramandmanagementreview=@internalauditprogramandmanagementreview WHERE audit_program_id=@audit_program_id;
			
				SELECT 1;

			END
			--IF(@condition='ShowAll')
			--BEGIN
			--	SELECT id,audit_program_id,statutoryregulatoryrequirement,exclusionsclaimedandaccepted,reference,internalauditprogramandmanagementreview FROM
			--	audit_report WHERE audit_program_id=@audit_program_id order by id

			--END
			IF(@condition='ShowById')
			BEGIN
			SELECT id,audit_program_id,statutoryregulatoryrequirement,exclusionsclaimedandaccepted,reference,internalauditprogramandmanagementreview FROM
				audit_report WHERE audit_program_id=@audit_program_id 

			END

			IF(@condition='Baseline')
			BEGIN
				UPDATE audit_report SET isbaseline=1 where audit_program_id=@audit_program_id;
				select 1;
			END

			IF(@condition='ShowAuditNextState')
			BEGIN
				 IF NOT EXISTS(SELECT 1 FROM map_audit_report_statement WHERE audit_program_id=@audit_program_id)
				 BEGIN
					SELECT '' AS ID,auditorstatement,'' AS VAL FROM audit_next_step ORDER BY ID
				 END
				 ELSE
				 BEGIN
				select id,audit_statement as auditorstatement,statement_value as val from map_audit_report_statement where audit_program_id=@audit_program_id
				order by id asc

				 END
			END
			IF(@condition='GetStageId')
			BEGIN
			SELECT STAGEID FROM audit_program WHERE ID=@audit_program_id
			END

			IF(@condition='SaveNextState')
			BEGIN
				insert into  map_audit_report_statement([audit_program_id],[audit_statement],[statement_value])
				values (@audit_program_id,@audit_statement,@statement_value);
				select 1;
			END
			IF(@condition='UpdateNextState')
			BEGIN
				 update map_audit_report_statement set audit_statement=@audit_statement,statement_value=@statement_value
				where id=@auditstatementid;
				select 1;
			END



END
GO
/****** Object:  StoredProcedure [dbo].[sp_audit_time]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_audit_time]
(

	   @id int =null
      ,@audit_program_id int =null
	  ,@auditplanning varchar(500)=null
	  ,@onsiteaudit varchar(500)=null
	  ,@condition varchar(50)=null
)
AS
BEGIN
			IF(@condition='Save')
			BEGIN
				INSERT INTO auditor_time 
				(audit_program_id,auditplanning,onsiteaudit)
				VALUES 
				(@audit_program_id,@auditplanning,@onsiteaudit)
				
				SELECT 1;
			END
			IF(@condition='Update')
			BEGIN
				UPDATE auditor_time SET auditplanning=@auditplanning,onsiteaudit=@onsiteaudit WHERE audit_program_id=@audit_program_id;
			
				SELECT 1;

			END
			IF(@condition='ShowAll')
			BEGIN
				SELECT id,audit_program_id,auditplanning,onsiteaudit FROM
				auditor_time WHERE audit_program_id=@audit_program_id order by id

			END
			IF(@condition='ShowById')
			BEGIN
			SELECT id,audit_program_id,auditplanning,onsiteaudit FROM
				auditor_time WHERE audit_program_id=@audit_program_id 

			END



END
GO
/****** Object:  StoredProcedure [dbo].[sp_auditor_report_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_auditor_report_checklist]
	-- Add the parameters for the stored procedure here
	@programid int,
	@id int,
	@option varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		 INSERT INTO dbo.map_audit_report_checklist
		 (
			programid,
			checklistid,
			options
		 )
		 VALUES
		 (
			@programid, -- programid - int
			@id, -- checklistid - int
			@option -- options - varchar
		 )
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_check_authentication]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_check_authentication]
	-- Add the parameters for the stored procedure here
	@userid varchar(100),
	@password varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT u.fname+ ' '+u.lname,u.email from dbo.users u WHERE u.email=@userid AND u.pwd=@password AND u.isactive=1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_checkbaseline]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_checkbaseline]
	 (@programid varchar(10)=null)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select isbaseline from audit_report where audit_program_id=@programid and isbaseline=1
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_assigned_program]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Ashish>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_assigned_program]
	-- Add the parameters for the stored procedure here
	@user varchar(50),
	@condition varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (@condition='AuditorAssignedTask')
	   BEGIN
		   SELECT qr.custname,ap.stagename,ap.nod,aa.auditorid,aa.auditornm,CONVERT(VARCHAR(11), ap.frmdt, 106
							   ) AS frm, CONVERT(VARCHAR(11), ap.todt, 106
											) AS [to],qr.quotation_id AS qid,ap.id AS pid
		   FROM dbo.quotation_request qr 
		   INNER JOIN dbo.audit_program ap ON qr.quotation_id=ap.q_id
		   INNER JOIN dbo.assigned_auditor aa ON ap.id = aprogramid
		   WHERE aa.auditorid=@user
	   END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_master_data]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getaudit_finding]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- exec sp_getaudit_finding 18,1
 
 CREATE PROCEDURE [dbo].[sp_getaudit_finding]
(@audit_program_id INT=NULL,
 @type_id INT =NULL,
 @condition varchar(50))
	AS
	BEGIN
	    IF(@condition='Finding')
		   BEGIN
				    SELECT [ID],[SITE_LOC],[AUDITOR_EMAILID],[AUDITEE_NAME],[PROJ_NAME],[ISO_9001],[ISO_27001],[ISO_20000],[TYPE_ID],[DESCRIPTION]
				   ,[ROOT_CAUSE],[CORRECTIVE_ACTION],[PREVENTIVE_ACTIONS],CASE DATE_IMPLEMENTING_CORRECTIVE_ACTION WHEN '1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),[DATE_IMPLEMENTING_CORRECTIVE_ACTION],103) END DATE_IMPLEMENTING_CORRECTIVE_ACTION,[VERIFICATION_DTL_CORRECTIVE_ACTION]
				   ,[INITIALS_OF_MQAS_AUDITOR_REVIEWING_CA_PROPOSED],CASE [DATE_PROPOSED_CA_ACCEPTED_BY_MQAS] WHEN '1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),[DATE_PROPOSED_CA_ACCEPTED_BY_MQAS],103) END [DATE_PROPOSED_CA_ACCEPTED_BY_MQAS],[INITIALS_MQAS_AUDITOR_VERIFY_EFFECT_OF_CORRECTIVE_ACTION]
				   ,CASE [DATE_CA_VERIFIED_BY_MQAS] WHEN '1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),[DATE_CA_VERIFIED_BY_MQAS],103) END [DATE_CA_VERIFIED_BY_MQAS],[MQAS_AUDITOR_COMMENTS_ON_CA_VERIFICATION],CASE [DATE_FOR_CLOSURE_OF_NON_CONFORMITY] WHEN '1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),[DATE_FOR_CLOSURE_OF_NON_CONFORMITY],103) END [DATE_FOR_CLOSURE_OF_NON_CONFORMITY] ,
				    CONVERT(VARCHAR(10),[DATE],103) [DATE]
				    FROM AUDIT_FINDING
				    WHERE AUDIT_PROGRAM_ID=@AUDIT_PROGRAM_ID AND [TYPE_ID]=@TYPE_ID
		   END
	   ELSE IF(@condition='AuditReport')
		  BEGIN
			 
			 SELECT ap.stagename, CONVERT(varchar(11),ap.frmdt,106)+' To '+ CONVERT(varchar(11),ap.todt,106) AS AuditDate
			 ,auditplanning,onsiteaudit,ar.statutoryregulatoryrequirement,ar.exclusionsclaimedandaccepted,ar.reference,
			 ar.internalauditprogramandmanagementreview,ar.mr,ar.sponsor,ar.custname,ar.street,at.auditplanning,at.onsiteaudit,aa.auditornm  FROM dbo.audit_program ap 
			 INNER JOIN [dbo].[audit_report] ar ON ar.audit_program_id=ap.id INNER JOIN auditor_time [at] ON [at].audit_program_id=ap.id
			 INNER JOIN [dbo].[assigned_auditor] aa ON ap.id = aa.aprogramid
			 WHERE ap.id=@AUDIT_PROGRAM_ID AND aa.auitor_type=1

		  END


	END
GO
/****** Object:  StoredProcedure [dbo].[sp_impartiality_checklist]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_impartiality_checklist]
(
@quotationid varchar(50)=null,
@checklistid int=null,
@remark varchar(500)=null,
@condition varchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF(@condition='GetFromMaster')
	begin
			SELECT [id],[sqno],[checkpoint],'' as remarks
			FROM   [md_impartiality_review_checklist] order by [sq_id],id asc
	END
	IF(@condition='GetFromMaping')
	BEGIN
	select 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_iso_question]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_quotation_overall_complexity]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_company_details]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_form]    Script Date: 4/7/2017 5:09:06 PM ******/
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
	 ,@sponsor varchar(50)=null
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
		    ,sponsor
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
		    ,@sponsor 
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
					 ,sponsor=@sponsor
		    WHERE
				    quotation_id=@quotation_id
				     
					SET @id=@quotation_id;

		  DELETE FROM dbo.quotation_request_scope WHERE dbo.quotation_request_scope.q_id=@quotation_id;
		  DELETE FROM dbo.quotation_request_scope_details WHERE dbo.quotation_request_scope_details.q_id=@quotation_id;
	   END
END
	   

    -- Insert statements for procedure here
	


GO
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_scope]    Script Date: 4/7/2017 5:09:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_quotation_request_scope_details]    Script Date: 4/7/2017 5:09:06 PM ******/
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
		@q_id VARCHAR(max)=null
      ,@audit_type int=null
      ,@c_status int=null
      ,@scope VARCHAR(max)=null
      ,@siteaddress VARCHAR(max)=null
      ,@workdesc VARCHAR(max)=null
      ,@empstrength int=null
      ,@managerial int=null
      ,@technical int=null
      ,@it int=null
      ,@business int=null
      ,@admin int=null
      ,@hr int=null
      ,@finance int=null
      ,@other int=null
      ,@offsite VARCHAR(max)=null
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
/****** Object:  StoredProcedure [dbo].[sp_quotation_select_statement]    Script Date: 4/7/2017 5:09:06 PM ******/
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
                 [place], [name],Sponsor
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

	   IF (@condition='ScopeForAuditReport')
		  BEGIN
		  SELECT mast.description,qrsd.scope FROM dbo.quotation_request_scope_details qrsd INNER JOIN dbo.md_audit_sub_type mast
		   ON qrsd.audit_type = mast.id WHERE qrsd.q_id= @quotation_id;

		  END

	   IF (@condition='SiteDetails')
		  BEGIN
			 SELECT DISTINCT qrsd.siteaddress,qrsd.empstrength FROM dbo.quotation_request_scope_details qrsd WHERE qrsd.q_id= @quotation_id;
		  END
     END;
GO
/****** Object:  StoredProcedure [dbo].[sp_save_role_rights]    Script Date: 4/7/2017 5:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================-- Author:		<Author,,Name>-- Create date: <Create Date,,>-- Description:	<Description,,>-- =============================================
CREATE PROCEDURE [dbo].[sp_save_role_rights]
-- Add the parameters for the stored procedure here
       @userid VARCHAR(100)= NULL, @screenid INT= NULL, @read INT= NULL, @write INT= NULL, @role INT= NULL, @condition VARCHAR(50)
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from-- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         IF(@condition = 'InsertRoles')
             BEGIN
                 INSERT INTO dbo.map_role_rights
                                                (roleid, screenid, [read], write
                                                )
                 VALUES
                        (@role, -- roleid - int
                 @screenid, -- screenid - int
                 @read, -- read - int
                 @write -- write - int
                        );
             END;
         IF(@condition = 'AssignRoles')
             BEGIN
                 INSERT INTO dbo.users_roles
                                            (userid, roleid
                                            )
                 VALUES
                        (@userid, -- userid - varchar
                 @role -- roleid - int
                        );
             END;
         IF(@condition = 'DeleteRole')
             BEGIN
                 DELETE FROM users_roles
                 WHERE users_roles.userid = @userid;
             END;
     END;

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
         Begin Table = "md_audit_report_checklist"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "map_audit_report_checklist"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_audit_report_checklist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_audit_report_checklist'
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_quotation_form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_quotation_form'
GO
USE [master]
GO
ALTER DATABASE [DMS] SET  READ_WRITE 
GO
