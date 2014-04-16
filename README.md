# Ellen
A chatterbot framework, inspired by Hubot.

## Dependencies
* Ruby 1.9.3+

## Adapter
You can create your own favorite adapter from
[Ellen::Adpaters::Base](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/base.rb)
class with #run method. Please see the following real examples for more details.

* [Ellen::Adapters::Shell](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/shell.rb)
* [Ellen::Adapters::Hipchat](https://github.com/r7kamura/ellen-hipchat)
* [Ellen::Adapters::Twitter](https://github.com/r7kamura/ellen-twitter)

## Handler
You can create your own handlers to add new behaviors from
[Ellen::Handlers::Base](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/base.rb) DSL.

* [Ellen::Handlers::Help](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/help.rb)
* [Ellen::Handlers::GoogleImage](https://github.com/r7kamura/ellen-google_image)

## Bundler
All you need to use your favorite plugins is to write their names into Gemfile.
Ellen will load them before running.

```ruby
# Gemfile
gem "ellen-foo"
gem "ellen-bar"
gem "ellen-baz"
```

## Config
Store config in envorinment variables.
They are easy to change between deploys without changing any code.
We recommend to put `.env` and run with `ellen --dotenv` option to manage them.

## Deploy
Here is the smallest example to deploy a simple chatterbot to Heroku.

```sh
$ gem install ellen
$ ellen --generate
$ cd ellen
$ echo 'gem "ellen-my_adapter"' >> Gemfile
$ echo 'bot: bundle exec ellen --adapter my_adapter' >> Procfile
$ bundle install
$ git init
$ git add .
$ git commit -m "Initial commit"
$ heroku create
$ heroku scale bot=1
$ heroku config:set FOO=1 BAR=2 BAZ=3
$ git push heroku master
```

## Screenshot
![](https://raw.githubusercontent.com/r7kamura/ellen/master/images/screenshot.png)
