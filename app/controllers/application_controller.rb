class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_json_dump(obj)
    render json: MultiJson.dump(obj)
  end
end
