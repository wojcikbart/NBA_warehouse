DELETE FROM FactPlayerSeason;
DBCC CHECKIDENT ('FactPlayerSeason', RESEED, 0);
