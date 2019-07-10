# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "ostranslator"
set :repo_url, "git@github.com:jujudellago/ostranslator.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh


#set :branch,  "master"
set :branch,  "master"


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name


# Default value for :scm is :git


# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

set :keep_releases, 6

set :ssh_options, { 
  user: 'deploy',
  forward_agent: true, 
  paranoid: true, 
  keys: "~/.ssh/id_rsa" 
}



set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }





# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


namespace :deploy do
 
  task :copy_config do
    on roles(:app)  do
      #execute :cp,  "  -Rf #{shared_path}/config/database.yml #{release_path}/config/"
      execute :cp,  "  -Rf #{shared_path}/config/initializers #{release_path}/config/"
      execute :cp,  "  -Rf #{shared_path}/config/environments #{release_path}/config/"
    end
  end
end
#before "deploy:updated", "deploy:copy_colors"
#before "deploy:updated", "deploy:rsync_imdb"
before "deploy:updated", "deploy:copy_config"


