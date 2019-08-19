# Himama App

Hi Mama is an app that allows  teachers check in and check out for time tracking management

## Installation

1) `git clone ...`
2) `cd himama-clocker`
3) `bundle install`
4) `rails s`


## How to Run the App

1) To visit home, URL is https://himama-clocker-app.herokuapp.com #GET
2) Sign Up with a Nick Name
3) Admin user should use the nickname `adminadmin` to login as an admin to the app

## How I approached this challenge 
* I tried to first understand the requirements
* I break the requirements down into smaller tasks in  form of user stories 
* At first I worked on the functionality to ensure it works as expected before working on the UI
* Test each functionality to ensure it works as expected 

## What Schema design did you use and why?

* I choose to create the Users table to only have fields that are related to users i.e. the first name, last name,user nick name(serves as username), password, is admin (to know if a user is an admin or not), login_status(to keep track of user logins/logouts) 

* I also created another separate table called clock_events to store/track the clock event logs of the user using the clock_in and the clock_out fields , this table is linked to the users table through a foreign key (user_id)

* The reason I chose the above schema is to have a separate clock_events table  only for clock records while users table is separately for user record, this will enhance data efficiency, normalisation and separation of concern 

* Another reason is because the association that exists between users and clock events is a one to many 1-M relationship i.e. a User can have many clock events


## If I was given another day
* Write unit tests using Rspec
* I would done some code refactoring
* Add more information/details about the events been created e.g. type of event, event name
* Authentication using a token based JWT
* Improve the UI


## If I was given a month 
* Look into how the app can be scaled with increasing users
* Work on the security 
* Work more on the UI and responsiveness
* Implement data caching using Redis



