
module SendMailWorker
  include Sidekiq::Worker
  # include Sidekiq::Schedulable 
  sidekiq_options retry: false
  # recurrence { daily }
   
  def perform(task)
    TaskMailer.new_mail(task).deliver_now
  end
end   