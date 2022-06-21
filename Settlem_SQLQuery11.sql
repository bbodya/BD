Create TABLE Dormitory
(
DormitoryID INT IDENTITY(1, 1),
ComendName VARCHAR(50) NOT NULL,
ComendPhoneNumber VARCHAR(10) NOT NULL,
Number TINYINT NOT NULL,
CONSTRAINT PK_ID_Dormitory PRIMARY KEY(DormitoryID)
);

Create TABLE Room
(
RoomID INT IDENTITY(1, 1),
DormitoryID INT NOT NULL,
Number SMALLINT NOT NULL,
Capacity TINYINT NOT NULL,
Sex BIT NOT NULL,
CONSTRAINT PK_ID_Room PRIMARY KEY(RoomID)
);

Create TABLE Student
(
StudentID INT IDENTITY(1, 1),
RoomID INT,
FacultyID INT NOT NULL,
StudentName VARCHAR(50) NOT NULL,
StudentPhoneNumber VARCHAR(10) NOT NULL,
Benefits BIT NOT NULL,
Sex BIT NOT NULL,
CONSTRAINT PK_ID_Student PRIMARY KEY(StudentID)
);

Create TABLE Faculty
(
FacultyID INT IDENTITY(1, 1),
FacultyName VARCHAR(50) NOT NULL,
HeadOfPKName VARCHAR(50) NOT NULL,
HeadOfPKPhoneNumber VARCHAR(10) NOT NULL,
CONSTRAINT PK_ID_Faculty PRIMARY KEY(FacultyID)
);

Create TABLE FacultyDormitory
(
FacultyDormitoryID INT IDENTITY(1, 1),
FacultyID INT NOT NULL,
DormitoryID INT NOT NULL,
CONSTRAINT PK_ID_FacultyDormitory PRIMARY KEY(FacultyDormitoryID)
);

ALTER TABLE Student
ADD CONSTRAINT FK_Student_RoomID FOREIGN KEY(RoomID) REFERENCES Room(RoomID);
ALTER TABLE Student
ADD CONSTRAINT FK_Student_FacultyID FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID);
ALTER TABLE FacultyDormitory
ADD CONSTRAINT FK_FacultyDormitory_FacultyID FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID);
ALTER TABLE FacultyDormitory
ADD CONSTRAINT FK_FacultyDormitory_DormitoryID FOREIGN KEY(DormitoryID) REFERENCES Dormitory(DormitoryID);
ALTER TABLE Room
ADD CONSTRAINT FK_Room_DormitoryID FOREIGN KEY(DormitoryID) REFERENCES Dormitory(DormitoryID);

INSERT INTO Faculty(FacultyName, HeadOfPKName, HeadOfPKPhoneNumber)
VALUES ('ФІОТ', 'Петраков Артем	Степанович', '0965473879'),
('ФММ', 'Гончаренко Лідія Сергіївна', '0978990879'),
('ФПМ', 'Галушко Аркадій Анатолійович', '0683546655'),
('ІПСА', 'Палійчук Петро Олексійович', '0663211128'),
('ФЛ', 'Петренко Богдан Олегович', '0673201908'),
('ВПІ', 'Щеліков Владислав Олександрович', '0998675544'),
('ТЕФ', 'Новіков Дмитро Богданович', '0663211128')

INSERT INTO Dormitory(ComendName, ComendPhoneNumber, Number)
VALUES ('Ковальчук Сергій Сергійович', '0998765789', 3),
('Кальченко Ірина Вікторівна', '0978765780', 20),
('Тимошенко Надія Вікторівна', '066345119', 10),
('Фанкон Олег Володимирович', '0975432911', 7),
('Козюра Олександр Віталійович', '0508765040', 8)

INSERT INTO FacultyDormitory(FacultyID, DormitoryID)
VALUES (1, 1),
(1, 5),
(2, 2),
(2, 3),
(3, 4),
(4, 4),
(5, 2),
(5, 3),
(6, 5),
(6, 1),
(7, 2)

INSERT INTO Room(DormitoryID, Capacity, Number, Sex)
VALUES (1, 3, 221, 1),
(1, 2, 419, 0),
(2, 4, 203, 1),
(2, 1, 511, 0),
(1, 3, 221, 1),
(3, 4, 101, 1),
(4, 3, 336, 0),
(4, 2, 509, 1),
(5, 1, 121, 0),
(5, 2, 424, 0),
(5, 4, 207, 1)

INSERT INTO Dormitory(ComendName, ComendPhoneNumber, Number)
VALUES ('Ковальчук Сергій Сергійович', '0998765789', 3),
('Кальченко Ірина Вікторівна', '0978765780', 20),
('Тимошенко Надія Вікторівна', '066345119', 10),
('Фанкон Олег Володимирович', '0975432911', 7),
('Козюра Олександр Віталійович', '0508765040', 8)

INSERT INTO Student(RoomID, FacultyID, Sex, Benefits, StudentName, StudentPhoneNumber)
VALUES (3, 1, 1, 0, 'Василів Богдан Петрович', '0998762435'),
(3, 1, 1, 1, 'Даньков Артем Аркадійович', '0965467780'),
(4, 6, 0, 0, 'Балій Оксана Олегівна', '0509876433'),
(4, 1, 0, 1, 'Валончак Вікторія Олегівна', '0677643300'),
(5, 2, 1, 1, 'Гапончак Сергій Петрович', '0977633390'),
(5, 7, 1, 0, 'Онолій Антон Романович', '0689098804'),
(6, 5, 0, 0, 'Анікова Анна Юріївна', '0978887754'),
(7, 6, 1, 0, 'Фенькевич Артем Русланович', '0669998304'),
(8, 2, 1, 1, 'Акрененко Ігор Микитович', '0631095054'),
(8, 5, 1, 0, 'Гарпун Станіслав Романович', '0961876099'),
(9, 3, 0, 0, 'Олійник Олена Миколаївна', '0961113322'),
(10, 4, 1, 0, 'Грецун Назар Васильович', '0997632546'),
(11, 6, 0, 1, 'Соболь Катерина Богданівна', '0668098705'),
(11, 6, 0, 0, 'Кравець Яна Дмитрівна', '0995070512'),
(10, 1, 0, 0, 'Наліп Олена Леонідівна', '0504445677'),
(11, 1, 1, 0, 'Яцюк Сергій Олегович', '0670008705'),
(NULL, 2, 1, 0, 'Оніщук Степан Вікторович', '0665468790'),
(NULL, 4, 0, 0, 'Куленко Аліна Тарасівна', '0671918075'),
(NULL, 7, 1, 1, 'Федоров Олександр Кирилович', '0686567898'),
(NULL, 3, 0, 1, 'Іньків Влада Олегівна', '0998765532')