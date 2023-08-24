-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname AS Teachers, d.discipline AS Discipline, ROUND(AVG(grade),3) AS avg_grade
FROM teachers t
JOIN disciplines d ON t.id = d.teacher_id
JOIN grades g ON d.id = g.discipline_id
GROUP BY t.fullname = 1;
