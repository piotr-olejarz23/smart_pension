# RubyApp

Quick implementation of task from smart pension:

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
e.g.: ./parser.rb webserver.log

b. Returns the following:

list of webpages with most page views ordered from most pages views to less page views
e.g.:
/home 90 visits /index 80 visits etc... 

list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views
/index 5 unique views etc...

## Installation

    $ bundle install

## Usage

To run application -> ```ruby ./parser.rb webserver.log```

## Testing

To execute test, simple run ```rspec``` in project directory.

## Improvements

- We can save the result of this to csv file, for example - each table would download separate csv file
- Create another list of most used IP adresses
  
