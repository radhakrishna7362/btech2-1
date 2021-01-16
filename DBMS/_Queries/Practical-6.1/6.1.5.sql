create table Library_Books(ACCNO int,BTITLE varchar(30),AUTHOR varchar(20),PUBLISHER varchar(10),EDITION int,PRICE int,No_of_Copies int,primary key(ACCNO));
desc Library_Books;
insert into Library_Books values(101,'DBMS','RaghuramaKrishna','Pearson',5,350,10);
insert into Library_Books values(102,'OS','Tanenbom','Willman',4,300,15);
insert into Library_Books values(103,'Let Us C','Kanetkar','Pearson',7,600,25);
insert into Library_Books values(104,'JavaCompleteReference','Peter Naughton','Pearson',6,500,30);
select * from Library_Books;


