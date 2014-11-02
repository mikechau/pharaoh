# PHARAOH

## Getting Started
### Set up
1. `git clone https://github.com/mikechau/pharaoh.git`
2. `cd pharaoh`
2.5 `git update-index --assume-unchanged app/assets/javascripts/rails-bundle.js`
3. `bundle install`
4.  Set up `application.yml` file (see example for details), set this up by doing `cp config/application.yml.example config/application.yml`
5.  Set up `database.yml` file, set this up by doing `cp config/database.yml.example config/database.yml` and filling in the appropriate details
6.  `rake db:create`
7. `rake db:migrate`
8. `rake db:seed`

```
rails c
```
### Setting up your test environment
1. `RAILS_ENV=test rake db:create`
2. `RAILS_ENV=test rake db:migrate`

### Starting the server

1. `guard`
2. `foreman start`

---
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
