# Instructions
Here are the steps to make this project works:

1- run `git clone https://github.com/AmrAdelKhalil/otlob_task.git`
2- run `bundle install`
3- run `rake db:setup` then `rake db:migration` then `rake db:seed`
4- run `rails server` to run the servers


#Available APIs

  Method   URI Pattern                 
1-  GET    /estates/paginate            
2-  POST   /estates/search                 
3-  POST   /estates         
4-  GET    /estates/:id           
5-  PUT    /estates/:id     
6-  DELETE /estates/:id   

#Info

* Ruby version: v2.4.2

* System dependencies: will_paginate gem, rspec

* Database creation: postgress

* How to run the test suite: `specs spec`
