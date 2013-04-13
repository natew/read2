class WelcomeController < ApplicationController
  
  layout 'splash', only: [:index]

  skip_before_filter :require_login, :only => [:index]

  def index
  end
end
