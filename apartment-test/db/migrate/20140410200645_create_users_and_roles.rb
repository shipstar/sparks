class CreateUsersAndRoles < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end

    create_table :roles_users do |t|
      t.belongs_to :user
      t.belongs_to :role
    end

    create_table :roles do |t|
      t.string :name
      t.string :site_key
    end
  end
end
