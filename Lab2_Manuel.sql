
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS GroupsStudents;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS degrees;


CREATE TABLE Degrees(
    degreeId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL UNIQUE,
    years INT DEFAULT(4) NOT NULL,
    PRIMARY KEY (degreeId),
    CONSTRAINT invalidDegreeYear CHECK (years >=3 AND years <=5)
);

CREATE TABLE Subjects(
    subjectId INT NOT NULL AUTO_INCREMENT,
    degreeId INT NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    acronym VARCHAR(8) NOT NULL UNIQUE,
    credits INT NOT NULL,
    year INT NOT NULL,
    type VARCHAR(20) NOT NULL,
    PRIMARY KEY (subjectId),
    FOREIGN KEY (degreeId) REFERENCES Degrees (degreeId),
    CONSTRAINT negativeSubjectsCredits CHECK(credits>0),
    CONSTRAINT invalidSubjectCourse CHECK(YEAR >=1 AND YEAR <=5),
    CONSTRAINT invalidSUbjectType CHECK(TYPE IN ('Formación Básica',
    'Optativa',
    'obligatoria'))
    
);

CREATE TABLE Groups(
    groupId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    activity VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    subjectId INT NOT NULL,
    PRIMARY KEY (groupId),
    FOREIGN KEY (subjectId) REFERENCES Subjects (subjectId),
    CONSTRAINT negativeGroupYear CHECK(YEAR>0),
    CONSTRAINT invalidGroupActivity CHECK(activity IN ('Teoría', 'Laboratorio'))
);

CREATE TABLE Students(
    studentId INT NOT NULL AUTO_INCREMENT,
    accessMethod VARCHAR(30) NOT NULL,
    dni CHAR(9) NOT NULL UNIQUE,
    firstName VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    birthDate DATE NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    PASSWORD VARCHAR(250) NOT NULL,
    PRIMARY KEY (studentId),
    CONSTRAINT invalidStudentAccessMethod CHECK(accessMethod IN ('Selectividad',
    'Ciclo','Mayor','Titulado Extranjero'))
);

CREATE TABLE GroupsStudents(
    groupStudentId INT NOT NULL AUTO_INCREMENT,
    groupId INT NOT NULL,
    studentId INT NOT NULL,
    PRIMARY KEY (groupStudentId),
    FOREIGN KEY (groupId) REFERENCES Groups (groupId),
    FOREIGN KEY (studentId) REFERENCES Students (studentId),
    UNIQUE (groupId, studentId)
);

CREATE TABLE Grades(
    gradeId INT NOT NULL AUTO_INCREMENT,
    value DECIMAL(4,2) NOT NULL,
    gradeCall INT NOT NULL,
    withHonours BOOLEAN NOT NULL,
    studentId INT NOT NULL,
    groupId INT NOT NULL,
    PRIMARY KEY (gradeId),
    FOREIGN KEY (studentId) REFERENCES Students (studentId),
    FOREIGN KEY (groupId) REFERENCES Groups (groupId),
    CONSTRAINT invalidGradeValue CHECK(VALUE >=0 AND VALUE <=10),
    CONSTRAINT invalidGradeCall CHECK(gradeCall >=1 AND gradeCall <=3),
    CONSTRAINT RN_002_duplicateCalCella UNIQUE(gradeCall,studentId,groupId)
);