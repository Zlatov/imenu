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
#    keys: %w(/home/user_name/.ssh/id_rsa),
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




# 
# Настройка соединения
# 
set :deploy_to, ENV["IMENU_CAP_PRODUCTION_PATH"]
set :tmp_dir, ENV["IMENU_CAP_PRODUCTION_TEMP"]
server ENV["IMENU_CAP_PRODUCTION_IP"],
  user: ENV["IMENU_CAP_PRODUCTION_USER"],
  ssh_options: {
    user: ENV["IMENU_CAP_PRODUCTION_USER"],
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }

set :branch, :master # из какой ветки лить
# set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :keep_releases, 5 # количество хранимых версий (для отката cap rollback)




# 
# Задачи деплоя приложения
# 
namespace :app do

  desc 'Обновляем npm зависимости.'
  task :yarn do
    on roles(:all) do |host|
      execute "cd #{deploy_to}/current/site && yarn"
      info "Npm зависимости обновлены."
    end
  end

  desc 'Подготавливаем фронтэнд.'
  task :assets do
    on roles(:all) do |host|
      execute "cd #{deploy_to}/current/site && ./bash/build_production.sh"
      info "Фронтэнд подготовлен."
    end
  end
end




# 
# Деплой
# 
after :deploy, 'app:yarn' unless ENV['SKIP_HOOKS']
after :deploy, 'app:assets' unless ENV['SKIP_HOOKS']
