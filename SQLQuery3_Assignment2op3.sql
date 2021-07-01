
create table Movie(
	Movie_ID int not null primary key,
	Movie_Name nvarchar(100),
	Duration int,
	Genre int,
	Director nvarchar(100),
	Amount_Money money
)
alter table Movie
add constraint Duration check (Duration>=60)

alter table Movie
add foreign key (Genre) references Genre(Genre_ID)

alter table Movie
add ImageLink varchar(100)

create table Genre(
	Genre_ID int not null primary key,
	Name nvarchar(255)
)
create table Actor(
	Actor_ID int not null primary key,
	Actor_Name nvarchar(50),
	Age int,
	Salary_Avg money,
	Nationality nvarchar(50)
)

CREATE TABLE ActedIn(
	Movie_ID int NOT NULL foreign key references Movie(Movie_ID),
	Actor_ID int NOT NULL foreign key references Actor(Actor_ID),
	Start_Day date,
	End_Day date
)
alter table ActedIn
add constraint pk_Act primary key (Movie_ID,Actor_ID)


insert into Genre(Genre_ID,Name)
values (1,'Action'),
		(2,'Adventure'),
		(3,'Comedy'),
		(4,'Crime(gangster)'),
		(5,'Dramas'),
		(6,'Horror'),
		(7,'Musical/dance'),
		(8,'War')

insert into Actor(Actor_ID,Actor_Name,Age,Salary_Avg,Nationality)
values (1,'Nguyen Van A',23,2000.0000,'VN'),
		(2,'Nguyen Van B',23,3000.0000,'VN'),
		(3,'Nguyen Van C',28,4000.0000,'VN'),
		(4,'Nguyen Van D',32,5000.0000,'VN'),
		(5,'Nguyen Van E',25,1000.0000,'VN')

insert into Movie(Movie_ID,Movie_Name,Duration,Genre,Director,Amount_Money,ImageLink)
values (1,'Phim hay',90,3,'Quang Hai',1000000000,'anh.jpg'),
		(2,'Phim Vui',120,5,'Anh Hai',2000000000,'bn.png'),
		(3,'Phim Hai',100,7,'Quoc Hai',9000000000,'am.png'),
		(4,'Phim Chan Dong',180,1,'Trong Hai',7000000000,'re.jpg'),
		(5,'Phim Hang Khac',150,4,'Ly Hai',5000000000,'au.png')

insert into ActedIn(Movie_ID,Actor_ID,Start_Day,End_Day)
values	(1,1,'2015-06-15','2018-05-25'),
		(2,2,'2016-05-22','2018-04-27'),
		(3,3,'2017-03-16','2019-03-12'),
		(4,4,'2019-07-30','2020-02-25'),
		(5,5,'2019-12-25','2021-12-20');

update Actor
set Actor_Name = 'Nguyen Van A'
where Salary_Avg='2000.0000'
and Actor_ID=1 and Age=23 and Nationality='VN'

select * from Actor where Age>50

select A.Actor_Name,A.Salary_Avg from Actor as A
order by A.Salary_Avg asc

select a.Movie_Name,c.Actor_Name from  Movie a inner join  ActedIn b on b.Movie_ID= a.Movie_ID right join Actor c on b.Actor_ID=c.Actor_ID

select Movie_Name from Movie
where Genre=1 and (select count(*) from Actor a inner join ActedIn b on a.Actor_ID=b.Actor_ID right join Movie c on b.Movie_ID=c.Movie_ID
)>3