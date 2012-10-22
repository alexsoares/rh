set :application, "192.168.0.122"
set :repository,  "git://github.com/alexsoares/rh.git"

set :user, "servidor"
set :use_sudo, false
set :deploy_to, "/home/#{user}/eventual.seducpma.com"
set :scm, :git       

server application, :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
