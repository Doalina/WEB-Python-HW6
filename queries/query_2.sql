--Знайти студента із найвищим середнім балом з певного предмета.


SELECT d.discipline AS Discipline, s.fullname AS Student_name, AVG(g.grade) AS avg_grade
FROM grades g 
LEFT JOIN students s ON s.id =g.student_id 
LEFT JOIN disciplines d ON g.discipline_id = d.id 
where d.id = 4
GROUP BY s.fullname 
ORDER BY avg_grade DESC 
LIMIT 1;