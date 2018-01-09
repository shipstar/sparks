class ApplicationController < ActionController::Base
  before_filter :set_format
  before_filter :set_site_db, unless: -> { Rails.env.test? }

  protected
  def set_format
    request.format = :json
  end

  def set_site_db
    Apartment::Database.switch "cms_#{Thread.current[:site_key]}" if Thread.current[:site_key]
  end
end
