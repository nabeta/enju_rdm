class PageController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def home
  end

  def help
  end

  def contact
  end
end
