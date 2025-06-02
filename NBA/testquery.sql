SELECT 
    p.playerID,
    dpi.Name AS first_name,
    dpi.Surname AS last_name,
    COUNT(*) AS all_star_appearances
FROM 
    PlayerSeasonAward p
JOIN 
    dimAwards a ON p.awardID = a.awardID
JOIN 
    dimPlayerInfo dpi ON p.playerID = dpi.playerID
WHERE 
    a.name = 'All Star'
GROUP BY 
    p.playerID, dpi.Name, dpi.Surname
ORDER BY 
    all_star_appearances DESC;
