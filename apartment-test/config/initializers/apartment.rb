#
# Apartment Configuration
#
Apartment.configure do |config|

  config.database_schema_file = Rails.root.join('db', 'site_schema.rb')

  # these models will not be multi-tenanted,
  # but remain in the global (public) namespace
  # Note that ActiveRecord::SessionStore::Session is just an example
  # you may not even use the AR Session Store, in which case you'd remove that line
  config.excluded_models = %w{
    Role
    RolesUser
    User
  }

  # use postgres schemas?
  config.use_schemas = false

  # configure persistent schemas (E.g. hstore )
  # config.persistent_schemas = %w{ hstore }

  # add the Rails environment to database names?
  # config.prepend_environment = true
  # config.append_environment = true

  # supply list of database names for migrations to run on
  # config.database_names = lambda{ ToDo_Tenant_Or_User_Model.pluck :database }

end
