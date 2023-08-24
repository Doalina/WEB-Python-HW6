-- Знайти, які курси читає певний викладач.

SELECT d.discipline, t.fullname as Teacher
FROM disciplines d
JOIN teachers t ON d.teacher_id = t.id
WHERE d.teacher_id  = 2
GROUP BY Discipline

