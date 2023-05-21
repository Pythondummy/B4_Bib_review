DROP TABLE IF EXISTS bib.review;
DROP TABLE IF EXISTS bib.book;
DROP TABLE IF EXISTS bib.customer;

DROP schema if exists bib;

create schema bib;
use bib;

create table bib.customer
	(
	customerId int primary key,
	firstName varchar(45),
	secondName varchar(45)
	);

create table bib.book
	(
    bookId int primary key,
    title varchar(45),
    author varchar(45),
    genre varchar(45)
	);
    
create table bib.review
	(
    reviewId int not null auto_increment primary key,
    star1_5 int not null,
    text varchar(500),
    dataOfReview date not null,
    bookId int not null,
    customerId int not null,
    constraint FK_review_customer foreign key (customerId) references bib.customer (customerId),
    constraint FK_review_book foreign key (bookId) references bib.book (bookId)
    );
    
insert into bib.customer values (1, 'Jef', 'Klak');
insert into bib.customer values (2, 'Piet', 'Broek');
insert into bib.customer values (3, 'Jan', 'Jansens');
insert into bib.customer values (4, 'Mark', 'Wouters');
insert into bib.customer values (5, 'Fre', 'Dierckx');
insert into bib.customer values (6, 'Fien', 'Broeckx');
insert into bib.customer values (7, 'Marie', 'Peeters');
insert into bib.customer values (8, 'Maria', 'Van den Broeck');
insert into bib.customer values (9, 'Seppe', 'Stroobants');
insert into bib.customer values (10, 'Seppe', 'Peeters');
insert into bib.customer values (11, 'Brian', 'De Roy');
insert into bib.customer values (12, 'Emiel', 'Dockx');

INSERT INTO bib.book VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 'Classic Fiction');
INSERT INTO bib.book VALUES (2, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Fiction');
INSERT INTO bib.book VALUES (3, '1984', 'George Orwell', 'Dystopian Fiction');
INSERT INTO bib.book VALUES (4, 'The Hitchhikers Guide to the Galaxy', 'Douglas Adams', 'Science Fiction');
INSERT INTO bib.book VALUES (5, 'Pride and Prejudice', 'Jane Austen', 'Romance');
INSERT INTO bib.book VALUES (6, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-Age Fiction');
INSERT INTO bib.book VALUES (7, 'Brave New World', 'Aldous Huxley', 'Dystopian Fiction');
INSERT INTO bib.book VALUES (8, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO bib.book VALUES (9, 'The Hunger Games', 'Suzanne Collins', 'Dystopian Fiction');
INSERT INTO bib.book VALUES (10, 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Magical Realism');


INSERT INTO bib.review VALUES (1, 4, 'This was a great book! The characters were so interesting and the plot kept me hooked until the very end.','2022-01-01', 5, 3);
INSERT INTO bib.review VALUES (2, 2, 'I didn\'t really like this book. The writing was poor and the characters were uninteresting.','2022-01-05', 9, 9);
INSERT INTO bib.review VALUES (3, 5, 'This book was amazing! I couldn\'t put it down.','2022-01-09', 2, 5);
INSERT INTO bib.review VALUES (4, 3, 'This book was okay. The story was a bit predictable and the characters weren\'t very memorable.','2022-01-14', 4, 7);
INSERT INTO bib.review VALUES (5, 1, 'I really didn\'t like this book. The story was boring and the characters were forgettable.','2022-01-18', 1, 12);
INSERT INTO bib.review VALUES (6, 4, 'I loved this book! The writing was beautiful and the story was captivating.','2022-01-22', 6, 4);
INSERT INTO bib.review VALUES (7, 3, 'This book was good, but I felt like it dragged on a bit too long.','2022-01-27', 8, 11);
INSERT INTO bib.review VALUES (8, 5, 'This was an incredible book! The characters were so well-written and the story was very engaging.','2022-01-31', 3, 2);
INSERT INTO bib.review VALUES (9, 2, 'I didn\'t really like this book. The story was slow-moving and the characters were forgettable.','2022-02-04', 10, 12);
INSERT INTO bib.review VALUES (10, 4, 'This was a great read. The story was well-crafted and the characters were well-developed.','2022-02-08', 7, 10);
INSERT INTO bib.review VALUES (11, 3, 'I enjoyed this book, but I felt that the ending was a bit rushed.','2022-02-13', 3, 11);
INSERT INTO bib.review VALUES (12, 5, 'This book was incredible! The plot was so unique and the characters were so interesting.','2022-02-17', 9, 6);
INSERT INTO bib.review VALUES (13, 2, 'This book was okay. The story was a bit predictable and the characters weren\'t very memorable.','2022-02-21', 2, 8);
INSERT INTO bib.review VALUES (14, 4, 'I loved this book! The characters were so interesting and the plot kept me hooked until the very end.','2022-02-26', 5, 1);
INSERT INTO bib.review VALUES (15, 1, 'I really didn\'t like this book. The story was boring and the characters were forgettable.','2022-03-02', 1, 2);
INSERT INTO bib.review VALUES (16, 5, 'This book was amazing! The writing was beautiful and the story was very moving.','2022-03-06', 4, 3);
INSERT INTO bib.review VALUES (17, 3, 'This book was okay. The story was a bit slow-moving and the characters weren\'t very interesting.','2022-03-11', 7, 9);
INSERT INTO bib.review VALUES (18, 4, 'I really enjoyed this book. The characters were very well-written and the story was very engaging.','2022-03-15', 6, 6);
INSERT INTO bib.review VALUES (19, 2, 'This book wasn\'t my favorite. The story was a bit slow-moving and the characters didn\'t really resonate with me.','2022-03-19', 8, 9);
INSERT INTO bib.review VALUES (20, 5, 'This book was amazing! I loved the characters and the plot was so engaging.','2022-03-24', 10, 5);
INSERT INTO bib.review VALUES (21, 3, 'I liked this book, but I felt like the story was a bit too predictable.','2022-03-28', 3, 11);
INSERT INTO bib.review VALUES (22, 4, 'This book was really good. The story was very engaging and the characters were very well-written.','2022-04-01', 9, 4);
INSERT INTO bib.review VALUES (23, 2, 'I didn\'t really enjoy this book. The writing was poor and the characters were uninteresting.','2022-04-05', 1, 10);
INSERT INTO bib.review VALUES (24, 5, 'This book was incredible! The story was very unique and the characters were so interesting.','2022-04-10', 5, 2);
INSERT INTO bib.review VALUES (25, 3, 'This book was okay. The story was a bit slow-moving and the characters weren\'t very memorable.','2022-04-14', 6, 8);
INSERT INTO bib.review VALUES (26, 4, 'I really enjoyed this book. The story was well-crafted and the characters were very interesting.','2022-04-18', 2, 7);
INSERT INTO bib.review VALUES (27, 1, 'This book wasn\'t for me. The story was boring and the characters were forgettable.','2022-04-23', 4, 12);
INSERT INTO bib.review VALUES (28, 5, 'This book was absolutely amazing! The writing was beautiful and the story was very moving.','2022-04-27', 8, 1);
INSERT INTO bib.review VALUES (29, 3, 'I liked this book, but I felt like it was a bit too predictable.','2022-04-27', 10, 12);
INSERT INTO bib.review VALUES (30, 4, 'I really enjoyed this book. The characters were well-developed and the plot was engaging.', '2022-05-01', 7, 5);
INSERT INTO bib.review VALUES (31, 2, 'This book didn\'t meet my expectations. The story was confusing and the characters were poorly written.', '2022-05-05', 3, 10);
INSERT INTO bib.review VALUES (32, 5, 'This book blew me away! The writing was beautiful and the story was gripping from start to finish.', '2022-05-09', 6, 9);
INSERT INTO bib.review VALUES (33, 3, 'I found this book to be just average. The plot was predictable and the characters were forgettable.', '2022-05-13', 1, 12);
INSERT INTO bib.review VALUES (34, 4, 'This book was a pleasant surprise! The twists and turns kept me on the edge of my seat.', '2022-05-17', 9, 6);
INSERT INTO bib.review VALUES (35, 1, 'I really didn\'t like this book. The story was confusing and the writing style didn\'t resonate with me.', '2022-05-21', 4, 5);
INSERT INTO bib.review VALUES (36, 5, 'This book is an absolute masterpiece! The author has created a vivid and captivating world.', '2022-05-25', 2, 8);
INSERT INTO bib.review VALUES (37, 3, 'I enjoyed reading this book. The characters were relatable and the plot had some unexpected twists.', '2022-05-29', 7, 12);
INSERT INTO bib.review VALUES (38, 4, 'This book kept me hooked from the first page to the last. The story was fast-paced and thrilling.', '2022-06-02', 3, 5);
INSERT INTO bib.review VALUES (39, 2, 'I had high hopes for this book, but it fell short. The plot was predictable and the characters lacked depth.', '2022-06-06', 10, 3);
INSERT INTO bib.review VALUES (40, 5, 'This book touched my heart. The emotional journey of the characters was beautifully portrayed.', '2022-06-10', 5, 7);
INSERT INTO bib.review VALUES (41, 3, 'I found this book to be just okay. The story had potential, but it didn\'t fully captivate me.', '2022-06-14', 8, 11);
INSERT INTO bib.review VALUES (42, 4, 'This book was a delightful read. The witty dialogue and charming characters made it a joy to read.', '2022-06-18', 6, 4);
INSERT INTO bib.review VALUES (43, 1, 'I couldn\'t get into this book. The writing style didn\'t resonate with me and the story failed to hold my interest.', '2022-06-22', 1, 3);
INSERT INTO bib.review VALUES (44, 5, 'This book completely captivated me. The rich descriptions and complex characters made it a compelling read.', '2022-06-26', 9, 2);
INSERT INTO bib.review VALUES (45, 3, 'I had mixed feelings about this book. While the premise was intriguing, the execution fell flat.', '2022-06-30', 3, 5);