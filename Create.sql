create table Donor(
donorid int not null,
donationtype varchar(60) not null,
contactinfo varchar(100) not null,
name varchar(120) not null,
fname varchar(60) not null,
lname varchar(60) not null,
primary key (donorid))

create table Donation(
donationid int not null,
date date not null,
itemtype varchar(60) not null,
quantity numeric(4,2) not null,
donorid int not null,
primary key(donationid),
foreign key (donorid) references Donor(donorid))

create table Distribution(
distributionid int not null,
quantity numeric(3,2) not null,
distributiondate date not null,
primary key(distributionid))

create table Recipient(
recipientid int not null,
fname varchar(60) not null,
lname varchar(60) not null,
name varchar(120) not null,
contactinfo varchar(120) not null,
householdsize int not null,
eligibilitystatus char(1) not null,
distributionid int not null,
constraint valid_eligibility check(eligibilitystatus in('Y','N')),
primary key (recipientid),
foreign key (distributionid) references Distribution (distributionid))

create table Inventory(
itemid int not null,
expirationdate date,
distributionid int not null,
donationid int not null,
primary key(itemid),
foreign key (donationid) references Donation(donationid))

ALTER TABLE Distribution 
ADD itemid int not null
ALTER TABLE Distribution 
ADD FOREIGN KEY (itemid) REFERENCES Inventory(itemid);

create table volunteer(
volunteerid INT not null,
name varchar(120) not null,
fname varchar(60) not null,
lname varchar(60) not null,
contactinfo varchar(120) not null,
availability varchar (120) not null,
primary key (volunteerid))

create table Donation_Campaign(
campaignid int not null,
name varchar(120) not null,
startdate date not null,
enddate date not null,
targetgoal numeric(5,2),
targetcollected numeric(5,2),
duration int not null,
donationid int not null,
volunteerid int not null,
primary key (campaignid),
foreign key (donationid) references Donation(donationid),
foreign key (volunteerid) references Volunteer(volunteerid))
create table Event(
eventid int not null,
name varchar(120) not null,
date date not null,
location varchar(120) not null,
campaignid int not null,
volunteerid int not null,
primary key (eventid),
foreign key (campaignid) references Donation_Campaign(campaignid),
foreign key (volunteerid) references Volunteer(volunteerid))

