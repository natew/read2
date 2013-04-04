module UseCase
  class CreateFeed

    def initialize(params)
      @params = params
    end

    def call
      @feed = Feed.new(@params.permit(:url, :site_id))
      if @feed.save
        fetch_new_entries
        return SuccessfulResponse.new
      else
        return UnsuccessfulResponse.new(errors: @feed.errors.to_hash)
      end
    end

    private

      def fetch_new_entries
        UseCase::FechFeedEntries.new.call(@feed.id, @feed.url)
      end

  end
end