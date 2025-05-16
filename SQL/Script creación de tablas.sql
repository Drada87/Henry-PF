/**DECLARE @sql NVARCHAR(MAX) = '';

-- Construir DROP de constraints
SELECT @sql += 'ALTER TABLE [' + SCHEMA_NAME(t.schema_id) + '].[' + t.name + '] DROP CONSTRAINT [' + fk.name + '];' + CHAR(13)
FROM sys.foreign_keys fk
JOIN sys.tables t ON fk.parent_object_id = t.object_id;

-- Ejecutar el DROP de constraints
EXEC sp_executesql @sql;

SET @sql = '';

SELECT @sql += 'DROP TABLE [' + SCHEMA_NAME(schema_id) + '].[' + name + '];' + CHAR(13)
FROM sys.tables;

-- Ejecutar el DROP de tablas
EXEC sp_executesql @sql;


--CREATE DATABASE NBAStats;
--GO
*/
-- Usar la base de datos recién creada
USE NBAStats;
GO

SELECT @@VERSION;

/**
Información adicional de los juegos, como la duración del partido, asistencia de público y otros detalles específicos del evento.
*/
CREATE TABLE 
	[d_game_info] (
    [game_id] BIGINT NOT NULL,
    [game_date] varchar(20) NOT NULL,
    [attendance] decimal(10,0),
    [game_time] varchar(10),
    PRIMARY KEY ([game_id])
);

CREATE INDEX [index_1]
ON [d_game_info] ([game_date]);

/**
Detalles básicos de los equipos
*/

CREATE TABLE [d_team] (
    [id] BIGINT NOT NULL PRIMARY KEY,
    [full_name] varchar(25) NOT NULL,
    [abbreviation] varchar(3) NOT NULL,
    [nickname] varchar(15) NOT NULL,
    [city] varchar(15) NOT NULL,
    [state] varchar(25) NOT NULL,
    [year_founded] SMALLINT  NOT NULL,
);

CREATE INDEX [index_1]
ON [d_team] ([full_name], [city], [state]);

/**
Contiene información detallada de todos los jugadores históricos y actuales que han estado vinculados de alguna manera a la NBA. Incluye tanto jugadores activos como retirados, e incluso aquellos que nunca llegaron a disputar un partido oficial. Se proporciona información personal (nombre, fecha de nacimiento, nacionalidad), académica (escuela, última afiliación), física (altura, peso), profesional (equipo actual, posición, número de camiseta), y de carrera (años activos, experiencia, participación en la NBA y G-League, historial de draft). Es una tabla fundamental dentro del conjunto de datos, ya que sirve como entidad central para relacionarse con estadísticas de partidos, box scores, equipos, y draft.
*/

CREATE TABLE [d_common_player] (
    [person_id] BIGINT NOT NULL PRIMARY KEY,
    [full_name] varchar(40) NOT NULL,
    [is_active] bit NOT NULl,
    [birthdate] nvarchar(25),
    [school] varchar(40),
    [country] varchar(40),
    [last_affiliation] varchar(50),
    [height] varchar(10),
    [weight] int NOT NULL,
    [season_exp] decimal(4,1),
    [position] varchar(10),
    [team_id] BIGINT,
    [team_name] varchar(20) NOT NULL,
    [team_abbreviation] varchar(5) NOT NULL,
    [team_code] varchar(20) NOT NULL,
    [team_city] varchar(50) NOT NULL,
    [from_year] smallint,
    [to_year] smallint,
    [draft_year] varchar(10) NOT NULL,
    [draft_round] varchar(10),
    [draft_number] varchar(10),
    [greatest_75_flag] varchar(1)
	
	FOREIGN KEY (team_id) REFERENCES d_team(id)
);

CREATE INDEX [index_1]
ON [d_common_player] ([full_name], [from_year], [to_year], [team_abbreviation]);

/**
Esta tabla fue obtenida mediante scraping desde Basketball Reference. Contiene el detalle de las votaciones al premio de MVP por temporada. Cada fila representa a un jugador que recibió al menos un voto, con su posición final, puntaje total y estadísticas clave de esa temporada. Permite evaluar reconocimiento individual y su relación con el rendimiento estadístico.
*/

CREATE TABLE [f_mvp_votes] (
    [vote_id] INT IDENTITY(1,1) PRIMARY KEY,  -- PK artificial para identificar cada fila
    [person_id] BIGINT NOT NULL,
    [rank] VARCHAR(10) NOT NULL,
    [player] VARCHAR(30) NOT NULL,
    [age] INT NOT NULL,
    [tm] VARCHAR(3) NOT NULL,
    [first] INT NOT NULL,
    [pts_won] INT NOT NULL,
    [pts_max] INT NOT NULL,
    [share] DECIMAL(5,3) NOT NULL,
    [g] INT NOT NULL,
    [mp] DECIMAL(5,2) NOT NULL,
    [pts] DECIMAL(5,2) NOT NULL,
    [trb] DECIMAL(5,2) NOT NULL,
    [ast] DECIMAL(5,2) NOT NULL,
    [stl] DECIMAL(5,2) NOT NULL,
    [blk] DECIMAL(5,2) NOT NULL,
    [fgpct] DECIMAL(5,3) NOT NULL,
    [3ppct] DECIMAL(5,3),  -- Permitís NULLs por el error que viste antes
    [ftpct] DECIMAL(5,3) NOT NULL,
    [ws] DECIMAL(5,2) NOT NULL,
    [ws_per_48] DECIMAL(5,4) NOT NULL,
    [year] INT NOT NULL,

    FOREIGN KEY ([person_id]) REFERENCES d_common_player([person_id])
);


/**
Listado de jugadores inactivos para cada partido.
*/

CREATE TABLE [f_inactive_players] (
    [inactive_players_id] INT IDENTITY(1,1) PRIMARY KEY,
	[game_id] BIGINT NOT NULL,
    [player_id] BIGINT NOT NULL,
    [first_name] varchar(40),
    [last_name] varchar(40),
    [team_id] BIGINT NOT NULL,
    [team_name] varchar(20) NOT NULL,
    [team_city] varchar(30) NOT NULL,
    [team_abbreviation] varchar(3) NOT NULL,

    FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
	FOREIGN KEY ([player_id]) REFERENCES d_common_player([person_id]),
	FOREIGN KEY ([team_id]) REFERENCES d_team([id])
);

CREATE INDEX [index_1]
ON [f_inactive_players] ([team_city], [team_name]);

/**
Detalles de cada juego, incluyendo identificador del juego, fecha, equipos involucrados, y códigos de equipo
*/

CREATE TABLE [f_game] (
    [f_game_id] INT IDENTITY(1,1) PRIMARY KEY,
    [game_id] BIGINT NOT NULL,
    [season] INT NOT NULL,
    [team_id_home] BIGINT NOT NULL,
    [team_name_home] VARCHAR(40) NOT NULL,
    [team_abbreviation_home] VARCHAR(3) NOT NULL,
    [team_id_away] BIGINT NOT NULL,
    [team_name_away] VARCHAR(40) NOT NULL,
    [team_abbreviation_away] VARCHAR(3) NOT NULL,
    [game_date] VARCHAR(15) NOT NULL,
    [wl_home] VARCHAR(1),
    [matchup_home] VARCHAR(15) NOT NULL,
    [fgm_home] DECIMAL(5,1),
    [fga_home] DECIMAL(5,1),
    [fg_pct_home] DECIMAL(5,3),
    [fg3m_home] DECIMAL(5,1),
    [fg3a_home] DECIMAL(5,1),
    [fg3_pct_home] DECIMAL(5,3),
    [ftm_home] DECIMAL(5,1),
    [fta_home] DECIMAL(5,1),
    [ft_pct_home] DECIMAL(5,3),
    [oreb_home] DECIMAL(5,1),
    [dreb_home] DECIMAL(5,1),
    [fgm_away] DECIMAL(5,1),
    [fga_away] DECIMAL(5,1),
    [fg_pct_away] DECIMAL(5,3),
    [fg3m_away] DECIMAL(5,1),
    [fg3a_away] DECIMAL(5,1),
    [fg3_pct_away] DECIMAL(5,3),
    [ftm_away] DECIMAL(5,1),
    [fta_away] DECIMAL(5,1),
    [ft_pct_away] DECIMAL(5,3),
    [oreb_away] DECIMAL(5,1),
    [dreb_away] DECIMAL(5,1),
    [ast_home] DECIMAL(5,1),
    [ast_away] DECIMAL(5,1),
    [stl_home] DECIMAL(5,1),
    [stl_away] DECIMAL(5,1),
    [blk_home] DECIMAL(5,1),
    [blk_away] DECIMAL(5,1),
    [tov_home] DECIMAL(5,1),
    [tov_away] DECIMAL(5,1),
    [pf_home] DECIMAL(5,1),
    [pf_away] DECIMAL(5,1),
    [pts_home] DECIMAL(5,1) NOT NULL,
    [pts_away] DECIMAL(5,1) NOT NULL,
    [plus_minus_home] INT NOT NULL,
    [plus_minus_away] INT NOT NULL,
    [min] INT NOT NULL,
    [season_type] VARCHAR(20) NOT NULL,

    FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
    FOREIGN KEY ([team_id_home]) REFERENCES d_team([id]),
    FOREIGN KEY ([team_id_away]) REFERENCES d_team([id])
);

CREATE INDEX [index_1]
ON [f_game] ([game_date], [season_type]);


/**
Registro detallado de cada jugada en los partidos, incluyendo tiempo, tipo de jugada, jugadores involucrados y resultado de la acción.
*/

CREATE TABLE [f_play_by_play] (
    [f_play_by_play_id] INT IDENTITY(1,1) PRIMARY KEY,
    [game_id] BIGINT NOT NULL,
    [eventnum] INT NOT NULL,
    [eventmsgtype] INT NOT NULL,
    [eventmsgactiontype] INT NOT NULL,
    [period] INT NOT NULL,
    [pctimestring] VARCHAR(5) NOT NULL,
    [homedescription] VARCHAR(100), -- Permitimos NULL
    [visitordescription] VARCHAR(100), -- Permitimos NULL
    [person1type] TINYINT NOT NULL,
    [player1_id] BIGINT NOT NULL,
    [player1_name] VARCHAR(50) NOT NULL,
    [player1_team_id] BIGINT NOT NULL,
    [player1_team_city] VARCHAR(50) NOT NULL,
    [player1_team_nickname] VARCHAR(50) NOT NULL,
    [player1_team_abbreviation] VARCHAR(3) NOT NULL,
    [person2type] TINYINT,
    [player2_id] BIGINT,
    [person3type] TINYINT,
    [player3_id] BIGINT,
    [video_available_flag] INT NOT NULL,

    FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
    FOREIGN KEY ([player1_id]) REFERENCES d_common_player([person_id]),
    FOREIGN KEY ([player2_id]) REFERENCES d_common_player([person_id]),
    FOREIGN KEY ([player3_id]) REFERENCES d_common_player([person_id])
);


CREATE INDEX [index_1]
ON [f_play_by_play] ([eventnum], [eventmsgtype], [period]);


/**
Esta tabla fue obtenida mediante scraping del sitio HoopsHype. Contiene los salarios anuales de jugadores NBA desde la temporada 2013-2014 hasta la 2022-2023. Cada fila representa a un jugador, y las columnas corresponden a las distintas temporadas. La información permite evaluar la evolución de los contratos y realizar análisis de inversión económica por jugador y por temporada.
*/
CREATE TABLE [f_salaries] (
    [f_salaries_id] INT IDENTITY(1,1) PRIMARY KEY,
    [id] BIGINT NOT NULL,
    [display_first_las] VARCHAR(30) NOT NULL,
    [season_2013_2014] DECIMAL(12,2) NOT NULL,
    [season_2014_2015] DECIMAL(12,2) NOT NULL,
    [season_2015_2016] DECIMAL(12,2) NOT NULL,
    [season_2016_2017] DECIMAL(12,2) NOT NULL,
    [season_2017_2018] DECIMAL(12,2) NOT NULL,
    [season_2018_2019] DECIMAL(12,2) NOT NULL,
    [season_2019_2020] DECIMAL(12,2) NOT NULL,
    [season_2020_2021] DECIMAL(12,2) NOT NULL,
    [season_2021_2022] DECIMAL(12,2) NOT NULL,
    [season_2022_2023] DECIMAL(12,2) NOT NULL,

    FOREIGN KEY ([id]) REFERENCES d_common_player([person_id])
);


/**
Estadísticas adicionales de los partidos, como faltas personales, pérdidas de balón, robos y bloqueos
*/
CREATE TABLE [f_other_stats] (
    [f_other_stats_id] INT IDENTITY(1,1) PRIMARY KEY,
	[game_id] BIGINT NOT NULL,
    [league_id] int NOT NULL,
    [team_id_home] BIGINT NOT NULL,
    [team_abbreviation_home] varchar(3) NOT NULL,
    [pts_paint_home] int NOT NULL,
    [pts_2nd_chance_home] int NOT NULL,
    [pts_fb_home] int NOT NULL,
    [largest_lead_home] int NOT NULL,
    [team_id_away] BIGINT NOT NULL,
    
    FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
	FOREIGN KEY ([team_id_home]) REFERENCES d_team([id]),
	FOREIGN KEY ([team_id_away]) REFERENCES d_team([id])	
);

CREATE INDEX [index_1]
ON [f_other_stats] ([team_abbreviation_home]);


/**
Resumen estadístico de los partidos, incluyendo puntuaciones totales, líderes en puntos, rebotes y asistencias
*/

CREATE TABLE [f_game_summary] (
    [f_game_summary_id] INT IDENTITY(1,1) PRIMARY KEY,
    [game_id] BIGINT NOT NULL,
    [game_date_est] VARCHAR(20) NOT NULL,
    [game_sequence] INT UNIQUE,
    [home_team_id] BIGINT NOT NULL,
    [visitor_team_id] BIGINT NOT NULL,
    [season] INT NOT NULL,

    FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
    FOREIGN KEY ([home_team_id]) REFERENCES d_team([id]),
    FOREIGN KEY ([visitor_team_id]) REFERENCES d_team([id])  
);

CREATE INDEX [index_1]
ON [f_game_summary] ([season]);

/**
Historial de selecciones del draft, detallando el año, equipo que seleccionó, número de selección, nombre del jugador y universidad.
*/

CREATE TABLE [f_draft_history] (
    [f_draft_history_id] INT IDENTITY(1,1) PRIMARY KEY,
    [person_id] BIGINT NOT NULL,	
    [player_name] VARCHAR(40) NOT NULL,
    [season] INT NOT NULL,
    [round_number] INT NOT NULL,
    [round_pick] INT NOT NULL,
    [overall_pick] INT NOT NULL,
    [draft_type] VARCHAR(10) NOT NULL,
    [team_id] BIGINT NOT NULL,
    [team_city] VARCHAR(15) NOT NULL,
    [team_name] VARCHAR(15) NOT NULL,
    [team_abbreviation] VARCHAR(3) NOT NULL,
    [organization] VARCHAR(50),
    [organization_type] VARCHAR(20),
    [player_profile_flag] BIT, -- cambiado de INT a BIT para consistencia

    FOREIGN KEY ([person_id]) REFERENCES d_common_player([person_id]),
    FOREIGN KEY ([team_id]) REFERENCES d_team([id])
);


CREATE INDEX [index_1]
ON [f_draft_history] ([season], [player_name], [team_abbreviation]);


/**
Contiene las mediciones físicas y resultados de pruebas de habilidad de los jugadores que participaron en el NBA Draft Combine, un evento anual donde prospectos muestran sus capacidades ante entrenadores y equipos. La información aquí registrada incluye métricas corporales (altura, peso, envergadura, porcentaje de grasa corporal), capacidad atlética (saltos, velocidad, agilidad), y desempeño en pruebas de tiro desde diferentes zonas y situaciones (estático, tras drible, en movimiento). Estas variables son clave en la evaluación previa al draft para determinar el potencial físico y técnico de los jugadores. La tabla permite análisis comparativos entre temporadas, posiciones y rendimiento en pruebas específicas.
*/
CREATE TABLE [f_draft_combine] (
    [f_draft_combine_id] INT IDENTITY(1,1) PRIMARY KEY,
    [season] INT NOT NULL,
    [player_id] BIGINT NOT NULL,
    [first_name] VARCHAR(20) NOT NULL,
    [last_name] VARCHAR(20) NOT NULL,
    [position] VARCHAR(5),
    [height_wo_shoes] DECIMAL(4,2),
    [height_w_shoes] DECIMAL(4,2),
    [weight] DECIMAL(5,1),
    [wingspan] DECIMAL(4,2),
    [standing_reach] DECIMAL(4,2),

    FOREIGN KEY ([player_id]) REFERENCES d_common_player([person_id])
);


CREATE INDEX [index_1]
ON [f_draft_combine] ([season], [position]);

/**
Puntuaciones por cuarto para cada equipo en cada juego, permitiendo análisis de rendimiento por periodo
*/
CREATE TABLE [f_line_score] (
    [f_line_score_id] INT IDENTITY(1,1) PRIMARY KEY,
    [game_id] BIGINT NOT NULL,
    [team_id_home] BIGINT NOT NULL,
    [team_abbreviation_home] VARCHAR(3) NOT NULL,
    [team_city_name_home] VARCHAR(30) NOT NULL,
    [team_nickname_home] VARCHAR(30) NOT NULL,
    [team_wins_losses_home] VARCHAR(10) NOT NULL,
    [pts_qtr1] DECIMAL(5,1),
    [pts_qtr2] DECIMAL(5,1),
    [pts_qtr3] DECIMAL(5,1),
    [pts_qtr4] DECIMAL(5,1),
    [pts] DECIMAL(5,1) NOT NULL,
    [pts_ot1] DECIMAL(5,1),
    [pts_ot2] DECIMAL(5,1),
    [pts_ot3] DECIMAL(5,1),
    [pts_ot4] DECIMAL(5,1),
    [home_away] CHAR(1) NOT NULL,
    
	FOREIGN KEY ([game_id]) REFERENCES d_game_info([game_id]),
    FOREIGN KEY ([team_id_home]) REFERENCES d_team([id])
);

CREATE INDEX [index_1]
ON [f_line_score] ([team_abbreviation_home], [team_city_name_home]);

/**
Información adicional de los equipos.
*/

CREATE TABLE [f_team_details] (
    [f_team_details_id] INT IDENTITY(1,1) PRIMARY KEY,
    [team_id] BIGINT NOT NULL,
    [arena] VARCHAR(40) NOT NULL,
    [arenacapacity] INT,
    [owner] VARCHAR(30) NOT NULL,
    [generalmanager] VARCHAR(30) NOT NULL,
    [headcoach] VARCHAR(30),
    [dleagueaffiliation] VARCHAR(40) NOT NULL,
    
    FOREIGN KEY ([team_id]) REFERENCES d_team([id])
);


CREATE INDEX [index_1]
ON [f_team_details] ([owner], [generalmanager]);

