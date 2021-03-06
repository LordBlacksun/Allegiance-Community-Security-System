/*
   Friday, May 21, 20104:55:46 PM
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
CREATE TABLE dbo.Tmp_LinkedItemType
	(
	Id int NOT NULL,
	Name varchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_LinkedItemType SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.LinkedItemType)
	 EXEC('INSERT INTO dbo.Tmp_LinkedItemType (Id, Name)
		SELECT Id, Name FROM dbo.LinkedItemType WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.LinkedItem
	DROP CONSTRAINT FK_LinkedItem_LinkedItemType
GO
DROP TABLE dbo.LinkedItemType
GO
EXECUTE sp_rename N'dbo.Tmp_LinkedItemType', N'LinkedItemType', 'OBJECT' 
GO
ALTER TABLE dbo.LinkedItemType ADD CONSTRAINT
	PK_LinkedItemType PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LinkedItem ADD CONSTRAINT
	FK_LinkedItem_LinkedItemType FOREIGN KEY
	(
	LinkedItemTypeId
	) REFERENCES dbo.LinkedItemType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LinkedItem SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
