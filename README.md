[![Build Status](https://travis-ci.org/Matt-Warnock/quiz_master.svg?branch=master)](https://travis-ci.org/Matt-Warnock/quiz_master
)
[![Coverage Status](https://coveralls.io/repos/github/Matt-Warnock/quiz_master/badge.svg?branch=master)](https://coveralls.io/github/Matt-Warnock/quiz_master?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/928faf993ccf571770dc/maintainability)](https://codeclimate.com/github/Matt-Warnock/quiz_master/maintainability)
[![Dependency status](https://badges.depfu.com/badges/a5f9aa0eb83998a1a81f7b1298a0b4f8/overview.svg)](https://depfu.com/github/Matt-Warnock/quiz_master?project=Bundler)


# Readme

# quiz_master

A CLI app that asks multi-choice questions and keeps score.

## Interchangeable questions module

This app is currently designed to receive the questions and answers from a `Questions module`.
You replace the questions module `lib/questions.rb` to the project in this format:

```ruby
module Qestions
  SUBJECT = < questions subject string >
  FIRST = [< question string >, < answers array of strings >, < correct answer letter >].freeze
  SECOND = ect...
  ALL = [FIRST, SECOND, ect...].freeze
end
```
The questions module must included a **SUBJECT**, **ALL** and at least one question constants.
- **Answers array of strings** can be as long as you like (more than one) I recommend 4 - 5 answers.
- **Correct answer letter** needs to be the letter that represents the order of the correct_answer within the `< answers array of strings >`.\
For example:

```ruby
correct_answer = questions::FIRST[1][0]
# means correct answer letter is 'A'

correct_answer = questions::FIRST[1][2]
# means correct answer letter is 'C'

```

**ALL** is an array of all the question constants in module. It can be any amount of vaild question constants.


## How to use this project

This is a Ruby project. Tell your Ruby version manager to set your local Ruby version to the one specified in the `Gemfile`.

For example, if you are using [rbenv](https://cbednarski.com/articles/installing-ruby/):

1. Install the right Ruby version:
  ```bash
  rbenv install < VERSION >
  ```
1. Move to the root directory of this project and type:
  ```bash
  rbenv local 2.7.1
  ruby -v
  ```

You will also need to install the `bundler` gem, which will allow you to install the rest of the dependencies listed in the `Gemfile` file of this project.

```bash
gem install bundler
rbenv rehash
```

### Folder structure

* `bin `: Executable files
* `lib `: Source files
* `spec`: Test files


### To initialise the project

```bash
bundle install
```

### To run the app

Make sure that the `bin/app` file has execution permissions:

```bash
chmod +x bin/app
```

Then just type:

```bash
bin/app
```

If this doesn't work you can always do:

```bash
bundle exec ruby bin/app
```

## Tests


### To run all tests


```bash
bundle exec rspec
```


### To run a specific file


```bash
bundle exec rspec path/to/test/file.rb
```


### To run a specific test

```bash
bundle exec rspec path/to/test/file.rb:TESTLINENUMBER
```


### To run rubocop

```bash
bundle exec rubocop
```


### To run all tests and rubocop

```bash
bundle exec rake
```

## Badges

* Turn your repo ON in Travis (CI), in Coveralls (coverage status), codeclimate (maintainability), and depfu (dependency status).
* Update badges with your user/repo names.


## License

[![License](https://img.shields.io/badge/mit-license-green.svg?style=flat)](https://opensource.org/licenses/mit)
MIT License
