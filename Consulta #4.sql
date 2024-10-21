-- Script de consultas
SELECT s.dni,s.email
	FROM students s
;

-- Asignaturas de más de 6 créditos

SELECT s.acronym, s.credits > 6
	FROM subjects s
;

-- Número de estudiantes
SELECT COUNT(*)
	FROM students
;

-- Asignaturas por grados
SELECT d.name, s.acronym
	FROM degrees d, subjects s
	WHERE d.degreeId = s.degreeId
;
CREATE OR REPLACE VIEW vDSG as
	SELECT d.name AS nameDegree, s.acronym, g.name AS nameGroup
		FROM degrees d
			JOIN subjects s ON d.degreeId = s.degreeId
			JOIN groups g ON g.subjectId = s.subjectId
;

SELECT COUNT(*)
	FROM vdsg
;

SELECT *
	FROM subjects s;
	
SELECT *
	FROM subjects
	WHERE acronym = 'FP'
;

SELECT s.name,s.acronym
	FROM subjects s;
	
SELECT AVG(VALUE)
	FROM grades
	WHERE groupId = 18
;

SELECT s.name
	FROM subjects s
	WHERE s.type = 'Obligatoria'
;

SELECT AVG(VALUE)
	FROM grades
	WHERE groupId = 19
;
SELECT SUM(VALUE)

