# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}

set :deploy_to, "/data/www/ostranslator"
set :deploy_via, :copy


set :default_environment, {
  'PATH' => "/home/deploy/.rvm/gems/ruby-2.3.1@global/bin:/home/deploy/.rvm/gems/ruby-2.3.1/bin:/home/deploy/.rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby 2.3.1',
  'GEM_HOME'     => '/home/deploy/.rvm/gems/ruby-2.3.1',
  'GEM_PATH'     => '/home/deploy/.rvm/gems/ruby-2.3.1',
  'BUNDLE_PATH'  => '/home/deploy/.rvm/gems/ruby-2.3.1'  # If you are using bundler.
}



set :rvm_path,  "/home/deploy/.rvm"

set :bundle_cmd, "/home/deploy/.rvm/gems/ruby-2.3.1/bin/bundle"
set :bundle_dir, "/home/deploy/.rvm/gems/ruby-2.3.1"
set :bundle_path, "/home/deploy/.rvm/gems/ruby-2.3.1"


server '178.63.84.93', roles: %w(app web db), primary: true, user: 'deploy'

set :nginx_sites_available_path, "/usr/local/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/usr/local/etc/nginx/sites-enabled"

set :user, 'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'french'))
set :puma_bind,       "unix:///data/www/ostranslator/shared/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_conf,       "#{shared_path}/config/puma.rb"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
#set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


#role :resque_worker, "178.63.84.93"  
#role :resque_scheduler, "178.63.84.93"  
#set :resque_environment_task, true
#
#set :workers, { "*" => 3 }
#
#after "puma:restart", "resque:restart"
#
# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml','config/application.yml','config/secrets.yml', 'config/application.rb', 'config/puma.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets')


set :use_sudo, false

#namespace :rvm do
#  task :trust_rvmrc do
#    on roles(:app)  do
#      execute :rvm, " rvmrc trust #{release_path}"
#    end
#  end
#end
#
#after "deploy", "rvm:trust_rvmrc"
#




#after :deploy, :symlink do
#  on roles(:app)  do    
#    run "cp #{shared_path}/css/_colors* #{release_path}/assets/stylesheets/_colors.scss"
#  end
#end


#after :deploy, :update_code do
#  on roles(:app)  do
#    run "cp -Rf #{shared_path}/config/initializers #{release_path}/config/"
#  end
#end

#set :deploy_via, :remote_cache


# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }




SSHKit::Backend::Netssh.configure do |ssh|
  ssh.connection_timeout = 30
  ssh.ssh_options = {
    keys: %w(/home/juju/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
  }
end


#task :generate_500_html do
#  on roles(:web) do |host|
#     cache_path=File.join(release_path, "public/cache")
#     cmd = " mkdir  #{cache_path}" 
#     system cmd
#    
#    
#     public_cache_path = File.join(release_path, "public/cache/www.ostranslator")
#     cmd = " mkdir  #{public_cache_path}" 
#     system cmd
#    
#     pro_public_cache_path = File.join(release_path, "public/cache/www.ostranslator")
#     cmd = " mkdir  #{pro_public_cache_path}" 
#     system cmd
#    
#    public_500_html = File.join(public_cache_path, "500.html")
#    execute :curl, "-k", "http://www.ostranslator/500", "> #{public_500_html}"
#    
#    public_404_html = File.join(public_cache_path, "404.html")
#    execute :curl, "-k", "http://www.ostranslator/404", "> #{public_404_html}"
#  
#    pro_500_html = File.join(pro_public_cache_path, "500.html")
#    execute :curl, "-k", "http://www.vostfr.pro/500", "> #{pro_500_html}"
#    
#    pro_404_html = File.join(pro_public_cache_path, "404.html")
#    execute :curl, "-k", "http://www.vostfr.pro/404", "> #{pro_404_html}"
#
#    
#  end
#end
#after "deploy:published", :generate_500_html


  ## rsync to each server


# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
