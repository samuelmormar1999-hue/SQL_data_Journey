-- Esquema base de datos NBA. 

CREATE DATABASE NBA; 
USE NBA; 

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR (50),
    equipo VARCHAR (50),
    puntos INT 
);

-- Inserción de datos. 

INSERT INTO jugadores (nombre,equipo,puntos) VALUES 
('LeBron James', 'Lakers', 25),
('Stephen Curry', 'Warriors', 27),
('Nikola Jokic', 'Nuggets', 26),
('Kevin Durant', 'Suns', 29),
('Giannis Antetokounmpo', 'Bucks', 30),
('Jayson Tatum', 'Celtics', 27),
('Joel Embiid', '76ers', 28),
('Jimmy Butler', 'Heat', 23),
('Kawhi Leonard', 'Clippers', 25),
('Anthony Davis', 'Lakers', 24),
('Devin Booker', 'Suns', 26),
('Ja Morant', 'Grizzlies', 26),
('Damian Lillard', 'Bucks', 25);


CREATE TABLE equipos ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50)
);

-- Inserción datos equipos. 
INSERT INTO equipos (nombre) VALUES 
('Atlanta Hawks'),
('Boston Celtics'),
('Brooklyn Nets'),
('Charlotte Hornets'),
('Chicago Bulls'),
('Cleveland Cavaliers'),
('Dallas Mavericks'),
('Denver Nuggets'),
('Detroit Pistons'),
('Golden State Warriors'),
('Houston Rockets'),
('Indiana Pacers'),
('LA Clippers'),
('Los Angeles Lakers'),
('Memphis Grizzlies'),
('Miami Heat'),
('Milwaukee Bucks'),
('Minnesota Timberwolves'),
('New Orleans Pelicans'),
('New York Knicks'),
('Oklahoma City Thunder'),
('Orlando Magic'),
('Philadelphia 76ers'),
('Phoenix Suns'),
('Portland Trail Blazers'),
('Sacramento Kings'),
('San Antonio Spurs'),
('Toronto Raptors'),
('Utah Jazz'),
('Washington Wizards');


SELECT * FROM jugadores; 
SELECT * FROM equipos