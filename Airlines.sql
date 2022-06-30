--city table
create table city (cname varchar2(15) primary key, state varchar2(15), country varchar2(30));
insert into city values('Louisville','Kentucky','United States');
insert into city values('Chandigarh','Chandigarh','India');
insert into city values('Fort Worth','Texas','United States');
insert into city values('Delhi','Delhi','India');
insert into city values('Mumbai','Maharashtra','India');
insert into city values('San Franciso','California','United States');
insert into city values('Frankfurt','Hesse','Germany');
insert into city values('Houston','Texas','United States');
insert into city values('New York City','New York','United States');
insert into city values('Tampa','Florida','United States');
update city set cname='San Francisco' where state='California';
insert into city values('Patiala','Punjab','India');

--airport table
create table airport(AP_name varchar2(100) primary key, state varchar2(15), country varchar2(30), cname references city(cname) on delete cascade);
insert into airport values('Louisville International Airport','Kentucky','United States','Louisville');
insert into airport values('Chandigarh International Airport','Chandigarh','India','Chandigarh');
insert into airport values('Dallas/Fort Worth International Airport','Texas','United States','Fort Worth');
insert into airport values('Indira GandhiInternational Airport','Delhi','India','Delhi');
insert into airport values('Chhatrapti Shivaji International Airport','Maharashtra','India','Mumbai');
insert into airport values('San Francisco International Airport','California','United States','San Francisco');
insert into airport values('Frankfurt Airport','Hesse','Germany','Frankfurt');
insert into airport values('George Bush Intercontinental Airport','Texas','United States','Houston');
insert into airport values('John F. Kennedy International Airport','New York','United States','New York City');
insert into airport values('Tampa International Airport','Florida','United States','Tampa');

--airline table
create table airline(airlineid varchar(3) primary key, al_name varchar2(50), three_digital_code varchar2(3));
insert into airline values('AA','American Airlines','001');
insert into airline values('AI','Air India Limited','098');
insert into airline values('LH','Lufthansa','220');
insert into airline values('BA','British Airways','125');
insert into airline values('QR','Qatar Airways','157');
insert into airline values('9W','Jet Airways','589');
insert into airline values('EK','Emirates','176');
insert into airline values('EY','Ethiad Airways','607');

--contains table
create table contains(airlineid varchar(3), AP_name varchar2(100), primary key(airlineid, AP_name), foreign key(airlineid) references airline(airlineid) on delete cascade, foreign key(AP_name) references airport(AP_name) on delete cascade);
insert into contains values('AA','Louisville International Airport');
insert into contains values('AA','John F. Kennedy International Airport');
insert into contains values('AA','George Bush Intercontinental Airport');
insert into contains values('AA','San Francisco International Airport');
insert into contains values('AA','Tampa International Airport');

insert into contains values('AI','Chandigarh International Airport');
insert into contains values('AI','Dallas/Fort Worth International Airport');
insert into contains values('AI','Indira GandhiInternational Airport');
insert into contains values('AI','Chhatrapti Shivaji International Airport');
insert into contains values('AI','George Bush Intercontinental Airport');

insert into contains values('LH','Chhatrapti Shivaji International Airport');
insert into contains values('LH','Frankfurt Airport');
insert into contains values('LH','John F. Kennedy International Airport');
insert into contains values('LH','San Francisco International Airport');
insert into contains values('LH','Dallas/Fort Worth International Airport');

insert into contains values('BA','John F. Kennedy International Airport');
insert into contains values('BA','Chhatrapti Shivaji International Airport');
insert into contains values('BA','Chandigarh International Airport');
insert into contains values('BA','Frankfurt Airport');
insert into contains values('BA','San Francisco International Airport');

insert into contains values('QR','Chhatrapti Shivaji International Airport');
insert into contains values('QR','Dallas/Fort Worth International Airport');
insert into contains values('QR','John F. Kennedy International Airport');
insert into contains values('QR','Tampa International Airport');
insert into contains values('QR','Louisville International Airport');


--flight table
create table flight(flight_code varchar2(10) primary key, source1 varchar2(3), destination varchar2(3), arrival varchar2(10), departure varchar2(10), status varchar2(10), duration1 varchar2(30), flighttype varchar2(10), layover_time varchar2(30), no_of_stope int, airlineid references airline(airlineid) on delete cascade);
insert into flight values('AI2014','BOM','DFW','02:10','03:15','On-time','24hr','Connecting',3,1,'AI');
insert into flight values('QR2305','BOM','DFW','13:00','13:55','delayed','21hr','Non-stop',0,0,'QR');
insert into flight values('EY1234','JFK','TPA','19:20','20:05','On-time','16hr','Connecting',5,2,'EY');
insert into flight values('LH9876','JFK','BOM','05:50','06:35','On-time','18hr','Non-stop',0,0,'LH');
insert into flight values('BA1689','FRA','DEL','10:20','10:55','On-time','14hr','Non-stop',0,0,'BA');
insert into flight values('AA4367','SFO','FRA','18:10','18:55','On-time','21hr','Non-stop',0,0,'AA');
insert into flight values('QR1902','IXC','IAH','22:00','22:50','Delayed','28hr','Non-stop',5,1,'QR');
insert into flight values('BA3056','BOM','DFW','02:15','02:55','On-time','29hr','Connecting',3,1,'BA');
insert into flight values('EK3456','BOM','SFO','18:50','19:40','On-time','30hr','Non-stop',0,0,'EK');
insert into flight values('9W2334','IAH','DAL','23:00','13:45','On-time','23hr','Direct',0,0,'9W'); --???? BESTIE WHY DIRECT?????? non-stop????????????????????

--passenger1 table
create table passenger1(PID int, passportno varchar2(10), primary key(PID, passportno));
insert into passenger1 values(1,'A1234568');
insert into passenger1 values(2,'B9876541');
insert into passenger1 values(3,'C2345698');
insert into passenger1 values(4,'D1002004');
insert into passenger1 values(5,'X9324666');
insert into passenger1 values(6,'B8765430');
insert into passenger1 values(7,'J9801235');
insert into passenger1 values(8,'A1122334');
insert into passenger1 values(9,'Q1243567');
insert into passenger1 values(10,'S1243269');
insert into passenger1 values(11,'E3277889');
insert into passenger1 values(12,'K3212322');
insert into passenger1 values(13,'P3452390');
insert into passenger1 values(14,'W7543336');
insert into passenger1 values(15,'R8990566');

--passenger2 table
create table passenger2(passportno varchar2(10) primary key,fname varchar2(20), m varchar2(20), lname varchar2(20), address varchar2(100), age int, sex varchar2(1));
insert into passenger2 values('A1234568','Alen','M','Smith','2230 Northside,APT 11,Albany,NY',30,'M');
insert into passenger2 values('B9876541','Archita','K','Gautam','168 sector-5,Trikuta Nagar,Jammu,India',19,'F');
insert into passenger2 values('C2345698','Tushar','T','Sharan','3456 Vikas Apts,Apt 102,Dombivli,India',24,'M');
insert into passenger2 values('D1002004','Bhavya','R','Gupta','345 Chatram courts,Apt 678,Mumbai,India',20,'F');
insert into passenger2 values('X9324666','Archita','T','Sharma','House no 52,Model Town,Bhatinda,India',40,'F');
insert into passenger2 values('B8765430','Robert','M ','Pratt','7720 Maccallum Blvd,Apt 2087,Dallas,TX',31,'M');
insert into passenger2 values('J9801235','Madhurya','N','Peram','Pragati Apts,Apt 09,Chennai,India',19,'F');
insert into passenger2 values('A1122334','Pranjal','A','Arora','Aanad Vihar,Apt 1230,Delhi,India',20,'F');
insert into passenger2 values('Q1243567','Aakarsh','K','Miglani','4444 Frankfurt Villa,Apt 77,Guilderland,NY',22,'M');
insert into passenger2 values('S1243269','Babu','M','Rao','1234 Baker Apts,Apt 59,Hesse,Germany',50,'M');
insert into passenger2 values('E3277889','Parush','M','Goel','6785 Splitsvilla,apt 34,Miami,FL',17,'M');
insert into passenger2 values('K3212322','Uday','K','Mazumdar','6666 Rock Hill,Apt 2902,Tampa,FL',41,'M');
insert into passenger2 values('P3452390','Sagar','U','Garg','3535 Vasant Kunj,Apt 102,Delhi,India',61,'M');
insert into passenger2 values('W7543336','John','A','Gates','7820 Mccallum courts,Apt 9900,Dallas,TX',34,'M');
insert into passenger2 values('R8990566','Jimin','K','Goel','123 IIlasam,Apt 23,San Francisco,CA',23,'M');

--passenger3 table
create table passenger3(PID int primary key, flight_code references flight(flight_code) on delete cascade);
insert into passenger3 values(1,'AI2014');
insert into passenger3 values(2,'LH9876');
insert into passenger3 values(3,'9W2334');
insert into passenger3 values(4,'QR1902');
insert into passenger3 values(5,'EY1234');
insert into passenger3 values(6,'BA3056');
insert into passenger3 values(7,'9W2334');
insert into passenger3 values(8,'AA4367');
insert into passenger3 values(9,'QR1902');
insert into passenger3 values(10,'EK3456');
insert into passenger3 values(11,'BA1689');
insert into passenger3 values(12,'QR1902');
insert into passenger3 values(13,'AI2014');
insert into passenger3 values(14,'BA1689');
insert into passenger3 values(15,'QR2305');


--EMPLOYEE1 TABLE
create table employee1(ssn int primary key, fname varchar2(20), m varchar2(1), lname varchar2(20), address varchar2(100), age int, sex varchar2(1), jobtype varchar2(30), AP_name references airport(AP_name) on delete cascade);
--adding age constraint 
alter table employee1 add constraint age_limit check(age<65);
--adding jobtype constraint 
alter table employee1 add constraint job1 check (jobtype in ('receptionist','secretary','radio engineer','traffic monitor','manager','civil engineer','data entry worker'));

insert into employee1 values('1','Ram','M','Sharma','731 Hill Town, Arlington, TX',30,'M','receptionist','Louisville International Airport');
insert into employee1 values('2','Linda','M','Goodman','731 Fondren, Housten, TX',35,'F','receptionist','Louisville International Airport');
insert into employee1 values('3','Johny','N','Paul','638 Voss, Housten, TX',40,'M','secretary','Louisville International Airport');
insert into employee1 values('4','James','P','Bond','3321 Castle, Spring, TX',50,'M','radio engineer','Louisville International Airport');
insert into employee1 values('5','Raja','M','Sharma',' 442 Chandni Chowk, Delhi, India',35,'M','civil engineer','Louisville International Airport');
insert into employee1 values('6','Nikita','C','Paul','110 Synergy Park,Dallas, TX',35,'F','traffic monitor','Louisville International Airport');
insert into employee1 values('7','Shubham','R','Gupta','334 Vitruvian Park,Albany ,NY ',56,'M','manager','Louisville International Airport');
insert into employee1 values('8','Aditi','R','Desai','987 Somnath, Chandigarh, India',36,'M','civil engineer','Louisville International Airport');
insert into employee1 values('9','Raj','B','Sharma','345 Floyds, Mumbai, India',36,'M','data entry worker','Louisville International Airport');
insert into employee1 values('10','Sheldon','A','James','345 Cherry Park, Hesse, Germany',55,'M','secretary','Louisville International Airport');

--EMPLOYEE2 TABLE
create table employee2(jobtype varchar2(30) primary key, salary int);
insert into employee2 values('receptionist',50000);
insert into employee2 values('radio engineer',70000);
insert into employee2 values('traffic monitor',80000);
insert into employee2 values('manager',90000);
insert into employee2 values('secretary',50000);
insert into employee2 values('civil engineer',70000);
insert into employee2 values('data entry worker',80000);

--SERVES TABLE
create table serves(ssn int, PID int, passportno varchar2(10), primary key(ssn, PID, passportno), foreign key(ssn) references employee1(ssn) on delete cascade, foreign key(PID, passportno) references passenger1(PID, passportno) on delete cascade);
insert into serves values(1,1,'A1234568');
insert into serves values(1,15,'R8990566');
insert into serves values(1,9,'Q1243567');
insert into serves values(2,4,'D1002004');
insert into serves values(3,13,'P3452390');
insert into serves values(3,10,'S1243269');
insert into serves values(2,12,'K3212322');
insert into serves values(3,12,'K3212322');
insert into serves values(1,7,'J9801235');
insert into serves values(2,7,'J9801235');

--TICKET1 TABLE
create table ticket1(ticket_number varchar2(13) primary key, source varchar2(3), destination varchar2(3), date_of_booking date, date_of_travel date, seatno varchar2(5), class varchar2(15), date_of_cancellation date, PID int, passportno varchar2(10), foreign key(PID, passportno) references passenger1(PID,passportno) on delete cascade);
--constraint to check dates of booking and travel 
alter table ticket1 add constraint check_my_date check(date_of_booking<date_of_travel);

insert into ticket1 values('0011234111','BOM','DFW','11-May-16','15-Dec-16','32A','Economy','','1','A1234568'); --COMMON FLIGHT
update ticket1 set date_of_booking='11-May-22', date_of_travel='15-Dec-22' where ticket_number='0011234111';

insert into ticket1 values('0987654321','JFK','BOM','09-May-22','14-Dec-22','20C','Business','','2','B9876541');
insert into ticket1 values('1234567890','IAH','DEL','13-Apr-22','09-Sep-22','1A','Economy','','3','C2345698');
insert into ticket1 values('1627384950','IXC','IAH','20-Apr-22','13-Oct-22','30A','First-class','','4','D1002004');
insert into ticket1 values('7826582057','JFK','TPA','21-May-22','21-Jul-22','54C','Economy','','5','X9324666');
insert into ticket1 values('1039476932','BOM','DWF','13-Apr-22','15-Dec-22','32A','Economy','','6','B8765430'); --COMMON FLIGHT, SAME SEAT 
insert into ticket1 values('0091827221','IAH','DEL','26-Jun-22','13-Dec-22','27B','Economy','','7','J9801235');
insert into ticket1 values('2233454323','SFO','FRA','09-Jul-22','18-Aug-22','45D','Business','','8','A1122334');
insert into ticket1 values('1234321232','IXC','IAH','14-Feb-22','19-Dec-22','33F','First-class','','9','Q1243567');
insert into ticket1 values('0011234123','BOM','SFO','10-Mar-22','13-Sep-22','45D','Economy','','10','S1243269');
insert into ticket1 values('0011333123','FRA','DEL','11-Apr-22','16-Sep-22','30A','Economy','','11','E3277889');
insert into ticket1 values('7765656434','IXC','IAH','20-May-22','20-Oct-22','1A','Economy','','12','K3212322');

insert into ticket1 values('9990987877','BOM','DFW','13-May-22','15-Dec-22','20A','Business','','13','P3452390'); --COMMON FLIGHT

insert into ticket1 values('6665676567','FRA','DEL','26-Jun-22','23-Dec-22','32C','First-class','','14','W7543336');
insert into ticket1 values('1312266731','BOM','DFW','11-Aug-22','15-Dec-22','3D','Economy','','15','R8990566'); --COMMON FLIGHT
insert into ticket1 values('1312266732','BOM','DFW','11-Aug-22','15-Dec-22','23A','Economy','','16','K8990566'); --COMMON FLIGHT

--TICKET2 TABLE
create table ticket2(date_of_booking date not null, source varchar2(3) not null, destination varchar2(15) not null, class varchar2(15) not null, price int, primary key(date_of_booking, source, destination, class));
insert into ticket2 values('11-May-22','BOM','DFW','Economy',95000);
insert into ticket2 values('09-May-22','JFK','BOM','Business',100000);
insert into ticket2 values('13-Apr-22','IAH','DEL','Economy',90000);
insert into ticket2 values('20-Apr-22','IXC','IAH','First-class',100000);
insert into ticket2 values('21-May-22','JFK','TPA','Economy',90000);
insert into ticket2 values('13-Apr-22','BOM','DFW','Economy',98000);
insert into ticket2 values('26-Jun-22','IAH','DEL','Economy',96000);
insert into ticket2 values('09-Jul-22','SFO','FRA','Business',125000);
insert into ticket2 values('14-Feb-22','IXC','IAH','First-class',140000);
insert into ticket2 values('10-Mar-22','BOM','SFO','Economy',120000);
insert into ticket2 values('11-Apr-22','FRA','DEL','Economy',98000);
insert into ticket2 values('20-May-22','IXC','IAH','Economy',45000);
insert into ticket2 values('13-May-22','BOM','DFW','Business',120000); 
insert into ticket2 values('26-Jun-22','FRA','DEL','First-class',100000);
insert into ticket2 values('11-Aug-22','BOM','DFW','Economy',65000);


--TICKET3 TABLE
create table ticket3(date_of_cancellation date primary key, surcharge int, ticket_number references ticket1(ticket_number));



--SELECT STATEMENTS 
select * from city;
select * from airport;
select * from airline;
select * from contains;
select * from flight;
select * from passenger1;
select * from passenger2;
select * from passenger3;
select * from employee1;
select * from employee2;
select * from serves;
SELECT * FROM TICKET1;
select * from ticket2;
select * from ticket3;



--PROCEDURES : 
--PROCEDURE : TO INSERT VALUES IN A TABLE (done)
CREATE OR REPLACE PROCEDURE Addticket3(doc in date,surcharge in int,tk_no in varchar2 )  --stored procedure? 
AS 
BEGIN
  INSERT INTO ticket3 VALUES (doc,surcharge,tk_no);
  dbms_output.put_line('Record Inserted');
END;

DECLARE
BEGIN
--ADDticket3('13-Oct-22',75000);
ADDticket3('21-Jun-22',25000,'0091827221');
END;
select * from ticket3;


--PROCEDURE- add new passenger
create or replace procedure add_passenger(p_id in int, passport_no in varchar2, firstn in varchar2, middlen in varchar2, lastn in varchar2, address in varchar2, age in int, sex in varchar2, flightcode varchar2) is
    
    begin
        --passenger1 update
        insert into passenger1 values (p_id, passport_no);
        --passenger2 
        insert into passenger2 values(passport_no, firstn, middlen, lastn, address, age, sex);
        --passenger3 update
        insert into passenger3 values(p_id,flightcode);
    
    end;


declare 
    passid int;
    passno varchar2(10);
    f_name varchar2(20);
    m_name varchar2(20);
    l_name varchar2(20);
    addr varchar2(100);
    passage int;
    passex varchar2(1);
    flightc varchar2(10);

begin
    passid:=25;
    passno:='PJ543336';
    f_name:= 'Khushi';
    m_name:= 'K.';
    l_name:='Bhatla';
    addr:='A-102, Karnal, Haryana';
    passage:=20;
    passex:='F';
    flightc:='AA4367';
    add_passenger(passid, passno, f_name, m_name, l_name, addr, passage, passex, flightc);
    dbms_output.put_line('Passenger added');
    
end;

select * from passenger1;
select * from passenger2;
select * from passenger3;



--Procedure to change travel date
create or replace procedure date_change(dot in date, tk_no in varchar2) is
    begin
        --updating travel date
        update ticket1 set date_of_travel=dot where ticket_number=tk_no;
        dbms_output.put_line('Travel date changed');
    end;

declare
    dot date;
    tk_no varchar2(13);
begin
    dot:='29-Sep-22';
    tk_no:='7826582057';
    date_change(dot, tk_no);
end;

select * from ticket1 where ticket_number='7826582057';




--Procedure :FLIGHT CANCELLATIONTRI
create or replace procedure flight_cancellation(tk_no in varchar2, price in int) is
    doc date;
    dob date;
    surcharge_amt int;
    begin 
        --updating cancellation date
        update ticket1 set date_of_cancellation=sysdate() where ticket_number=tk_no;
        select date_of_cancellation into doc from ticket1 where ticket_number=tk_no;
        update ticket3 set date_of_cancellation=doc where ticket_number=tk_no;
        
        --updating seatno to null
        update ticket1 set seatno=NULL where ticket_number=tk_no;
        
        --surcharge calculation 
        select date_of_booking into dob from ticket1 where ticket_number=tk_no;
        if to_char(to_date(doc),'DD')-to_char(to_date(dob),'DD') > 14 then 
            dbms_output.put_line('surcharge will be 50% of price');
            surcharge_amt:=0.5*price;
        else 
            dbms_output.put_line('surcharge will be 100% of price');
            surcharge_amt:=price;
        end if;
        
        --update surcharge in ticket1 and ticket3
        --update ticket1 set surcharge=surcharge_amt where ticket_number=tk_no;
        insert into ticket3 values (doc, surcharge_amt, tk_no);
        
    
    end;
            
declare
    tck_no varchar2(13);
    price int;
begin
    tck_no:='1234321232';--:&Enter_ticket_number;  --enter from admin
    select ticket2.price into price from ticket2,ticket1 where ticket1.ticket_number=tck_no and ticket1.date_of_booking=ticket2.date_of_booking and ticket1.source=ticket2.source and ticket1.destination=ticket2.destination and ticket1.class=ticket2.class ;
    flight_cancellation(tck_no, price);
end;

select * from ticket3;
select * from ticket1;


--Procedure to fire

create or replace procedure emp_fire(ssn_no in int) is
    begin 
        --deleting employee
        delete from employee1 where ssn=ssn_no;
        dbms_output.put_line('Employee Fired!');
    end;

declare
    ssn_no int;
begin
    ssn_no:=1;
    emp_fire(ssn_no);
end;

select * from employee1;

--EMP PROMO (done)
create or replace procedure emp_promo(ssn_no in int, job in varchar2) is
    begin
        --updating jobtype
        update employee1 set jobtype=job where ssn=ssn_no;
        dbms_output.put_line('Employee promoted!!!!!');
        
    exception
        when no_data_found then
            dbms_output.put_line('No record found');
        when too_many_rows then
            dbms_output.put_line('Too many rows returned, please check');
            
    end;
  
declare
    job varchar2(30);
    ssn_no int;
begin
    ssn_no:= 50; --&Enter_Serial_No_Employee
    job:='sec';  --&Enter_the_job_to_which_employee_needs_to_be_promoted
    emp_promo(ssn_no, job);

exception when others then
    dbms_output.put_line('There was some error, please check');
end;

select * from employee1;



--TRIGGERS 

--trigger : TO CHECK CANCELLATION LESS THAN 15 DAYS (done)
create or replace trigger check_cancellation_date
before insert or update on ticket1
for each row
begin
--select to_char(TO_DATE(:NEW.date_of_cancellation),'DD')from dual
if to_char(TO_DATE(:NEW.date_of_travel),'DD')-to_char(TO_DATE(:NEW.date_of_cancellation),'DD')<15 then
raise_application_error(-20000,'cancelling ticket before 15 days of date of flight not allowed');
end if;
end;


--UPDATING FOR THIS ENTRY :ticket1 values('0987654321','JFK','BOM','09-May-22','14-Dec-22','20C','Business','','2','B9876541');
update ticket1 set date_of_cancellation='13-Dec-22' where passportno='B9876541';

drop trigger check_cancellation_date;

--FUNCTIONS : 
--NEW AIRPORT
create or replace function new_airport(airport_name in varchar2, state_name in varchar2, country_name in varchar2, city_name in varchar2 ) return integer is
    airport_check integer;
    begin
        --inserting new airport
        insert into airport values(airport_name, state_name, country_name, city_name);
        airport_check:=1;
        return(airport_check);
        end;
        
declare
    airport_name varchar2(100);
    state_name varchar2(15);
    country_name varchar2(30);
    city_name varchar2(15);
    ap_check integer;
begin
    airport_name:='Patiala International Airport';
    state_name:='Punjab';
    country_name:='India';
    city_name:='Patiala';
    ap_check:=new_airport(airport_name, state_name, country_name, city_name);
    if ap_check>0 then
        dbms_output.put_line('airport successfully added');
    else
        dbms_output.put_line('airport not added');
    end if;
end;

select * from airport;




--
--create or replace procedure dfw_economy as 
--declare 
--cursor cur1 is 
--select al.AL_name, fl.flight_code, p2.fname, p2.lname, p2.passportno, t.class, t.date_of_travel, t.detination, t.source, t.seatno, t.ticket_number from airline al, flight f1, passenger1 p1, passenger2 p2, passenger3 p3, ticket1 t
--where al.airlineid=f1.airlineid
--and p1.PID=p3.PID
--and p1.passportno=p2.passportno
--and f1.flight_code=p3.flight_code
--and t.passportno=p2.passportno
--and t.class='economy' and t.destination='DFW';
--
--passdeatils ecopassdetails%rowtype 
--begin 
--for rec in cur1 loop 
--dbms_output.put_line(passdetails.AL

---

--CREATE OR REPLACE TRIGGER UPDATEDSalary AFTER
--  INSERT OR
--  UPDATE OF SALARY ON EMPLOYEE2
--  FOR EACH ROW;
--DECLARE 
--JOBTYPE EMPLOYEE2.JOBTYPE%TYPE
--BEGIN
--  CASE
--    WHEN (JOBTYPE= 'Administrative Support') THEN
--      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.10;
--    WHEN (JOBTYPE= 'ENGINEER') THEN
--      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.05;
--    WHEN (JOBTYPE= 'TRAFFIC MONITOR') THEN
--      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.25;
--    WHEN (JOBTYPE= 'AIRPORT AUTHORITY') THEN
--      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.45;
--  END CASE; 
--END;


------trigger : don;t give same seat to multiple people
create or replace trigger duplicate_seat
after insert or update on ticket1 
for each row
declare 
--cursor c1 is 
--select source,destination,date_of_travel,class,seactno from ticket1
begin
--for rec in c1 loop
if :OLD.source=:NEW.source and :OLD.destination=:NEW.destination and :OLD.date_of_travel=:NEW.date_of_travel and :OLD.class=:NEW.class and :OLD.seatno=:NEW.seatno then
raise_application_error(-20005,'seat number cannot be same');
end if;
end;

drop trigger duplicate_seat;
--insert into ticket1 values('1039476932','BOM','DWF','13-Apr-22','15-Dec-22','32A','Economy','','6','B8765430')
update  ticket1 set seatno = '23A' where ticket_number='1039476453';
select * from ticket1;
delete from ticket1 where ticket_number='1039476453';


--TRIGGER : TO SHOWCASE CHANGE IN STATUS OF FLIGHT (??)
create trigger delayed_flight
after update of status on flight 
for each row 
begin 
insert into delay_f(flight_code,  destination, airlineid, report_time) 
values (:NEW.flight_code, :NEW.destination, :NEW.airlineid, sysdate);
end;

create table delay_f(flight_code varchar(20),destination varchar2 (20),airlineid varchar2(20),report_time date);
update flight set status='delayed' where flight_code='AI2014';
select * from delay_f;   --showing the output

drop trigger delayed_flight;
drop table delay_f;


--TRIGGER FOR DUPLICATE SEAT NOS 
----TRIGGER : 
--create or replcae trigger duplicate_seatno
--before insert of seatno on ticket1 
--for each row
--declare 
--t ticket.seat_no%type;
--begin
--if :NEW.seat_no is NOT NULL then 
--    raise application_error(-20002,'unique attribute violation');
--    end if;
--end;

