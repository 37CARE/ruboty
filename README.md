# Ellen
A chatterbot framework, inspired by Hubot.

## Dependencies
* Ruby 1.9.3+

## Usage
```sh
$ gem install ellen                 # Install `ellen` gem to your local machine
$ ellen --help                      # Show usage with --help
Usage: ellen [options]
    -a, --adapter       Take adapter name.
        --dotenv        Load .env before running.
    -g, --generate      Generate a new chatterbot with ./ellen/ directory if specified.
    -l, --load          Load a ruby file before running.
    -h, --help          Display this help message.
$ ellen --generate                  # Generate your new chatterbot with ./ellen/ directory
$ cd ellen                          # Change to ./ellen/
$ vi Gemfile                        # Add your favorite plugin gems
$ bundle exec ellen --adapter=shell # Run your chatterbot with specified adapter
```

## Adapter
You can create your own favorite adapter from
[Ellen::Adpaters::Base](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/base.rb)
class with #run method. Please see the following real examples for more details.

* [Ellen::Adapters::Hipchat](https://github.com/r7kamura/ellen-hipchat/blob/master/lib/ellen/adapters/hipchat.rb)
* [Ellen::Adapters::Shell](https://github.com/r7kamura/ellen/blob/master/lib/ellen/adapters/shell.rb)

## Handler
You can create your own handlers to add new behaviors from
[Ellen::Handlers::Base](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/base.rb) DSL.

* [Ellen::Handlers::Help](https://github.com/r7kamura/ellen/blob/master/lib/ellen/handlers/help.rb)

## Bundler
All you need to use your favorite plugins is to write their names into Gemfile.
Ellen will load them before running.

```ruby
# Gemfile
gem "ellen-foo"
gem "ellen-bar"
gem "ellen-baz"
```

## Heroku
Here is the smallest example to deploy Ellen to Heroku.

```sh
$ ellen --generate
$ cd ellen
$ echo 'gem "ellen-my_adapter"' >> Gemfile
$ echo 'bot: bundle exec ellen --adapter my_adapter' >> Procfile
$ bundle install
$ git init
$ git commit -a -m "Initial commit"
$ heroku create
$ heroku scale bot=1
$ heroku config:set FOO=1 BAR=2 BAZ=3
$ git push heroku master
```
