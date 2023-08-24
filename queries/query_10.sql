-- Список курсів, які певному студенту читає певний викладач.

SELECT s.fullname AS Students, t.fullname AS Teachers, d.discipline AS Discipline
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN teachers t ON t.id = d.teacher_id 
JOIN disciplines d ON d.id = g.discipline_id  
WHERE s.id = 2 AND t.id = 1
GROUP BY d.discipline
