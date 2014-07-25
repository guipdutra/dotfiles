alias srspec="SCREENSHOT=true rspec"
alias test="bundle exec rspec spec/business &&
            bundle exec rspec spec/controllers  &&
            bundle exec rspec spec/decorators  &&
            bundle exec rspec spec/enumerations  &&
            bundle exec rspec spec/helpers &&
            bundle exec rspec spec/importers &&
            bundle exec rspec spec/integrations &&
            bundle exec rspec spec/lib &&
            bundle exec rspec spec/models &&
            bundle exec rspec spec/views "
alias migrate_test_up="RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate"
alias amend="git commit --amend"
alias bi='bundle install'
alias nohup='cd /home/guilherme/Projects/Nohup/'
alias raise='cd /home/guilherme/Projects/Raise/'
alias artan='cd /home/guilherme/Projects/Artan/'
alias opens='cd /home/guilherme/Projects/Opensource/'
alias home='cd /home/guilherme/'
alias gad='git add .'
alias gpo='git push -u origin'
alias gc='git commit'
alias gco='git checkout'
alias pmaster='git co master && git pull origin master'
alias rmaster='git rebase master'
alias gd='git diff'
alias get='sudo apt-get install'
alias gg='git lg'
alias gst='git status'
alias vimrc='vim /home/guilherme/.vim/vimrc'
alias showvimrc='more /home/guilherme/.vim/vimrc'
alias aliases='vim /home/guilherme/.bash_aliases'
alias atest='autotest -fnc'
alias simfarm='dosbox /home/guilherme/Desktop/simfarm/simfarm/SIMFARM.EXE'
alias redis='cd /home/guilherme/redis-2.6.13/src/ && ./redis-server'
alias gitpr='hub pull-request'
alias dbdc='rake db:drop && rake db:create'
alias modftest='rspec `git list-branch-tests`'
alias server='RAILS_RELATIVE_URL_ROOT=/contabil bundle exec unicorn -p 3000'
alias up_services='bundle exec rake thinking_sphinx:start'
alias git_search='git rev-list --all | xargs git grep -F'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'
alias last_modified_files='git status -s | while read mode file; do echo $mode $file $(stat -c %y $file); done'
alias fix_mongo='sudo rm /var/lib/mongodb/mongod.lock && mongod --repair && sudo service mongodb start'
alias generate_tags='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

