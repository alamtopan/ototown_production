# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'ototown'
set :repo_url, 'git@github.com:alamtopan/ototown_production.git'
set :deploy_to, '/home/ototown/www'

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
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute "cd #{current_path} && bundle exec unicorn -c #{current_path}/config/unicorn.rb -E production -D"
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "ln -nfs #{shared_path}/tmp #{release_path}/tmp"
      execute "ln -nfs #{shared_path}/log #{release_path}/log"
      execute "kill -15 `cat #{current_path}/tmp/pids/unicorn.pid` || true"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      stop
      start
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end
