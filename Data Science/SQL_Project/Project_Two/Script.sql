select "Country name", "Year", "Population aged 15 to 64 years" 
from population_and_demography pad2 
where cast ("Year" as int) >= 2015


select * 
from number_of_internet_users noiu 
where cast("Year" as int) >= 2015 


select *
from literacy_rate_adults lra 
where cast ("Year" as int) >= 2015


select *
from share_with_anxiety_disorders swad 
where cast ("Year" as int) >= 2015

select *
from number_with_anxiety_disorders_country nwadc 
where cast("Year" as int) >= 2015

select nwadc.entity ,nwadc.code 
from number_with_anxiety_disorders_country nwadc 
where nwadc.entity  like '%G20%'

---------------------------------------

delete 
from number_with_anxiety_disorders_country nwadc
where nwadc.entity  like '%G20%'
---------------------------------------------------------------------------------------------------------------------

-- population_and_demography : number_of_internet_users 
select "Country name" , pad2."Year" , "Population aged 15 to 64 years" , noiu."Year" , noiu."Number of Internet users"  
from population_and_demography pad2 
inner join number_of_internet_users noiu 
	on pad2."Country name"  = noiu.entity
	where pad2."Year"  = noiu."Year" 
	order by pad2."Year", noiu."Year" 

---------------------------------------------------------------------------------------------------------------------
-- Create New Table from population_and_demography pad2 : number_of_internet_users noiu 
create table Population_Over_Internet_User(
Country_Name varchar(100),
Year_ int,
Population_15_to_64_years bigint,
Number_of_Internet_User bigint
)

select *
from population_over_internet_user poiu 

insert into population_over_internet_user 
select "Country name" , pad2."Year" , "Population aged 15 to 64 years", noiu."Number of Internet users"  
from population_and_demography pad2 
inner join number_of_internet_users noiu 
	on pad2."Country name"  = noiu.entity
	where pad2."Year"  = noiu."Year" 
	order by pad2."Year", noiu."Year" 
	
	
--------------------------------------------------------------------------------------------------------------
	
-- "Literacy rate, adult total(% of people ages 15 and above)"  : share_with_anxiety_disorders 
select lra.entity, lra."Year", swad."Year" ,  lra."Literacy rate, adult total (% of people ages 15 and above)" , swad."Prevalence - Anxiety disorders - Sex: Both - Age: Age-standardi" 
from literacy_rate_adults lra 
inner join share_with_anxiety_disorders swad
	on lra.entity  = swad.entity  
	where lra."Year" = swad."Year"


------------------------------------------------------------------------------------------------------------

-- population_and_demography Over literacy_rate_adults 
	select pad2."Country name" , pad2."Year" , pad2."Population aged 15 to 64 years" , 
	lra.entity , lra."Year", lra."Literacy rate, adult total (% of people ages 15 and above)",
	(pad2."Population aged 15 to 64 years" * lra."Literacy rate, adult total (% of people ages 15 and above)" )/100 as Percentage
	from population_and_demography pad2 
	inner join literacy_rate_adults lra 
		on pad2."Country name" = lra.entity 
		where pad2."Year" = lra."Year" 
		

-- Create New Table population_and_demography Over Literacy_rate_adults
create table Population_over_Literacy_Adults (
Country_Name varchar (150),
Year_ int,
Population_15_to_64_years bigint,
Literacy_Rate_Adults_persen_of_Population float,
Population_over_Literacy float
)

select *
from population_over_literacy_adults pola 

insert into population_over_literacy_adults 
select pad2."Country name" , pad2."Year" , pad2."Population aged 15 to 64 years" , 
lra."Literacy rate, adult total (% of people ages 15 and above)",
(pad2."Population aged 15 to 64 years" * lra."Literacy rate, adult total (% of people ages 15 and above)" )/100 as Percentage
from population_and_demography pad2 
inner join literacy_rate_adults lra 
	on pad2."Country name" = lra.entity 
	where pad2."Year" = lra."Year" 

-----------------------------------------------------------------------------------------------------------------------	

-- Population of Adult Literacy Rate Over Number of Internet user 
select pola.country_name, pola.year_, pola.population_over_literacy, poiu.year_, poiu.number_of_internet_user, 
(poiu.number_of_internet_user/pola.population_over_literacy)*100 as Percentage_of_PoLa_Over_NIU
from population_over_literacy_adults pola
inner join population_over_internet_user poiu 
	on pola.country_name  = poiu.country_name 
	where pola.year_  = poiu.year_  
	
create table Percentage_of_Pola_Over_Niu (
country_name varchar (150),
Year_of int,
Percentage_of_Pola_Over_Niu_Persen float
)


select *
from percentage_of_pola_over_niu popon 

insert into percentage_of_pola_over_niu 
select pola.country_name, pola.year_, (poiu.number_of_internet_user/pola.population_over_literacy)*100 as Percentage_of_PoLa_Over_NIU
from population_over_literacy_adults pola
inner join population_over_internet_user poiu 
	on pola.country_name  = poiu.country_name 
	where pola.year_  = poiu.year_ 
	
------------------------------------------------------------------------------------------------------------------------

-- Population of Adult Literacy Rate who was Internet of User Over Number with Anxiety disorder/country 
select *
from number_with_anxiety_disorders_country nwadc 

alter table number_with_anxiety_disorders_country 
drop column code

select *,(popon.percentage_of_pola_over_niu_persen*nwadc."Prevalence - Anxiety disorders - Sex: Both - Age: All Ages (Num") as OverAll
from percentage_of_pola_over_niu popon 
inner join number_with_anxiety_disorders_country nwadc 
	on popon.country_name  = nwadc.entity 
	where popon.year_of  = nwadc."Year" 

------------------------------------------------------------------------------------------------------------------------------

--	FINAL DATA
create table Anxiety_Disorder_Data (
country_name varchar (150),
year_of int,
percentage_of_pola_over_niu_persen float,
Prevalence_Anxiety_Disorders float,
Anxiety_Disorder_Data_Overall float
)

select *
from anxiety_disorder_data add2 

insert into anxiety_disorder_data 
select country_name, year_of, percentage_of_pola_over_niu_persen, nwadc."Prevalence - Anxiety disorders - Sex: Both - Age: All Ages (Num" ,(popon.percentage_of_pola_over_niu_persen*nwadc."Prevalence - Anxiety disorders - Sex: Both - Age: All Ages (Num") as OverAll
from percentage_of_pola_over_niu popon 
inner join number_with_anxiety_disorders_country nwadc 
	on popon.country_name  = nwadc.entity 
	where popon.year_of  = nwadc."Year" 
