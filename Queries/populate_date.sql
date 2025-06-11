use NBA;

-- Declare date range
DECLARE @StartDate DATE = '1900-01-01';
DECLARE @EndDate DATE = '2025-12-31';

-- Create a helper number table using CROSS JOIN
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
      N2 (n) AS (SELECT 1 FROM N1 a CROSS JOIN N1 b),           -- 4 rows
      N3 (n) AS (SELECT 1 FROM N2 a CROSS JOIN N2 b),           -- 16 rows
      N4 (n) AS (SELECT 1 FROM N3 a CROSS JOIN N3 b),           -- 256 rows
      N5 (n) AS (SELECT 1 FROM N4 a CROSS JOIN N4 b),           -- 65,536 rows
      Numbers (n) AS (
          SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
          FROM N5
      )
INSERT INTO [dbo].[dimDate] (
    [DateTime], [Year], [Month], [Day], [Quarter], [DayOfWeek]
)
SELECT
    DATEADD(DAY, n, @StartDate) AS [DateTime],
    YEAR(DATEADD(DAY, n, @StartDate)) AS [Year],
    MONTH(DATEADD(DAY, n, @StartDate)) AS [Month],
    DAY(DATEADD(DAY, n, @StartDate)) AS [Day],
    DATEPART(QUARTER, DATEADD(DAY, n, @StartDate)) AS [Quarter],
    DATEPART(WEEKDAY, DATEADD(DAY, n, @StartDate)) AS [DayOfWeek]
FROM Numbers
WHERE DATEADD(DAY, n, @StartDate) <= @EndDate;
