class ResponseProcessor
  include Interactor

  CODE_SUCCESS = 200

  def call
    validate_params
    if context.status_code == CODE_SUCCESS
      puts 'It works!'
    else
      process_error_code
    end
  end

  private

    def validate_params
      raise 'Missing status_code!' unless context.status_code
      raise 'Missing website!' unless context.website
    end

    def process_error_code
      return unless enough_time_passed?

      create_new_visit
      check_notifiers
    end

    def create_new_visit
      WebsiteVisit.create(status_code: context.status_code, website: context.website)
    end

    def check_notifiers; end

    def enough_time_passed?
      !latest_visit || latest_visit + context.website.min_interval.minutes < Time.now
    end

    def latest_visit
      WebsiteVisit.where(status_code: context.status_code, website: context.website)
                  .order(created_at: :desc)
                  .first&.created_at
    end
end
