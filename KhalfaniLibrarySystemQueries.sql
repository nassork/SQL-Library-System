use master;

select * from LibraryLocation

-- 1. admin wants to know the IDs, names, and address of all the patrons
select * from LibraryLocation

select PatronId, PatronName, PatronAddress
from LibraryPatron
where PatrontypeId = 100; --just for the student

-- 2. admin wants to know the IDs, names, and address of all the patrons using innerjoin

go --need to separate each of the database 

if (OBJECT_ID('proSearchPatronTypeName') is not null)
	drop procedure proSearchPatronTypeName;

go --

create procedure proSearchPatronTypeName --has to have an @ symbol, dealing with a variable and not a table or 
(
	@PatronTypeName varchar(50)
)
as --seperator, the header from the body
begin

select PatronId, PatronName, PatronAddress
from LibraryPatron as LP inner join PatronType PT --using aliases
	on LP.PatronTypeId = PT.PatronTypeId
where PatronTypeName = 'Student';

end; --programmabilty/stored procedures

/*
execture proSearchPatronTypeName
	@PatronTypeName = 'Faculty';
*/


-- how many copies of the book "harry potter" is currently "available" in "downtown" library

create procedure proSearchforBook
(
	@BookTitle varchar(50) = null,
	@AvailabilityStatus varchar(50) = null,
	@BookLocation varchar(50) = null
)

as
begin

select count (B.Title) --where to start
from Book B join BookInventory BI 
		on B.ISBN = BI.ISBN join LibraryLocation LL on LL.LibraryLocationId = BI.LibraryLocationId --where to end
where 

B.Title like '%Harry Potter%' and 
BI.AvailabilityStatus = 'Available' and
LL.LocationName = 'Downtown';

/*
execture proSearchforBook
	@BookTitle like '%Harry Potter%',
	@AvailabilityStatus = 'Available',
	@BookLocation = 'Downtown';
*/
end

go




-- all the ids, names, and emails of "students" who are currently late by a week or more








--declare @test varchar (10); -- this test if there is a value of null
--set @test = null;
--select count(@test);


iff()


-- how does isnull() work?
-- looks for inside varaible and if its null, it gives you the alternate value. 
-- soo when the user doesnt provide input, the varaable is going to be null
isnull()

---- what happens if you set a column to its self in a where class



declare @ISBN varchar(10); -- this test if there is a value of null
set @ISBN = null;

select * from Book
where ISBN = IsNull(@ISBN, ISBN); --

--new

if (OBJECT_ID('proSearchPatronTypeNameIsNull') is not null)
	drop procedure proSearchPatronTypeNameIsNull;

go

create procedure proSearchforBookIsNull
(
	@BookTitle varchar(50) = null,
	@AvailabilityStatus varchar(50) = null,
	@BookLocation varchar(50) = null --no comma right here
)

as
begin

select count (B.Title) --where to start
from Book B join BookInventory BI 
		on B.ISBN = BI.ISBN join LibraryLocation LL on LL.LibraryLocationId = BI.LibraryLocationId --where to end
where 

B.Title like '%' + IsNULL(@BookTitle, Title) and 
BI.AvailabilityStatus = IsNULL(@AvailabilityStatus, @AvailabilityStatus) and
LL.LocationName = IsNULL(@BookLocation, LocationName);

/*
execture proSearchforBook
	@BookTitle like '%Harry Potter%',
	@AvailabilityStatus = 'Available',
	@BookLocation = 'Downtown';



