use master;

if (OBJECT_ID('BookBorrowed') is not null)
	drop table BookBorrowed;

if (OBJECT_ID('LibraryPatron') is not null)
	drop table LibraryPatron;

if (OBJECT_ID('PatronType') is not null)
	drop table PatronType;

if (OBJECT_ID('BookInventory') is not null)
	drop table BookInventory;

if (OBJECT_ID('BookAuthor') is not null)
	drop table BookAuthor;

if (OBJECT_ID('Book') is not null)
	drop table Book;

if (OBJECT_ID('LibraryLocation') is not null) -- tables have the oppisite order from how you created it
	drop table LibraryLocation; 

if (OBJECT_ID('Author') is not null)
	drop table Author;






create table LibraryLocation
(
	LibraryLocationId int identity(1, 1) primary key,
	LocationName varchar(50) not null,
	LocationAddress varchar(100) not null,
);

go

create table PatronType --second drop becasue library a=patron deponds on it
(
	PatronTypeId int identity(100, 1) primary key,
	PatronTypeName varchar(50) not null,
	MaxBooks int not null,
	DaysAllowed int not null,
);

go

create table LibraryPatron --first drop
(
	PatronId int identity(10, 1) primary key,
	PatronName varchar(50) not null,
	PatronEmailAddress varchar(50) not null,
	PatronAddress varchar(50) not null, 
	PatronTypeId int not null,

	constraint fkLibraryPatrontoPatronType
		foreign key (PatronTypeId) references PatronType (PatronTypeId), --the table being refernces comes first (very important)

);

go

create table Author
(
	AuthorId int identity(1,1) primary key,
	AuthorName varchar(50) not null
);

go

create table Book --
(
	ISBN varchar(13) primary key,
	Title varchar(100) not null,
	BookFormat varchar(50) not null,
);

go

create table BookAuthor --4th because bookinventory depends on it
(
	AuthorId int,
	ISBN varchar(13),
	constraint pkBookAuthor primary key (ISBN, AuthorId),
	constraint fkBookAuthortoAuthor foreign key(AuthorId) references Author(AuthorId),
	constraint fkBookAuthortoBook foreign key(ISBN) references Book(ISBN),
);


go


create table BookInventory --3rd drop
(
	BookInventoryId int identity(10,1) primary key,
	BookCondition varchar(50) not null,
	AvailabilityStatus varchar(50) not null,
	LibraryLocationId int not null,
	ISBN varchar(13) not null,
	constraint fkBookInventorytoLibraryLocation foreign key(LibraryLocationId) references LibraryLocation(LibraryLocationId),
	constraint fkBookInventorytoBook foreign key(ISBN) references Book(ISBN),
	--constraint chBookCondition check (BookCondition in ('Good', 'Damaged', 'Lost')) 
);

create table BookBorrowed
(
	BookBorredId int identity(1,1) primary key,
	PatronId int not null,
	BookInventoryId int not null,
	DateCheckedOut date not null,
	DateReturned date null,

	constraint fkBookBorrowedtoLibraryPatron foreign key (PatronId) references LibraryPatron(PatronId),
	constraint fkBookBorrowedtoBookInventory foreign key (BookInventoryId) references BookInventory(BookInventoryId),
	constraint chValidDates check (DateReturned >= DateCheckedOut),
);

/*
alter table BookInventory
add constaint chBookCondition
check (BookCondition in ('Good', 'Damaged', 'Lost')) 
*/

go












