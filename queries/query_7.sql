-- Знайти оцінки студентів в окремій групі з певного предмета.

SELECT d.discipline AS Disciplines, gr.name AS Groups, fullname AS Studens, g.grade AS Grade
FROM grades g 
JOIN [groups] gr ON s.group_id = gr.id
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON g.discipline_id = d.id
WHERE d.id = 3 AND gr.id = 1;

