# Jungle

A mini e-commerce application built with Ruby on Rails 4.2. Allows user to view products, add them to cart and checkout with a credit card. Used Rspec, Capybara and Poltergeist for testing.

## Screenshots

![Home Page](https://github.com/Omar-Irfan/jungle/blob/master/screenshots/Screenshot%20from%202021-06-02%2017-46-09.png?raw=true "Home Page")

![Product Details Page](https://github.com/Omar-Irfan/jungle/blob/master/screenshots/Screenshot%20from%202021-06-02%2017-47-32.png?raw=true "Product Details Page")

![Cart and Order](https://github.com/Omar-Irfan/jungle/blob/master/screenshots/Screenshot%20from%202021-06-02%2017-49-17.png?raw=true "Cart and Order")

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
