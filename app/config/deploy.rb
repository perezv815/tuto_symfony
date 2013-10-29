set :application, "symfony-standard"
set :domain,      "62.4.19.82"
set :deploy_to,   "/var/www/tuto_symfony"
set :app_path,    "app"

set :repository,  "git@github.com:perezv815/tuto_symfony.git"
set :scm,         :git
#set :deploy_via   :copy
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

set :model_manager, "doctrine"
# Or: `propel`

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain, :primary => true       # This may be the same as your `Web` server

set  :keep_releases,  3
set  :user, "root"  #A remplacer par www-data

#permet de forwarder l'identifiant ssh sur le serveur
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "vincentp.pem")] 
ssh_options[:forward_agent] = true
#set   :use_sudo,      true
# Be more verbose by uncommenting the following line
#logger.level = Logger::MAX_LEVEL

set :shared_files,      ["app/config/parameters.yml"]
set :shared_children,     [app_path + "/logs", web_path + "/uploads", "vendor"]

#2 lignes indispensables
set :use_composer, true
set :update_vendors, true

#donner les droitssur les dossiers app/cache et app/logs
set :writable_dirs,       ["app/cache", "app/logs"]
set :webserver_user,      "www-data"
set :permission_method,   :acl
set :use_set_permissions, true



