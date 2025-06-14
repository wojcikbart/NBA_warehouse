-- Clear all base if exists and rebuild it

-- Disable foreign key constraints and drop them
USE [NBA];
GO

-- Drop foreign key constraints
ALTER TABLE [dbo].[PlayerSeasonAward] DROP CONSTRAINT IF EXISTS FK_PlayerSeasonAward_dimAwards;
ALTER TABLE [dbo].[PlayerSeasonAward] DROP CONSTRAINT IF EXISTS FK_PlayerSeasonAward_dimPlayerInfo;

ALTER TABLE [dbo].[FactTeamSeason] DROP CONSTRAINT IF EXISTS FK_FactTeamSeason_dimSeason;
ALTER TABLE [dbo].[FactTeamSeason] DROP CONSTRAINT IF EXISTS FK_FactTeamSeason_dimTeam;

ALTER TABLE [dbo].[FactTeamGameStats] DROP CONSTRAINT IF EXISTS FK_FactTeamGameStats_dimGame;
ALTER TABLE [dbo].[FactTeamGameStats] DROP CONSTRAINT IF EXISTS FK_FactTeamGameStats_dimSeason;
ALTER TABLE [dbo].[FactTeamGameStats] DROP CONSTRAINT IF EXISTS FK_FactTeamGameStats_dimTeam;

ALTER TABLE [dbo].[FactPlayerSeason] DROP CONSTRAINT IF EXISTS FK_FactPlayerSeason_dimPlayerInfo;
ALTER TABLE [dbo].[FactPlayerSeason] DROP CONSTRAINT IF EXISTS FK_FactPlayerSeason_dimSeason;
ALTER TABLE [dbo].[FactPlayerSeason] DROP CONSTRAINT IF EXISTS FK_FactPlayerSeason_dimTeam;

ALTER TABLE [dbo].[dimPlayerInfo] DROP CONSTRAINT IF EXISTS FK_dimPlayerInfo_dimDate;
ALTER TABLE [dbo].[dimPlayerInfo] DROP CONSTRAINT IF EXISTS FK_dimPlayerInfo_dimSeason;
ALTER TABLE [dbo].[dimPlayerInfo] DROP CONSTRAINT IF EXISTS FK_dimPlayerInfo_dimSeason1;

ALTER TABLE [dbo].[dimGame] DROP CONSTRAINT IF EXISTS FK_dimGame_dimDate;
ALTER TABLE [dbo].[dimGame] DROP CONSTRAINT IF EXISTS FK_dimGame_dimSeason;
ALTER TABLE [dbo].[dimGame] DROP CONSTRAINT IF EXISTS FK_dimGame_dimTeam;
ALTER TABLE [dbo].[dimGame] DROP CONSTRAINT IF EXISTS FK_dimGame_dimTeam1;

ALTER TABLE [dbo].[dimTeam] DROP CONSTRAINT IF EXISTS FK_dimTeam_dimSeason;
ALTER TABLE [dbo].[dimTeam] DROP CONSTRAINT IF EXISTS FK_dimTeam_dimSeason1;

ALTER TABLE [dbo].[dimAwards] DROP CONSTRAINT IF EXISTS FK_dimAwards_dimSeason;
GO

-- Drop tables (in order that avoids FK dependency errors)
DROP TABLE IF EXISTS [dbo].[PlayerSeasonAward];
DROP TABLE IF EXISTS [dbo].[FactTeamSeason];
DROP TABLE IF EXISTS [dbo].[FactTeamGameStats];
DROP TABLE IF EXISTS [dbo].[FactPlayerSeason];
DROP TABLE IF EXISTS [dbo].[dimTeam];
DROP TABLE IF EXISTS [dbo].[dimPlayerInfo];
DROP TABLE IF EXISTS [dbo].[dimGame];
DROP TABLE IF EXISTS [dbo].[dimDate];
DROP TABLE IF EXISTS [dbo].[dimAwards];
DROP TABLE IF EXISTS [dbo].[dimSeason];
GO

GO
/****** Object:  Table [dbo].[dimAwards]    Script Date: 03/06/2025 16:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimAwards](
	[AwardID] [smallint] IDENTITY(1,1) NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_dimAwards] PRIMARY KEY CLUSTERED 
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimDate]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimDate](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Month] [smallint] NOT NULL,
	[Day] [smallint] NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
 CONSTRAINT [PK_dimDate] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimGame]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimGame](
	[GameID] [bigint] IDENTITY(1,1) NOT NULL,
	[GameDateID] [int] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[HomeTeamID] [bigint] NULL,
	[AwayTeamID] [bigint] NULL,
	[Attendance] [int] NOT NULL,
	[GameType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dimGame] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimPlayerInfo]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimPlayerInfo](
	[PlayerID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[LatinName] [nvarchar](50) NOT NULL,
	[BirthDateID] [int] NOT NULL,
	[NumberOfSeasons] [tinyint] NOT NULL,
	[FirstSeasonID] [bigint] NOT NULL,
	[LastSeasonID] [bigint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[Weight] [smallint] NOT NULL,
	[Nationality] [nvarchar](50) NULL,
	[isActive] [nvarchar](50) NOT NULL,
	[College] [nvarchar](100) NULL,
	[Position] [nvarchar](50) NOT NULL,
	[DraftYear] [nvarchar](50) NULL,
	[DraftRound] [nvarchar](50) NULL,
	[DraftNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimPlayerInfo] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimSeason]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimSeason](
	[SeasonID] [bigint] IDENTITY(1,1) NOT NULL,
	[Year] [smallint] NOT NULL,
 CONSTRAINT [PK_dimSeason] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimTeam]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimTeam](
	[TeamID] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
	[Abbreviation] [nvarchar] (3) NOT NULL,
	[FirstSeasonID] [bigint] NULL,
	[LastSeasonID] [bigint] NOT NULL,
	[isActive] [nvarchar](3) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dimTeam] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPlayerSeason]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPlayerSeason](
	[PlayerSeasonID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [bigint] NOT NULL,
	[TeamID] [bigint] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[Age] [tinyint] NOT NULL,
	[Experience] [tinyint] NOT NULL,
	[GamesPlayed] [smallint] NOT NULL,
	[GamesStarted] [smallint] NOT NULL,
	[MinutesPlayed] [smallint] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[FG] [smallint] NOT NULL,
	[FGA] [smallint] NOT NULL,
	[FGPercentage] [decimal](6, 4) NOT NULL,
	[EFGPercentage] [decimal](6, 4) NOT NULL,
	[TSPercentage] [decimal](6, 4) NOT NULL,
	[2PTM] [smallint] NOT NULL,
	[2PTA] [smallint] NOT NULL,
	[2PTPercentage] [decimal](6, 4) NOT NULL,
	[3PTM] [smallint] NOT NULL,
	[3PA] [smallint] NOT NULL,
	[3PTPercentage] [decimal](6, 4) NOT NULL,
	[FTM] [smallint] NOT NULL,
	[FTA] [smallint] NOT NULL,
	[FTPercentage] [decimal](6, 4) NOT NULL,
	[AverageShotDinstance] [decimal](6, 3) NOT NULL,
	[UsagePercentage] [decimal](6, 4) NOT NULL,
	[Points] [smallint] NOT NULL,
	[Assists] [smallint] NOT NULL,
	[TotalRebounds] [smallint] NOT NULL,
	[OffensiveRebounds] [smallint] NOT NULL,
	[DefensiveRebounds] [smallint] NOT NULL,
	[Steals] [smallint] NOT NULL,
	[Blocks] [smallint] NOT NULL,
	[Fouls] [smallint] NOT NULL,
	[Turnovers] [smallint] NOT NULL,
	[Dunks] [smallint] NOT NULL,
	[PER] [decimal](4, 1) NOT NULL,
	[WinShares] [decimal](5, 2) NOT NULL,
	[OffensiveWinShares] [decimal](5, 2) NOT NULL,
	[DefensiveWinShares] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_FactPlayerSeason] PRIMARY KEY CLUSTERED 
(
	[PlayerSeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTeamGameStats]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTeamGameStats](
	[TeamGameStatsID] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamID] [bigint] NOT NULL,
	[GameID] [bigint] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[PointsScored] [smallint] NOT NULL,
	[PointsAllowed] [smallint] NOT NULL,
	[FGM] [smallint] NOT NULL,
	[FGA] [smallint] NOT NULL,
	[FGPercentage] [decimal](5, 3) NOT NULL,
	[3PTM] [smallint] NOT NULL,
	[3PTA] [smallint] NOT NULL,
	[3PTPercentage] [decimal](5, 3) NOT NULL,
	[FTM] [smallint] NOT NULL,
	[FTA] [smallint] NOT NULL,
	[FTPercentage] [decimal](5, 3) NOT NULL,
	[Rebounds] [smallint] NOT NULL,
	[Assists] [smallint] NOT NULL,
	[Steals] [smallint] NOT NULL,
	[Turnovers] [smallint] NOT NULL,
	[Blocks] [smallint] NOT NULL,
	[Fouls] [smallint] NOT NULL,
	[Result] [nvarchar](4) NOT NULL,
	[GameType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FactTeamGameStats] PRIMARY KEY CLUSTERED 
(
	[TeamGameStatsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTeamSeason]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTeamSeason](
	[TeamSeasonID] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamID] [bigint] NOT NULL,
	[SeasonID] [bigint] NOT NULL,
	[AverageAge] [decimal](3, 1) NOT NULL,
	[MinutesPlayed] [smallint] NOT NULL,
	[FG] [smallint] NOT NULL,
	[FGA] [smallint] NOT NULL,
	[FGPercentage] [decimal](5, 3) NOT NULL,
	[FT] [smallint] NOT NULL,
	[FTA] [smallint] NOT NULL,
	[FTPercentage] [decimal](5, 3) NOT NULL,
	[3PTM] [smallint] NOT NULL,
	[3PTA] [smallint] NOT NULL,
	[3PTPercentage] [decimal](5, 3) NOT NULL,
	[Points] [smallint] NOT NULL,
	[Assists] [smallint] NOT NULL,
	[TotalRebounds] [smallint] NOT NULL,
	[OffensiveRebounds] [smallint] NOT NULL,
	[DefensiveRebounds] [smallint] NOT NULL,
	[Steals] [smallint] NOT NULL,
	[Blocks] [smallint] NOT NULL,
	[Fouls] [smallint] NOT NULL,
	[Turnovers] [smallint] NOT NULL,
	[Playoffs] [nvarchar](3) NOT NULL,
	[Wins] [smallint] NOT NULL,
	[Losses] [smallint] NOT NULL,
	[OffensiveRating] [decimal](5, 1) NOT NULL,
	[DefensiveRating] [decimal](5, 1) NOT NULL,
	[NetRating] [decimal](5, 1) NOT NULL,
	[Pace] [decimal](5, 1) NOT NULL,
	[AverageAttendance] [int] NOT NULL,
	[GamesPlayed] [smallint] NOT NULL,
 CONSTRAINT [PK_FactTeamSeason] PRIMARY KEY CLUSTERED 
(
	[TeamSeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerSeasonAward]    Script Date: 03/06/2025 16:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerSeasonAward](
	[PlayerID] [bigint] NOT NULL,
	[AwardID] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dimAwards]  WITH CHECK ADD  CONSTRAINT [FK_dimAwards_dimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimAwards] CHECK CONSTRAINT [FK_dimAwards_dimSeason]
GO
ALTER TABLE [dbo].[dimGame]  WITH CHECK ADD  CONSTRAINT [FK_dimGame_dimDate] FOREIGN KEY([GameDateID])
REFERENCES [dbo].[dimDate] ([DateID])
GO
ALTER TABLE [dbo].[dimGame] CHECK CONSTRAINT [FK_dimGame_dimDate]
GO
ALTER TABLE [dbo].[dimGame]  WITH CHECK ADD  CONSTRAINT [FK_dimGame_dimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimGame] CHECK CONSTRAINT [FK_dimGame_dimSeason]
GO
ALTER TABLE [dbo].[dimGame]  WITH CHECK ADD  CONSTRAINT [FK_dimGame_dimTeam] FOREIGN KEY([HomeTeamID])
REFERENCES [dbo].[dimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[dimGame] CHECK CONSTRAINT [FK_dimGame_dimTeam]
GO
ALTER TABLE [dbo].[dimGame]  WITH CHECK ADD  CONSTRAINT [FK_dimGame_dimTeam1] FOREIGN KEY([AwayTeamID])
REFERENCES [dbo].[dimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[dimGame] CHECK CONSTRAINT [FK_dimGame_dimTeam1]
GO
ALTER TABLE [dbo].[dimPlayerInfo]  WITH CHECK ADD  CONSTRAINT [FK_dimPlayerInfo_dimDate] FOREIGN KEY([BirthDateID])
REFERENCES [dbo].[dimDate] ([DateID])
GO
ALTER TABLE [dbo].[dimPlayerInfo] CHECK CONSTRAINT [FK_dimPlayerInfo_dimDate]
GO
ALTER TABLE [dbo].[dimPlayerInfo]  WITH CHECK ADD  CONSTRAINT [FK_dimPlayerInfo_dimSeason] FOREIGN KEY([FirstSeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimPlayerInfo] CHECK CONSTRAINT [FK_dimPlayerInfo_dimSeason]
GO
ALTER TABLE [dbo].[dimPlayerInfo]  WITH CHECK ADD  CONSTRAINT [FK_dimPlayerInfo_dimSeason1] FOREIGN KEY([FirstSeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimPlayerInfo] CHECK CONSTRAINT [FK_dimPlayerInfo_dimSeason1]
GO
ALTER TABLE [dbo].[dimTeam]  WITH CHECK ADD  CONSTRAINT [FK_dimTeam_dimSeason] FOREIGN KEY([FirstSeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimTeam] CHECK CONSTRAINT [FK_dimTeam_dimSeason]
GO
ALTER TABLE [dbo].[dimTeam]  WITH CHECK ADD  CONSTRAINT [FK_dimTeam_dimSeason1] FOREIGN KEY([LastSeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[dimTeam] CHECK CONSTRAINT [FK_dimTeam_dimSeason1]
GO
ALTER TABLE [dbo].[FactPlayerSeason]  WITH CHECK ADD  CONSTRAINT [FK_FactPlayerSeason_dimPlayerInfo] FOREIGN KEY([playerID])
REFERENCES [dbo].[dimPlayerInfo] ([PlayerID])
GO
ALTER TABLE [dbo].[FactPlayerSeason] CHECK CONSTRAINT [FK_FactPlayerSeason_dimPlayerInfo]
GO
ALTER TABLE [dbo].[FactPlayerSeason]  WITH CHECK ADD  CONSTRAINT [FK_FactPlayerSeason_dimSeason] FOREIGN KEY([teamID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[FactPlayerSeason] CHECK CONSTRAINT [FK_FactPlayerSeason_dimSeason]
GO
ALTER TABLE [dbo].[FactPlayerSeason]  WITH CHECK ADD  CONSTRAINT [FK_FactPlayerSeason_dimTeam] FOREIGN KEY([teamID])
REFERENCES [dbo].[dimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactPlayerSeason] CHECK CONSTRAINT [FK_FactPlayerSeason_dimTeam]
GO
ALTER TABLE [dbo].[FactTeamGameStats]  WITH CHECK ADD  CONSTRAINT [FK_FactTeamGameStats_dimGame] FOREIGN KEY([GameID])
REFERENCES [dbo].[dimGame] ([GameID])
GO
ALTER TABLE [dbo].[FactTeamGameStats] CHECK CONSTRAINT [FK_FactTeamGameStats_dimGame]
GO
ALTER TABLE [dbo].[FactTeamGameStats]  WITH CHECK ADD  CONSTRAINT [FK_FactTeamGameStats_dimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[FactTeamGameStats] CHECK CONSTRAINT [FK_FactTeamGameStats_dimSeason]
GO
ALTER TABLE [dbo].[FactTeamGameStats]  WITH CHECK ADD  CONSTRAINT [FK_FactTeamGameStats_dimTeam] FOREIGN KEY([TeamID])
REFERENCES [dbo].[dimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactTeamGameStats] CHECK CONSTRAINT [FK_FactTeamGameStats_dimTeam]
GO
ALTER TABLE [dbo].[FactTeamSeason]  WITH CHECK ADD  CONSTRAINT [FK_FactTeamSeason_dimSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[dimSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[FactTeamSeason] CHECK CONSTRAINT [FK_FactTeamSeason_dimSeason]
GO
ALTER TABLE [dbo].[FactTeamSeason]  WITH CHECK ADD  CONSTRAINT [FK_FactTeamSeason_dimTeam] FOREIGN KEY([TeamID])
REFERENCES [dbo].[dimTeam] ([TeamID])
GO
ALTER TABLE [dbo].[FactTeamSeason] CHECK CONSTRAINT [FK_FactTeamSeason_dimTeam]
GO
ALTER TABLE [dbo].[PlayerSeasonAward]  WITH CHECK ADD  CONSTRAINT [FK_PlayerSeasonAward_dimAwards] FOREIGN KEY([AwardID])
REFERENCES [dbo].[dimAwards] ([AwardID])
GO
ALTER TABLE [dbo].[PlayerSeasonAward] CHECK CONSTRAINT [FK_PlayerSeasonAward_dimAwards]
GO
ALTER TABLE [dbo].[PlayerSeasonAward]  WITH CHECK ADD  CONSTRAINT [FK_PlayerSeasonAward_dimPlayerInfo] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[dimPlayerInfo] ([PlayerID])
GO
ALTER TABLE [dbo].[PlayerSeasonAward] CHECK CONSTRAINT [FK_PlayerSeasonAward_dimPlayerInfo]
GO
