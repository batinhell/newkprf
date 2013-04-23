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
set :rails_env, "production"

set :scm, "git"
set :repository, "git@github.com:batinhell/newkprf.git"
set :branch, "capistrano"

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

end
