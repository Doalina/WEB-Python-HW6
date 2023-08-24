-- Знайти середній бал на потоці (по всій таблиці оцінок).

SELECT ROUND(AVG(grade),3) AS avg_grade
FROM grades;