namespace :setup_config do
  desc 'Generate configs for application and database'
    task :init => :environment do
      example_app_config = "#{Rails.root}/config/application.yml.example"
      example_db_config = "#{Rails.root}/config/database.yml.example"

      app_config = "#{Rails.root}/config/application.yml"
      db_config = "#{Rails.root}/config/database.yml"

      puts "-----> Copying application.yml..."
      copy(example_app_config, app_config)

      puts "-----> Copying database.yml..."
      copy(example_db_config, db_config)

      puts "----> Copy complete!"
  end
end