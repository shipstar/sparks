class User < ActiveRecord::Base
  has_many :roles_users
  has_many :roles, through: :roles_users

  validates :email, presence: true, uniqueness: true

  def has_role_on_site?(site_key, *roles_required)
    query = roles.where(site_key: site_key)
    query = query.where(name: roles_required) unless roles_required.empty?
    query.count != 0
  end
end
