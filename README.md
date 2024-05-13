# Voting System

Voting System is a platform which provides online voting. Candidate can create and remove their profiles. Voters can cast vote.
By the end of voting time votes will be counted and winner will be announced.

The setups steps expect following tools installed on the system.

- Ruby [2.7](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [5.2](https://github.com/organization/project-name/blob/master/Gemfile#L12)

##### 1. Create and setup the database

Postgres Database Used.
Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
bundle exec rake db:migrate
bundle exec rake db:seed
```

##### 2. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

##### 3. Dependencies

- Add gmail and cloudinary credentials to rails credential.

```ruby
Rails.application.credentials.gmail[:username]
Rails.application.credentials.gmail[:password]
Rails.application.credentials.cloudinary[:api_key]
Rails.application.credentials.cloudinary[:api_secret]
```

- Add cloud name to config/initiazers/cloudinary.rb
- Api_key, Api_secret are to be added as given as above after adding you credentials in rails credentials
- Add gmail username and password to config/production and config/development.

And now you can visit the site with the URL http://localhost:3000
