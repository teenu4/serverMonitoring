require 'sidekiq-scheduler'

class VisitorWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(website_id)
    website = Website.find(website_id)
    visit(website)
  end

  private

    def visit(website)
      RestClient.get(website.url) do |response|
        update_last_visit(website)
        ResponseProcessor.call(status_code: response.code, website: website)
      end
    end

    def update_last_visit(website)
      website.update(last_visit: DateTime.now)
    end
end
