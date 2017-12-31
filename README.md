# Instructions
Here are the steps to make this project works:

* run `git clone https://github.com/AmrAdelKhalil/otlob_task.git`
* run `bundle install`
* run `rake db:setup` then `rake db:migration` then `rake db:seed`
* run `rails server` to run the servers


**Available APIs**

  Method   URI Pattern                 
*  GET    `/estates/paginate`           
*  POST   `/estates/search `                
*  POST   `/estates`         
*  GET    `/estates/:id`           
*  PUT    `/estates/:id`     
*  DELETE `/estates/:id`   

**Info**

* Ruby version: v2.4.2

* System dependencies: will_paginate gem, rspec

* Database creation: postgress

* How to run the test suite: `specs spec`
