DELETE FROM dimPlayerInfo;
DBCC CHECKIDENT ('dimPlayerInfo', RESEED, 0);
