workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads 1, threads_count

preload_app!

rails_env = ENV['RAILS_ENV'] || 'development'
port 3000 if rails_env == 'development'

puts "Starting puma server in #{rails_env} environment"

rackup      DefaultRackup
environment rails_env

bind 'unix:///var/run/internal.sock' if rails_env == 'production'

stdout_redirect 'log/production.log', 'log/production.log' if rails_env == 'production'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end