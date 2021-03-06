class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?
end
