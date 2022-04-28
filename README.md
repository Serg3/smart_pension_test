## Description
This wonderful log analyzer was created as a test task for Smart Pension.

## Download application
* SSH: `git clone git@github.com:Serg3/sp_test.git`

OR
* HTTPS: `git clone https://github.com/Serg3/sp_test.git`

## Requirements
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (3.1.1)
* [Bundler](http://bundler.io/) for Ruby, a dependency manager

#### Before start
* `cd sp_test`
* `bundle install`
* a file `*.log` is required (file format example already included in ['inbox'](https://github.com/Serg3/sp_test/tree/master/inbox) folder)

## Running the app

`ruby app/main.rb inbox/webserver.log`

#### Console output:

```
Descending URLs visits:
"/about/2 has 90 visits."
"/contact has 89 visits."
"/index has 82 visits."
"/about has 81 visits."
"/help_page/1 has 80 visits."
"/home has 78 visits."
-----------------------
Descending unique entries:
"/contact has 23 visits."
"/help_page/1 has 23 visits."
"/home has 23 visits."
"/index has 23 visits."
"/about/2 has 22 visits."
"/about has 21 visits."
```

### Github actions (CI)
* reek
* rubocop
* rspec
