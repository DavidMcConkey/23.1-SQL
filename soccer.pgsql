DROP DATABASE soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date DATE NOT NULL
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams ON DELETE SET NULL,
    away_team_id INT REFERENCES teams ON DELETE SET NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    start_time TEXT NOT NULL,
    season_id INT REFERENCES season ON DELETE SET NULL,
    head_ref_id INT REFERENCES referees ON DELETE SET NULL,
    assis_ref_1_id INT REFERENCES referees ON DELETE SET NULL,
    assis_ref_2_id INT REFERENCES referees ON DELETE SET NULL
);


CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    bday DATE NOT NULL,
    height INT NOT NULL,
    current_team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players ON DELETE SET NULL,
    match_id INT REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE results(
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams ON DELETE SET NULL,
    match_id INT REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE lineups(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players ON DELETE SET NULL,
    match_id INT REFERENCES matches ON DELETE SET NULL,
    team_id INT REFERENCES teams ON DELETE SET NULL
);