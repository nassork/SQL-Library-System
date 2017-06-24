use master;

insert into LibraryLocation (LocationName, LocationAddress) values
('Downtown', '1 Univeristy Ave, Morgantown WV, 26505'),
('Evansdale', '1 Evandale Street, Morgantown WV, 26505'),
('Health Sciences', '1 Health Lane, Morgantown WV, 26505');

go

insert into PatronType (PatronTypeName, MaxBooks, DaysAllowed) values
('Student', 5, 21), ('Faculty', 10, 42);

go

insert into LibraryPatron (PatronName, PatronEmailAddress, PatronAddress, PatronTypeId) values
('Bob huggins', 'Bob.Huggins@wvu.edu', '1 Colliseum Drive, Morgantown WV, 26505', 100),
('Kobe Bryant', 'Kobe.Bryant@Laker.nba', '1 Laker Drive, California, 90821', 101),
('Jerry West', 'Jerry.West@wvu.edu', '1 Nba Logo Drive, Morgantown WV, 26505', 101);

go

insert into Author (AuthorName) values
('J.K. Rowling'), ('Mark Twain'), ('Dr. Sues'), ('Donald Trump');

go

insert into Book (ISBN, Title, BookFormat) values
('1111111111', 'Harry Potter and the Goblin of Fire', 'Hard Cover'),
('2222222222', 'innocents abroad', 'PaperBack'),
('3333333333', 'Can in the Hat', 'PaperBack'),
('4444444444', 'The Art of the Deal', 'Hard Cover');

go

insert into BookAuthor (ISBN, AuthorId) values
('1111111111', 1), ('2222222222', 2), ('3333333333', 3), ('4444444444', 4); --connecting the author with the right book

go

insert into BookInventory (BookCondition, AvailabilityStatus, LibraryLocationId, ISBN) values --connecting the right book with its status in the inventory
('Good', 'Checked out', 1, '1111111111'), ('Damanged', 'Available', 3, '1111111111'), ('Lost', 'Reserved', 2, '1111111111'), ('Good', 'Reserved', 1, '1111111111'),
('Good', 'Checked out', 1, '2222222222'), ('Damanged', 'Available', 3, '2222222222'), ('Lost', 'Reserved', 2, '2222222222'), ('Good', 'Reserved', 2, '2222222222'),
('Good', 'Checked out', 1, '3333333333'), ('Damanged', 'Available', 1, '3333333333'), ('Lost', 'Reserved', 2, '3333333333'), ('Good', 'Reserved', 3, '3333333333'),
('Good', 'Checked out', 1, '4444444444'), ('Damanged', 'Available', 2, '4444444444'), ('Lost', 'Reserved', 1, '4444444444'), ('Good', 'Reserved', 1, '4444444444');






