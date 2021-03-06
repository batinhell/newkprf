
require "rvm/capistrano"



set :default_environment, {
  'PATH' => "/home/kprf/data/.rvm/gems/ruby-1.9.3-p392/bin:/home/kprf/data/.rvm/gems/ruby-1.9.3-p392@global/bin:/home/kprf/data/.rvm/rubies/ruby-1.9.3-p392/bin:/home/kprf/data/.rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.3',
  'GEM_HOME'     => '/home/kprf/data/.rvm/gems/ruby-1.9.3-p392@newkprf',
  'GEM_PATH'     => '/home/kprf/data/.rvm/gems/ruby-1.9.3-p392@newkprf',
  #'BUNDLE_PATH'  => '/home/kprf/data/.rvm/gems/ruby-1.9.3-p392'  # If you are using bundler.
}



# set :bundle_cmd, "/home/kprf/data/.rvm/gems/ruby-1.9.3-p392@newkprf/bin/bundle"
set :bundle_dir, "/home/kprf/data/.rvm/gems/ruby-1.9.3-p392"
require "bundler/capistrano"

server "77.246.150.198", :web, :app, :db, primary: true
# set :rvm_path, "/home/kprf/data/.rvm/gems/ruby-1.9.3-p392"
#set :rvm_bin_path, "$HOME/.rvm/bin"
set :application, "kprf-arh.ru"
set :user, "kprf"
set :deploy_to, "/home/#{user}/data/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:batinhell/newkprf.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/usr/local/etc/rc.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    # sudo "ln -nfs #{current_path}/config/nginx.conf /usr/local/etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /usr/local/etc/rc.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
