# Multitenant Rails application
A sample Rails application to create accounts based on subdomains (multi-tenancy) thanks to the `gem apartment`. **All tenants are separated in postgreSQL schemas.**

### Requirements
- Rails 4.2.5
- PostgreSQL
- Launchy (needed for `gem letter_opener` if I remember well...)

### Usage
- Install required gems
> `bundle install`
- Create DBs
> `bundle exec rake db:create`
- And create DBs structure
> `bundle exec rake db:migrate`
- Start the Rails server
> `bundle exec rails s`

Visit [http://lvh.me:3000/](http://lvh.me:3000/) and you are done =)

### Credits
**Ryan Boland** ( [Website](https://ryanboland.com) / [Github](https://github.com/bolandrm) )