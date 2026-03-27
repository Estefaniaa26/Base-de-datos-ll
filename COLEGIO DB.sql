Create database Consultas1
use Consultas1
go

create table Cursos(
IdCurso int not null PRIMARY KEY,
NombreCurso varchar(60),
Duracion time 
)
go

create table Estudiantes(
IdEstudiante int PRIMARY KEY not null,
Nombre varchar(50),
Edad int,
Ciudad varchar(30),
IdCursos int not null,
FOREIGN KEY (IdCursos) references Cursos(IdCurso)
)
go

create table Matriculas(
IdMatricula int not null PRIMARY KEY,
IdEstudiante int not null,
IdCursos int not null,
FOREIGN KEY (IdEstudiante) references Estudiantes(IdEstudiante),
FOREIGN KEY (IdCursos) references Cursos(IdCurso)
)
go

Insert into Cursos Values
(01, 'HHHH', '2:30:00'),
(02, 'HHHK', '1:00:00'),
(03, 'HHKK', '2:00:00'),
(04, 'HKKK', '1:50:00'),
(05, 'KKKK', '0:30:00')

select * from Cursos

Insert into Estudiantes Values
(5, 'A', 15, 'Cali', 01),
(10, 'B', 18, 'Bogota', 02),
(15, 'Carlos Diaz', 20, 'Medellin', 03),
(20, 'C', 22, 'Medellin', 04),
(25, 'D', 17, 'Bucaramanga', 05)

/*Punto 1. Muestra nombre y edad de los estudiantes*/
Select Nombre, edad
From Estudiantes

/*Punto 2 Select con los estudiantes mayores de 18*/
Select *
From Estudiantes
Where Edad > 18

/*Punto 3. Muestra nombres de la A a la Z*/
Select Nombre, IdEstudiante
From Estudiantes
Order by Nombre ASC

/*El punto 4 se hizo en un insert con anterioridad (Carlos dias de 20 años, medellin y el curso 3*/

/*Punto 5. Actualiza la edad del estudiante con id 5*/
Update Estudiantes
Set Edad = 25
Where IdEstudiante = 5

Select * 
From Estudiantes

/*Punto 6. Elimana el estudiante con id 10*/
Delete from Estudiantes 
Where IdEstudiante = 10

/*Punto 7. Mostrar el nombre del estudiante y el curso*/
Select E.Nombre, C.NombreCurso
From Estudiantes E inner join Cursos C
On E.IdCursos = C.IdCurso

/*Punto 8. Mostrar total de estudiantes*/
Select COUNT(*) AS TotalEstudiantes
From Estudiantes

/*Punto 9. Mostrar total estudiantes X curso*/
Select NombreCurso, COUNT(*) AS TotalInscritos
From Cursos
Group By NombreCurso

/*Punto 10. Muestra cursos con 10+ estudiantes inscritos*/
Select NombreCurso, COUNT(*) AS EstudiantesInscritos
From Cursos
Group by NombreCurso
Having COUNT(*) > 10