Create Database db_books2
USE db_books2
create table tbl_publisher (
	publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(200) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL	
)


create table tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(100) NOT NULL,
	publisher_name VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
)


create table tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	branch_name VARCHAR(100) NOT NULL,
	branch_address VARCHAR(200) NOT NULL
)


create table tbl_book_copies (
	copy_id INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	book_id INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	no_of_copies INT NOT NULL
)


create table tbl_book_authors (
	author_book_entry_id INT PRIMARY KEY NOT NULL IDENTITY(300,1), 
	book_id INT NOT NULL CONSTRAINT fk_authors_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(100) NOT NULL
)


create table tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	borrower_name VARCHAR(100) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL 

)



create table tbl_book_loans (
	book_loan_id INT PRIMARY KEY NOT NULL IDENTITY(400,1),
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,  
	date_out DATE NOT NULL,
	due_date DATE NOT NULL
)



insert into tbl_publisher 
   (publisher_name, publisher_address, publisher_phone)
   VALUES 
   ('Johnson LLC','111 Duff Drive', '222-222-2222'),
   ('Adamson LLC','222 Duff Drive', '333-333-3333'),
   ('Bradford LLC','333 Duff Drive', '777-777-7777')
;


insert into tbl_book
	(title,publisher_name)
	VALUES 
	('The Apartment', 'Johnson LLC'),
	('The 3rd Floor', 'Adamson LLC'),
	('Me and Jim', 'Bradford LLC'),
	('Aces Are Wild', 'Johnson LLC'),
	('One Eyed Jacks', 'Adamson LLC'),
	('The Lost Tribe', 'Bradford LLC'),
	('JJ Birden', 'Johnson LLC'),
	('Why Now', 'Adamson LLC'),
	('Because I Said So', 'Bradford LLC'),
	('Lance and I', 'Johnson LLC'),
	('Follow Second', 'Adamson LLC'),
	('Catamore Drive', 'Bradford LLC'),
	('The Point', 'Johnson LLC'),
	('Winter Hill', 'Adamson LLC'),
	('Hilltop', 'Bradford LLC'),
	('Crestmoor', 'Johnson LLC'),
	('Par 3', 'Adamson LLC'),
	('Checkmate', 'Bradford LLC'),
	('Guide to Fox Point', 'Johnson LLC'),
	('The Judge, Me, and Kenny', 'Adamson LLC')
;


insert into tbl_book_authors
	(book_id,author_name)
	VALUES
	(1, 'Stephen King'),
	(2, 'Stephen King'),
	(3, 'Jon Jones'),
	(4, 'LL Cool J'),
	(5, 'Jim Jimerson'),
	(6, 'Ray Crockett'),
	(7, 'Scott Secules'),
	(8, 'John Elway'),
	(9, 'Chris Harris'),
	(10, 'Von Miller'),
	(11, 'Aquib Talib'),
	(12, 'Derik Wolf'),
	(13, 'Demarcus Ware'),
	(14, 'TJ Ward'),
	(15, 'TJ Del Santo'),
	(16, 'Cam Stuart'),
	(17, 'Sylvester Williams'),
	(18, 'Peyton Manning'),
	(19, 'CJ Andrson'),
	(20, 'John Jonson')
;


insert into tbl_library_branch
	(branch_name,branch_address)
	VALUES
	('Shaprstown','333 Sharpstown Road'),
	('Central','333 Central Road'),
	('East Denver','444 Bellaire Road'),
	('West Denver','555 Main Road')
;



insert into tbl_book_copies
	(book_id,branch_id,no_of_copies)
	VALUES
	(1,200,2),
	(2,200,2),
	(3,200,2),
	(4,200,2),
	(5,200,2),
	(6,200,2),
	(7,200,2),
	(8,200,2),
	(9,200,2),
	(10,200,2),
	(2,201,2),
	(3,201,2),
	(4,201,2),
	(5,201,2),
	(6,201,2),
	(7,201,2),
	(8,201,2),
	(9,201,2),
	(10,201,2),
	(11,201,2),
	(3,202,2),
	(4,202,2),
	(5,202,2),
	(6,202,2),
	(7,202,2),
	(8,202,2),
	(9,202,2),
	(10,202,2),
	(11,202,2),
	(12,202,2),
	(4,203,2),
	(5,203,2),
	(6,203,2),
	(7,203,2),
	(8,203,2),
	(9,203,2),
	(10,203,2),
	(12,203,2),
	(12,203,2),
	(13,203,2)
;

insert into tbl_book_copies
	(book_id,branch_id,no_of_copies)
	VALUES
	(1,201,2)
;

insert into tbl_borrower 
	(borrower_name,borrower_address,borrower_phone)
	VALUES
	('Alex English','111 Nugget Drive','555-555-3333'),
	('Fat Lever','222 Nugget Drive','555-555-1111'),
	('ET Turner','333 Nugget Drive','555-555-2222'),
	('Kenyon Martin','444 Nugget Drive','555-555-6666'),
	('George Karl','555 Nugget Drive','555-555-7777'),
	('Robert Pack','666 Nugget Drive','555-555-8888'),
	('Fanz Ellis','777 Nugget Drive','555-555-9999'),
	('Dan Schayes','888 Nugget Drive','555-555-4444')
;



insert into tbl_book_loans
 (book_id,branch_id,card_no,date_out,due_date)
 VALUES 
 (1,200,1000,'2018-01-01','2018-01-04')
 ;

 insert into tbl_book_loans
 (book_id,branch_id,card_no,date_out,due_date)
 VALUES 
 (2,200,1000,'2018-01-01','2018-01-04'),
 (3,200,1000,'2018-01-01','2018-01-04'),
 (4,200,1000,'2018-01-01','2018-01-04'),
 (5,200,1000,'2018-01-01','2018-01-04'),
 (6,200,1000,'2018-01-01','2018-01-04')
 ;



  insert into tbl_book_loans
 (book_id,branch_id,card_no,date_out,due_date)
 VALUES 
 (2,200,1001,'2018-01-01','2018-01-04'),
 (3,200,1001,'2018-01-01','2018-01-04'),
 (4,200,1001,'2018-01-01','2018-01-04'),
 (5,200,1001,'2018-01-01','2018-01-04'),
 (6,200,1001,'2018-01-01','2018-01-04'),
 (7,200,1001,'2018-01-01','2018-01-04')
 ;


insert into tbl_book_loans
 (book_id,branch_id,card_no,date_out,due_date)
 VALUES 
 (2,201,1002,'2018-01-01','2018-01-04'),
 (3,201,1002,'2018-01-01','2018-01-04'),
 (4,201,1002,'2018-01-01','2018-01-04'),
 (5,201,1002,'2018-01-01','2018-01-04'),
 (6,201,1002,'2018-01-01','2018-01-04'),
 (7,201,1002,'2018-01-01','2018-01-04'),
 (8,201,1002,'2018-01-01','2018-01-04'),
 (9,201,1002,'2018-01-01','2018-01-04'),
 (3,202,1002,'2018-01-01','2018-01-04'),
 (4,202,1002,'2018-01-01','2018-01-04'),
 (5,202,1002,'2018-01-01','2018-01-04'),
 (6,202,1002,'2018-01-01','2018-01-04'),
 (7,202,1002,'2018-01-01','2018-01-04'),
 (8,202,1002,'2018-01-01','2018-01-04'),
 (9,202,1002,'2018-01-01','2018-01-04'),
 (10,202,1002,'2018-01-01','2018-01-04'),
 (11,202,1002,'2018-01-01','2018-01-04'),
 (12,202,1002,'2018-01-01','2018-01-04'),
 (5,203,1002,'2018-01-01','2018-01-04'),
 (6,203,1002,'2018-01-01','2018-01-04')
 ;


  insert into tbl_book_loans
 (book_id,branch_id,card_no,date_out,due_date)
 VALUES 
 (2,201,1003,'2018-01-01','2018-01-04'),
 (3,201,1003,'2018-01-01','2018-01-04'),
 (4,201,1003,'2018-01-01','2018-01-04'),
 (5,201,1003,'2018-01-01','2018-01-04'),
 (6,201,1003,'2018-01-01','2018-01-04'),
 (7,201,1003,'2018-01-01','2018-01-04'),
 (8,201,1003,'2018-01-01','2018-01-04'),
 (9,201,1003,'2018-01-01','2018-01-04'),
 (3,202,1003,'2018-01-01','2018-01-04'),
 (4,202,1003,'2018-01-01','2018-01-04'),
 (5,202,1003,'2018-01-01','2018-01-04'),
 (6,202,1003,'2018-01-01','2018-01-04'),
 (7,202,1003,'2018-01-01','2018-01-04'),
 (8,202,1003,'2018-01-01','2018-01-04'),
 (9,202,1003,'2018-01-01','2018-01-04'),
 (10,202,1003,'2018-01-01','2018-01-04'),
 (11,202,1003,'2018-01-01','2018-01-04'),
 (12,202,1003,'2018-01-01','2018-01-04'),
 (5,203,1003,'2018-01-01','2018-01-04'),
 (6,203,1003,'2018-01-01','2018-01-04')
 ;


 update tbl_book_copies
 SET no_of_copies = 200
 ;



 update tbl_library_branch
 SET branch_name = 'Sharpstown'
 WHERE branch_name = 'Shaprstown' 

USE db_books2
GO
CREATE PROCEDURE dbo.uspGetFinalProjectQueries

AS

select no_of_copies from tbl_book 
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_id = tbl_book.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.branch_id
	WHERE
	branch_name = 'Sharpstown' AND
	title = 'The Lost Tribe'
;
  

 select no_of_copies,branch_name from tbl_book 
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_id = tbl_book.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.branch_id
	WHERE
	title = 'The Lost Tribe'
;

select borrower_name from tbl_borrower
	LEFT JOIN tbl_book_loans ON tbl_book_loans.card_no = tbl_borrower.card_no
	WHERE 
	book_id IS NULL
;


DECLARE @todaydate DATE
SET @todaydate = GETDATE()
select title, borrower_name, borrower_address, due_date from tbl_book
   INNER JOIN tbl_book_loans ON tbl_book_loans.book_id = tbl_book.book_id
   INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_book_loans.card_no
   INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_loans.branch_id
   WHERE 
   branch_name='Sharpstown' AND
   due_date = @todaydate 
;

select branch_name, COUNT(book_id) as 'Number Books Checked Out' from tbl_library_branch 
	inner join tbl_book_loans on tbl_book_loans.branch_id = tbl_library_branch.branch_id
	GROUP BY branch_name 
;

select borrower_name,borrower_address, COUNT(book_id) as 'Number of Books Checked Out' from tbl_borrower
	left join tbl_book_loans on tbl_book_loans.card_no = tbl_borrower.card_no
	GROUP BY borrower_name, borrower_address
	HAVING
	COUNT(book_id) > 5
;


select title, no_of_copies as 'Number of Copies', branch_name from tbl_book 
	INNER JOIN tbl_book_authors on tbl_book_authors.book_id = tbl_book.book_id
	INNER JOIN tbl_book_copies on tbl_book_copies.book_id = tbl_book.book_id
	INNER JOIN tbl_library_branch on tbl_library_branch.branch_id = tbl_book_copies.branch_id
	WHERE author_name = 'Stephen King' AND
	branch_name = 'Central'
;

GO

EXEC dbo.uspGetFinalProjectQueries
