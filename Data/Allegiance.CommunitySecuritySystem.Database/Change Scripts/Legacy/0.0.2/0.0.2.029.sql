USE CSSStats
GO


/*
   Wednesday, April 21, 20109:59:45 PM
   User: 
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
CREATE TABLE dbo.StatsFaction
	(
	StatsFactionId int NOT NULL IDENTITY (1, 1),
	WinFactionName varchar(50) NOT NULL,
	WinStarbase bit NOT NULL,
	WinSupremacy bit NOT NULL,
	WinTactical bit NOT NULL,
	WinExpansion bit NOT NULL,
	WinShipyard bit NOT NULL,
	LossFactionName varchar(50) NOT NULL,
	LossStarbase bit NOT NULL,
	LossSupremacy bit NOT NULL,
	LossTactical bit NOT NULL,
	LossExpansion bit NOT NULL,
	LossShipyard bit NOT NULL,
	GamesPlayed int NOT NULL,
	HoursPlayed float(53) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.StatsFaction ADD CONSTRAINT
	PK_StatsFaction PRIMARY KEY CLUSTERED 
	(
	StatsFactionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.StatsFaction SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
