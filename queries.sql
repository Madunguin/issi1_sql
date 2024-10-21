-- Manejo de datos
INSERT INTO Degrees (name, years) VALUES
('Ingeniería del Software', 4),
('Ingeniería del Computadores', 4),
('Tecnologías Informáticas', 4);

INSERT INTO subjects (NAME, acronym, credits, YEAR, TYPE, degreeId) VALUES
	('Fundamentos de Programación', 'FP', 12 , 1, 'Formación Básica', 3),
	('Lógica Informática', 'LI', 6, 2, 'Optativa', 3);

INSERT INTO groups (NAME, activity, YEAR, subjectId) VALUES 
	('T1', 'Teoría', 2019, 1),
	('LI', 'Laboratorio', 2019, 1),
	('L2', 'Laboratorio', 2019, 1);
	
INSERT INTO students(accessMethod, dni, firstname, surname, birthdate,email) VALUES
	('Selectividad', '12345678A', 'Daniel', 'Pérez', '1991-01-01',
	'daniel@alum.us.es'),
	('Selectividad', '22345678A', 'Rafael', 'Ramírez', '1992-01-01',
	'rafael@alum.us.es'),
	('Selectividad', '32345678A', 'Gabriel', 'Hernández', '1993-01-01',
	'gabriel@alum.us.es');
INSERT INTO GroupsStudents (groupId, studentId) VALUES
(1, 1),
(3, 1);
INSERT INTO Grades (value, gradeCall, withHonours, studentId, groupId) VALUES
(4.50, 1, 0, 1, 1);

UPDATE Students
SET birthdate = '1998-01-01', surname='Fernández'
WHERE studentId = 3;

UPDATE Subjects
SET credits = credits/2;

DELETE FROM Grades
WHERE gradeId = 1;
	
