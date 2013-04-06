class FeedsController < ApplicationController

  before_filter :require_login, only: [:index, :show]

  def index
  end

  def show
  end

  private

    def perform_show_response
      feed_view_serializer = FeedViewSerializer.new(@feed_view)

      respond_to do |format|
        format.html do
        end

        format.json do
          render_json_dump(feed_view_serializer)
        end
      end
    end

end
