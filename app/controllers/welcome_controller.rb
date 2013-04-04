class WelcomeController < ApplicationController
  layout 'splash', only: [:index]

  def index
  end
end
