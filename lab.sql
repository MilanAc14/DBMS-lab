
--lab 1
create Database HCOE;
use HCOE;
--  create table Student(ID,Name,RN,Batch)and Teacher( TID,Name, Faculty) 
create table student(
ID char(10) not null ,
Name char(15),
RN int,
Batch char(10)
);

create table Teacher(
TID char(10),
Name char(15),
Faculty char(10)
);

-- insert any five record into each database

insert into student(ID,Name,RN,Batch) 
values ('101','Ram Gurung',10,'2077BCA');
insert into student(ID,Name,RN,Batch) 
values ('102','Sita  Lama',15,'2077CSIT');
insert into student(ID,Name,RN,Batch) 
values ('103','Ram Bahadur Oli',1,'2077BCA');
insert into student(ID,Name,RN,Batch) 
values ('104','Manish Sharma',16,'2077BCE');
insert into student(ID,Name,RN,Batch) 
values ('105','Hari Prasad KC',20,'2077CSIT');

Select * from student;

insert  into Teacher(Tid,Name,Faculty)
values('1001','Santosh lama','CSIT');
insert  into Teacher(Tid,Name,Faculty)
values('1005','Himal Thapa','CSIT');
insert  into Teacher(Tid,Name,Faculty)
values('1010','Nawaraj Thapa','BCA');
insert  into Teacher(Tid,Name,Faculty)
values('1009','Hari Prasad KC','BCE');
insert  into Teacher(Tid,Name,Faculty)
values('1006','Kapil Sharma','BCA');

select*from Teacher;

--Display all records.
Select * from student;
select*from Teacher;

--Display only ID and Name from student table.
select ID,Name from student;

--Display Name and faculty from Teacher table.
select Name , Faculty from Teacher;

--Remove ‘RN’ attribute from student relation.
alter table student
drop column RN;

--Add ‘salary’ attribute to teacher relation.
alter table Teacher
add salary int;

--Copy ID and name attribute to new relation ‘info_student’.
select ID,Name into Info_student from student;
select * from Info_student;

--Delete all contents from info_student relation
delete from Info_student;





--lab2

--Employee (eid, ename, dateofemploy, salary)
create table Employee(
eid char(10),
ename char(20) not null,
dateofemployee datetime ,
salary decimal (18,2),
primary key (eid)
);
-- Set default value of ‘dateofemployee’ attribute as jan 1, 2010.
   alter table Employee
   add constraint df_dateofemployee
   Default '1-01-2010' for dateofemployee; 

--insert data into table Employee
insert into Employee(eid ,ename,dateofemployee,salary) 
values ('1001','Santosh lama', default ,4000);

/*If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query.
However, make sure the order of the values is in the same order as the columns in the table. */

insert into Employee
values ('1005','Himal Thapa', '1-01-2023' ,6000);
insert into Employee
values ('1010','Nawaraj Thapa', '1-03-2023' ,7000);
insert into Employee
values ('1009','Hari Prasad KC', '1-12-2022' ,8000);
insert into Employee
values ('1006','Kapil Sharma', default ,9000);
insert into Employee
values ('1002','Karan KC', '1-11-2020' ,10000);
insert into Employee
values ('1015','Krishna Chhetri', default ,2000);
insert into Employee
values ('1014','Kanchan Gurung', '3-03-2019' ,3000);

select * from Employee;

--Booklist(isbn, name, publication )
create table Booklist(
isbn char(10),
name char(20) not null,
publication char(20),
primary key (isbn)
);

insert into Booklist
values ('2001','DSA','Himal Publication');
insert into Booklist
values ('2003','CFA','Ekta Publication');
insert into Booklist
values ('2009','OS','Ekta Publication');
insert into Booklist
values ('2005','NM','Himal Publication');
insert into Booklist
values ('2011','DBMS','Prashant Publication');
insert into Booklist
values ('2012','SAD','Himal Publication');

select *from Booklist;

--Book(bid, bname, author, price)create table Book(
bid char(10),
bname char(20) not null,
author char(20),
price decimal(10,2)
primary key (bid)
);--remove bid as primary keyalter table Bookdrop constraint PK__Book__DE90ADE72D72F294; --Assign Bid 
alter table Book
add foreign key (bid) references booklist(isbn);--All the price of books must be less than 5000.insert into Book
values ('2011','DBMS','Prashant Adhikari',1550);insert into Book
values ('2001','DSA','Himal Thapa',1250);
insert into Book
values ('2003','CFA','Kapil Sharma',1350);
insert into Book
values ('2009','OS','Krishana Chhetri',2250);
insert into Book
values ('2005','NM','Prashant Adhikari',3050);select * from Book--Issues(IID,name,dateofissue)create table Issues(
IID char(10),
name char(20) not null,
dateofissue date,
primary key (IID)
);select * from Issues;select *from Employee;--add  as foreign key in issue table reference to employee tablealter table Issues
add employee_id char(10);alter table Issuesadd foreign key (employee_id)  references Employee(eid);insert into Issuesvalues('3001','Santosh Lama','10-02-2013','1001');insert into Issuesvalues('3005','Himal Thapa','03-10-2023','1005');insert into Issuesvalues('3015','Krishana Chhetri','11-03-2019','1015');insert into Issuesvalues('3010','Nawaraj Thapa','10-02-2023','1010');select * from Issues;-- Display all records from all relations.select * from Employee;select* from Book;select *from Booklist;select * from Issues;/* Modify relation teacher and student
 Set Tid as foreign key
 Set ID as primary key
 Delete RN attribute.*/alter table student
add primary key (ID);

alter table teacher
add foreign key (TID) references Employee (eid); 

-- Display eid and ename of all employes whose salary is less than 8000.
select eid , ename
from Employee
where( salary <8000);

-- Display all record of book whose price ranges from 2500 to 5000.
select*from Book
where (price between 2500  and 5000);

/*
select * from book
where (price>2500 and price<5000);
*/
--Display all the records from booklist relation whose publication name starts from ‘E’ eg Ekta
select * from Booklist 
where publication like 'E%';


-- small and capital letter doesnot matter like E or e same.

-- Display all records from employee table whose name ends with ‘ma’ eg Sita, Geeta etc.
select * from Employee;
select * from Employee 
where ename like '%ma';

--. Display iid and name from issues table whose name exactly consist of 12 characters.
select *from Employee
where ename like '__________';

-- trim removes space from first and last so as len
--next method
select * from Issues;
select len(name) from Issues;

select IID,name
from Issues
where len(name)=12;



-- Display all records from employee table where name starts with ‘K’ and salary greater than 4000.
select * from Employee
where ename like 'K%' and (salary>4000);

--Display all records from book table where either bookid lies in range 1001 to 2000 or price range in 500 to 1500
select * from Book
where (bid between 1001 and 2000) or (price between 500 and 1500);

--Display isbn number and bookname where booklist must not contain isbn no. 1003
select isbn ,name
from Booklist
where isbn !=2003;

exec sp_help Employee;--displays the properties of a table .


--lab3

--Find all the bookname, publication name and author name where publication name is “Ekta”.

select b.bname,bl.publication, b.author 
from Book as b
inner join  Booklist  as bl on b.bid=bl.isbn;

--Find the teachers name and faculty who issued book on 03-10-2023;
select * from teacher;

select t.TID,t.Name,t.faculty,i.IID
from Teacher  as t
inner join Issues as i on i.employee_id = t.TID
where i.dateofissue='03-10-2023';
 
 -- Add attribute bid on Issues relation .
 alter table Issues
 add bid char(10);

 --Insert the data in bid column.
 select * from Issues;
select * from Book;
 update Issues
 set bid='2001'
 where IID='3005';

 update Issues
 set bid='2020'
 where IID='3001';

 update Issues
 set bid='2025'
 where IID='3010';

 update Issues
 set bid='2022'
 where IID='3015';

 --Find the Teacher’s name , and book name issued by the teacher whose name starts with “H”.(explanation)
 select *from Teacher;
 select*from Issues;
 select * from Book;
 -- 3 tables inner join
 select t.Name,i.name,b.bname
 from Teacher as t
 inner join Issues as i on t.TID=i.employee_id
 inner join Book as b on b.bid=i.bid
where t.Name like 'H%';

--Update all salary by 10 %.
select*from Employee;
update Employee
set salary=((0.1* salary) + salary);

--Update book name DBMS as DATABASE.
select * from Book;
update Book
set bname='Database'
where bname='DBMS';

-- Update the salary of all employee by 20% whose salary is less than 5000..
update Employee
set salary=((0.2*salary)+salary)
where (salary<5000);

-- Delete the records from employee table whose eid is 1010.
select * from Teacher;
delete Teacher 
where TID='1010';
delete Employee 
where eid='1010';-- to delete a data from a base table we need to first delete data from a child table .

--Use sub query to find all teachers name and faculty whose date of employee is jan 2., 2011
select Name,faculty
from Teacher
where TID in(
select eid 
from Employee
where dateofemployee ='1-01-2010');

 --Use sub query to find all the book name and author name whose publication is “himal publication".
	select * from Book;
	select * from Booklist;

	select bname, author 
	from Book
	where bid in (
	select isbn 
	from Booklist
	where publication='himal publication');


	--lab 4

	-- Sort the employee records in descending order.
	select * from Employee
	order by eid desc;

	-- Sort name and publication name in ascending order.
	select * from Booklist;

	select name,publication
	from Booklist
	order by isbn asc;

	-- Display top three records from teachers relation.
	select top 3* from Teacher;

	-- Display the sum of salaries of all employees.
	select sum (salary) as 'sum of salary of  all employee'
	from Employee;

	--Display the minimum salary of employee.
	select  min (salary) as 'minimum salary of a employee'
	from Employee;
	

	--Display the average price of book written by same author.
	select avg (price ) as 'average price of a book'
	from Book;

	--Display publication name and number of books published by it from book list relation publication wise.
	select publication , count(name) as 'no. of books published'
	from Booklist
	group by publication;

	--Display the bid and bname of books whose price is greater than average prices of book.
	select * from Book;

	select bid, bname
	from Book
	where price >(select avg(price) from Book);

	-- Find the bid , bname and author in ascending order where author name is started by “k”.
	select bid , bname ,author 
	from Book
	where author like 'k%'
	order by bid asc;		--order by can be done in bid , bname or author any.

	--Find the teachers name and book issued  by him. The teacher’s salary who issued the book should have  the maximum salary.
		select *from Book;
	select * from Issues;
	select * from Teacher;

	update Teacher
	set salary= 15000
	where TID='1005';

	update t
	set t.salary=e.salary
	from Teacher as t
	inner join Employee as e on e.eid=t.TID;

	select t.Name,b.bname
	from Teacher as t 
	inner join Issues as i  on i.employee_id=t.TID
	inner join Book as b on b.bid=i.bid
	where t.salary = (select max (salary) from Teacher) ;

	--Find the authors name who have written more than one book.
	select author 
	from Book
	group by author
	having count (author )>1;


	--lab 5
	--note: to access from another database (select *from anotherdatabsename.dbo.tablename

	--Perform join operation on teacher and employee table and display the Ename , Faculty and salary.
	select * from Teacher;
	select * from Employee;

	select  e.ename ,t.faculty,e.salary
	from Employee as e
	inner join Teacher as t on e.eid=t.TID;

	-- Perform left join on table book list and book table.
	select * from Book;
	select * from Booklist;
	select*
	from Booklist as bl
	left join Book as b on b.bid=bl.isbn;

	--Perform right join on booklist and book table.
	select*
	from Booklist as bl
	right join Book as b on b.bid=bl.isbn;
	

	-- Perform Full join on Book and issues table.
	select * from Book ;
	select * from Issues;

	select *
	from Book
	full outer join Issues
	on Issues.bid=Book.bid;



	--Display those employees name and salary whose name starts with‘k’ and whose name consist ‘ch’ as sub string.
	select * from Employee;
	select ename,salary
	from Employee
	where( ename like 'k%' and ename like '%ch%');


	--Display name of the employee who is also a teacher.
	select ename
	from Employee
	inner join Teacher on Teacher.TID=Employee.eid;

	--Display all employees name except the name who are teachers.
	select * from Teacher;
	select * from Employee;
	select ename
	from Employee
	left join Teacher on Teacher.TID=Employee.eid
	where Teacher.TID is null;

	--Create a view Employee-view which consist of eid, ename , salary as attributes.
	Create View  Employee_view 
	as
	select eid,ename,salary
	from Employee;

	select * from Employee_view;

	--Insert a new record in recently created view. And also display the contents of primary table.
	insert into Employee_view
	values('1020','Ramesh Kafle',15000);

	--Delete the information from view where salary are less than 5000.
	delete from Employee_view
	where eid='1020';

	--note data in view can be delete but only those which ar inserted in view as other data from base table cannot be delete as it violates constraint.
	





 




