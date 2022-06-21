/*1*/
SELECT Dormitory.Number as Dorm, Room.Number as Room, Student.StudentName as Name 
FROM Dormitory
INNER JOIN Room On 
Dormitory.DormitoryID = Room.DormitoryID 
RIGHT JOIN Student On Room.RoomID = Student.RoomID
WHERE Student.Sex = 1

/*2*/
SELECT Faculty.FacultyName as Facultet, Dormitory.Number as Dorm, Room.Number, Room.Capacity
FROM Faculty
INNER JOIN FacultyDormitory On 
Faculty.FacultyID = FacultyDormitory.FacultyID 
INNER JOIN Dormitory On FacultyDormitory.DormitoryID = Dormitory.DormitoryID 
INNER JOIN Room On Dormitory.DormitoryID = Room.DormitoryID 
WHERE Capacity > 2

/*3*/
SELECT Dormitory.Number as DormNumber, COUNT(Room.Number) as CountOfRooms
FROM Room
INNER JOIN Dormitory on Room.DormitoryID = Dormitory.DormitoryID
GROUP by Dormitory.Number 
ORDER BY CountOfRooms DESC

/*4*/
SELECT Faculty.FacultyName as Facultet, COUNT(Student.StudentID) as CountOfStudent	
FROM Faculty
INNER JOIN Student on Faculty.FacultyID = Student.FacultyID
GROUP by Faculty.FacultyName
ORDER BY CountOfStudent

/*5*/
SELECT Faculty.FacultyName as Facultet, Student.RoomID, Student.StudentName, Student.Benefits	
FROM Faculty
INNER JOIN Student on Faculty.FacultyID = Student.FacultyID
WHERE Student.RoomID IS NULL AND Student.Benefits = 1

/*6*/
SELECT Dormitory.Number as DormNumber, Sum(Room.Capacity) as CapacityOfRooms,  Room.Sex	
FROM Room
INNER JOIN Dormitory on Room.DormitoryID = Dormitory.DormitoryID
GROUP by Dormitory.Number, Room.Sex
ORDER BY DormNumber

/*7*/
INSERT INTO FacultyDormitory(FacultyID, DormitoryID) VALUES (7, 4)
INSERT INTO Room(DormitoryID, Number, Capacity, Sex) VALUES (5, 122, 4, 0)
INSERT INTO Room(DormitoryID, Number, Capacity, Sex) VALUES (5, 555, 3, 1)

/*8*/
UPDATE Student
SET RoomID = 14 
WHERE StudentID = 18
SELECT * FROM Student

UPDATE Student
SET Benefits = 1
WHERE Benefits = 0
SELECT * FROM Student

/*9*/
DELETE 
FROM Room
WHERE Number = 555
SELECT * FROM Room

DELETE 
FROM Student
WHERE StudentID = 20
SELECT * FROM Student