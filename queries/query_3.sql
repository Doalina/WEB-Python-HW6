-- Знайти середній бал у групах з певного предмета.

SELECT d.discipline AS Discipline, gr.name AS Group_name, AVG(g.grade) AS avg_grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id =g.discipline_id 
JOIN [groups] gr ON gr.id = s.group_id 
WHERE d.id = 1
GROUP BY Group_name, Discipline 
ORDER BY avg_grade DESC

