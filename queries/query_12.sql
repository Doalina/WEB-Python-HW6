--Оцінки студентів у певній групі з певного предмета на останньому занятті
SELECT s.fullname AS Students, d.discipline AS Discipline, gr.name AS Groups, g.grade AS Grades, g.date_of AS Last_lesson
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN groups gr ON gr.id = s.group_id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE group_id = 1
ORDER BY date_of DESC
LIMIT 1
