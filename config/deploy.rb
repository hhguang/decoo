#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'bundler/capistrano'

default_run_options[:pty] = true

require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.3-p392'
set :rvm_type, :system

set :application, "decool"
set :repository,  "git://github.com/hhguang/decoo.git"
set :branch, "master"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "rails"
set :deploy_to, "/data/www/#{application}"
set :runner, "rails"

role :web, "42.120.19.221"                          # Your HTTP server, Apache/etc
role :app, "42.120.19.221"                          # This may be the same as your `Web` server
role :db,  "42.120.19.221", :primary => true # This is where Rails migrations will run
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