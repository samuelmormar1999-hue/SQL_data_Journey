CREATE DATABASE nba_salaries_db;
USE nba_salaries_db;

-- Create the tables

CREATE TABLE teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    conference VARCHAR(10) NOT NULL
);

CREATE TABLE players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(40) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    season VARCHAR(9) NOT NULL,
    salary_usd INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);
