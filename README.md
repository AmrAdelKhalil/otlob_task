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

**Params**

* Create and Update  
`{
  estate: {
    street: "51 OMAHA CT", city: "SACRAMENTO", zip: "90823", state: "CA", beds: 3, baths: 1, sq_ft: 1167.0, estate_type: "Residential", sale_date: "2008-05-21", price: 68212.0, latitude: 38.478902, longitude: -121.431028
  }
}`
* Paginate
`{
  page: 1,
  per_page: 5 #default is 15
}`
*Search
`{
    {
      type: "",
      price: {
        "low": Float,
        "high": Float
      },
      sq_ft: {
        "low": Float.
        "high": Float
      }
    }
}`

**Info**

* Ruby version: v2.4.2

* System dependencies: will_paginate gem, rspec

* Database creation: postgress

* How to run the test suite: `specs spec`
