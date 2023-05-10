/*
1st Project - SQL Data Exploration (1/4)
*/

select *
from PortfolioProject.dbo.CovidDeath
order by 3,4



-- select Data that we are going to be using
select *
from PortfolioProject.dbo.CovidDeath
order by 1,2



-- Looking at Total Cases vs Total Deaths
select location, date, total_cases, total_deaths, 
	coalesce (convert(float, PortfolioProject.dbo.CovidDeath.total_deaths)/nullif(
			  convert (float, PortfolioProject.dbo.CovidDeath.total_cases),0), 0)*100 
			as Result
from PortfolioProject.dbo.CovidDeath 
where location like '%Indo%'
order by 1,2



-- Looking at Total Cases vs Population
select location, date, total_cases, population, 
	coalesce (convert(float, PortfolioProject.dbo.CovidDeath.total_cases)/nullif(
			  convert (float, PortfolioProject.dbo.CovidDeath.population),0), 0)*100 
			as Result
from PortfolioProject.dbo.CovidDeath 
where location like '%Indonesia%'
order by 1,2



-- Looking at Countries with Highest Infection Rate Compared to Population
select location, PortfolioProject..CovidDeath.population, max(total_cases) as HighestInfection, 
		max(coalesce(convert(float, PortfolioProject.dbo.CovidDeath.total_cases)/nullif(
					 convert (float, PortfolioProject.dbo.CovidDeath.population),0),0))*100
		as Result
from PortfolioProject.dbo.CovidDeath 
--where location like '%Indonesia%'
group by location, population
order by Result desc



-- Showing Countries with Highest Death Count per Population
select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeath
where continent is not null
group by location
order by TotalDeathCount desc



-- LET'S BREAK THINGS DOWN BY CONTINENT


-- Showing Continents with the Highest Death Count per Population
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeath
where continent is not null
group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS
select  sum(cast(new_cases as bigint)) as new_total_case, 
		sum(cast(new_deaths as bigint)) as new_total_deaths, 
		sum(cast(new_deaths as float))/nullif(sum(cast(new_cases as float)),0)*100 as NewDeathPercentage
from PortfolioProject..CovidDeath
--where location like 'Indonesia'
where continent is not null
--group by location, date
order by 1,2


-- Total Cases vs Total Deaths
select date, total_cases, total_deaths, 
	coalesce (convert(float, PortfolioProject.dbo.CovidDeath.total_deaths)/nullif(
			  convert (float, PortfolioProject.dbo.CovidDeath.total_cases),0), 0)*100 
			as Result
from PortfolioProject.dbo.CovidDeath 
where continent is not null
group by date, total_cases, total_deaths
--where location like '%Indonesia%'
order by 1,2



-- New Cases vs New Deaths
select location, date, sum(cast(new_cases as int)) as new_total_case, 
		 	sum(cast(new_deaths as int)) as new_total_deaths, 
			sum(cast(new_deaths as float))/
			nullif(sum(cast(new_cases as float)),0)*100 as NewDeathPercentage
from PortfolioProject..CovidDeath
--where location like 'Indonesia'
where continent is not null
group by location, date
order by 1,2



-- Looking at Total Population vs Vaccinations
select CD.continent, CV.location, CD.date, CD.population, CV.new_vaccinations,
		sum(convert(bigint, CV.new_vaccinations)) 
			over (partition by CD.location order by CD.location, CD.date) as RollingPeopleVaccinated
			-- (RollingPeopleVaccinated/Population)*100
from PortfolioProject..CovidDeath as CD
join PortfolioProject..CovidVaccination CV
	on CD.location = CV.location
	and CD.date = CV.date
where CD.continent is not null
order by 2,3


--CTE
with PopvsVac(continent, location, date, population,new_vaccinations, RollingPeopleVaccinated) as
(
select CD.continent, CV.location, CD.date, CD.population, CV.new_vaccinations,
		sum(convert(bigint, CV.new_vaccinations)) 
			over (partition by CD.location order by CD.location, CD.date) as RollingPeopleVaccinated
			-- (RollingPeopleVaccinated/Population)*100
from PortfolioProject..CovidDeath as CD
join PortfolioProject..CovidVaccination CV
	on CD.location = CV.location
	and CD.date = CV.date
where CD.continent is not null
--order by 2,3
)

select *, (cast(RollingPeopleVaccinated as float)/cast(Population as float))*100
from PopvsVac


-- Temp Table
drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

insert into #PercentPopulationVaccinated
select CD.continent, CV.location, CD.date, cast(CD.population as bigint), cast(CV.new_vaccinations as bigint),
		sum(convert(bigint, CV.new_vaccinations)) 
			over (partition by CD.location order by CD.location, CD.date) as RollingPeopleVaccinated
			-- (RollingPeopleVaccinated/Population)*100
from PortfolioProject..CovidDeath as CD
join PortfolioProject..CovidVaccination as CV
	on CD.location = CV.location
	and CD.date = CV.date
--where CD.continent is not null
--order by 2,3


select *, (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated
where Location like '%Azer%'


-- Create View to store data for later visualizations
create view PercentPopulationVaccinated as
select CD.continent, 
		CV.location, 
		CD.date, 
		cast(CD.population as bigint) as Population, 
		cast(CV.new_vaccinations as bigint) as New_Vaccinations,
		sum(convert(bigint, CV.new_vaccinations)) over (partition by CD.location order by CD.location, CD.date) as RollingPeopleVaccinated,
		(sum(convert(float,CV.new_vaccinations)) over (partition by CD.location order by CD.location, CD.date)/ cast(CD.population as float))*100 as PercentPopulationVaccinated
from PortfolioProject..CovidDeath as CD
join PortfolioProject..CovidVaccination as CV
	on CD.location = CV.location
	and CD.date = CV.date
where CD.continent is not null
--order by 2,3


select *
from PercentPopulationVaccinated
