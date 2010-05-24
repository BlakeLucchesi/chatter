#############################################################
#	Application
#############################################################

set :application, "chatter"
set :deploy_to, "/var/www/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, true
set :port, 37878

#############################################################
#	Servers
#############################################################

set :user, "deploy"
set :domain, "chatter.boldsource.com"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Subversion
#############################################################

set :repository,  "git@github.com:BlakeLucchesi/chatter.git"
set :scm, "git"

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  
  desc "Restart the application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end