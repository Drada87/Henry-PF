--Cargamos los datos

-- 1. d_common_player
BULK INSERT d_common_player
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\d_common_player.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 2. f_draft_combine
BULK INSERT f_draft_combine
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_draft_combine.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 3. f_draft_history
BULK INSERT f_draft_history
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_draft_history.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 4. d_game_info
BULK INSERT d_game_info
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\d_game_info.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 5. f_game_summary
BULK INSERT f_game_summary
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_game_summary.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 6. f_game
BULK INSERT f_game
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_game.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 7. f_inactive_players
BULK INSERT f_inactive_players
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_inactive_players.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 8. f_line_score
BULK INSERT f_line_score
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_line_score.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 9. f_other_stats
BULK INSERT f_other_stats
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_other_stats.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 10. f_play_by_play
BULK INSERT f_play_by_play
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_play_by_play.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 11. f_team_details
BULK INSERT f_team_details
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_team_details.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 12. d_team
BULK INSERT d_team
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\d_team.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 13. f_salaries
BULK INSERT f_salaries
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_salaries.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 14. f_mvp_votes
BULK INSERT f_mvp_votes
FROM 'D:\OneDrive\Ivan Hernández\Data Science\Soy Henry\Proyecto Final\sql_exports\f_mvp_votes.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
