require 'sidekiq-scheduler'

class VisitorWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(website_id)
    # TODO
    website = Website.find(website_id)
    RestClient.get(website.url) do |response|
      status_code = response.code
      case status_code
      when 200
        puts 'It works!'
      else
        WebsiteVisit.create(status_code: status_code,
                            website: website)
      end
    end
  end
end
