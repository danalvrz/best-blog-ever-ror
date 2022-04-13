# Best Blog Ever

This is the best blog app ever app, it was build with love using RoR.

## Built With

- Ruby
- Rails
- PostgresSQL
- Tailwind CSS

## Getting Started

To get a local copy up and running follow the steps below.

### Prerequisites
- Ruby
- Rails

### Setup
- `git clone` this repo
- `cd` into the generated directory
- Run `bundle install`
- Run `rails db:create` 
- Run `rails db:migrate` 
- Run `rails s` 
Note: In case this doesn't work, try `rails db:drop` and do the steps all over again

### Install
- Run `bundle install` to install all the necessary dependencies
  
### Tests

- Open a terminal and cd into the project folder.
- Run `rspec ./spec/controllers/users_spec.rb`
- Run `rspec ./spec/controllers/posts_spec.rb`

### Usage
- Run `rails s` to expose a local webserver

### Sending emails
To test for emails sign up for FREE with [Mailtrap.io](https://mailtrap.io/). 
Once signed up, copy your email configuration details for mailtrap and configure them in your `config/credentials.rb` file. Please see example below.

`ActionMailer::Base.smtp_settings = {`<br>
  `:user_name => '<as_provided_by_mailtrap>',`<br>
  `:password => '<as_provided_by_mailtrap>',`<br>
  `:address => 'smtp.mailtrap.io',`<br>
  `:domain => 'smtp.mailtrap.io',`<br>
  `:port => '2525',`<br>
  `:authentication => :cram_md5`<br>
`}`<br>

## Author

👤 **Dante Alvarez**

- GitHub: [@danalvrz](https://github.com/danalvrz)
- Twitter: [@danalvrz](https://twitter.com/danalvrz)
- LinkedIn: [Dante Alvarez](https://www.linkedin.com/in/dante-alvarez-p/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/danalvrz/best-blog-ever-ror/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.