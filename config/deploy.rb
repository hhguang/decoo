#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'bundler/capistrano'

default_run_options[:pty] = true

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))  

require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.2-p320'
set :rvm_type, :user


set :application, "decool"
set :repository,  "git://github.com/hhguang/decoo.git"
set :branch, "master"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "railsu"
set :deploy_to, "/www-data/#{application}"
set :runner, "railsu"
set :use_sudo, false

role :web, "198.199.104.4"                          # Your HTTP server, Apache/etc
role :app, "198.199.104.4"                          # This may be the same as your `Web` server
role :db,  "198.199.104.4", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

 namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install  --without test "
  end

end
# before "deploy:restart", "bundle:install"