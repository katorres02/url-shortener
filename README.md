# README

steps to get the application up and running.

* clone the repository
  
  ```$ git clone git@github.com:katorres02/url-shortener.git```

* Install gems and dependencies
  ```$ cd url-shortener```
  ```$ bundle install```
 
* Create database and populate data
  
  ```$ rake db:create db:migrate db:seed```

* You need to get installed redis before start testing this project

* Start redis-server in a new terminal
  
  run ```$ redis-server```

* Start sidekiq in a new terminal

  run ```$ bundle exec sidekiq```

* Start project in a new terminal

  run ```$ rails s```
  
* Run tests

  run ```$ rspec spec```

## Getting Started

### Generate short url
  
  curl -X POST -d "url=URL_TO_GET_SHORT" http://localhost:3000/generator.json
  
  curl -X POST -d "url=https://www.facebook.com" http://localhost:3000/generator.json
  
  response: 
  
  ```{ "response": { "url":"3Ai8G", "status":"ok" } }```

### Retrive original url

  curl -X GET http://localhost:3000/generator/TOKEN_SHORT_URL.json
  
  curl -X GET http://localhost:3000/generator/3Ai8G.json
  
  response: 
  
  ```{ "url": "https://www.facebook.com" }```
  
### Retrive top 100 urls
  curl -X GET http://localhost:3000/generator/top.json
  
  response:
  
  ```[{"id":null,"original_url":"https://www.huffingtonpost.com/","shorten_url":"jtceN","visits":9},{"id":null,"original_url":"https://www.issuu.com/","shorten_url":"ogV9F","visits":9},{"id":null,"original_url":"https://www.wikipedia.org/","shorten_url":"l2Rt0","visits":9},.....]```
  
  Or you can visit in the brower http://localhost:3000/generator/top
  
  
  ### Redirecting
  
  Using a browser do a request to http://localhost:3000/generator/3Ai8G rember replace the right token. The app should redirect to the original_url

## Algorithm used

basically I used a 6-digit alphanumeric combination

```
source ||= ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
token = source.sample(TOKEN_LENGTH).join
validate token in case already exists, in that case generate a new one and repeat process
```

## 100 top url table

Remember to visit http://localhost:300/generator/top  to see the table with most visited urls
