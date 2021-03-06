/*
   Thursday, November 11, 20103:27:50 PM
   User: css_server
   Server: localhost
   Database: CSS
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ActiveKey ADD
	IsValid bit NOT NULL CONSTRAINT DF_ActiveKey_IsValid DEFAULT 1
GO
ALTER TABLE dbo.ActiveKey SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
