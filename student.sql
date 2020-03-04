create TABLE student(name varchar2(20),bdate date,regno varchar2(20),major varchar2(10),primary key(regno));

create table course(courseid int,cname varchar2(10),dept varchar2(10),primary key(courseid));

create table text(isbn int,book_title varchar2(20),publisher varchar2(20),author varchar2(20),primary key(isbn));

create table book_adoption(courseid int,sem int,isbn int,foreign key (courseid) references course(courseid) on delete cascade,foreign key(isbn) references text(isbn) on delete cascade);

create table enroll(regno varchar2 (20),courseid int,sem int,marks int,foreign key(regno) references student(regno) on delete cascade,foreign key(courseid) references course(courseid) on delete cascade);

insert into student values('kiran','02-jan-84','1db01is01','ise');
insert into student values('divya','03-oct-85','1db01cs02','cse');
insert into student values('babu','04-feb-83','1db01me03','mech');
insert into student values('john','05-nov-84','1db01ec04','ece');
insert into student values('asha','06-dec-84','1db01cs05','cse');

insert into course values(11,'dcs','cse');
insert into course values(22,'ada','cse');
insert into course values(33,'cn','ece');
insert into course values(44,'td','mech');
insert into course values(55,'mup','ece');



insert into text values(7722,'vb','phi','holzner');

insert into text values(1144,'ds with c','sapna','nandagopal');

insert into text values(4400,'c prog','phi','balaguru');

insert into text values(5566,'cn','phi','tenenbaum');

insert into text values(3388,'mp','tata','brey');

insert into book_adoption values(11,3,7722);
insert into book_adoption values(22,4,7722);
insert into book_adoption values(11,5,4400);
insert into book_adoption values(11,8,5566);
insert into book_adoption values(55,4,3388);
insert into book_adoption values(44,4,5566);
insert into book_adoption values(44,7,3388);

insert into enroll values('1db01is01',22,5,76);
insert into enroll values('1db01is01',11,3,90);
insert into enroll values('1db01cs02',33,6,55);
insert into enroll values('1db01me03',22,5,75);
insert into enroll values('1db01cs05',44,5,75);

select * from text;
select * from book_adoption;
select * from course;
select * from student;
select * from enroll;
