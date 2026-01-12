-- Top 10 highest paid players
SELECT p.player_name, s.salary_usd
FROM players p
JOIN salaries s ON p.player_id = s.player_id
ORDER BY s.salary_usd DESC
LIMIT 10;

-- Average salary by team
SELECT t.team_name, AVG(s.salary_usd) AS avg_salary
FROM teams t
JOIN players p ON t.team_id = p.team_id
JOIN salaries s ON p.player_id = s.player_id
GROUP BY t.team_name
ORDER BY avg_salary DESC;

-- Total payroll by team
SELECT t.team_name, SUM(s.salary_usd) AS total_payroll
FROM teams t
JOIN players p ON t.team_id = p.team_id
JOIN salaries s ON p.player_id = s.player_id
GROUP BY t.team_name
ORDER BY total_payroll DESC;

-- Salary distribution
SELECT
    CASE
        WHEN salary_usd < 5000000 THEN 'Below 5M'
        WHEN salary_usd BETWEEN 5000000 AND 15000000 THEN '5M–15M'
        ELSE 'Above 15M'
    END AS salary_range,
    COUNT(*) AS players
FROM salaries
GROUP BY salary_range;

-- Number of players per team
SELECT t.team_name, COUNT(*) AS num_players
FROM teams t
JOIN players p ON t.team_id = p.team_id
GROUP BY t.team_name
ORDER BY num_players DESC;
