# Best Blog Ever

This is the best blog app ever app, it was build with love using RoR.

## Built With

- Ruby
- Ruby on Rails
- Tailwind CSS
- PostgreSQL


## Getting Started

1. Clone the project using `git clone`.
2. Open the project folder with VSCode or any Editor.
3. Open terminal and navigate to the project folder.
4. Run `bundle install`.
5. Run `rails db:migrate`.
6. Run `rails db:create`.
7. Run `bundle exec rake assets:precompile`
8. Run `rails s`.

### Email confirmation

To test for email confirmation sign up for FREE with [Mailtrap.io](https://mailtrap.io/). 
Once signed up, copy your email configuration details for mailtrap and configure them in your `config/environment.rb` file. Please see example below.

`ActionMailer::Base.smtp_settings = {`<br>
  `:user_name => '<as_provided_by_mailtrap>',`<br>
  `:password => '<as_provided_by_mailtrap>',`<br>
  `:address => 'smtp.mailtrap.io',`<br>
  `:domain => 'smtp.mailtrap.io',`<br>
  `:port => '2525',`<br>
  `:authentication => :cram_md5`<br>
`}`<br>


## Tests

1. Open a terminal and `cd` into the project repository.
2. Run `rspec ./spec/requests/users_request_spec.rb`.
3. Run `rspec ./spec/requests/posts_request_spec.rb`.


## Author

👤 **Dante Alvarez**

- GitHub: [@danalvrz](https://github.com/danalvrz)
- Twitter: [@danalvrz](https://twitter.com/danalvrz)
- LinkedIn: [Dante Alvarez](https://www.linkedin.com/in/dante-alvarez-p/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues).

## 👏 Show your support

Give a ⭐️ if you like this project!

## 📝 License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
