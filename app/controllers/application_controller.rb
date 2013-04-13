class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login, except: [:not_authenticated]

  def render_json_dump(obj)
    render json: MultiJson.dump(obj)
  end

  protected

  def not_authenticated
    redirect_to root_path, alert: "Please login first."
  end

end
