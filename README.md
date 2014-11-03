# PHARAOH
## STATUS
- [ ![Codeship Status for mikechau/pharaoh](https://codeship.io/projects/919a6a40-44b9-0132-1b8a-32378b856677/status)](https://codeship.io/projects/44859)

- [![Code Climate](https://codeclimate.com/github/mikechau/pharaoh/badges/gpa.svg)](https://codeclimate.com/github/mikechau/pharaoh)

- [![Test Coverage](https://codeclimate.com/github/mikechau/pharaoh/badges/coverage.svg)](https://codeclimate.com/github/mikechau/pharaoh)

- [![Coverage Status](https://coveralls.io/repos/mikechau/pharaoh/badge.png?branch=master)](https://coveralls.io/r/mikechau/pharaoh?branch=master)


## Requirements
- Ruby 2.1.4
- Postgres 9.3+
- Rails 4.1+
- NodeJS 0.10.x+
- npm, webpack, shrinkwrap

## Getting Started
### Set up
1. `git clone https://github.com/mikechau/pharaoh.git`
2. `cd pharaoh`
3. `git update-index --assume-unchanged app/assets/javascripts/rails-bundle.js`
4. `bundle install`
5. `rake setup_config:init` - generates `application.yml` and `database.yml`
6. `rake db:create`
7. `rake db:migrate`
8. `rake db:seed`
9. `npm install`

### Installing npm dependencies
1. `sudo npm install -g webpack`
2. `sudo npm install -g npm-check-updates`
3. `sudo npm install -g npm-shrinkwrap`

### Setting up your test environment
1. `RAILS_ENV=test rake db:create`
2. `RAILS_ENV=test rake db:migrate`

### Starting the server

1. `guard`
2. `foreman start` - Requires NodeJS, otherwise just do `rails s`.

### Updating Node Dependencies
1. `rm -rf node_modules`
2. `npm-check-updates -u`
3. `npm install`
4. `npm shrinkwrap`

## GIT WORKFLOW
#### Initial Setup
0. Configure your git with `git config --global push.default simple` so you only push your current branch!
1. `git checkout -b feature/name-of-your-feature`
2. `git pull --rebase origin master`
3. `git add .` and `git commit -m "msg"` - Add & Commit your changes, often
5. `git pull` before commiting any changes!
4. `git push origin feature_branch_name` - you only need to do this once! After that you can just do `git push`

#### Rebasing notes
1. Rebase your changes into nice commits
2. `git rebase -i HEAD~#` replace # with the number of commits you are ahead of the master branch by
3. The first commit should have `pick`, change the commits following it to `squash`
4. Save and then when you are entering your comments
5. Add a comment to the the top that summarizes everything you did, comment out the old comments if it makes sense to do so
6. Do a pull request when you are ready for your changes to be merged into master

#### NOTES
1. Name feature branches as: `feature/name`
2. Ensure tests pass before pushing

## Vagrant
- https://github.com/uberarchitects/vagrant-boxes

## Guides Referenced
- [ Fast Rich Client Rails Development With Webpack and the ES6 Transpiler](http://www.railsonmaui.com/blog/2014/10/02/integrating-webpack-and-the-es6-transpiler-into-an-existing-rails-project/)
- [React Webpack Rails Tutorial Repo](https://github.com/justin808/react-webpack-rails-tutorial)

### Special Thanks
- [Justin Gordan](https://github.com/justin808)

License MIT. 2014.