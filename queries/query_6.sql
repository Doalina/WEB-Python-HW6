-- Знайти список студентів у певній групі.

SELECT s.fullname AS Students, g.name AS Groups
FROM students s
JOIN [groups] g ON s.group_id = g.id
WHERE g.id = 1;
