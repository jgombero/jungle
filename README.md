# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


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

## Project Goals

The goal of this project was to learn a new language and framework (in this case Ruby/Rails), in a short period of time, to simulate a real-life scenario where you are hired as a junior developer using a language you aren't familiar with. We inherited an already almost complete app, and were sent "tickets" to fix minor bugs and to implement new features and enhancements. The bugs and features included...

Bugs:
- Missing Admin Security -> User must enter HTTP auth login/password to access admin functionality.
- Checking Out with Empty Cart -> When the cart is empty and the user goes to the carts#show page, instead of displaying the contents and a stripe checkout button, display a friendly message about how it is empty and link to the home page.

Features:
- Sold Out Badge -> When a product has 0 quantity, a sold out badge should be displayed on the product list page.
- Admin Categories -> Admin users can list and create new categories. Admins can add new products using the new category. Restful routes (resources) should be used, and there should be no extra, unused routes exposed.
- User Authentication -> As a Visitor I can go to the registration page from any page in order to create an account. As a Visitor I can sign up for a user account with my e-mail, password, first name and last name. As a Visitor I can sign in using my e-mail and password. As a User I can log out from any page. As a User I cannot sign up with an existing e-mail address (uniqueness validation). Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem.

Enhancements:
- Order Details Page -> The order page contains items, their image, name, description, quantities and line item totals. The final amount for the order is displayed. The email that was used to place the order is displayed. As a Visitor I can place an order (i.e. without logging in and therefore without an e-mail address). The original functionality from the inherited code (even though it is not realistic) should therefore not be suppressed.
