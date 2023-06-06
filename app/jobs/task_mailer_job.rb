class TaskMailerJob < ApplicationJob
  queue_as :default

  def perform(task)
    TaskMailer.new_mail(task).deliver_now
  end
end
