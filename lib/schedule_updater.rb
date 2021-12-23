class ScheduleUpdater
  include Interactor

  WORKER_CLASS = 'VisitorWorker'.freeze

  def call
    create_schedule_hash
    load_new_schedule
  end

  private

    def create_schedule_hash
      context.hash = Website.active.map do |website|
        ["visitor_#{website.id}", website_params(website)]
      end.to_h
    end

    def website_params(website)
      {
        cron: website.schedule,
        class: WORKER_CLASS,
        args: website.id
      }
    end

    def load_new_schedule
      Sidekiq.schedule = context.hash
      Sidekiq::Scheduler.reload_schedule!
    end
end
