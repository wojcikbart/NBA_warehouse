SELECT 
    fps.SeasonID,
    fps.GamesPlayed,
    fps.MinutesPlayed,
    fps.Points,
    fps.Assists,
    fps.TotalRebounds,
    fps.PER,
    fps.FGPercentage,
    fps.EFGPercentage,
    fps.TSPercentage,
    fps.UsagePercentage,
    fps.WinShares
FROM dbo.FactPlayerSeason fps
JOIN dbo.dimPlayerInfo p ON fps.PlayerID = p.PlayerID
WHERE p.LatinName='Luka Doncic'  -- dla Donèiæ mo¿esz daæ LIKE, jeœli jest problem z znakami
ORDER BY fps.SeasonID;