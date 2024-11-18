
-- print all the necessary details from all tables --

select FirstName,LastName,Gender,email,SubjectName,SubjectCode,MinMark,Mark
from marks 
inner join student on marks.StudentID = student.StudentID
inner join subject on marks.SubjectID = subject.SubjectID
inner join exam on marks.ExamID= exam.ExamID

-- print all mark of all students for a given subject --

select FirstName,LastName,Mark 
from marks 
inner join subject on subject.SubjectID = marks.SubjectID
inner join student on student.StudentID = marks.StudentID
where SubjectName='Physics'

-- print the details of all exams attended by a student if a student is given --

select FirstName,LastName,Gender,email,MinMark ,Mark
from marks 
inner join student on student.StudentID = marks.StudentID 
inner join exam on exam.ExamID = marks.ExamID
where student.StudentID = 1