-- Create and use minimumwagesGun_db
drop database minimumwagesGun_db;
CREATE DATABASE MinimumwagesGun_db;
USE MinimumwagesGun_db;
drop table new_data;
-- Create tables for raw data to be loaded into
CREATE TABLE new_data(
state text not null,
  name text not null,
  manner_of_death text not null,
  armed text not null,
  age int not null,
  gender text not null,
  race text not null,
  city text not null,  
  year int not null
); 

drop table minimum_wage;
CREATE TABLE minimum_wage( 
	state text not null,
    Year_ int not null,
    `High.Value` text not null,
    `Low.Value` int not null,
    `CPI.Average` int not null
);
  

-- Showing different tables
select*from minimum_wage1;
select*from new_data1;

-- Joining Tables

select minimum_wage1.Year, minimum_wage1.state, minimum_wage1.`High.Value`, minimum_wage1.`Low.Value`, 
minimum_wage1.`CPI.Average`, new_data1.name, new_data1.manner_of_death,new_data1.gender
FROM new_data1
JOIN minimum_wage1
on minimum_wage1.state=new_data1.state;

-- Inquiry on Type of Manner of death
select manner_of_death, Count(manner_of_death) as `Total Per Group`
from new_data1
group by manner_of_death;

-- Inquiry on type of armed
select armed, Count(armed) as `Total Per Group1`
from new_data1
group by armed
order by `Total Per Group1` DESC;

-- TOP State WITH MORE KILLINGS to the Low
select state, Count(armed) as `Total Per Group2`
from new_data1
group by state 
order by `Total Per Group2` desc limit 5;

-- List of people Kill by Gun in Order Alphabetic
select name , state, armed
from new_data1 
where armed = 'gun'
order by name asc; 

-- Top 5 High Minimum wages per state in 2015
select state,`High.Value`
from minimum_wage1 
where Year=2015
order by `High.Value` desc
limit 5;

-- Top 5 High Minimum wages per state in 2016
select state,`High.Value`
from minimum_wage1  
where Year=2016 
order by `High.Value` desc limit 5;

-- Top 5 States with higher minimum Wage
select state, `Low.Value`, `high.Value`
from Minimum_wage1
where Year=2015
group by `High.value` desc
Limit 5;

select
state, `Low.Value`, `high.Value`
from Minimum_wage1
where Year=2016
group by `High.value` desc
Limit 5;

-- Minimum wage versus top States with more killings
select new_data1.state, minimum_wage1.`High.Value`, count(new_data1.armed)
from new_data1
join minimum_wage1 
on new_data1.state=minimum_wage1.state
where new_data1.Year=2015
group by state 
order by count(armed) desc limit 5;

















