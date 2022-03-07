--If you want to put it into a new instance of a database, un-comment this line.
--CREATE database kylecardb;

create table if not exists kylecardb.public.SalesPerson(
	SalesPerson_ID serial primary key,
	first_name varchar(120),
	last_name varchar(120)
);

create table if not exists Cars(
	car_id serial primary key, 
	VIN varchar(21),
	Make varchar(120),
	Model varchar(120),
	Color varchar(120),
	"Year" integer  
);

create table if not exists Parts_inventory(
	part_id serial primary key,
	part_name varchar(120),
	brand varchar(120)
);

create table if not exists Mechanics(
	Mechanic_id serial primary key,
	first_name varchar(120),
	last_name varchar(120)
);

create table if not exists Customer(
	Customer_id serial primary key,
	car_id integer not null references Cars ,
	first_name varchar(120),
	last_name varchar(120),
	email varchar(120),
	phone integer
);

create table if not exists Invoice(
	Invoice_id serial primary key,
	car_id integer not null references Cars,
	SalesPerson_ID integer not null references SalesPerson,
	Invoice_date varchar(120),
	price integer 
);

create table if not exists Service_Ticket(
	service_id serial primary key,
	car_id integer not null references Cars,
	part_id integer not null references Parts_inventory,
	service_date varchar(120),
	service_done varchar(120),
	price integer
);

create table if not exists Mechanics_Service(
	service_id integer not null references Service_Ticket,
	Mechanic_id integer not null references Mechanics 
);


insert into Cars(VIN, Make, Model, Color, "Year") values('1234512345', 'Subaru', 'Crosstrek', 'Orange', 2022);
insert into Cars(VIN, Make, Model, Color, "Year") values('1234512346', 'Tesla', 'Model X', 'Red', 2022);
insert into Cars(VIN, Make, Model, Color, "Year") values('1234512347', 'Toyota', 'Camry', 'Blue', 2015);
insert into Cars(VIN, Make, Model, Color, "Year") values('1234512344', 'Honda', 'Civic', 'Pink', 2018);

insert into Customer(first_name, last_name, email, phone, car_id) values('Elon', 'Musk', 'ceo@tesla.com', 2011234567, 2);
insert into Customer(first_name, last_name, email, phone, car_id) values('Bill', 'Gates', 'ceo@microsoft.com', 2011245678, 1);
insert into Customer(first_name, last_name, email, phone, car_id) values('Steve', 'Jobs', 'ceo@apple.com', 2011234567, 3);
insert into Customer(first_name, last_name, email, phone, car_id) values('Mark', 'Zuck', 'ceo@facebook.com', 2011236795, 4);

insert into SalesPerson(first_name, last_name) values('Donald', 'Duck');
insert into SalesPerson(first_name, last_name) values('Mickey', 'Mouse');

insert into mechanics(first_name, last_name) values('Joe', 'Schmoe');
insert into mechanics(first_name, last_name) values('John', 'Doe');

insert into parts_inventory(part_name, brand) values('Tires', 'Goodyear');
insert into parts_inventory(part_name, brand) values('Spark plugs', ' Sparksters');

insert into invoice(car_id, salesperson_id, invoice_date, price) values(1, 1, 'March 6, 2022', 60000);
insert into invoice(car_id, salesperson_id, invoice_date, price) values(2, 2, 'March 6, 2022', 45000);

insert into service_ticket(car_id, part_id, service_date, service_done, price) values(3, 1, 'March 6, 2022', 'Replaced Tires', 400);
insert into service_ticket(car_id, part_id, service_date, service_done, price) values(4, 2, 'March 6, 2022', 'Changed Spark plugs', 100);

insert into mechanics_service(service_id, mechanic_id) values(1, 1);
insert into mechanics_service(service_id, mechanic_id) values(2, 2);


