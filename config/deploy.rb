# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'Ototown'
set :repo_url, 'git@github.com:alamtopan/ototown_production.git'
set :scm, :git
set :deploy_to, '/home/ototown/www'

set :format, :pretty
set :log_level, :info

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system}


set :default_env, { 
   path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
 }
 set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :finishing, 'deploy:cleanup'
end

after 'deploy:publishing', 'deploy:restart'