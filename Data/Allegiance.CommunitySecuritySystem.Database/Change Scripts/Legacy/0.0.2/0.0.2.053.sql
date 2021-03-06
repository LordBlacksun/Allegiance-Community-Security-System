/*
   Friday, December 03, 20109:28:56 AM
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
ALTER TABLE dbo.MachineRecordType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.MachineRecordExclusions
	(
	Id int NOT NULL IDENTITY (1, 1),
	IdentifierMask nvarchar(50) NOT NULL,
	RecordTypeId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.MachineRecordExclusions ADD CONSTRAINT
	PK_MachineRecordExclusions PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.MachineRecordExclusions ADD CONSTRAINT
	FK_MachineRecordExclusions_MachineRecordType FOREIGN KEY
	(
	RecordTypeId
	) REFERENCES dbo.MachineRecordType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.MachineRecordExclusions SET (LOCK_ESCALATION = TABLE)
GO


INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('%0000000%', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('592843238', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('839718926', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('4SUBSYS2', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2633124372', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('0BROKER0', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('982452547', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('576117690', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('120276828', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('1122570335', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2292584050', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('1380278024', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('1414806718', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('10ECDEV0', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('742876493', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('814567584', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('992807681', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('3894360729', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('604936657', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2625493935', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('3700979340', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('515406229', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('1302358256', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('1859848970', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2896432619', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('312976832', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('%USB%', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('%GENERIC%', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2020202057202d4443574e', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('Volume0', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('Volume1', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('2685867626', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('STRIPE', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('738623858', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('3840450990', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('RAID0', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('Set001Con', 2)

INSERT INTO MachineRecordExclusions (IdentifierMask, RecordTypeId) VALUES('ILES%', 2)



COMMIT
