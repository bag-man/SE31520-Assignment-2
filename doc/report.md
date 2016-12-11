# SE31520 Assignment 2

## Cover Page
Owen Garland - owg1@aber.ac.uk - 0.1

## Introduction
This report details my progress with the Developing Internet-Based Applications CSA assignment. I will justify all of my design decisions as well as analysing how those decisions effected the project. 

## Architecture
The design and architecture of this project really wasn't up to me, the project is a standard rails project which means it is structured exactly as rails projects are always structured. When the project was initially given to me, the API endpoints were not abstracted away from the human web end points. This really isn't an issue, as it makes the development of an API quite intuitive for someone who is already familiar with the website. Simply add .json to the end of the resource that you want to get a .json feed. 

However there is no harm in abstracting the API endpoint out to a separate URI at /api/, this was done by creating a new set of controllers in an API sub-directory, and removing all of the API end points from the original controllers and moving them over to the new ones. 

### UML :( 


After that I moved the jbuilder views from the original views folder to the api folder so that the json could be built. I also had to add a new namespace to the routes file that directed requests to /api/ to the correct locations. 

Implementing ActionCable to this project was fairly straight forward, I simply had to read the documentation for how ActionCable should be implemented in a Rails project and add the necessary files and functions to my project. 

I found the implementation of ActionCable to be fairly poorly documented online however and it did take a while to find a resource that did provide enough of the information required. It was also very difficult when compared to Socket.IO which has a lot simpler implementation. 

Once I had the ActionCable successfully added to my project I ran into an issue where it wouldn't run correctly on the 'thin' webserver that the project had been setup to use. After a few hours of Googling I was able to determine that this was the issue and that switching to the 'puma' webserver would solve these issues. 

## RESTful client
This client was very simple, all it had to do was perform one GET and one POST request. I quickly developed a short python script that could perform these functions, then added in a minimal CLI using the docopt library. 

I chose to use python for this script as it is a language that I am more familiar with than Ruby, and for scripts this size python seems like a very popular choice as it is included in pretty much all major distributions and OS X.

## Cucumber tests
Feature driven tests were something rather new to me. I am very experienced in writing unit tests for web sites, and found the concept of a feature test quite counter intuitive. Unit tests are written to be atomic so that they can rule out all variables that might effect the output of the test. 

Feature tests are the opposite of this as they test a whole feature rather than a single function, I can see this being used as a smoke test before deployment to ensure that key features are working, this combined with passing unit tests would give you a very good indicator that the project was doing everything it should.

However I do not see cucumber tests as a valid substitute for unit tests at all. There were some unit tests given to us for the user class, however they didn't pass when they were given to us, nor were we instructed to fix them. 

## Screencast

## Flair

## Evaluation
I have been interested in developing web applications for many years and have spent my industrial year making NodeJS applications, so I felt that this module would be a good place for me to show my knowledge and expertise in this area. Unfortunately I didn't really get a long with Ruby, nor Rails. Both presented challenges to me, with Ruby itself I had issues understanding the syntax, it bothers me that some parts of the syntax are optional and other parts just seem like they were intended to confuse. this: :looks, like: json.

I have used frameworks that allow for scaffolding before and haven't been a fan. I like to know what I am creating and how it all links together. With some frameworks this isn't too much of a problem but I felt with Rails there was a lot of magic holding it all together, and it was really unclear how some files linked together unless you had intimate knowledge of how rails uses its file structure. This magic is always apparent and makes you feel rather helpless when it comes to debugging. I'm sure that if you learn how Rails works in detail then you will be able to make the most of this magic, but having something not work because a file wasn't named correctly is very frustrating. 


For this application the use of a relational database seemed to be a bad decision as well. It overcomplicates a very simple data structure. Having three tables to link the broadcasts and feeds could have been simplified a lot by just have a feeds field in the broadcast data structure. This would have meant easier and smaller queries, and creating the database in MongoDB would have suited this just fine. 

The CLI client was simple for me to make, I used docopt to create a nice user interface with minimal coding on my part. I have written many scripts that query RESTful API's before so it was really simple for me to implement. 
