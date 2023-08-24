--Середній бал, який певний викладач ставить певному студентові

SELECT s.fullname AS Students, t.fullname AS Teachers, ROUND(AVG(g.grade),2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id  
WHERE s.id = 25 AND t.id = 2
GROUP BY s.fullname 

